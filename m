Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FA339EBB5
	for <lists.iommu@lfdr.de>; Tue,  8 Jun 2021 03:55:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65F9D83A8F;
	Tue,  8 Jun 2021 01:55:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eJEaObaq9fCN; Tue,  8 Jun 2021 01:55:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E6FD83A8A;
	Tue,  8 Jun 2021 01:55:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC43EC0027;
	Tue,  8 Jun 2021 01:55:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 116F6C0001
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 01:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1D6D83A91
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 01:55:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4eZk8lCIPsx2 for <iommu@lists.linux-foundation.org>;
 Tue,  8 Jun 2021 01:55:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 617B883A8F
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 01:55:25 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id 6so15275461pgk.5
 for <iommu@lists.linux-foundation.org>; Mon, 07 Jun 2021 18:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PVlNy6GFZskXwhmJM3/KpQE5O4kPgimeLb6iehn44jE=;
 b=rtJTHteosGHqvGerLxDOacK+OAEMS78keadnAtsslhFWaQd76IG1I30qATHXr3U1+O
 u3Pcn1u1ZaZRTEe+TJKtRGrJsu6jCGVCIaVNvZwLnv+haxMJUIcv4V7FcTwSWlQWKaKn
 aA0hbuDVmbkf2rTc/lUjXn3S3OncimcpFr4HfORnYrLWfc1K+Uot7v/FN8M94eahUWmD
 qmAvOgQ6/N2w8+Mx6URrug9t+oTsSGpkjqJGShkmyVJCZjEEW7vu1eHcJL8gTPC8b2Qm
 79m+BHGTzTBpdNAbBzIXch0lgWWTlWIoWCgZcFZuIkRbKHuhsEnuJfpovzQZ+NPg29Bc
 hHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PVlNy6GFZskXwhmJM3/KpQE5O4kPgimeLb6iehn44jE=;
 b=SxvD7fl2Ssq34G31E/E0Rd+ZNt83wlRh9g63bTReDGpMwQrriKZncHwmWPxWA6HknE
 MrDGpSctAxhBmlBgJVpUXSKrwawKSxLtqpTn0kXGjS+G24hZcN+0akh4lknUKKE6F6Di
 DqdL2mODdmkDoFlpX8r0DTHUXS+icJ9mI39dvSM4HrCCpBSsn8I80iDI38jbZRD+ChLX
 tcc2N79Z7PbFJ4lUxUZ4iaZ3b4uZjk2AokMAFqaD+aWzv6YKJmeG3PXPXffucz55exjN
 cQc7o2yE7ZOmSHNDNTYl18j/YERRcNqdEYfwYiKeQ9FMxqmIaGyeypeinGvpbPe1yV+l
 AKNA==
X-Gm-Message-State: AOAM532cLNTC0fDfUXClm0obri12duEDr1lsntEbAlyyw2LcQ16ZgmpG
 rEOtXj1T+U/i5vGYNEfG9/Y=
X-Google-Smtp-Source: ABdhPJxVT8efeIufgkaSCDKk6eZ4gB5/q4jKeVg4vhx+g85q5sdx4JTMRcU359SIEQBq5lXjHMHE/g==
X-Received: by 2002:a05:6a00:26d8:b029:2ea:1101:8acf with SMTP id
 p24-20020a056a0026d8b02902ea11018acfmr19317888pfw.67.1623117324738; 
 Mon, 07 Jun 2021 18:55:24 -0700 (PDT)
Received: from sc2-haas01-esx0118.eng.vmware.com ([66.170.99.1])
 by smtp.gmail.com with ESMTPSA id s24sm9284767pfh.104.2021.06.07.18.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 18:55:24 -0700 (PDT)
From: Nadav Amit <nadav.amit@gmail.com>
X-Google-Original-From: Nadav Amit
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v3 3/6] iommu: Improve iommu_iotlb_gather helpers
Date: Mon,  7 Jun 2021 11:25:38 -0700
Message-Id: <20210607182541.119756-4-namit@vmware.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607182541.119756-1-namit@vmware.com>
References: <20210607182541.119756-1-namit@vmware.com>
MIME-Version: 1.0
Cc: Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Jiajun Cao <caojiajun@vmware.com>,
 Will Deacon <will@kernel.org>
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

From: Robin Murphy <robin.murphy@arm.com>

The Mediatek driver is not the only one which might want a basic
address-based gathering behaviour, so although it's arguably simple
enough to open-code, let's factor it out for the sake of cleanliness.
Let's also take this opportunity to document the intent of these
helpers for clarity.

Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
Cc: Jiajun Cao <caojiajun@vmware.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Cc: iommu@lists.linux-foundation.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Robin Murphy <robin.murphy@arm.com>

---

Changes from Robin's version:
* Added iommu_iotlb_gather_add_range() stub !CONFIG_IOMMU_API
* Use iommu_iotlb_gather_add_range() in iommu_iotlb_gather_add_page()
---
 drivers/iommu/mtk_iommu.c |  5 +----
 include/linux/iommu.h     | 43 ++++++++++++++++++++++++++++++++++-----
 2 files changed, 39 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index e06b8a0e2b56..0af4a91ac7da 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -523,10 +523,7 @@ static size_t mtk_iommu_unmap(struct iommu_domain *domain,
 	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
 	unsigned long end = iova + size - 1;
 
-	if (gather->start > iova)
-		gather->start = iova;
-	if (gather->end < end)
-		gather->end = end;
+	iommu_iotlb_gather_add_range(gather, iova, size);
 	return dom->iop->unmap(dom->iop, iova, size, gather);
 }
 
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 32d448050bf7..f254c62f3720 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -497,6 +497,38 @@ static inline void iommu_iotlb_sync(struct iommu_domain *domain,
 	iommu_iotlb_gather_init(iotlb_gather);
 }
 
+/**
+ * iommu_iotlb_gather_add_range - Gather for address-based TLB invalidation
+ * @gather: TLB gather data
+ * @iova: start of page to invalidate
+ * @size: size of page to invalidate
+ *
+ * Helper for IOMMU drivers to build arbitrarily-sized invalidation commands
+ * where only the address range matters, and simply minimising intermediate
+ * syncs is preferred.
+ */
+static inline void iommu_iotlb_gather_add_range(struct iommu_iotlb_gather *gather,
+						unsigned long iova, size_t size)
+{
+	unsigned long end = iova + size - 1;
+
+	if (gather->start > iova)
+		gather->start = iova;
+	if (gather->end < end)
+		gather->end = end;
+}
+
+/**
+ * iommu_iotlb_gather_add_page - Gather for page-based TLB invalidation
+ * @domain: IOMMU domain to be invalidated
+ * @gather: TLB gather data
+ * @iova: start of page to invalidate
+ * @size: size of page to invalidate
+ *
+ * Helper for IOMMU drivers to build invalidation commands based on individual
+ * pages, or with page size/table level hints which cannot be gathered if they
+ * differ.
+ */
 static inline void iommu_iotlb_gather_add_page(struct iommu_domain *domain,
 					       struct iommu_iotlb_gather *gather,
 					       unsigned long iova, size_t size)
@@ -515,11 +547,7 @@ static inline void iommu_iotlb_gather_add_page(struct iommu_domain *domain,
 		gather->pgsize = size;
 	}
 
-	if (gather->end < end)
-		gather->end = end;
-
-	if (gather->start > start)
-		gather->start = start;
+	iommu_iotlb_gather_add_range(gather, iova, size);
 }
 
 /* PCI device grouping function */
@@ -702,6 +730,11 @@ static inline void iommu_iotlb_sync(struct iommu_domain *domain,
 {
 }
 
+static inline void iommu_iotlb_gather_add_range(struct iommu_iotlb_gather *gather,
+						unsigned long iova, size_t size)
+{
+}
+
 static inline phys_addr_t iommu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova)
 {
 	return 0;
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
