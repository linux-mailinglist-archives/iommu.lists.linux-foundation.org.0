Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E5E3C6C69
	for <lists.iommu@lfdr.de>; Tue, 13 Jul 2021 10:48:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C338F401C3;
	Tue, 13 Jul 2021 08:48:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OZUQLXkLIqvb; Tue, 13 Jul 2021 08:48:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6F19340468;
	Tue, 13 Jul 2021 08:48:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46216C000E;
	Tue, 13 Jul 2021 08:48:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9CED4C000E
 for <iommu@lists.linux-foundation.org>; Tue, 13 Jul 2021 08:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8981C8316F
 for <iommu@lists.linux-foundation.org>; Tue, 13 Jul 2021 08:48:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CGEjc2D5lYbv for <iommu@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 08:48:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 60228839C0
 for <iommu@lists.linux-foundation.org>; Tue, 13 Jul 2021 08:48:19 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id x16so9857115plg.3
 for <iommu@lists.linux-foundation.org>; Tue, 13 Jul 2021 01:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DmuibZSASz5HW9QiqnoPNYlf/iv8ZNP8HE9857Kg6Fw=;
 b=XFYPiitRN4+RByOxDim7QxWXrOIW6wy7raapT+osXdqpI/uA8WXCu8aCkb7Nzl7iTT
 crxA725BDpJ0Rtee7BnKrbt0YYnKlWAojWmIfXnMHK5Uh1rnBYXxzHVrJNqTsQN1rVfb
 zOxP2taHjLAMH4PdTQ1bVuovD2u4yLDvQ129fLwEMR/o+GbK3rkTgP2JZxR71aY3E8H4
 W6nXzSjPl3BsHG/R9uVgU1+0uT9Ash4iexZ184aX7R4puclZz1DUrpVrwaA4qF8QIOU5
 mkMLHDM1zsxSpydA+xKM68QqnZuTWd1E4o3us+1929DbtCpx04r8nZNZ80bgM8oe1hk9
 o6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DmuibZSASz5HW9QiqnoPNYlf/iv8ZNP8HE9857Kg6Fw=;
 b=L0aGie3BEGCnByXJLP4Vwgzk8E8wnhUqNbd4WK8f5GW6K69AB0o6elFhcFVdXuqrUm
 v4hxKvuBhQtZy7ACu6uQLohYMafN6lyT1ZGJ9jyCLq6Io+JDTsCs1LEz6MUvjIEPpaA/
 85x5T9LLyLUPKRUh61bCOTBA5oM73bE9c4GvspC7HUqfGM5BoJdfXe98/arfNTtZ/zGH
 u4ymAoIARqF8eAABNLRWCEa4shxvnaf9XpP0Ji915rvHnwuiQKHDS6wnwE288xVeS8JK
 DV1kPKLeUZ0pa6sQ29dzaCve5/xOloO7oZaN18WV8uQ4LrvIUee+Vkq1v7hM+ByhLGt3
 z8MA==
X-Gm-Message-State: AOAM533XgON2tIRnRrkLKcwslQo92r3aVm1C90LSWATs2c/D/eJtGXDl
 Pzf4hJ+GFlFJeMDV7mJft9PA
X-Google-Smtp-Source: ABdhPJzMFFL+LqmYw0EqE9kKoTKOfG4JqdLi0VjPIskKPn746N91NPZc3/W+s7UTqY4A8Q2BsvNCMQ==
X-Received: by 2002:a17:90a:4bce:: with SMTP id
 u14mr3307609pjl.188.1626166098789; 
 Tue, 13 Jul 2021 01:48:18 -0700 (PDT)
Received: from localhost ([139.177.225.253])
 by smtp.gmail.com with ESMTPSA id s15sm19293283pfu.97.2021.07.13.01.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 01:48:18 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, parav@nvidia.com, hch@infradead.org,
 christian.brauner@canonical.com, rdunlap@infradead.org,
 willy@infradead.org, viro@zeniv.linux.org.uk, axboe@kernel.dk,
 bcrl@kvack.org, corbet@lwn.net, mika.penttila@nextfour.com,
 dan.carpenter@oracle.com, joro@8bytes.org, gregkh@linuxfoundation.org,
 zhe.he@windriver.com, xiaodong.liu@intel.com
Subject: [PATCH v9 15/17] vduse: Implement an MMU-based IOMMU driver
Date: Tue, 13 Jul 2021 16:46:54 +0800
Message-Id: <20210713084656.232-16-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210713084656.232-1-xieyongji@bytedance.com>
References: <20210713084656.232-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 songmuchun@bytedance.com, linux-fsdevel@vger.kernel.org
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

This implements an MMU-based IOMMU driver to support mapping
kernel dma buffer into userspace. The basic idea behind it is
treating MMU (VA->PA) as IOMMU (IOVA->PA). The driver will set
up MMU mapping instead of IOMMU mapping for the DMA transfer so
that the userspace process is able to use its virtual address to
access the dma buffer in kernel.

And to avoid security issue, a bounce-buffering mechanism is
introduced to prevent userspace accessing the original buffer
directly.

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vdpa/vdpa_user/iova_domain.c | 545 +++++++++++++++++++++++++++++++++++
 drivers/vdpa/vdpa_user/iova_domain.h |  73 +++++
 2 files changed, 618 insertions(+)
 create mode 100644 drivers/vdpa/vdpa_user/iova_domain.c
 create mode 100644 drivers/vdpa/vdpa_user/iova_domain.h

diff --git a/drivers/vdpa/vdpa_user/iova_domain.c b/drivers/vdpa/vdpa_user/iova_domain.c
new file mode 100644
index 000000000000..ad45026f5423
--- /dev/null
+++ b/drivers/vdpa/vdpa_user/iova_domain.c
@@ -0,0 +1,545 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * MMU-based IOMMU implementation
+ *
+ * Copyright (C) 2020-2021 Bytedance Inc. and/or its affiliates. All rights reserved.
+ *
+ * Author: Xie Yongji <xieyongji@bytedance.com>
+ *
+ */
+
+#include <linux/slab.h>
+#include <linux/file.h>
+#include <linux/anon_inodes.h>
+#include <linux/highmem.h>
+#include <linux/vmalloc.h>
+#include <linux/vdpa.h>
+
+#include "iova_domain.h"
+
+static int vduse_iotlb_add_range(struct vduse_iova_domain *domain,
+				 u64 start, u64 last,
+				 u64 addr, unsigned int perm,
+				 struct file *file, u64 offset)
+{
+	struct vdpa_map_file *map_file;
+	int ret;
+
+	map_file = kmalloc(sizeof(*map_file), GFP_ATOMIC);
+	if (!map_file)
+		return -ENOMEM;
+
+	map_file->file = get_file(file);
+	map_file->offset = offset;
+
+	ret = vhost_iotlb_add_range_ctx(domain->iotlb, start, last,
+					addr, perm, map_file);
+	if (ret) {
+		fput(map_file->file);
+		kfree(map_file);
+		return ret;
+	}
+	return 0;
+}
+
+static void vduse_iotlb_del_range(struct vduse_iova_domain *domain,
+				  u64 start, u64 last)
+{
+	struct vdpa_map_file *map_file;
+	struct vhost_iotlb_map *map;
+
+	while ((map = vhost_iotlb_itree_first(domain->iotlb, start, last))) {
+		map_file = (struct vdpa_map_file *)map->opaque;
+		fput(map_file->file);
+		kfree(map_file);
+		vhost_iotlb_map_free(domain->iotlb, map);
+	}
+}
+
+int vduse_domain_set_map(struct vduse_iova_domain *domain,
+			 struct vhost_iotlb *iotlb)
+{
+	struct vdpa_map_file *map_file;
+	struct vhost_iotlb_map *map;
+	u64 start = 0ULL, last = ULLONG_MAX;
+	int ret;
+
+	spin_lock(&domain->iotlb_lock);
+	vduse_iotlb_del_range(domain, start, last);
+
+	for (map = vhost_iotlb_itree_first(iotlb, start, last); map;
+	     map = vhost_iotlb_itree_next(map, start, last)) {
+		map_file = (struct vdpa_map_file *)map->opaque;
+		ret = vduse_iotlb_add_range(domain, map->start, map->last,
+					    map->addr, map->perm,
+					    map_file->file,
+					    map_file->offset);
+		if (ret)
+			goto err;
+	}
+	spin_unlock(&domain->iotlb_lock);
+
+	return 0;
+err:
+	vduse_iotlb_del_range(domain, start, last);
+	spin_unlock(&domain->iotlb_lock);
+	return ret;
+}
+
+void vduse_domain_clear_map(struct vduse_iova_domain *domain,
+			    struct vhost_iotlb *iotlb)
+{
+	struct vhost_iotlb_map *map;
+	u64 start = 0ULL, last = ULLONG_MAX;
+
+	spin_lock(&domain->iotlb_lock);
+	for (map = vhost_iotlb_itree_first(iotlb, start, last); map;
+	     map = vhost_iotlb_itree_next(map, start, last)) {
+		vduse_iotlb_del_range(domain, map->start, map->last);
+	}
+	spin_unlock(&domain->iotlb_lock);
+}
+
+static int vduse_domain_map_bounce_page(struct vduse_iova_domain *domain,
+					 u64 iova, u64 size, u64 paddr)
+{
+	struct vduse_bounce_map *map;
+	u64 last = iova + size - 1;
+
+	while (iova <= last) {
+		map = &domain->bounce_maps[iova >> PAGE_SHIFT];
+		if (!map->bounce_page) {
+			map->bounce_page = alloc_page(GFP_ATOMIC);
+			if (!map->bounce_page)
+				return -ENOMEM;
+		}
+		map->orig_phys = paddr;
+		paddr += PAGE_SIZE;
+		iova += PAGE_SIZE;
+	}
+	return 0;
+}
+
+static void vduse_domain_unmap_bounce_page(struct vduse_iova_domain *domain,
+					   u64 iova, u64 size)
+{
+	struct vduse_bounce_map *map;
+	u64 last = iova + size - 1;
+
+	while (iova <= last) {
+		map = &domain->bounce_maps[iova >> PAGE_SHIFT];
+		map->orig_phys = INVALID_PHYS_ADDR;
+		iova += PAGE_SIZE;
+	}
+}
+
+static void do_bounce(phys_addr_t orig, void *addr, size_t size,
+		      enum dma_data_direction dir)
+{
+	unsigned long pfn = PFN_DOWN(orig);
+	unsigned int offset = offset_in_page(orig);
+	char *buffer;
+	unsigned int sz = 0;
+
+	while (size) {
+		sz = min_t(size_t, PAGE_SIZE - offset, size);
+
+		buffer = kmap_atomic(pfn_to_page(pfn));
+		if (dir == DMA_TO_DEVICE)
+			memcpy(addr, buffer + offset, sz);
+		else
+			memcpy(buffer + offset, addr, sz);
+		kunmap_atomic(buffer);
+
+		size -= sz;
+		pfn++;
+		addr += sz;
+		offset = 0;
+	}
+}
+
+static void vduse_domain_bounce(struct vduse_iova_domain *domain,
+				dma_addr_t iova, size_t size,
+				enum dma_data_direction dir)
+{
+	struct vduse_bounce_map *map;
+	unsigned int offset;
+	void *addr;
+	size_t sz;
+
+	if (iova >= domain->bounce_size)
+		return;
+
+	while (size) {
+		map = &domain->bounce_maps[iova >> PAGE_SHIFT];
+		offset = offset_in_page(iova);
+		sz = min_t(size_t, PAGE_SIZE - offset, size);
+
+		if (WARN_ON(!map->bounce_page ||
+			    map->orig_phys == INVALID_PHYS_ADDR))
+			return;
+
+		addr = page_address(map->bounce_page) + offset;
+		do_bounce(map->orig_phys + offset, addr, sz, dir);
+		size -= sz;
+		iova += sz;
+	}
+}
+
+static struct page *
+vduse_domain_get_coherent_page(struct vduse_iova_domain *domain, u64 iova)
+{
+	u64 start = iova & PAGE_MASK;
+	u64 last = start + PAGE_SIZE - 1;
+	struct vhost_iotlb_map *map;
+	struct page *page = NULL;
+
+	spin_lock(&domain->iotlb_lock);
+	map = vhost_iotlb_itree_first(domain->iotlb, start, last);
+	if (!map)
+		goto out;
+
+	page = pfn_to_page((map->addr + iova - map->start) >> PAGE_SHIFT);
+	get_page(page);
+out:
+	spin_unlock(&domain->iotlb_lock);
+
+	return page;
+}
+
+static struct page *
+vduse_domain_get_bounce_page(struct vduse_iova_domain *domain, u64 iova)
+{
+	struct vduse_bounce_map *map;
+	struct page *page = NULL;
+
+	spin_lock(&domain->iotlb_lock);
+	map = &domain->bounce_maps[iova >> PAGE_SHIFT];
+	if (!map->bounce_page)
+		goto out;
+
+	page = map->bounce_page;
+	get_page(page);
+out:
+	spin_unlock(&domain->iotlb_lock);
+
+	return page;
+}
+
+static void
+vduse_domain_free_bounce_pages(struct vduse_iova_domain *domain)
+{
+	struct vduse_bounce_map *map;
+	unsigned long pfn, bounce_pfns;
+
+	bounce_pfns = domain->bounce_size >> PAGE_SHIFT;
+
+	for (pfn = 0; pfn < bounce_pfns; pfn++) {
+		map = &domain->bounce_maps[pfn];
+		if (WARN_ON(map->orig_phys != INVALID_PHYS_ADDR))
+			continue;
+
+		if (!map->bounce_page)
+			continue;
+
+		__free_page(map->bounce_page);
+		map->bounce_page = NULL;
+	}
+}
+
+void vduse_domain_reset_bounce_map(struct vduse_iova_domain *domain)
+{
+	if (!domain->bounce_map)
+		return;
+
+	spin_lock(&domain->iotlb_lock);
+	if (!domain->bounce_map)
+		goto unlock;
+
+	vduse_iotlb_del_range(domain, 0, domain->bounce_size - 1);
+	domain->bounce_map = 0;
+unlock:
+	spin_unlock(&domain->iotlb_lock);
+}
+
+static int vduse_domain_init_bounce_map(struct vduse_iova_domain *domain)
+{
+	int ret = 0;
+
+	if (domain->bounce_map)
+		return 0;
+
+	spin_lock(&domain->iotlb_lock);
+	if (domain->bounce_map)
+		goto unlock;
+
+	ret = vduse_iotlb_add_range(domain, 0, domain->bounce_size - 1,
+				    0, VHOST_MAP_RW, domain->file, 0);
+	if (ret)
+		goto unlock;
+
+	domain->bounce_map = 1;
+unlock:
+	spin_unlock(&domain->iotlb_lock);
+	return ret;
+}
+
+static dma_addr_t
+vduse_domain_alloc_iova(struct iova_domain *iovad,
+			unsigned long size, unsigned long limit)
+{
+	unsigned long shift = iova_shift(iovad);
+	unsigned long iova_len = iova_align(iovad, size) >> shift;
+	unsigned long iova_pfn;
+
+	/*
+	 * Freeing non-power-of-two-sized allocations back into the IOVA caches
+	 * will come back to bite us badly, so we have to waste a bit of space
+	 * rounding up anything cacheable to make sure that can't happen. The
+	 * order of the unadjusted size will still match upon freeing.
+	 */
+	if (iova_len < (1 << (IOVA_RANGE_CACHE_MAX_SIZE - 1)))
+		iova_len = roundup_pow_of_two(iova_len);
+	iova_pfn = alloc_iova_fast(iovad, iova_len, limit >> shift, true);
+
+	return iova_pfn << shift;
+}
+
+static void vduse_domain_free_iova(struct iova_domain *iovad,
+				   dma_addr_t iova, size_t size)
+{
+	unsigned long shift = iova_shift(iovad);
+	unsigned long iova_len = iova_align(iovad, size) >> shift;
+
+	free_iova_fast(iovad, iova >> shift, iova_len);
+}
+
+dma_addr_t vduse_domain_map_page(struct vduse_iova_domain *domain,
+				 struct page *page, unsigned long offset,
+				 size_t size, enum dma_data_direction dir,
+				 unsigned long attrs)
+{
+	struct iova_domain *iovad = &domain->stream_iovad;
+	unsigned long limit = domain->bounce_size - 1;
+	phys_addr_t pa = page_to_phys(page) + offset;
+	dma_addr_t iova = vduse_domain_alloc_iova(iovad, size, limit);
+
+	if (!iova)
+		return DMA_MAPPING_ERROR;
+
+	if (vduse_domain_init_bounce_map(domain))
+		goto err;
+
+	if (vduse_domain_map_bounce_page(domain, (u64)iova, (u64)size, pa))
+		goto err;
+
+	if (dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL)
+		vduse_domain_bounce(domain, iova, size, DMA_TO_DEVICE);
+
+	return iova;
+err:
+	vduse_domain_free_iova(iovad, iova, size);
+	return DMA_MAPPING_ERROR;
+}
+
+void vduse_domain_unmap_page(struct vduse_iova_domain *domain,
+			     dma_addr_t dma_addr, size_t size,
+			     enum dma_data_direction dir, unsigned long attrs)
+{
+	struct iova_domain *iovad = &domain->stream_iovad;
+
+	if (dir == DMA_FROM_DEVICE || dir == DMA_BIDIRECTIONAL)
+		vduse_domain_bounce(domain, dma_addr, size, DMA_FROM_DEVICE);
+
+	vduse_domain_unmap_bounce_page(domain, (u64)dma_addr, (u64)size);
+	vduse_domain_free_iova(iovad, dma_addr, size);
+}
+
+void *vduse_domain_alloc_coherent(struct vduse_iova_domain *domain,
+				  size_t size, dma_addr_t *dma_addr,
+				  gfp_t flag, unsigned long attrs)
+{
+	struct iova_domain *iovad = &domain->consistent_iovad;
+	unsigned long limit = domain->iova_limit;
+	dma_addr_t iova = vduse_domain_alloc_iova(iovad, size, limit);
+	void *orig = alloc_pages_exact(size, flag);
+
+	if (!iova || !orig)
+		goto err;
+
+	spin_lock(&domain->iotlb_lock);
+	if (vduse_iotlb_add_range(domain, (u64)iova, (u64)iova + size - 1,
+				  virt_to_phys(orig), VHOST_MAP_RW,
+				  domain->file, (u64)iova)) {
+		spin_unlock(&domain->iotlb_lock);
+		goto err;
+	}
+	spin_unlock(&domain->iotlb_lock);
+
+	*dma_addr = iova;
+
+	return orig;
+err:
+	*dma_addr = DMA_MAPPING_ERROR;
+	if (orig)
+		free_pages_exact(orig, size);
+	if (iova)
+		vduse_domain_free_iova(iovad, iova, size);
+
+	return NULL;
+}
+
+void vduse_domain_free_coherent(struct vduse_iova_domain *domain, size_t size,
+				void *vaddr, dma_addr_t dma_addr,
+				unsigned long attrs)
+{
+	struct iova_domain *iovad = &domain->consistent_iovad;
+	struct vhost_iotlb_map *map;
+	struct vdpa_map_file *map_file;
+	phys_addr_t pa;
+
+	spin_lock(&domain->iotlb_lock);
+	map = vhost_iotlb_itree_first(domain->iotlb, (u64)dma_addr,
+				      (u64)dma_addr + size - 1);
+	if (WARN_ON(!map)) {
+		spin_unlock(&domain->iotlb_lock);
+		return;
+	}
+	map_file = (struct vdpa_map_file *)map->opaque;
+	fput(map_file->file);
+	kfree(map_file);
+	pa = map->addr;
+	vhost_iotlb_map_free(domain->iotlb, map);
+	spin_unlock(&domain->iotlb_lock);
+
+	vduse_domain_free_iova(iovad, dma_addr, size);
+	free_pages_exact(phys_to_virt(pa), size);
+}
+
+static vm_fault_t vduse_domain_mmap_fault(struct vm_fault *vmf)
+{
+	struct vduse_iova_domain *domain = vmf->vma->vm_private_data;
+	unsigned long iova = vmf->pgoff << PAGE_SHIFT;
+	struct page *page;
+
+	if (!domain)
+		return VM_FAULT_SIGBUS;
+
+	if (iova < domain->bounce_size)
+		page = vduse_domain_get_bounce_page(domain, iova);
+	else
+		page = vduse_domain_get_coherent_page(domain, iova);
+
+	if (!page)
+		return VM_FAULT_SIGBUS;
+
+	vmf->page = page;
+
+	return 0;
+}
+
+static const struct vm_operations_struct vduse_domain_mmap_ops = {
+	.fault = vduse_domain_mmap_fault,
+};
+
+static int vduse_domain_mmap(struct file *file, struct vm_area_struct *vma)
+{
+	struct vduse_iova_domain *domain = file->private_data;
+
+	vma->vm_flags |= VM_DONTDUMP | VM_DONTEXPAND;
+	vma->vm_private_data = domain;
+	vma->vm_ops = &vduse_domain_mmap_ops;
+
+	return 0;
+}
+
+static int vduse_domain_release(struct inode *inode, struct file *file)
+{
+	struct vduse_iova_domain *domain = file->private_data;
+
+	spin_lock(&domain->iotlb_lock);
+	vduse_iotlb_del_range(domain, 0, ULLONG_MAX);
+	vduse_domain_free_bounce_pages(domain);
+	spin_unlock(&domain->iotlb_lock);
+	put_iova_domain(&domain->stream_iovad);
+	put_iova_domain(&domain->consistent_iovad);
+	vhost_iotlb_free(domain->iotlb);
+	vfree(domain->bounce_maps);
+	kfree(domain);
+
+	return 0;
+}
+
+static const struct file_operations vduse_domain_fops = {
+	.owner = THIS_MODULE,
+	.mmap = vduse_domain_mmap,
+	.release = vduse_domain_release,
+};
+
+void vduse_domain_destroy(struct vduse_iova_domain *domain)
+{
+	fput(domain->file);
+}
+
+struct vduse_iova_domain *
+vduse_domain_create(unsigned long iova_limit, size_t bounce_size)
+{
+	struct vduse_iova_domain *domain;
+	struct file *file;
+	struct vduse_bounce_map *map;
+	unsigned long pfn, bounce_pfns;
+
+	bounce_pfns = PAGE_ALIGN(bounce_size) >> PAGE_SHIFT;
+	if (iova_limit <= bounce_size)
+		return NULL;
+
+	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
+	if (!domain)
+		return NULL;
+
+	domain->iotlb = vhost_iotlb_alloc(0, 0);
+	if (!domain->iotlb)
+		goto err_iotlb;
+
+	domain->iova_limit = iova_limit;
+	domain->bounce_size = PAGE_ALIGN(bounce_size);
+	domain->bounce_maps = vzalloc(bounce_pfns *
+				sizeof(struct vduse_bounce_map));
+	if (!domain->bounce_maps)
+		goto err_map;
+
+	for (pfn = 0; pfn < bounce_pfns; pfn++) {
+		map = &domain->bounce_maps[pfn];
+		map->orig_phys = INVALID_PHYS_ADDR;
+	}
+	file = anon_inode_getfile("[vduse-domain]", &vduse_domain_fops,
+				domain, O_RDWR);
+	if (IS_ERR(file))
+		goto err_file;
+
+	domain->file = file;
+	spin_lock_init(&domain->iotlb_lock);
+	init_iova_domain(&domain->stream_iovad,
+			PAGE_SIZE, IOVA_START_PFN);
+	init_iova_domain(&domain->consistent_iovad,
+			PAGE_SIZE, bounce_pfns);
+
+	return domain;
+err_file:
+	vfree(domain->bounce_maps);
+err_map:
+	vhost_iotlb_free(domain->iotlb);
+err_iotlb:
+	kfree(domain);
+	return NULL;
+}
+
+int vduse_domain_init(void)
+{
+	return iova_cache_get();
+}
+
+void vduse_domain_exit(void)
+{
+	iova_cache_put();
+}
diff --git a/drivers/vdpa/vdpa_user/iova_domain.h b/drivers/vdpa/vdpa_user/iova_domain.h
new file mode 100644
index 000000000000..5fc41d01c412
--- /dev/null
+++ b/drivers/vdpa/vdpa_user/iova_domain.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * MMU-based IOMMU implementation
+ *
+ * Copyright (C) 2020-2021 Bytedance Inc. and/or its affiliates. All rights reserved.
+ *
+ * Author: Xie Yongji <xieyongji@bytedance.com>
+ *
+ */
+
+#ifndef _VDUSE_IOVA_DOMAIN_H
+#define _VDUSE_IOVA_DOMAIN_H
+
+#include <linux/iova.h>
+#include <linux/dma-mapping.h>
+#include <linux/vhost_iotlb.h>
+
+#define IOVA_START_PFN 1
+
+#define INVALID_PHYS_ADDR (~(phys_addr_t)0)
+
+struct vduse_bounce_map {
+	struct page *bounce_page;
+	u64 orig_phys;
+};
+
+struct vduse_iova_domain {
+	struct iova_domain stream_iovad;
+	struct iova_domain consistent_iovad;
+	struct vduse_bounce_map *bounce_maps;
+	size_t bounce_size;
+	unsigned long iova_limit;
+	int bounce_map;
+	struct vhost_iotlb *iotlb;
+	spinlock_t iotlb_lock;
+	struct file *file;
+};
+
+int vduse_domain_set_map(struct vduse_iova_domain *domain,
+			 struct vhost_iotlb *iotlb);
+
+void vduse_domain_clear_map(struct vduse_iova_domain *domain,
+			    struct vhost_iotlb *iotlb);
+
+dma_addr_t vduse_domain_map_page(struct vduse_iova_domain *domain,
+				 struct page *page, unsigned long offset,
+				 size_t size, enum dma_data_direction dir,
+				 unsigned long attrs);
+
+void vduse_domain_unmap_page(struct vduse_iova_domain *domain,
+			     dma_addr_t dma_addr, size_t size,
+			     enum dma_data_direction dir, unsigned long attrs);
+
+void *vduse_domain_alloc_coherent(struct vduse_iova_domain *domain,
+				  size_t size, dma_addr_t *dma_addr,
+				  gfp_t flag, unsigned long attrs);
+
+void vduse_domain_free_coherent(struct vduse_iova_domain *domain, size_t size,
+				void *vaddr, dma_addr_t dma_addr,
+				unsigned long attrs);
+
+void vduse_domain_reset_bounce_map(struct vduse_iova_domain *domain);
+
+void vduse_domain_destroy(struct vduse_iova_domain *domain);
+
+struct vduse_iova_domain *vduse_domain_create(unsigned long iova_limit,
+					      size_t bounce_size);
+
+int vduse_domain_init(void);
+
+void vduse_domain_exit(void);
+
+#endif /* _VDUSE_IOVA_DOMAIN_H */
-- 
2.11.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
