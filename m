Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 818173A368
	for <lists.iommu@lfdr.de>; Sun,  9 Jun 2019 04:46:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3C7ADC21;
	Sun,  9 Jun 2019 02:45:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 702A7BA9
	for <iommu@lists.linux-foundation.org>;
	Sun,  9 Jun 2019 02:45:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C49C5174
	for <iommu@lists.linux-foundation.org>;
	Sun,  9 Jun 2019 02:45:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jun 2019 19:45:39 -0700
X-ExtLoop1: 1
Received: from allen-box.sh.intel.com ([10.239.159.136])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Jun 2019 19:45:38 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 6/6] iommu/vt-d: Consolidate domain_init() to avoid duplication
Date: Sun,  9 Jun 2019 10:38:03 +0800
Message-Id: <20190609023803.23832-7-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190609023803.23832-1-baolu.lu@linux.intel.com>
References: <20190609023803.23832-1-baolu.lu@linux.intel.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, cai@lca.pw, jacob.jun.pan@intel.com
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

The domain_init() and md_domain_init() do almost the same job.
Consolidate them to avoid duplication.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel-iommu.c | 123 +++++++++++-------------------------
 1 file changed, 36 insertions(+), 87 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index d60cf0fd9500..a4f68585941e 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -1825,63 +1825,6 @@ static inline int guestwidth_to_adjustwidth(int gaw)
 	return agaw;
 }
 
-static int domain_init(struct dmar_domain *domain, struct intel_iommu *iommu,
-		       int guest_width)
-{
-	int adjust_width, agaw;
-	unsigned long sagaw;
-	int err;
-
-	init_iova_domain(&domain->iovad, VTD_PAGE_SIZE, IOVA_START_PFN);
-
-	err = init_iova_flush_queue(&domain->iovad,
-				    iommu_flush_iova, iova_entry_free);
-	if (err)
-		return err;
-
-	domain_reserve_special_ranges(domain);
-
-	/* calculate AGAW */
-	if (guest_width > cap_mgaw(iommu->cap))
-		guest_width = cap_mgaw(iommu->cap);
-	domain->gaw = guest_width;
-	adjust_width = guestwidth_to_adjustwidth(guest_width);
-	agaw = width_to_agaw(adjust_width);
-	sagaw = cap_sagaw(iommu->cap);
-	if (!test_bit(agaw, &sagaw)) {
-		/* hardware doesn't support it, choose a bigger one */
-		pr_debug("Hardware doesn't support agaw %d\n", agaw);
-		agaw = find_next_bit(&sagaw, 5, agaw);
-		if (agaw >= 5)
-			return -ENODEV;
-	}
-	domain->agaw = agaw;
-
-	if (ecap_coherent(iommu->ecap))
-		domain->iommu_coherency = 1;
-	else
-		domain->iommu_coherency = 0;
-
-	if (ecap_sc_support(iommu->ecap))
-		domain->iommu_snooping = 1;
-	else
-		domain->iommu_snooping = 0;
-
-	if (intel_iommu_superpage)
-		domain->iommu_superpage = fls(cap_super_page_val(iommu->cap));
-	else
-		domain->iommu_superpage = 0;
-
-	domain->nid = iommu->node;
-
-	/* always allocate the top pgd */
-	domain->pgd = (struct dma_pte *)alloc_pgtable_page(domain->nid);
-	if (!domain->pgd)
-		return -ENOMEM;
-	__iommu_flush_cache(iommu, domain->pgd, PAGE_SIZE);
-	return 0;
-}
-
 static void domain_exit(struct dmar_domain *domain)
 {
 	struct page *freelist;
@@ -2563,6 +2506,31 @@ static int get_last_alias(struct pci_dev *pdev, u16 alias, void *opaque)
 	return 0;
 }
 
+static int domain_init(struct dmar_domain *domain, int guest_width)
+{
+	int adjust_width;
+
+	init_iova_domain(&domain->iovad, VTD_PAGE_SIZE, IOVA_START_PFN);
+	domain_reserve_special_ranges(domain);
+
+	/* calculate AGAW */
+	domain->gaw = guest_width;
+	adjust_width = guestwidth_to_adjustwidth(guest_width);
+	domain->agaw = width_to_agaw(adjust_width);
+
+	domain->iommu_coherency = 0;
+	domain->iommu_snooping = 0;
+	domain->iommu_superpage = 0;
+	domain->max_addr = 0;
+
+	/* always allocate the top pgd */
+	domain->pgd = (struct dma_pte *)alloc_pgtable_page(domain->nid);
+	if (!domain->pgd)
+		return -ENOMEM;
+	domain_flush_cache(domain, domain->pgd, PAGE_SIZE);
+	return 0;
+}
+
 static struct dmar_domain *find_or_alloc_domain(struct device *dev, int gaw)
 {
 	struct device_domain_info *info;
@@ -2600,11 +2568,19 @@ static struct dmar_domain *find_or_alloc_domain(struct device *dev, int gaw)
 	domain = alloc_domain(0);
 	if (!domain)
 		return NULL;
-	if (domain_init(domain, iommu, gaw)) {
+
+	if (domain_init(domain, gaw)) {
 		domain_exit(domain);
 		return NULL;
 	}
 
+	if (init_iova_flush_queue(&domain->iovad,
+				  iommu_flush_iova,
+				  iova_entry_free)) {
+		pr_warn("iova flush queue initialization failed\n");
+		intel_iommu_strict = 1;
+	}
+
 out:
 	return domain;
 }
@@ -2709,8 +2685,6 @@ static int domain_prepare_identity_map(struct device *dev,
 	return iommu_domain_identity_map(domain, start, end);
 }
 
-static int md_domain_init(struct dmar_domain *domain, int guest_width);
-
 static int __init si_domain_init(int hw)
 {
 	struct dmar_rmrr_unit *rmrr;
@@ -2721,7 +2695,7 @@ static int __init si_domain_init(int hw)
 	if (!si_domain)
 		return -EFAULT;
 
-	if (md_domain_init(si_domain, DEFAULT_DOMAIN_ADDRESS_WIDTH)) {
+	if (domain_init(si_domain, DEFAULT_DOMAIN_ADDRESS_WIDTH)) {
 		domain_exit(si_domain);
 		return -EFAULT;
 	}
@@ -4836,31 +4810,6 @@ static void dmar_remove_one_dev_info(struct device *dev)
 	spin_unlock_irqrestore(&device_domain_lock, flags);
 }
 
-static int md_domain_init(struct dmar_domain *domain, int guest_width)
-{
-	int adjust_width;
-
-	init_iova_domain(&domain->iovad, VTD_PAGE_SIZE, IOVA_START_PFN);
-	domain_reserve_special_ranges(domain);
-
-	/* calculate AGAW */
-	domain->gaw = guest_width;
-	adjust_width = guestwidth_to_adjustwidth(guest_width);
-	domain->agaw = width_to_agaw(adjust_width);
-
-	domain->iommu_coherency = 0;
-	domain->iommu_snooping = 0;
-	domain->iommu_superpage = 0;
-	domain->max_addr = 0;
-
-	/* always allocate the top pgd */
-	domain->pgd = (struct dma_pte *)alloc_pgtable_page(domain->nid);
-	if (!domain->pgd)
-		return -ENOMEM;
-	domain_flush_cache(domain, domain->pgd, PAGE_SIZE);
-	return 0;
-}
-
 static struct iommu_domain *intel_iommu_domain_alloc(unsigned type)
 {
 	struct dmar_domain *dmar_domain;
@@ -4875,7 +4824,7 @@ static struct iommu_domain *intel_iommu_domain_alloc(unsigned type)
 			pr_err("Can't allocate dmar_domain\n");
 			return NULL;
 		}
-		if (md_domain_init(dmar_domain, DEFAULT_DOMAIN_ADDRESS_WIDTH)) {
+		if (domain_init(dmar_domain, DEFAULT_DOMAIN_ADDRESS_WIDTH)) {
 			pr_err("Domain initialization failed\n");
 			domain_exit(dmar_domain);
 			return NULL;
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
