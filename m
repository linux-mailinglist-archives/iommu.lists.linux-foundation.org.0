Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id B35A84AB527
	for <lists.iommu@lfdr.de>; Mon,  7 Feb 2022 07:43:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3E3B8145F;
	Mon,  7 Feb 2022 06:43:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PUEFvSGeZ5hQ; Mon,  7 Feb 2022 06:43:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E208381458;
	Mon,  7 Feb 2022 06:43:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8303C0073;
	Mon,  7 Feb 2022 06:43:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 578D3C000B
 for <iommu@lists.linux-foundation.org>; Mon,  7 Feb 2022 06:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3B46840278
 for <iommu@lists.linux-foundation.org>; Mon,  7 Feb 2022 06:43:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k7ejLBNxMqO2 for <iommu@lists.linux-foundation.org>;
 Mon,  7 Feb 2022 06:43:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2BC6340272
 for <iommu@lists.linux-foundation.org>; Mon,  7 Feb 2022 06:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644216186; x=1675752186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gN3LPgLC7pbNU4whlKOywLY30HbjfL0dlgHdNEPYbiE=;
 b=nS5O4f+LdcACE6njqPZJxrHA0LurVtKiwKBryY2b7kKWtqvKHrYQoig5
 kb+e3DMLlJ6wIY0LfCDT+CwysdI+Y4s7Fc3abYvQtpwRzhN4JXxRbK00u
 oEK4JlQu33qxP5dPVAiwEmeaxN5s7QgiRlyNWNOMQk1dkpfmLsO4GYFEN
 3v9zAl7TcvWoMwrqfTKugiCu7GDGNg9R5iQnVJ9UlMuA4bBWchCROnHsM
 WzbMuXez6Lyg5vne2RHPQ/QmAfd0Ojf0cGXULdWQTT8HkScHYbuD1QNuV
 IC8sGJHJg+rIZ5BYk1KA9qOSDpuCc/YY4iRGGHCxl1hJWILbIpcKMhq1B Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="228622926"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="228622926"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2022 22:43:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="525020204"
Received: from allen-box.sh.intel.com ([10.239.159.118])
 by orsmga007.jf.intel.com with ESMTP; 06 Feb 2022 22:43:03 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Liu Yi L <yi.l.liu@intel.com>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: [PATCH v1 02/10] iommu/vt-d: Remove intel_iommu::domains
Date: Mon,  7 Feb 2022 14:41:34 +0800
Message-Id: <20220207064142.1092846-3-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220207064142.1092846-1-baolu.lu@linux.intel.com>
References: <20220207064142.1092846-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Jason Gunthorpe <jgg@nvidia.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
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

The "domains" field of the intel_iommu structure keeps the mapping of
domain_id to dmar_domain. This information is not used anywhere. Remove
and cleanup it to avoid unnecessary memory consumption.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 include/linux/intel-iommu.h |  1 -
 drivers/iommu/intel/iommu.c | 68 ++-----------------------------------
 2 files changed, 3 insertions(+), 66 deletions(-)

diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
index 5cfda90b2cca..8c7591b5f3e2 100644
--- a/include/linux/intel-iommu.h
+++ b/include/linux/intel-iommu.h
@@ -578,7 +578,6 @@ struct intel_iommu {
 
 #ifdef CONFIG_INTEL_IOMMU
 	unsigned long 	*domain_ids; /* bitmap of domains */
-	struct dmar_domain ***domains; /* ptr to domains */
 	spinlock_t	lock; /* protect context, domain ids */
 	struct root_entry *root_entry; /* virtual address */
 
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 3eb914798c18..438da5da301d 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -422,36 +422,6 @@ __setup("intel_iommu=", intel_iommu_setup);
 static struct kmem_cache *iommu_domain_cache;
 static struct kmem_cache *iommu_devinfo_cache;
 
-static struct dmar_domain* get_iommu_domain(struct intel_iommu *iommu, u16 did)
-{
-	struct dmar_domain **domains;
-	int idx = did >> 8;
-
-	domains = iommu->domains[idx];
-	if (!domains)
-		return NULL;
-
-	return domains[did & 0xff];
-}
-
-static void set_iommu_domain(struct intel_iommu *iommu, u16 did,
-			     struct dmar_domain *domain)
-{
-	struct dmar_domain **domains;
-	int idx = did >> 8;
-
-	if (!iommu->domains[idx]) {
-		size_t size = 256 * sizeof(struct dmar_domain *);
-		iommu->domains[idx] = kzalloc(size, GFP_ATOMIC);
-	}
-
-	domains = iommu->domains[idx];
-	if (WARN_ON(!domains))
-		return;
-	else
-		domains[did & 0xff] = domain;
-}
-
 void *alloc_pgtable_page(int node)
 {
 	struct page *page;
@@ -1718,8 +1688,7 @@ static void intel_flush_iotlb_all(struct iommu_domain *domain)
 						 DMA_TLB_DSI_FLUSH);
 
 		if (!cap_caching_mode(iommu->cap))
-			iommu_flush_dev_iotlb(get_iommu_domain(iommu, did),
-					      0, MAX_AGAW_PFN_WIDTH);
+			iommu_flush_dev_iotlb(dmar_domain, 0, MAX_AGAW_PFN_WIDTH);
 	}
 }
 
@@ -1782,7 +1751,6 @@ static void iommu_disable_translation(struct intel_iommu *iommu)
 static int iommu_init_domains(struct intel_iommu *iommu)
 {
 	u32 ndomains;
-	size_t size;
 
 	ndomains = cap_ndoms(iommu->cap);
 	pr_debug("%s: Number of Domains supported <%d>\n",
@@ -1794,24 +1762,6 @@ static int iommu_init_domains(struct intel_iommu *iommu)
 	if (!iommu->domain_ids)
 		return -ENOMEM;
 
-	size = (ALIGN(ndomains, 256) >> 8) * sizeof(struct dmar_domain **);
-	iommu->domains = kzalloc(size, GFP_KERNEL);
-
-	if (iommu->domains) {
-		size = 256 * sizeof(struct dmar_domain *);
-		iommu->domains[0] = kzalloc(size, GFP_KERNEL);
-	}
-
-	if (!iommu->domains || !iommu->domains[0]) {
-		pr_err("%s: Allocating domain array failed\n",
-		       iommu->name);
-		bitmap_free(iommu->domain_ids);
-		kfree(iommu->domains);
-		iommu->domain_ids = NULL;
-		iommu->domains    = NULL;
-		return -ENOMEM;
-	}
-
 	/*
 	 * If Caching mode is set, then invalid translations are tagged
 	 * with domain-id 0, hence we need to pre-allocate it. We also
@@ -1838,7 +1788,7 @@ static void disable_dmar_iommu(struct intel_iommu *iommu)
 	struct device_domain_info *info, *tmp;
 	unsigned long flags;
 
-	if (!iommu->domains || !iommu->domain_ids)
+	if (!iommu->domain_ids)
 		return;
 
 	spin_lock_irqsave(&device_domain_lock, flags);
@@ -1859,15 +1809,8 @@ static void disable_dmar_iommu(struct intel_iommu *iommu)
 
 static void free_dmar_iommu(struct intel_iommu *iommu)
 {
-	if ((iommu->domains) && (iommu->domain_ids)) {
-		int elems = ALIGN(cap_ndoms(iommu->cap), 256) >> 8;
-		int i;
-
-		for (i = 0; i < elems; i++)
-			kfree(iommu->domains[i]);
-		kfree(iommu->domains);
+	if (iommu->domain_ids) {
 		bitmap_free(iommu->domain_ids);
-		iommu->domains = NULL;
 		iommu->domain_ids = NULL;
 	}
 
@@ -1945,11 +1888,8 @@ static int domain_attach_iommu(struct dmar_domain *domain,
 		}
 
 		set_bit(num, iommu->domain_ids);
-		set_iommu_domain(iommu, num, domain);
-
 		domain->iommu_did[iommu->seq_id] = num;
 		domain->nid			 = iommu->node;
-
 		domain_update_iommu_cap(domain);
 	}
 
@@ -1968,8 +1908,6 @@ static void domain_detach_iommu(struct dmar_domain *domain,
 	if (domain->iommu_refcnt[iommu->seq_id] == 0) {
 		num = domain->iommu_did[iommu->seq_id];
 		clear_bit(num, iommu->domain_ids);
-		set_iommu_domain(iommu, num, NULL);
-
 		domain_update_iommu_cap(domain);
 		domain->iommu_did[iommu->seq_id] = 0;
 	}
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
