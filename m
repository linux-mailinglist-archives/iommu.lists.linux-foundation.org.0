Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB1D35E302
	for <lists.iommu@lfdr.de>; Tue, 13 Apr 2021 17:37:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96D9B400E3;
	Tue, 13 Apr 2021 15:37:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Flrqj-70R9fL; Tue, 13 Apr 2021 15:37:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 167A9401C1;
	Tue, 13 Apr 2021 15:37:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5083CC0017;
	Tue, 13 Apr 2021 15:37:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 57D98C000A
 for <iommu@lists.linux-foundation.org>; Tue, 13 Apr 2021 15:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4742A40100
 for <iommu@lists.linux-foundation.org>; Tue, 13 Apr 2021 15:22:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fx61t6GWR01y for <iommu@lists.linux-foundation.org>;
 Tue, 13 Apr 2021 15:22:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A71B0400E3
 for <iommu@lists.linux-foundation.org>; Tue, 13 Apr 2021 15:22:41 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id h20so8409789plr.4
 for <iommu@lists.linux-foundation.org>; Tue, 13 Apr 2021 08:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SNYshAOIhIfYWplCoKI3GKQhqu3xrQdJgtDgLoPsrVY=;
 b=jp8qbqTxevt3fdyQq8b90lIy5Mw3k9Z6yoHsMiBXwH4fDpxjxdLMTa8PGmUGYRVo15
 UuyUCWEMXA6prtck9kKNZi8q5cIvXOQdT1AfgdK4H8IabvykjPZKs0WeIaB2S3g0lrf+
 Em6ziCnIcHB9pEqBFotRuVBu03DKULXJy8+g7S78YqgQEWZqfqDpvBGVmBDF+SKWmu3i
 m1djg6mYmWmSPiqLAADMVltOnyDP91MH+xEIL5xUgoNfsTiycItmhWshzQWfODOcwqPJ
 LKeqyXHHjrY7yhcUaCVGSvPMJTQ1QqM4GYYBpkhy/d5ZzdKvINdHsphO8hgpkaupFrgB
 g7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SNYshAOIhIfYWplCoKI3GKQhqu3xrQdJgtDgLoPsrVY=;
 b=JXyvUyFx+RtkaFfl49Hh+QphmyKGyZ/luriXSm1PFf2hVRdkHYVpgxgR7tOC0kXrpu
 AbMLp01FaMm6zDBJ8RCCNcGz7dGl9EXjwEmzVcODMim/fjl6O1o5wD721nYtlyXCvcYx
 raPSMQN2wvXZU4C8SFMxWxiMlM6uQ82wMxjIuVSd/22zwCBI8Uc3d8F/O0mTRX2BgBGl
 RUqsR23/9hiQ7GSvgPYRdsxaLyjZqTPZs/vahEQ6cV5QPznAljl2OfB7h8lsqwGt7CgT
 6D2n04nZwp8VY3HIFEqXMfhHfWxRp3CW1zzDi6OasDNEp5MEnwrXAy7noDL55PYi+m80
 joOA==
X-Gm-Message-State: AOAM531Ky1Gbg0g3Par8xmCClDh5Yoi+9jKKzv7Mf+4JOoUGpAUQX4Kb
 EN5Q+oVgr/yH6MVrRrMqxTo=
X-Google-Smtp-Source: ABdhPJzxOadIW9AoyD8BTTDKf7rAcHW65iwBoDDGNL6nNN1XC0+VeHv+FxJbtWQNFGR2CFI0/fzDKQ==
X-Received: by 2002:a17:902:dac8:b029:eb:14e1:5057 with SMTP id
 q8-20020a170902dac8b02900eb14e15057mr7667402plx.65.1618327361177; 
 Tue, 13 Apr 2021 08:22:41 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:36:5b29:fe1a:45c9:c61c])
 by smtp.gmail.com with ESMTPSA id y3sm12882026pfg.145.2021.04.13.08.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 08:22:40 -0700 (PDT)
From: Tianyu Lan <ltykernel@gmail.com>
To: konrad.wilk@oracle.com, hch@lst.de, m.szyprowski@samsung.com,
 robin.murphy@arm.com
Subject: [RFC V2 PATCH 9/12] swiotlb: Add bounce buffer remap address setting
 function
Date: Tue, 13 Apr 2021 11:22:14 -0400
Message-Id: <20210413152217.3386288-10-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413152217.3386288-1-ltykernel@gmail.com>
References: <20210413152217.3386288-1-ltykernel@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 13 Apr 2021 15:37:35 +0000
Cc: thomas.lendacky@amd.com, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 brijesh.singh@amd.com, vkuznets@redhat.com, sunilmut@microsoft.com
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

For Hyper-V isolation VM with AMD SEV SNP, the bounce buffer(shared memory)
needs to be accessed via extra address space(e.g address above bit39).
Hyper-V code may remap extra address space outside of swiotlb. swiotlb_bounce()
needs to use remap virtual address to copy data from/to bounce buffer. Add
new interface swiotlb_set_bounce_remap() to do that.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 include/linux/swiotlb.h |  5 +++++
 kernel/dma/swiotlb.c    | 13 ++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index d9c9fc9ca5d2..3ccd08116683 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -82,8 +82,13 @@ unsigned int swiotlb_max_segment(void);
 size_t swiotlb_max_mapping_size(struct device *dev);
 bool is_swiotlb_active(void);
 void __init swiotlb_adjust_size(unsigned long new_size);
+void swiotlb_set_bounce_remap(unsigned char *vaddr);
 #else
 #define swiotlb_force SWIOTLB_NO_FORCE
+static inline void swiotlb_set_bounce_remap(unsigned char *vaddr)
+{
+}
+
 static inline bool is_swiotlb_buffer(phys_addr_t paddr)
 {
 	return false;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 7c42df6e6100..5fd2db6aa149 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -94,6 +94,7 @@ static unsigned int io_tlb_index;
  * not be bounced (unless SWIOTLB_FORCE is set).
  */
 static unsigned int max_segment;
+static unsigned char *swiotlb_bounce_remap_addr;
 
 /*
  * We need to save away the original address corresponding to a mapped entry
@@ -421,6 +422,11 @@ void __init swiotlb_exit(void)
 	swiotlb_cleanup();
 }
 
+void swiotlb_set_bounce_remap(unsigned char *vaddr)
+{
+	swiotlb_bounce_remap_addr = vaddr;
+}
+
 /*
  * Bounce: copy the swiotlb buffer from or back to the original dma location
  */
@@ -428,7 +434,12 @@ static void swiotlb_bounce(phys_addr_t orig_addr, phys_addr_t tlb_addr,
 			   size_t size, enum dma_data_direction dir)
 {
 	unsigned long pfn = PFN_DOWN(orig_addr);
-	unsigned char *vaddr = phys_to_virt(tlb_addr);
+	unsigned char *vaddr;
+
+	if (swiotlb_bounce_remap_addr)
+		vaddr = swiotlb_bounce_remap_addr + tlb_addr - io_tlb_start;
+	else
+		vaddr = phys_to_virt(tlb_addr);
 
 	if (PageHighMem(pfn_to_page(pfn))) {
 		/* The buffer does not have a mapping.  Map it in and copy */
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
