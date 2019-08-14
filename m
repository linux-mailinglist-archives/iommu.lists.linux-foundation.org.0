Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0928DCB0
	for <lists.iommu@lfdr.de>; Wed, 14 Aug 2019 20:04:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E179FE2C;
	Wed, 14 Aug 2019 18:04:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 40312DCD
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 18:04:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id C9C5E8AA
	for <iommu@lists.linux-foundation.org>;
	Wed, 14 Aug 2019 18:04:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FD8315AD;
	Wed, 14 Aug 2019 10:56:52 -0700 (PDT)
Received: from fuggles.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
	[10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8D6803F694; 
	Wed, 14 Aug 2019 10:56:50 -0700 (PDT)
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 05/13] iommu: Introduce iommu_iotlb_gather_add_page()
Date: Wed, 14 Aug 2019 18:56:26 +0100
Message-Id: <20190814175634.21081-6-will@kernel.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190814175634.21081-1-will@kernel.org>
References: <20190814175634.21081-1-will@kernel.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Vijay Kilary <vkilari@codeaurora.org>, Robin Murphy <robin.murphy@arm.com>,
	Jan Glauber <jglauber@marvell.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Jayachandran Chandrasekharan Nair <jnair@marvell.com>,
	Jon Masters <jcm@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
	Will Deacon <will@kernel.org>
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

Introduce a helper function for drivers to use when updating an
iommu_iotlb_gather structure in response to an ->unmap() call, rather
than having to open-code the logic in every page-table implementation.

Signed-off-by: Will Deacon <will@kernel.org>
---
 include/linux/iommu.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index aaf073010a9a..ad41aee55bc6 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -507,6 +507,31 @@ static inline void iommu_tlb_sync(struct iommu_domain *domain,
 	iommu_iotlb_gather_init(iotlb_gather);
 }
 
+static inline void iommu_iotlb_gather_add_page(struct iommu_domain *domain,
+					       struct iommu_iotlb_gather *gather,
+					       unsigned long iova, size_t size)
+{
+	unsigned long start = iova, end = start + size;
+
+	/*
+	 * If the new page is disjoint from the current range or is mapped at
+	 * a different granularity, then sync the TLB so that the gather
+	 * structure can be rewritten.
+	 */
+	if (gather->pgsize != size ||
+	    end < gather->start || start > gather->end) {
+		if (gather->pgsize)
+			iommu_tlb_sync(domain, gather);
+		gather->pgsize = size;
+	}
+
+	if (gather->end < end)
+		gather->end = end;
+
+	if (gather->start > start)
+		gather->start = start;
+}
+
 /* PCI device grouping function */
 extern struct iommu_group *pci_device_group(struct device *dev);
 /* Generic device grouping function */
@@ -847,6 +872,12 @@ static inline void iommu_iotlb_gather_init(struct iommu_iotlb_gather *gather)
 {
 }
 
+static inline void iommu_iotlb_gather_add_page(struct iommu_domain *domain,
+					       struct iommu_iotlb_gather *gather,
+					       unsigned long iova, size_t size)
+{
+}
+
 static inline void iommu_device_unregister(struct iommu_device *iommu)
 {
 }
-- 
2.11.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
