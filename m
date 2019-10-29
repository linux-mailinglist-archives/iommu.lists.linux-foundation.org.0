Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBA7E921F
	for <lists.iommu@lfdr.de>; Tue, 29 Oct 2019 22:34:53 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5A5BFCA4;
	Tue, 29 Oct 2019 21:34:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E8E8FC96
	for <iommu@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 21:34:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8EC71FD
	for <iommu@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 21:34:39 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id q21so8307393plr.13
	for <iommu@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 14:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TR55chCCmBWkHTwfAhFnogv72SctklZSP/GTej4Kjb0=;
	b=oKJHpxq4xoQy3oSIQqwPlLB8hASIba7+d5xOsy4muSmGigScqgMUdELZWvZ5HHFkwT
	XoWdGcyAzYEeEJ1d6zU+UeWdh39zgY6BfyZIqHMDZeQrd6nrJxA1e1tjTmbiSpxwjyiY
	fy9W7C3xQpwb0B+nS/kzhr5h6dfcgynTLzuIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TR55chCCmBWkHTwfAhFnogv72SctklZSP/GTej4Kjb0=;
	b=qIZHNSdjaRDPFWjZow9//nQbTV5VH9t40ubYTwxLLngYFr7V5WgpvWQ6rg0lcgg6oH
	Oz0G7OGEvx0UN1Q6SAnogRuYfx+fV5/w9TPEzoaOJmiczz9vAWfkipYWbMP7v9ncICcc
	MXTf/PKXaBXTYBcditzDpqytPzFuRE5RT9UJb6+0cnlWinKP2oQWPIAos4DHb+jCTCtk
	Jq86TpduwJihf2YmGe0NF6c9o5VNAwFK06iP4fsxyIzVMZhHf1FMdwshc4pZKxILUHZt
	LmViN4CmHxXF7ezeL1NF4li1sFR5XOP9YmCeEeCl5OVeI0e3LngalHiJu9IU7QrdfkTj
	xFsg==
X-Gm-Message-State: APjAAAUSNP0csmC9/EpnzJKbXN+Tnl1rwY+UzFevBUjSNlbpXzP70eDB
	NoQJEiSSoQoW0SUNDlO/oJ1qaQ==
X-Google-Smtp-Source: APXvYqxHCJjrLr8A7ARPgZhUUVZAlUD10TxDsm4B7NQrxpTzCx1dyayjY2Dpt/KCocO3c9JTZVAg7g==
X-Received: by 2002:a17:902:b703:: with SMTP id
	d3mr904645pls.194.1572384879122; 
	Tue, 29 Oct 2019 14:34:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id q13sm72319pjq.0.2019.10.29.14.34.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 29 Oct 2019 14:34:36 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: [PATCH v4 1/2] dma-mapping: Add vmap checks to dma_map_single()
Date: Tue, 29 Oct 2019 14:34:22 -0700
Message-Id: <20191029213423.28949-2-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029213423.28949-1-keescook@chromium.org>
References: <20191029213423.28949-1-keescook@chromium.org>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Kees Cook <keescook@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
	iommu@lists.linux-foundation.org,
	Semmle Security Reports <security-reports@semmle.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Jesper Dangaard Brouer <brouer@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, Laura Abbott <labbott@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>, Allison Randal <allison@lohutok.net>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Development issues for Linux IOMMU support
	<iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

As we've seen from USB and other areas[1], we need to always do runtime
checks for DMA operating on memory regions that might be remapped. This
adds vmap checks (similar to those already in USB but missing in other
places) into dma_map_single() so all callers benefit from the checking.

[1] https://git.kernel.org/linus/3840c5b78803b2b6cc1ff820100a74a092c40cbb

Suggested-by: Laura Abbott <labbott@redhat.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/dma-mapping.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 4a1c4fca475a..54de3c496407 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -583,6 +583,12 @@ static inline unsigned long dma_get_merge_boundary(struct device *dev)
 static inline dma_addr_t dma_map_single_attrs(struct device *dev, void *ptr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
+	/* DMA must never operate on areas that might be remapped. */
+	if (dev_WARN_ONCE(dev, is_vmalloc_addr(ptr),
+			  "wanted %zu bytes mapped in vmalloc\n", size)) {
+		return DMA_MAPPING_ERROR;
+	}
+
 	debug_dma_map_single(dev, ptr, size);
 	return dma_map_page_attrs(dev, virt_to_page(ptr), offset_in_page(ptr),
 			size, dir, attrs);
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
