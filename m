Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C81A25CA17
	for <lists.iommu@lfdr.de>; Thu,  3 Sep 2020 22:20:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F32FB86BF8;
	Thu,  3 Sep 2020 20:20:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w7XdXRFJbTKO; Thu,  3 Sep 2020 20:19:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2EB4F86566;
	Thu,  3 Sep 2020 20:19:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 112E3C0051;
	Thu,  3 Sep 2020 20:19:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46E13C0051
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 20:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 34D1A87452
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 20:19:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d4KAm6KUWqPj for <iommu@lists.linux-foundation.org>;
 Thu,  3 Sep 2020 20:19:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B79408744F
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 20:19:54 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id w186so4379341qkd.1
 for <iommu@lists.linux-foundation.org>; Thu, 03 Sep 2020 13:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tcd-ie.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iC1bO7kY8h1dxCLc+88Y9d3vLDfR8lgV6EhA2XQHf+4=;
 b=yc6DgihpCzequMlQhUlh5JEomv/fvSvlPIsisqdLnSJUSApr6eScRa8SGfR+an9kO+
 59trSEQskENnvCf4+Mv8TL65+G+p7ido80cYsWOa2hY8kdcTC78N4JMKRgtAaAxDBrwZ
 McOOTXGKG1XL1kXwxDisat6efxoCu5gH7HUgiW0gHBykntdgarcmfjlLc6a/szvrzKqy
 TUbq+jRSfnzRNGD0lwKOlFRaqMXpdJtdWG/TqgSCinkd5iE/0rJbXmEZiw2eiApVCvaF
 hAuBMC5bbe+Ae9tqbhDVANHUVBfhTC4vXACC2YFEFSUb62F0vRg7qd4TLIWR67s0GouP
 MM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iC1bO7kY8h1dxCLc+88Y9d3vLDfR8lgV6EhA2XQHf+4=;
 b=ho0YSMIMIQOTkxKhp+crfgxSPl1i5e6lpikW4jkowlz4AvRyAgmvSK8JSc5ublWrsu
 U+5UaxICtlsx7CfxThV+sXEAYDGpoebY0cZYYEZy78TjnxMweMKaQ15zExfFnLUDytCb
 nYOgLkhjlc2wp7ilhUd470rkmcl9x2ysCposvaFdEIOczkP4I66tT8c37MYPVrtvuevW
 zh9LccSyuEdhlhLQJq9OaWxwunVGYZgzuSAdkPgEjYbQB14YRfUr0KXWZvVV8xmqWhsA
 UVhi83rsdST+tpw1/Auxymxp2z48LuG0jhe/9RFwvaBLpkmRKnpd/Hc34nX8qz0xJSlT
 YDYA==
X-Gm-Message-State: AOAM5310ZoEb3cxDm2QhPLNTi88X+oGTlAof1WBS1q3lDw59ne/Vr5LE
 zN781StdYDNUjxgnctbzkzugL91LpoXA8Q==
X-Google-Smtp-Source: ABdhPJzamPaTaKsUUij7ItNFT62XMRVJ6E0lUB8iElBiHPjZ97M7DgLlrcrGGBHpY/Kg4wEMzoSEYA==
X-Received: by 2002:a37:8405:: with SMTP id g5mr4837443qkd.286.1599164393025; 
 Thu, 03 Sep 2020 13:19:53 -0700 (PDT)
Received: from tom-ThinkPad-X1-Carbon-5th.hitronhub.home
 (CPEa84e3fce9b83-CMa84e3fce9b80.cpe.net.cable.rogers.com. [99.230.61.29])
 by smtp.googlemail.com with ESMTPSA id g37sm2863257qtk.76.2020.09.03.13.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 13:19:52 -0700 (PDT)
From: Tom Murphy <murphyt7@tcd.ie>
To: iommu@lists.linux-foundation.org
Subject: [PATCH V2 4/5] iommu/vt-d: Convert intel iommu driver to the iommu ops
Date: Thu,  3 Sep 2020 21:18:36 +0100
Message-Id: <20200903201839.7327-5-murphyt7@tcd.ie>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903201839.7327-1-murphyt7@tcd.ie>
References: <20200903201839.7327-1-murphyt7@tcd.ie>
MIME-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Tom Murphy <murphyt7@tcd.ie>
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

Convert the intel iommu driver to the dma-iommu api. Remove the iova
handling and reserve region code from the intel iommu driver.

Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
---
 drivers/iommu/Kconfig       |   1 +
 drivers/iommu/intel/iommu.c | 756 +++---------------------------------
 2 files changed, 51 insertions(+), 706 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index b622af72448f..f1404fc4cc5f 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -191,6 +191,7 @@ config INTEL_IOMMU
 	select DMAR_TABLE
 	select SWIOTLB
 	select IOASID
+	select IOMMU_DMA
 	help
 	  DMA remapping (DMAR) devices support enables independent address
 	  translations for Direct Memory Access (DMA) from devices.
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index ba47623f0f12..98cda61681d2 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -31,6 +31,7 @@
 #include <linux/io.h>
 #include <linux/iova.h>
 #include <linux/iommu.h>
+#include <linux/dma-iommu.h>
 #include <linux/intel-iommu.h>
 #include <linux/syscore_ops.h>
 #include <linux/tboot.h>
@@ -41,7 +42,6 @@
 #include <linux/dma-direct.h>
 #include <linux/crash_dump.h>
 #include <linux/numa.h>
-#include <linux/swiotlb.h>
 #include <asm/irq_remapping.h>
 #include <asm/cacheflush.h>
 #include <asm/iommu.h>
@@ -383,9 +383,6 @@ struct device_domain_info *get_domain_info(struct device *dev)
 DEFINE_SPINLOCK(device_domain_lock);
 static LIST_HEAD(device_domain_list);
 
-#define device_needs_bounce(d) (!intel_no_bounce && dev_is_pci(d) &&	\
-				to_pci_dev(d)->untrusted)
-
 /*
  * Iterate over elements in device_domain_list and call the specified
  * callback @fn against each element.
@@ -748,7 +745,7 @@ static int iommu_dummy(struct device *dev)
 
 static bool attach_deferred(struct device *dev)
 {
-	return dev->archdata.iommu == DEFER_DEVICE_DOMAIN_INFO;
+	return dev_iommu_priv_get(dev) == DEFER_DEVICE_DOMAIN_INFO;
 }
 
 /**
@@ -1194,13 +1191,6 @@ static void dma_free_pagelist(struct page *freelist)
 	}
 }
 
-static void iova_entry_free(unsigned long data)
-{
-	struct page *freelist = (struct page *)data;
-
-	dma_free_pagelist(freelist);
-}
-
 /* iommu handling */
 static int iommu_alloc_root_entry(struct intel_iommu *iommu)
 {
@@ -1565,19 +1555,17 @@ static inline void __mapping_notify_one(struct intel_iommu *iommu,
 		iommu_flush_write_buffer(iommu);
 }
 
-static void iommu_flush_iova(struct iova_domain *iovad)
+static void intel_flush_iotlb_all(struct iommu_domain *domain)
 {
-	struct dmar_domain *domain;
+	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
 	int idx;
 
-	domain = container_of(iovad, struct dmar_domain, iovad);
-
-	for_each_domain_iommu(idx, domain) {
+	for_each_domain_iommu(idx, dmar_domain) {
 		struct intel_iommu *iommu = g_iommus[idx];
-		u16 did = domain->iommu_did[iommu->seq_id];
+		u16 did = dmar_domain->iommu_did[iommu->seq_id];
 
-		if (domain_use_first_level(domain))
-			domain_flush_piotlb(iommu, domain, 0, -1, 0);
+		if (domain_use_first_level(dmar_domain))
+			domain_flush_piotlb(iommu, dmar_domain, 0, -1, 0);
 		else
 			iommu->flush.flush_iotlb(iommu, did, 0, 0,
 						 DMA_TLB_DSI_FLUSH);
@@ -1855,48 +1843,6 @@ static int domain_detach_iommu(struct dmar_domain *domain,
 	return count;
 }
 
-static struct iova_domain reserved_iova_list;
-static struct lock_class_key reserved_rbtree_key;
-
-static int dmar_init_reserved_ranges(void)
-{
-	struct pci_dev *pdev = NULL;
-	struct iova *iova;
-	int i;
-
-	init_iova_domain(&reserved_iova_list, VTD_PAGE_SIZE, IOVA_START_PFN);
-
-	lockdep_set_class(&reserved_iova_list.iova_rbtree_lock,
-		&reserved_rbtree_key);
-
-	/* IOAPIC ranges shouldn't be accessed by DMA */
-	iova = reserve_iova(&reserved_iova_list, IOVA_PFN(IOAPIC_RANGE_START),
-		IOVA_PFN(IOAPIC_RANGE_END));
-	if (!iova) {
-		pr_err("Reserve IOAPIC range failed\n");
-		return -ENODEV;
-	}
-
-	/* Reserve all PCI MMIO to avoid peer-to-peer access */
-	for_each_pci_dev(pdev) {
-		struct resource *r;
-
-		for (i = 0; i < PCI_NUM_RESOURCES; i++) {
-			r = &pdev->resource[i];
-			if (!r->flags || !(r->flags & IORESOURCE_MEM))
-				continue;
-			iova = reserve_iova(&reserved_iova_list,
-					    IOVA_PFN(r->start),
-					    IOVA_PFN(r->end));
-			if (!iova) {
-				pci_err(pdev, "Reserve iova for %pR failed\n", r);
-				return -ENODEV;
-			}
-		}
-	}
-	return 0;
-}
-
 static inline int guestwidth_to_adjustwidth(int gaw)
 {
 	int agaw;
@@ -1919,7 +1865,7 @@ static void domain_exit(struct dmar_domain *domain)
 
 	/* destroy iovas */
 	if (domain->domain.type == IOMMU_DOMAIN_DMA)
-		put_iova_domain(&domain->iovad);
+		iommu_put_dma_cookie(&domain->domain);
 
 	if (domain->pgd) {
 		struct page *freelist;
@@ -2450,16 +2396,6 @@ struct dmar_domain *find_domain(struct device *dev)
 	return NULL;
 }
 
-static void do_deferred_attach(struct device *dev)
-{
-	struct iommu_domain *domain;
-
-	dev->archdata.iommu = NULL;
-	domain = iommu_get_domain_for_dev(dev);
-	if (domain)
-		intel_iommu_attach_device(domain, dev);
-}
-
 static inline struct device_domain_info *
 dmar_search_domain_by_dev_info(int segment, int bus, int devfn)
 {
@@ -3332,591 +3268,6 @@ static int __init init_dmars(void)
 	return ret;
 }
 
-/* This takes a number of _MM_ pages, not VTD pages */
-static unsigned long intel_alloc_iova(struct device *dev,
-				     struct dmar_domain *domain,
-				     unsigned long nrpages, uint64_t dma_mask)
-{
-	unsigned long iova_pfn;
-
-	/*
-	 * Restrict dma_mask to the width that the iommu can handle.
-	 * First-level translation restricts the input-address to a
-	 * canonical address (i.e., address bits 63:N have the same
-	 * value as address bit [N-1], where N is 48-bits with 4-level
-	 * paging and 57-bits with 5-level paging). Hence, skip bit
-	 * [N-1].
-	 */
-	if (domain_use_first_level(domain))
-		dma_mask = min_t(uint64_t, DOMAIN_MAX_ADDR(domain->gaw - 1),
-				 dma_mask);
-	else
-		dma_mask = min_t(uint64_t, DOMAIN_MAX_ADDR(domain->gaw),
-				 dma_mask);
-
-	/* Ensure we reserve the whole size-aligned region */
-	nrpages = __roundup_pow_of_two(nrpages);
-
-	if (!dmar_forcedac && dma_mask > DMA_BIT_MASK(32)) {
-		/*
-		 * First try to allocate an io virtual address in
-		 * DMA_BIT_MASK(32) and if that fails then try allocating
-		 * from higher range
-		 */
-		iova_pfn = alloc_iova_fast(&domain->iovad, nrpages,
-					   IOVA_PFN(DMA_BIT_MASK(32)), false);
-		if (iova_pfn)
-			return iova_pfn;
-	}
-	iova_pfn = alloc_iova_fast(&domain->iovad, nrpages,
-				   IOVA_PFN(dma_mask), true);
-	if (unlikely(!iova_pfn)) {
-		dev_err_once(dev, "Allocating %ld-page iova failed\n",
-			     nrpages);
-		return 0;
-	}
-
-	return iova_pfn;
-}
-
-static dma_addr_t __intel_map_single(struct device *dev, phys_addr_t paddr,
-				     size_t size, int dir, u64 dma_mask)
-{
-	struct dmar_domain *domain;
-	phys_addr_t start_paddr;
-	unsigned long iova_pfn;
-	int prot = 0;
-	int ret;
-	struct intel_iommu *iommu;
-	unsigned long paddr_pfn = paddr >> PAGE_SHIFT;
-
-	BUG_ON(dir == DMA_NONE);
-
-	if (unlikely(attach_deferred(dev)))
-		do_deferred_attach(dev);
-
-	domain = find_domain(dev);
-	if (!domain)
-		return DMA_MAPPING_ERROR;
-
-	iommu = domain_get_iommu(domain);
-	size = aligned_nrpages(paddr, size);
-
-	iova_pfn = intel_alloc_iova(dev, domain, dma_to_mm_pfn(size), dma_mask);
-	if (!iova_pfn)
-		goto error;
-
-	/*
-	 * Check if DMAR supports zero-length reads on write only
-	 * mappings..
-	 */
-	if (dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL || \
-			!cap_zlr(iommu->cap))
-		prot |= DMA_PTE_READ;
-	if (dir == DMA_FROM_DEVICE || dir == DMA_BIDIRECTIONAL)
-		prot |= DMA_PTE_WRITE;
-	/*
-	 * paddr - (paddr + size) might be partial page, we should map the whole
-	 * page.  Note: if two part of one page are separately mapped, we
-	 * might have two guest_addr mapping to the same host paddr, but this
-	 * is not a big problem
-	 */
-	ret = domain_pfn_mapping(domain, mm_to_dma_pfn(iova_pfn),
-				 mm_to_dma_pfn(paddr_pfn), size, prot);
-	if (ret)
-		goto error;
-
-	start_paddr = (phys_addr_t)iova_pfn << PAGE_SHIFT;
-	start_paddr += paddr & ~PAGE_MASK;
-
-	trace_map_single(dev, start_paddr, paddr, size << VTD_PAGE_SHIFT);
-
-	return start_paddr;
-
-error:
-	if (iova_pfn)
-		free_iova_fast(&domain->iovad, iova_pfn, dma_to_mm_pfn(size));
-	dev_err(dev, "Device request: %zx@%llx dir %d --- failed\n",
-		size, (unsigned long long)paddr, dir);
-	return DMA_MAPPING_ERROR;
-}
-
-static dma_addr_t intel_map_page(struct device *dev, struct page *page,
-				 unsigned long offset, size_t size,
-				 enum dma_data_direction dir,
-				 unsigned long attrs)
-{
-	return __intel_map_single(dev, page_to_phys(page) + offset,
-				  size, dir, *dev->dma_mask);
-}
-
-static dma_addr_t intel_map_resource(struct device *dev, phys_addr_t phys_addr,
-				     size_t size, enum dma_data_direction dir,
-				     unsigned long attrs)
-{
-	return __intel_map_single(dev, phys_addr, size, dir, *dev->dma_mask);
-}
-
-static void intel_unmap(struct device *dev, dma_addr_t dev_addr, size_t size)
-{
-	struct dmar_domain *domain;
-	unsigned long start_pfn, last_pfn;
-	unsigned long nrpages;
-	unsigned long iova_pfn;
-	struct intel_iommu *iommu;
-	struct page *freelist;
-	struct pci_dev *pdev = NULL;
-
-	domain = find_domain(dev);
-	BUG_ON(!domain);
-
-	iommu = domain_get_iommu(domain);
-
-	iova_pfn = IOVA_PFN(dev_addr);
-
-	nrpages = aligned_nrpages(dev_addr, size);
-	start_pfn = mm_to_dma_pfn(iova_pfn);
-	last_pfn = start_pfn + nrpages - 1;
-
-	if (dev_is_pci(dev))
-		pdev = to_pci_dev(dev);
-
-	freelist = domain_unmap(domain, start_pfn, last_pfn, NULL);
-	if (intel_iommu_strict || (pdev && pdev->untrusted) ||
-			!has_iova_flush_queue(&domain->iovad)) {
-		iommu_flush_iotlb_psi(iommu, domain, start_pfn,
-				      nrpages, !freelist, 0);
-		/* free iova */
-		free_iova_fast(&domain->iovad, iova_pfn, dma_to_mm_pfn(nrpages));
-		dma_free_pagelist(freelist);
-	} else {
-		queue_iova(&domain->iovad, iova_pfn, nrpages,
-			   (unsigned long)freelist);
-		/*
-		 * queue up the release of the unmap to save the 1/6th of the
-		 * cpu used up by the iotlb flush operation...
-		 */
-	}
-
-	trace_unmap_single(dev, dev_addr, size);
-}
-
-static void intel_unmap_page(struct device *dev, dma_addr_t dev_addr,
-			     size_t size, enum dma_data_direction dir,
-			     unsigned long attrs)
-{
-	intel_unmap(dev, dev_addr, size);
-}
-
-static void intel_unmap_resource(struct device *dev, dma_addr_t dev_addr,
-		size_t size, enum dma_data_direction dir, unsigned long attrs)
-{
-	intel_unmap(dev, dev_addr, size);
-}
-
-static void *intel_alloc_coherent(struct device *dev, size_t size,
-				  dma_addr_t *dma_handle, gfp_t flags,
-				  unsigned long attrs)
-{
-	struct page *page = NULL;
-	int order;
-
-	if (unlikely(attach_deferred(dev)))
-		do_deferred_attach(dev);
-
-	size = PAGE_ALIGN(size);
-	order = get_order(size);
-
-	if (gfpflags_allow_blocking(flags)) {
-		unsigned int count = size >> PAGE_SHIFT;
-
-		page = dma_alloc_from_contiguous(dev, count, order,
-						 flags & __GFP_NOWARN);
-	}
-
-	if (!page)
-		page = alloc_pages(flags, order);
-	if (!page)
-		return NULL;
-	memset(page_address(page), 0, size);
-
-	*dma_handle = __intel_map_single(dev, page_to_phys(page), size,
-					 DMA_BIDIRECTIONAL,
-					 dev->coherent_dma_mask);
-	if (*dma_handle != DMA_MAPPING_ERROR)
-		return page_address(page);
-	if (!dma_release_from_contiguous(dev, page, size >> PAGE_SHIFT))
-		__free_pages(page, order);
-
-	return NULL;
-}
-
-static void intel_free_coherent(struct device *dev, size_t size, void *vaddr,
-				dma_addr_t dma_handle, unsigned long attrs)
-{
-	int order;
-	struct page *page = virt_to_page(vaddr);
-
-	size = PAGE_ALIGN(size);
-	order = get_order(size);
-
-	intel_unmap(dev, dma_handle, size);
-	if (!dma_release_from_contiguous(dev, page, size >> PAGE_SHIFT))
-		__free_pages(page, order);
-}
-
-static void intel_unmap_sg(struct device *dev, struct scatterlist *sglist,
-			   int nelems, enum dma_data_direction dir,
-			   unsigned long attrs)
-{
-	dma_addr_t startaddr = sg_dma_address(sglist) & PAGE_MASK;
-	unsigned long nrpages = 0;
-	struct scatterlist *sg;
-	int i;
-
-	for_each_sg(sglist, sg, nelems, i) {
-		nrpages += aligned_nrpages(sg_dma_address(sg), sg_dma_len(sg));
-	}
-
-	intel_unmap(dev, startaddr, nrpages << VTD_PAGE_SHIFT);
-
-	trace_unmap_sg(dev, startaddr, nrpages << VTD_PAGE_SHIFT);
-}
-
-static int intel_map_sg(struct device *dev, struct scatterlist *sglist, int nelems,
-			enum dma_data_direction dir, unsigned long attrs)
-{
-	int i;
-	struct dmar_domain *domain;
-	size_t size = 0;
-	int prot = 0;
-	unsigned long iova_pfn;
-	int ret;
-	struct scatterlist *sg;
-	unsigned long start_vpfn;
-	struct intel_iommu *iommu;
-
-	BUG_ON(dir == DMA_NONE);
-
-	if (unlikely(attach_deferred(dev)))
-		do_deferred_attach(dev);
-
-	domain = find_domain(dev);
-	if (!domain)
-		return 0;
-
-	iommu = domain_get_iommu(domain);
-
-	for_each_sg(sglist, sg, nelems, i)
-		size += aligned_nrpages(sg->offset, sg->length);
-
-	iova_pfn = intel_alloc_iova(dev, domain, dma_to_mm_pfn(size),
-				*dev->dma_mask);
-	if (!iova_pfn) {
-		sglist->dma_length = 0;
-		return 0;
-	}
-
-	/*
-	 * Check if DMAR supports zero-length reads on write only
-	 * mappings..
-	 */
-	if (dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL || \
-			!cap_zlr(iommu->cap))
-		prot |= DMA_PTE_READ;
-	if (dir == DMA_FROM_DEVICE || dir == DMA_BIDIRECTIONAL)
-		prot |= DMA_PTE_WRITE;
-
-	start_vpfn = mm_to_dma_pfn(iova_pfn);
-
-	ret = domain_sg_mapping(domain, start_vpfn, sglist, size, prot);
-	if (unlikely(ret)) {
-		dma_pte_free_pagetable(domain, start_vpfn,
-				       start_vpfn + size - 1,
-				       agaw_to_level(domain->agaw) + 1);
-		free_iova_fast(&domain->iovad, iova_pfn, dma_to_mm_pfn(size));
-		return 0;
-	}
-
-	for_each_sg(sglist, sg, nelems, i)
-		trace_map_sg(dev, i + 1, nelems, sg);
-
-	return nelems;
-}
-
-static u64 intel_get_required_mask(struct device *dev)
-{
-	return DMA_BIT_MASK(32);
-}
-
-static const struct dma_map_ops intel_dma_ops = {
-	.alloc = intel_alloc_coherent,
-	.free = intel_free_coherent,
-	.map_sg = intel_map_sg,
-	.unmap_sg = intel_unmap_sg,
-	.map_page = intel_map_page,
-	.unmap_page = intel_unmap_page,
-	.map_resource = intel_map_resource,
-	.unmap_resource = intel_unmap_resource,
-	.dma_supported = dma_direct_supported,
-	.mmap = dma_common_mmap,
-	.get_sgtable = dma_common_get_sgtable,
-	.get_required_mask = intel_get_required_mask,
-};
-
-static void
-bounce_sync_single(struct device *dev, dma_addr_t addr, size_t size,
-		   enum dma_data_direction dir, enum dma_sync_target target)
-{
-	struct dmar_domain *domain;
-	phys_addr_t tlb_addr;
-
-	domain = find_domain(dev);
-	if (WARN_ON(!domain))
-		return;
-
-	tlb_addr = intel_iommu_iova_to_phys(&domain->domain, addr);
-	if (is_swiotlb_buffer(tlb_addr))
-		swiotlb_tbl_sync_single(dev, tlb_addr, size, dir, target);
-}
-
-static dma_addr_t
-bounce_map_single(struct device *dev, phys_addr_t paddr, size_t size,
-		  enum dma_data_direction dir, unsigned long attrs,
-		  u64 dma_mask)
-{
-	size_t aligned_size = ALIGN(size, VTD_PAGE_SIZE);
-	struct dmar_domain *domain;
-	struct intel_iommu *iommu;
-	unsigned long iova_pfn;
-	unsigned long nrpages;
-	phys_addr_t tlb_addr;
-	int prot = 0;
-	int ret;
-
-	if (unlikely(attach_deferred(dev)))
-		do_deferred_attach(dev);
-
-	domain = find_domain(dev);
-
-	if (WARN_ON(dir == DMA_NONE || !domain))
-		return DMA_MAPPING_ERROR;
-
-	iommu = domain_get_iommu(domain);
-	if (WARN_ON(!iommu))
-		return DMA_MAPPING_ERROR;
-
-	nrpages = aligned_nrpages(0, size);
-	iova_pfn = intel_alloc_iova(dev, domain,
-				    dma_to_mm_pfn(nrpages), dma_mask);
-	if (!iova_pfn)
-		return DMA_MAPPING_ERROR;
-
-	/*
-	 * Check if DMAR supports zero-length reads on write only
-	 * mappings..
-	 */
-	if (dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL ||
-			!cap_zlr(iommu->cap))
-		prot |= DMA_PTE_READ;
-	if (dir == DMA_FROM_DEVICE || dir == DMA_BIDIRECTIONAL)
-		prot |= DMA_PTE_WRITE;
-
-	/*
-	 * If both the physical buffer start address and size are
-	 * page aligned, we don't need to use a bounce page.
-	 */
-	if (!IS_ALIGNED(paddr | size, VTD_PAGE_SIZE)) {
-		tlb_addr = swiotlb_tbl_map_single(dev,
-				__phys_to_dma(dev, io_tlb_start),
-				paddr, size, aligned_size, dir, attrs);
-		if (tlb_addr == DMA_MAPPING_ERROR) {
-			goto swiotlb_error;
-		} else {
-			/* Cleanup the padding area. */
-			void *padding_start = phys_to_virt(tlb_addr);
-			size_t padding_size = aligned_size;
-
-			if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
-			    (dir == DMA_TO_DEVICE ||
-			     dir == DMA_BIDIRECTIONAL)) {
-				padding_start += size;
-				padding_size -= size;
-			}
-
-			memset(padding_start, 0, padding_size);
-		}
-	} else {
-		tlb_addr = paddr;
-	}
-
-	ret = domain_pfn_mapping(domain, mm_to_dma_pfn(iova_pfn),
-				 tlb_addr >> VTD_PAGE_SHIFT, nrpages, prot);
-	if (ret)
-		goto mapping_error;
-
-	trace_bounce_map_single(dev, iova_pfn << PAGE_SHIFT, paddr, size);
-
-	return (phys_addr_t)iova_pfn << PAGE_SHIFT;
-
-mapping_error:
-	if (is_swiotlb_buffer(tlb_addr))
-		swiotlb_tbl_unmap_single(dev, tlb_addr, size,
-					 aligned_size, dir, attrs);
-swiotlb_error:
-	free_iova_fast(&domain->iovad, iova_pfn, dma_to_mm_pfn(nrpages));
-	dev_err(dev, "Device bounce map: %zx@%llx dir %d --- failed\n",
-		size, (unsigned long long)paddr, dir);
-
-	return DMA_MAPPING_ERROR;
-}
-
-static void
-bounce_unmap_single(struct device *dev, dma_addr_t dev_addr, size_t size,
-		    enum dma_data_direction dir, unsigned long attrs)
-{
-	size_t aligned_size = ALIGN(size, VTD_PAGE_SIZE);
-	struct dmar_domain *domain;
-	phys_addr_t tlb_addr;
-
-	domain = find_domain(dev);
-	if (WARN_ON(!domain))
-		return;
-
-	tlb_addr = intel_iommu_iova_to_phys(&domain->domain, dev_addr);
-	if (WARN_ON(!tlb_addr))
-		return;
-
-	intel_unmap(dev, dev_addr, size);
-	if (is_swiotlb_buffer(tlb_addr))
-		swiotlb_tbl_unmap_single(dev, tlb_addr, size,
-					 aligned_size, dir, attrs);
-
-	trace_bounce_unmap_single(dev, dev_addr, size);
-}
-
-static dma_addr_t
-bounce_map_page(struct device *dev, struct page *page, unsigned long offset,
-		size_t size, enum dma_data_direction dir, unsigned long attrs)
-{
-	return bounce_map_single(dev, page_to_phys(page) + offset,
-				 size, dir, attrs, *dev->dma_mask);
-}
-
-static dma_addr_t
-bounce_map_resource(struct device *dev, phys_addr_t phys_addr, size_t size,
-		    enum dma_data_direction dir, unsigned long attrs)
-{
-	return bounce_map_single(dev, phys_addr, size,
-				 dir, attrs, *dev->dma_mask);
-}
-
-static void
-bounce_unmap_page(struct device *dev, dma_addr_t dev_addr, size_t size,
-		  enum dma_data_direction dir, unsigned long attrs)
-{
-	bounce_unmap_single(dev, dev_addr, size, dir, attrs);
-}
-
-static void
-bounce_unmap_resource(struct device *dev, dma_addr_t dev_addr, size_t size,
-		      enum dma_data_direction dir, unsigned long attrs)
-{
-	bounce_unmap_single(dev, dev_addr, size, dir, attrs);
-}
-
-static void
-bounce_unmap_sg(struct device *dev, struct scatterlist *sglist, int nelems,
-		enum dma_data_direction dir, unsigned long attrs)
-{
-	struct scatterlist *sg;
-	int i;
-
-	for_each_sg(sglist, sg, nelems, i)
-		bounce_unmap_page(dev, sg->dma_address,
-				  sg_dma_len(sg), dir, attrs);
-}
-
-static int
-bounce_map_sg(struct device *dev, struct scatterlist *sglist, int nelems,
-	      enum dma_data_direction dir, unsigned long attrs)
-{
-	int i;
-	struct scatterlist *sg;
-
-	for_each_sg(sglist, sg, nelems, i) {
-		sg->dma_address = bounce_map_page(dev, sg_page(sg),
-						  sg->offset, sg->length,
-						  dir, attrs);
-		if (sg->dma_address == DMA_MAPPING_ERROR)
-			goto out_unmap;
-		sg_dma_len(sg) = sg->length;
-	}
-
-	for_each_sg(sglist, sg, nelems, i)
-		trace_bounce_map_sg(dev, i + 1, nelems, sg);
-
-	return nelems;
-
-out_unmap:
-	bounce_unmap_sg(dev, sglist, i, dir, attrs | DMA_ATTR_SKIP_CPU_SYNC);
-	return 0;
-}
-
-static void
-bounce_sync_single_for_cpu(struct device *dev, dma_addr_t addr,
-			   size_t size, enum dma_data_direction dir)
-{
-	bounce_sync_single(dev, addr, size, dir, SYNC_FOR_CPU);
-}
-
-static void
-bounce_sync_single_for_device(struct device *dev, dma_addr_t addr,
-			      size_t size, enum dma_data_direction dir)
-{
-	bounce_sync_single(dev, addr, size, dir, SYNC_FOR_DEVICE);
-}
-
-static void
-bounce_sync_sg_for_cpu(struct device *dev, struct scatterlist *sglist,
-		       int nelems, enum dma_data_direction dir)
-{
-	struct scatterlist *sg;
-	int i;
-
-	for_each_sg(sglist, sg, nelems, i)
-		bounce_sync_single(dev, sg_dma_address(sg),
-				   sg_dma_len(sg), dir, SYNC_FOR_CPU);
-}
-
-static void
-bounce_sync_sg_for_device(struct device *dev, struct scatterlist *sglist,
-			  int nelems, enum dma_data_direction dir)
-{
-	struct scatterlist *sg;
-	int i;
-
-	for_each_sg(sglist, sg, nelems, i)
-		bounce_sync_single(dev, sg_dma_address(sg),
-				   sg_dma_len(sg), dir, SYNC_FOR_DEVICE);
-}
-
-static const struct dma_map_ops bounce_dma_ops = {
-	.alloc			= intel_alloc_coherent,
-	.free			= intel_free_coherent,
-	.map_sg			= bounce_map_sg,
-	.unmap_sg		= bounce_unmap_sg,
-	.map_page		= bounce_map_page,
-	.unmap_page		= bounce_unmap_page,
-	.sync_single_for_cpu	= bounce_sync_single_for_cpu,
-	.sync_single_for_device	= bounce_sync_single_for_device,
-	.sync_sg_for_cpu	= bounce_sync_sg_for_cpu,
-	.sync_sg_for_device	= bounce_sync_sg_for_device,
-	.map_resource		= bounce_map_resource,
-	.unmap_resource		= bounce_unmap_resource,
-	.dma_supported		= dma_direct_supported,
-};
-
 static inline int iommu_domain_cache_init(void)
 {
 	int ret = 0;
@@ -4616,7 +3967,7 @@ static void free_all_cpu_cached_iovas(unsigned int cpu)
 			if (!domain || domain->domain.type != IOMMU_DOMAIN_DMA)
 				continue;
 
-			free_cpu_cached_iovas(cpu, &domain->iovad);
+			iommu_dma_free_cpu_cached_iovas(cpu, &domain->domain);
 		}
 	}
 }
@@ -4888,12 +4239,6 @@ int __init intel_iommu_init(void)
 	if (list_empty(&dmar_atsr_units))
 		pr_info("No ATSR found\n");
 
-	if (dmar_init_reserved_ranges()) {
-		if (force_on)
-			panic("tboot: Failed to reserve iommu ranges\n");
-		goto out_free_reserved_range;
-	}
-
 	if (dmar_map_gfx)
 		intel_iommu_gfx_mapped = 1;
 
@@ -4904,7 +4249,7 @@ int __init intel_iommu_init(void)
 		if (force_on)
 			panic("tboot: Failed to initialize DMARs\n");
 		pr_err("Initialization failed\n");
-		goto out_free_reserved_range;
+		goto out_free_dmar;
 	}
 	up_write(&dmar_global_lock);
 
@@ -4945,8 +4290,6 @@ int __init intel_iommu_init(void)
 
 	return 0;
 
-out_free_reserved_range:
-	put_iova_domain(&reserved_iova_list);
 out_free_dmar:
 	intel_iommu_free_dmars();
 	up_write(&dmar_global_lock);
@@ -5044,17 +4387,6 @@ static int md_domain_init(struct dmar_domain *domain, int guest_width)
 	return 0;
 }
 
-static void intel_init_iova_domain(struct dmar_domain *dmar_domain)
-{
-	init_iova_domain(&dmar_domain->iovad, VTD_PAGE_SIZE, IOVA_START_PFN);
-	copy_reserved_iova(&reserved_iova_list, &dmar_domain->iovad);
-
-	if (!intel_iommu_strict &&
-	    init_iova_flush_queue(&dmar_domain->iovad,
-				  iommu_flush_iova, iova_entry_free))
-		pr_info("iova flush queue initialization failed\n");
-}
-
 static struct iommu_domain *intel_iommu_domain_alloc(unsigned type)
 {
 	struct dmar_domain *dmar_domain;
@@ -5075,8 +4407,9 @@ static struct iommu_domain *intel_iommu_domain_alloc(unsigned type)
 			return NULL;
 		}
 
-		if (type == IOMMU_DOMAIN_DMA)
-			intel_init_iova_domain(dmar_domain);
+		if (type == IOMMU_DOMAIN_DMA &&
+				iommu_get_dma_cookie(&dmar_domain->domain))
+			return NULL;
 
 		domain_update_iommu_cap(dmar_domain);
 
@@ -5700,24 +5033,26 @@ static void intel_iommu_release_device(struct device *dev)
 	set_dma_ops(dev, NULL);
 }
 
+static int intel_iommu_needs_bounce_buffer(struct device *d)
+{
+	return !intel_no_bounce && dev_is_pci(d) && to_pci_dev(d)->untrusted;
+}
+
+
 static void intel_iommu_probe_finalize(struct device *dev)
 {
-	struct iommu_domain *domain;
+	dma_addr_t base = IOVA_START_PFN << VTD_PAGE_SHIFT;
+	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
+	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
 
-	domain = iommu_get_domain_for_dev(dev);
-	if (device_needs_bounce(dev))
-		set_dma_ops(dev, &bounce_dma_ops);
-	else if (domain && domain->type == IOMMU_DOMAIN_DMA)
-		set_dma_ops(dev, &intel_dma_ops);
+	if (intel_iommu_needs_bounce_buffer(dev) ||
+			(domain && domain->type == IOMMU_DOMAIN_DMA))
+		iommu_setup_dma_ops(dev, base,
+				__DOMAIN_MAX_ADDR(dmar_domain->gaw) - base);
 	else
 		set_dma_ops(dev, NULL);
 }
 
-static int intel_iommu_needs_bounce_buffer(struct device *d)
-{
-	return !intel_no_bounce && dev_is_pci(d) && to_pci_dev(d)->untrusted;
-}
-
 static void intel_iommu_get_resv_regions(struct device *device,
 					 struct list_head *head)
 {
@@ -5826,19 +5161,6 @@ int intel_iommu_enable_pasid(struct intel_iommu *iommu, struct device *dev)
 	return ret;
 }
 
-static void intel_iommu_apply_resv_region(struct device *dev,
-					  struct iommu_domain *domain,
-					  struct iommu_resv_region *region)
-{
-	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
-	unsigned long start, end;
-
-	start = IOVA_PFN(region->start);
-	end   = IOVA_PFN(region->start + region->length - 1);
-
-	WARN_ON_ONCE(!reserve_iova(&dmar_domain->iovad, start, end));
-}
-
 static struct iommu_group *intel_iommu_device_group(struct device *dev)
 {
 	if (dev_is_pci(dev))
@@ -6050,6 +5372,27 @@ intel_iommu_domain_set_attr(struct iommu_domain *domain,
 	return ret;
 }
 
+static int intel_iommu_domain_get_attr(struct iommu_domain *domain,
+		enum iommu_attr attr, void *data)
+{
+	switch (domain->type) {
+	case IOMMU_DOMAIN_UNMANAGED:
+		return -ENODEV;
+	case IOMMU_DOMAIN_DMA:
+		switch (attr) {
+		case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
+			*(int *)data = !intel_iommu_strict;
+			return 0;
+		default:
+			return -ENODEV;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+}
+
+
 /*
  * Check that the device does not live on an external facing PCI port that is
  * marked as untrusted. Such devices should not be able to apply quirks and
@@ -6079,15 +5422,16 @@ const struct iommu_ops intel_iommu_ops = {
 	.aux_get_pasid		= intel_iommu_aux_get_pasid,
 	.map			= intel_iommu_map,
 	.unmap			= intel_iommu_unmap,
+	.flush_iotlb_all        = intel_flush_iotlb_all,
 	.iotlb_sync		= intel_iommu_tlb_sync,
 	.iova_to_phys		= intel_iommu_iova_to_phys,
 	.probe_device		= intel_iommu_probe_device,
 	.probe_finalize		= intel_iommu_probe_finalize,
 	.release_device		= intel_iommu_release_device,
+	.domain_get_attr        = intel_iommu_domain_get_attr,
 	.needs_bounce_buffer	= intel_iommu_needs_bounce_buffer,
 	.get_resv_regions	= intel_iommu_get_resv_regions,
 	.put_resv_regions	= generic_iommu_put_resv_regions,
-	.apply_resv_region	= intel_iommu_apply_resv_region,
 	.device_group		= intel_iommu_device_group,
 	.dev_has_feat		= intel_iommu_dev_has_feat,
 	.dev_feat_enabled	= intel_iommu_dev_feat_enabled,
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
