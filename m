Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7C240EDF5
	for <lists.iommu@lfdr.de>; Fri, 17 Sep 2021 01:41:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD519415AB;
	Thu, 16 Sep 2021 23:41:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NUfxbDUqgxo7; Thu, 16 Sep 2021 23:41:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C372E414C8;
	Thu, 16 Sep 2021 23:41:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91AE2C000D;
	Thu, 16 Sep 2021 23:41:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F318DC000D
 for <iommu@lists.linux-foundation.org>; Thu, 16 Sep 2021 23:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4E3A83FA1
 for <iommu@lists.linux-foundation.org>; Thu, 16 Sep 2021 23:41:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=deltatee.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8DDhcgKvIXzr for <iommu@lists.linux-foundation.org>;
 Thu, 16 Sep 2021 23:41:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 09C0483F46
 for <iommu@lists.linux-foundation.org>; Thu, 16 Sep 2021 23:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Cc:To:From:content-disposition;
 bh=bz2RCO50eAJJqSXBrFg6cmyKcgphdDgqUVkr793NcJE=; b=L1A8epd4lBEFsliq7yfovmIIi0
 9J8rAKvv4WtDkA97J3q4C3uJQ2CnpBOxY9FGp5UqbY2qecunKPMp+ClQ2ViMNL8d+jmKsnUlTUuUE
 0HMT+xfrWXV9eYHV7wcAn9cjrrGlCr6VkS/B0IdArOtlFrc4549irVuHkcYb9SrVtFOJhCUQFnJ+z
 Ik0o513YBLvR0Xeo92QpwXtvQW65EN2XG4o3fT5pjcjOFy5Fv51DHKVEacMNGkswbIaifVUIbWtPx
 h4UoW/PHYdjsaNPhYiv/nYY+ZhANifrm7Wik8sCJonoqexa1avXPKsGFOylNDpl1vpj3Wjek1jWU1
 aUY8b8Yw==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <gunthorp@deltatee.com>)
 id 1mR10B-0008I1-IW; Thu, 16 Sep 2021 17:41:12 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim
 4.94.2) (envelope-from <gunthorp@deltatee.com>)
 id 1mR105-000Vra-NQ; Thu, 16 Sep 2021 17:41:05 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org
Date: Thu, 16 Sep 2021 17:40:54 -0600
Message-Id: <20210916234100.122368-15-logang@deltatee.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210916234100.122368-1-logang@deltatee.com>
References: <20210916234100.122368-1-logang@deltatee.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, sbates@raithlin.com, hch@lst.de,
 jgg@ziepe.ca, christian.koenig@amd.com, jhubbard@nvidia.com,
 ddutile@redhat.com, willy@infradead.org, daniel.vetter@ffwll.ch,
 jason@jlekstrand.net, dave.hansen@linux.intel.com, helgaas@kernel.org,
 dan.j.williams@intel.com, andrzej.jakowski@intel.com, dave.b.minturn@intel.com,
 jianxin.xiong@intel.com, ira.weiny@intel.com, robin.murphy@arm.com,
 martin.oliveira@eideticom.com, ckulkarnilinux@gmail.com, logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH v3 14/20] mm: introduce FOLL_PCI_P2PDMA to gate getting PCI
 P2PDMA pages
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: Minturn Dave B <dave.b.minturn@intel.com>,
 Martin Oliveira <martin.oliveira@eideticom.com>,
 Ira Weiny <ira.weiny@intel.com>, John Hubbard <jhubbard@nvidia.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Robin Murphy <robin.murphy@arm.com>,
 Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Logan Gunthorpe <logang@deltatee.com>,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bjorn Helgaas <helgaas@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Stephen Bates <sbates@raithlin.com>,
 Jakowski Andrzej <andrzej.jakowski@intel.com>, Christoph Hellwig <hch@lst.de>,
 Xiong Jianxin <jianxin.xiong@intel.com>
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

Callers that expect PCI P2PDMA pages can now set FOLL_PCI_P2PDMA to
allow obtaining P2PDMA pages. If a caller does not set this flag
and tries to map P2PDMA pages it will fail.

This is implemented by adding a flag and a check to get_dev_pagemap().

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 drivers/dax/super.c      |  7 ++++---
 include/linux/memremap.h |  4 ++--
 include/linux/mm.h       |  1 +
 mm/gup.c                 | 28 +++++++++++++++++-----------
 mm/huge_memory.c         |  8 ++++----
 mm/memory-failure.c      |  4 ++--
 mm/memory_hotplug.c      |  2 +-
 mm/memremap.c            | 14 ++++++++++----
 8 files changed, 41 insertions(+), 27 deletions(-)

diff --git a/drivers/dax/super.c b/drivers/dax/super.c
index fc89e91beea7..ffb6e57e65bb 100644
--- a/drivers/dax/super.c
+++ b/drivers/dax/super.c
@@ -180,9 +180,10 @@ bool generic_fsdax_supported(struct dax_device *dax_dev,
 	} else if (pfn_t_devmap(pfn) && pfn_t_devmap(end_pfn)) {
 		struct dev_pagemap *pgmap, *end_pgmap;
 
-		pgmap = get_dev_pagemap(pfn_t_to_pfn(pfn), NULL);
-		end_pgmap = get_dev_pagemap(pfn_t_to_pfn(end_pfn), NULL);
-		if (pgmap && pgmap == end_pgmap && pgmap->type == MEMORY_DEVICE_FS_DAX
+		pgmap = get_dev_pagemap(pfn_t_to_pfn(pfn), NULL, false);
+		end_pgmap = get_dev_pagemap(pfn_t_to_pfn(end_pfn), NULL, false);
+		if (!IS_ERR_OR_NULL(pgmap) && pgmap == end_pgmap
+				&& pgmap->type == MEMORY_DEVICE_FS_DAX
 				&& pfn_t_to_page(pfn)->pgmap == pgmap
 				&& pfn_t_to_page(end_pfn)->pgmap == pgmap
 				&& pfn_t_to_pfn(pfn) == PHYS_PFN(__pa(kaddr))
diff --git a/include/linux/memremap.h b/include/linux/memremap.h
index c0e9d35889e8..f10c332dac8b 100644
--- a/include/linux/memremap.h
+++ b/include/linux/memremap.h
@@ -136,7 +136,7 @@ void memunmap_pages(struct dev_pagemap *pgmap);
 void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
 void devm_memunmap_pages(struct device *dev, struct dev_pagemap *pgmap);
 struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
-		struct dev_pagemap *pgmap);
+		struct dev_pagemap *pgmap, bool allow_pci_p2pdma);
 bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
 
 unsigned long vmem_altmap_offset(struct vmem_altmap *altmap);
@@ -161,7 +161,7 @@ static inline void devm_memunmap_pages(struct device *dev,
 }
 
 static inline struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
-		struct dev_pagemap *pgmap)
+		struct dev_pagemap *pgmap, bool allow_pci_p2pdma)
 {
 	return NULL;
 }
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 73a52aba448f..6afdc09d0712 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2864,6 +2864,7 @@ struct page *follow_page(struct vm_area_struct *vma, unsigned long address,
 #define FOLL_SPLIT_PMD	0x20000	/* split huge pmd before returning */
 #define FOLL_PIN	0x40000	/* pages must be released via unpin_user_page */
 #define FOLL_FAST_ONLY	0x80000	/* gup_fast: prevent fall-back to slow gup */
+#define FOLL_PCI_P2PDMA	0x100000 /* allow returning PCI P2PDMA pages */
 
 /*
  * FOLL_PIN and FOLL_LONGTERM may be used in various combinations with each
diff --git a/mm/gup.c b/mm/gup.c
index 886d6148d3d0..1a03b9200cd9 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -522,11 +522,16 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
 		 * case since they are only valid while holding the pgmap
 		 * reference.
 		 */
-		*pgmap = get_dev_pagemap(pte_pfn(pte), *pgmap);
-		if (*pgmap)
+		*pgmap = get_dev_pagemap(pte_pfn(pte), *pgmap,
+					 flags & FOLL_PCI_P2PDMA);
+		if (IS_ERR(*pgmap)) {
+			page = ERR_CAST(*pgmap);
+			goto out;
+		} else if (*pgmap) {
 			page = pte_page(pte);
-		else
+		} else {
 			goto no_page;
+		}
 	} else if (unlikely(!page)) {
 		if (flags & FOLL_DUMP) {
 			/* Avoid special (like zero) pages in core dumps */
@@ -846,7 +851,7 @@ struct page *follow_page(struct vm_area_struct *vma, unsigned long address,
 		return NULL;
 
 	page = follow_page_mask(vma, address, foll_flags, &ctx);
-	if (ctx.pgmap)
+	if (!IS_ERR_OR_NULL(ctx.pgmap))
 		put_dev_pagemap(ctx.pgmap);
 	return page;
 }
@@ -1199,7 +1204,7 @@ static long __get_user_pages(struct mm_struct *mm,
 		nr_pages -= page_increm;
 	} while (nr_pages);
 out:
-	if (ctx.pgmap)
+	if (!IS_ERR_OR_NULL(ctx.pgmap))
 		put_dev_pagemap(ctx.pgmap);
 	return i ? i : ret;
 }
@@ -2149,8 +2154,9 @@ static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
 			if (unlikely(flags & FOLL_LONGTERM))
 				goto pte_unmap;
 
-			pgmap = get_dev_pagemap(pte_pfn(pte), pgmap);
-			if (unlikely(!pgmap)) {
+			pgmap = get_dev_pagemap(pte_pfn(pte), pgmap,
+						flags & FOLL_PCI_P2PDMA);
+			if (IS_ERR_OR_NULL(pgmap)) {
 				undo_dev_pagemap(nr, nr_start, flags, pages);
 				goto pte_unmap;
 			}
@@ -2198,7 +2204,7 @@ static int gup_pte_range(pmd_t pmd, unsigned long addr, unsigned long end,
 	ret = 1;
 
 pte_unmap:
-	if (pgmap)
+	if (!IS_ERR_OR_NULL(pgmap))
 		put_dev_pagemap(pgmap);
 	pte_unmap(ptem);
 	return ret;
@@ -2233,8 +2239,8 @@ static int __gup_device_huge(unsigned long pfn, unsigned long addr,
 	do {
 		struct page *page = pfn_to_page(pfn);
 
-		pgmap = get_dev_pagemap(pfn, pgmap);
-		if (unlikely(!pgmap)) {
+		pgmap = get_dev_pagemap(pfn, pgmap, flags & FOLL_PCI_P2PDMA);
+		if (IS_ERR_OR_NULL(pgmap)) {
 			undo_dev_pagemap(nr, nr_start, flags, pages);
 			ret = 0;
 			break;
@@ -2708,7 +2714,7 @@ static int internal_get_user_pages_fast(unsigned long start,
 
 	if (WARN_ON_ONCE(gup_flags & ~(FOLL_WRITE | FOLL_LONGTERM |
 				       FOLL_FORCE | FOLL_PIN | FOLL_GET |
-				       FOLL_FAST_ONLY)))
+				       FOLL_FAST_ONLY | FOLL_PCI_P2PDMA)))
 		return -EINVAL;
 
 	if (gup_flags & FOLL_PIN)
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 5e9ef0fc261e..853157a84b00 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1014,8 +1014,8 @@ struct page *follow_devmap_pmd(struct vm_area_struct *vma, unsigned long addr,
 		return ERR_PTR(-EEXIST);
 
 	pfn += (addr & ~PMD_MASK) >> PAGE_SHIFT;
-	*pgmap = get_dev_pagemap(pfn, *pgmap);
-	if (!*pgmap)
+	*pgmap = get_dev_pagemap(pfn, *pgmap, flags & FOLL_PCI_P2PDMA);
+	if (IS_ERR_OR_NULL(*pgmap))
 		return ERR_PTR(-EFAULT);
 	page = pfn_to_page(pfn);
 	if (!try_grab_page(page, flags))
@@ -1181,8 +1181,8 @@ struct page *follow_devmap_pud(struct vm_area_struct *vma, unsigned long addr,
 		return ERR_PTR(-EEXIST);
 
 	pfn += (addr & ~PUD_MASK) >> PAGE_SHIFT;
-	*pgmap = get_dev_pagemap(pfn, *pgmap);
-	if (!*pgmap)
+	*pgmap = get_dev_pagemap(pfn, *pgmap, flags & FOLL_PCI_P2PDMA);
+	if (IS_ERR_OR_NULL(*pgmap))
 		return ERR_PTR(-EFAULT);
 	page = pfn_to_page(pfn);
 	if (!try_grab_page(page, flags))
diff --git a/mm/memory-failure.c b/mm/memory-failure.c
index 54879c339024..8f15ccce5aea 100644
--- a/mm/memory-failure.c
+++ b/mm/memory-failure.c
@@ -1635,8 +1635,8 @@ int memory_failure(unsigned long pfn, int flags)
 	p = pfn_to_online_page(pfn);
 	if (!p) {
 		if (pfn_valid(pfn)) {
-			pgmap = get_dev_pagemap(pfn, NULL);
-			if (pgmap)
+			pgmap = get_dev_pagemap(pfn, NULL, false);
+			if (!IS_ERR_OR_NULL(pgmap))
 				return memory_failure_dev_pagemap(pfn, flags,
 								  pgmap);
 		}
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 9fd0be32a281..fa5cf8898b6b 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -285,7 +285,7 @@ struct page *pfn_to_online_page(unsigned long pfn)
 	 * the section may be 'offline' but 'valid'. Only
 	 * get_dev_pagemap() can determine sub-section online status.
 	 */
-	pgmap = get_dev_pagemap(pfn, NULL);
+	pgmap = get_dev_pagemap(pfn, NULL, true);
 	put_dev_pagemap(pgmap);
 
 	/* The presence of a pgmap indicates ZONE_DEVICE offline pfn */
diff --git a/mm/memremap.c b/mm/memremap.c
index ed593bf87109..ceebdb8a72bb 100644
--- a/mm/memremap.c
+++ b/mm/memremap.c
@@ -206,14 +206,14 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
 				"altmap not supported for multiple ranges\n"))
 		return -EINVAL;
 
-	conflict_pgmap = get_dev_pagemap(PHYS_PFN(range->start), NULL);
+	conflict_pgmap = get_dev_pagemap(PHYS_PFN(range->start), NULL, true);
 	if (conflict_pgmap) {
 		WARN(1, "Conflicting mapping in same section\n");
 		put_dev_pagemap(conflict_pgmap);
 		return -ENOMEM;
 	}
 
-	conflict_pgmap = get_dev_pagemap(PHYS_PFN(range->end), NULL);
+	conflict_pgmap = get_dev_pagemap(PHYS_PFN(range->end), NULL, true);
 	if (conflict_pgmap) {
 		WARN(1, "Conflicting mapping in same section\n");
 		put_dev_pagemap(conflict_pgmap);
@@ -465,19 +465,20 @@ void vmem_altmap_free(struct vmem_altmap *altmap, unsigned long nr_pfns)
  * get_dev_pagemap() - take a new live reference on the dev_pagemap for @pfn
  * @pfn: page frame number to lookup page_map
  * @pgmap: optional known pgmap that already has a reference
+ * @allow_pci_p2pdma: allow getting a pgmap with the PCI P2PDMA type
  *
  * If @pgmap is non-NULL and covers @pfn it will be returned as-is.  If @pgmap
  * is non-NULL but does not cover @pfn the reference to it will be released.
  */
 struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
-		struct dev_pagemap *pgmap)
+		struct dev_pagemap *pgmap, bool allow_pci_p2pdma)
 {
 	resource_size_t phys = PFN_PHYS(pfn);
 
 	/*
 	 * In the cached case we're already holding a live reference.
 	 */
-	if (pgmap) {
+	if (!IS_ERR_OR_NULL(pgmap)) {
 		if (phys >= pgmap->range.start && phys <= pgmap->range.end)
 			return pgmap;
 		put_dev_pagemap(pgmap);
@@ -490,6 +491,11 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
 		pgmap = NULL;
 	rcu_read_unlock();
 
+	if (!allow_pci_p2pdma && pgmap->type == MEMORY_DEVICE_PCI_P2PDMA) {
+		put_dev_pagemap(pgmap);
+		return ERR_PTR(-EREMOTEIO);
+	}
+
 	return pgmap;
 }
 EXPORT_SYMBOL_GPL(get_dev_pagemap);
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
