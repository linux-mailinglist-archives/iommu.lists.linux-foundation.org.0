Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C01F575B4E
	for <lists.iommu@lfdr.de>; Fri, 26 Jul 2019 01:39:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C2CA2DC2;
	Thu, 25 Jul 2019 23:39:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A4295DC0
	for <iommu@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 23:39:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 594EE224
	for <iommu@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 23:39:20 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id y15so23522638pfn.5
	for <iommu@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 16:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9prolDL+Bhp3LyY4fbBTGEV1uaHeMB5qkqJOff233Wo=;
	b=gnnilfsw9PFl1y7SWP83bgts6aO6Y7myoMOnWToOjhOrwX5u52dAb7lpcwNGyXI1HS
	ud7JJD3/1fVImwd8R6rplXWVwQ6shJCx9WRaFeze5tj4vRCAQ00luQWaTo7CnmZgOTsk
	v9GJteYr8jfb0TiVNL5HL192RwUBjFa32mSD0vzW64H2e/BT3DALu9C7hAMklC2d/bUX
	jvBH6veo4+LlY5XS4wJnXXdgYFGfERI0X+2r2WtbKwnf0gmj5DvZAQ/NI84EFuJ53Pjj
	iO0PABTu42Y8Q0XlkfPljqLeZqiG7yjY9rC1UBLjSP0OmD6Sco1Fmoua86iG6QwcTvRa
	VCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9prolDL+Bhp3LyY4fbBTGEV1uaHeMB5qkqJOff233Wo=;
	b=Jtv/x75bqoVX5JrqgfVzq7zD6SXlW+YmPI4WcluhJPIiJ+o9/83u1ShtxPv5vjUpaM
	5DnoeaXwZRIyeVdOEiAyeNS1c1WbM2l9GVtq+s37J1q6QyhkGCFaxiWrp3baqLNfLGDB
	nDDiPU1X9Dz/AA5ScE8I8QXd31uFP/EnTfAv/muYZOkxbygQnzwMSL5v0F/QZ5QpHebt
	z/sS/DrU130dlmdpqoKmyXE/M56F3xP/V3MLvD4tAc+B95vL5oVjp/6viuEY8cn09PxX
	8oYA1zyM3P4DvS5X+NS9Pz8l95s5YHcyBXNBsVi1UPbUT3CsiFgUkEC7XQ7gODC97D58
	2Eww==
X-Gm-Message-State: APjAAAXU8Vl6/ZSBGo4IZrswgpuB8NGtFV+Kkp0T7I+ZsTgqQr56+cTX
	1p3kgm3tUCaDOWvMd/NKULM=
X-Google-Smtp-Source: APXvYqwl8BTqAkMXqvYshZszKPiEYKFoC8MNpaXfud9Ul5VoXo6zYD92eosnuG9ivvT08H9Far5aMA==
X-Received: by 2002:a63:ff0c:: with SMTP id k12mr47230757pgi.186.1564097959856;
	Thu, 25 Jul 2019 16:39:19 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
	[216.228.112.22]) by smtp.gmail.com with ESMTPSA id
	f72sm70888203pjg.10.2019.07.25.16.39.19
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 25 Jul 2019 16:39:19 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: dafna.hirschfeld@collabora.com, hch@lst.de, m.szyprowski@samsung.com,
	robin.murphy@arm.com
Subject: [PATCH 2/2] dma-contiguous: page-align the size in
	dma_free_contiguous()
Date: Thu, 25 Jul 2019 16:39:59 -0700
Message-Id: <20190725233959.15129-3-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190725233959.15129-1-nicoleotsuka@gmail.com>
References: <20190725233959.15129-1-nicoleotsuka@gmail.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

According to the original dma_direct_alloc_pages() code:
{
	unsigned int count = PAGE_ALIGN(size) >> PAGE_SHIFT;

	if (!dma_release_from_contiguous(dev, page, count))
		__free_pages(page, get_order(size));
}

The count parameter for dma_release_from_contiguous() was page
aligned before the right-shifting operation, while the new API
dma_free_contiguous() forgets to have PAGE_ALIGN() at the size.

So this patch simply adds it to prevent any corner case.

Fixes: fdaeec198ada ("dma-contiguous: add dma_{alloc,free}_contiguous() helpers")
Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 kernel/dma/contiguous.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index fa8cd0f0512e..5735a9166866 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -267,7 +267,8 @@ struct page *dma_alloc_contiguous(struct device *dev, size_t size, gfp_t gfp)
  */
 void dma_free_contiguous(struct device *dev, struct page *page, size_t size)
 {
-	if (!cma_release(dev_get_cma_area(dev), page, size >> PAGE_SHIFT))
+	if (!cma_release(dev_get_cma_area(dev), page,
+			 PAGE_ALIGN(size) >> PAGE_SHIFT))
 		__free_pages(page, get_order(size));
 }
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
