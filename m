Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 94519175133
	for <lists.iommu@lfdr.de>; Mon,  2 Mar 2020 01:05:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4538584FA4;
	Mon,  2 Mar 2020 00:05:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QEiDFivB6Aj9; Mon,  2 Mar 2020 00:05:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A08CD84FBB;
	Mon,  2 Mar 2020 00:05:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88D56C1D74;
	Mon,  2 Mar 2020 00:05:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5566C013E
 for <iommu@lists.linux-foundation.org>; Mon,  2 Mar 2020 00:05:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C155120348
 for <iommu@lists.linux-foundation.org>; Mon,  2 Mar 2020 00:05:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MbhAsAplkdFa for <iommu@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 00:05:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by silver.osuosl.org (Postfix) with ESMTPS id BDEC020029
 for <iommu@lists.linux-foundation.org>; Mon,  2 Mar 2020 00:05:15 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id j7so3475828plt.1
 for <iommu@lists.linux-foundation.org>; Sun, 01 Mar 2020 16:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=s2fBx8J6GyzyTr+yWkTnlDANlDiTpifKHO8aX/LJVZ0=;
 b=aLJD/jdoeWRcBmGB9UJDHEOsiTXmMCZX2qHuC9G1Na9qtP6bwlFcbBJ5l7nRZmAGw2
 YqXuvD5U9G8W8Q3lT/vxF2laR7nwNqjPgPpvP9AOso/+X2N1Q3ZpYmTUigTMTehaWyfY
 sUjJfbK6NqNNuK13oOAvdbh/h8ecZ2HiE+rjimytVcMlSkMZ7dWzu3nHx3AJBmanzZNp
 8yNNrfx4sVwq0C2y+HwXCRQZjOd/WDkF1GcRlGHT4g6FasOCPgZFWPNC85iX3Ls+Tl/s
 CrKBi+G2oFBKoGG4z5Dqc4/uG+/xkdovbC/CeqPEvNUVXEEz7K519yMXHNzVyG8joR7w
 ZckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=s2fBx8J6GyzyTr+yWkTnlDANlDiTpifKHO8aX/LJVZ0=;
 b=rJbOktLcglxeNjXcEARaTFOGGx3lvdC4aXoz2Ct+sLLp7yJzwBSBiOzKphObylEHmP
 6cFFsz5TJ8cTkHxjGpqrmJlklbA/lq54WR6tbNo+oV/3fNqC5Dp6QqlF5zkt7xSFTpHP
 dw/3GPhRIZL1tzGBzCIJN7gygwM5Z/9WuCbIqjIjGf6ZywxIr5bT7az+q9GPW8fXE5hk
 liHmjcYstUuJZibfbIwRFFzEmT3MCCeoYISm7WxBTselovgdSfPoH9cCwtCq87FlBjHZ
 ZGZYnpTFn8opkLlzfnY9rvF9V39HejFQrEsbOYWmoJMZLGEskBdVY63RuCqCOCj0xjFb
 SuAQ==
X-Gm-Message-State: APjAAAXnqdzCGbYb93HvZQ+u0TTgjvEiUReu8VGNHO0wUqjRhoa5s2Fj
 9Sq0m/Gt5HQVuKNCTyf0DN+hjA==
X-Google-Smtp-Source: APXvYqxz4SV+mLft6McRhU3HpemRKIdhbgx1rY2V2skT/KnaIiFXqNWvdBQ87anIhdGyyEzLZM2hZA==
X-Received: by 2002:a17:90a:8c8a:: with SMTP id
 b10mr18515195pjo.51.1583107514888; 
 Sun, 01 Mar 2020 16:05:14 -0800 (PST)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598]
 ([2620:15c:17:3:3a5:23a7:5e32:4598])
 by smtp.gmail.com with ESMTPSA id iq3sm9864063pjb.0.2020.03.01.16.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2020 16:05:13 -0800 (PST)
Date: Sun, 1 Mar 2020 16:05:13 -0800 (PST)
X-X-Sender: rientjes@chino.kir.corp.google.com
To: Christoph Hellwig <hch@lst.de>, Tom Lendacky <thomas.lendacky@amd.com>
Subject: [rfc 2/6] dma-remap: add additional atomic pools to map to gfp
 mask
In-Reply-To: <alpine.DEB.2.21.2003011535510.213582@chino.kir.corp.google.com>
Message-ID: <alpine.DEB.2.21.2003011537000.213582@chino.kir.corp.google.com>
References: <alpine.DEB.2.21.1912311738130.68206@chino.kir.corp.google.com>
 <b22416ec-cc28-3fd2-3a10-89840be173fa@amd.com>
 <alpine.DEB.2.21.2002280118461.165532@chino.kir.corp.google.com>
 <alpine.DEB.2.21.2003011535510.213582@chino.kir.corp.google.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: "Singh, Brijesh" <brijesh.singh@amd.com>, "Grimm, Jon" <jon.grimm@amd.com>,
 baekhw@google.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
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
From: David Rientjes via iommu <iommu@lists.linux-foundation.org>
Reply-To: David Rientjes <rientjes@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

The single atomic pool is allocated from the lowest zone possible since
it is guaranteed to be applicable for any DMA allocation.

Devices may allocate through the DMA API but not have a strict reliance
on GFP_DMA memory.  Since the atomic pool will be used for all
non-blockable allocations, returning all memory from ZONE_DMA may
unnecessarily deplete the zone.

Provision for multiple atomic pools that will map to the optimal gfp
mask of the device.  These will be wired up in a subsequent patch.

Signed-off-by: David Rientjes <rientjes@google.com>
---
 kernel/dma/remap.c | 75 +++++++++++++++++++++++++++-------------------
 1 file changed, 45 insertions(+), 30 deletions(-)

diff --git a/kernel/dma/remap.c b/kernel/dma/remap.c
--- a/kernel/dma/remap.c
+++ b/kernel/dma/remap.c
@@ -100,6 +100,8 @@ void dma_common_free_remap(void *cpu_addr, size_t size)
 
 #ifdef CONFIG_DMA_DIRECT_REMAP
 static struct gen_pool *atomic_pool __ro_after_init;
+static struct gen_pool *atomic_pool_dma32 __ro_after_init;
+static struct gen_pool *atomic_pool_normal __ro_after_init;
 
 #define DEFAULT_DMA_COHERENT_POOL_SIZE  SZ_256K
 static size_t atomic_pool_size __initdata = DEFAULT_DMA_COHERENT_POOL_SIZE;
@@ -111,66 +113,79 @@ static int __init early_coherent_pool(char *p)
 }
 early_param("coherent_pool", early_coherent_pool);
 
-static gfp_t dma_atomic_pool_gfp(void)
+static int __init __dma_atomic_pool_init(struct gen_pool **pool,
+					 size_t pool_size, gfp_t gfp)
 {
-	if (IS_ENABLED(CONFIG_ZONE_DMA))
-		return GFP_DMA;
-	if (IS_ENABLED(CONFIG_ZONE_DMA32))
-		return GFP_DMA32;
-	return GFP_KERNEL;
-}
-
-static int __init dma_atomic_pool_init(void)
-{
-	unsigned int pool_size_order = get_order(atomic_pool_size);
-	unsigned long nr_pages = atomic_pool_size >> PAGE_SHIFT;
+	const unsigned int order = get_order(pool_size);
+	const unsigned long nr_pages = pool_size >> PAGE_SHIFT;
 	struct page *page;
 	void *addr;
 	int ret;
 
 	if (dev_get_cma_area(NULL))
-		page = dma_alloc_from_contiguous(NULL, nr_pages,
-						 pool_size_order, false);
+		page = dma_alloc_from_contiguous(NULL, nr_pages, order, false);
 	else
-		page = alloc_pages(dma_atomic_pool_gfp(), pool_size_order);
+		page = alloc_pages(gfp, order);
 	if (!page)
 		goto out;
 
-	arch_dma_prep_coherent(page, atomic_pool_size);
+	arch_dma_prep_coherent(page, pool_size);
 
-	atomic_pool = gen_pool_create(PAGE_SHIFT, -1);
-	if (!atomic_pool)
+	*pool = gen_pool_create(PAGE_SHIFT, -1);
+	if (!*pool)
 		goto free_page;
 
-	addr = dma_common_contiguous_remap(page, atomic_pool_size,
+	addr = dma_common_contiguous_remap(page, pool_size,
 					   pgprot_dmacoherent(PAGE_KERNEL),
 					   __builtin_return_address(0));
 	if (!addr)
 		goto destroy_genpool;
 
-	ret = gen_pool_add_virt(atomic_pool, (unsigned long)addr,
-				page_to_phys(page), atomic_pool_size, -1);
+	ret = gen_pool_add_virt(*pool, (unsigned long)addr, page_to_phys(page),
+				pool_size, -1);
 	if (ret)
 		goto remove_mapping;
-	gen_pool_set_algo(atomic_pool, gen_pool_first_fit_order_align, NULL);
+	gen_pool_set_algo(*pool, gen_pool_first_fit_order_align, NULL);
 
-	pr_info("DMA: preallocated %zu KiB pool for atomic allocations\n",
-		atomic_pool_size / 1024);
+	pr_info("DMA: preallocated %zu KiB %pGg pool for atomic allocations\n",
+		pool_size >> 10, &gfp);
 	return 0;
 
 remove_mapping:
-	dma_common_free_remap(addr, atomic_pool_size);
+	dma_common_free_remap(addr, pool_size);
 destroy_genpool:
-	gen_pool_destroy(atomic_pool);
-	atomic_pool = NULL;
+	gen_pool_destroy(*pool);
+	*pool = NULL;
 free_page:
 	if (!dma_release_from_contiguous(NULL, page, nr_pages))
-		__free_pages(page, pool_size_order);
+		__free_pages(page, order);
 out:
-	pr_err("DMA: failed to allocate %zu KiB pool for atomic coherent allocation\n",
-		atomic_pool_size / 1024);
+	pr_err("DMA: failed to allocate %zu KiB %pGg pool for atomic allocation\n",
+		atomic_pool_size >> 10, &gfp);
 	return -ENOMEM;
 }
+
+static int __init dma_atomic_pool_init(void)
+{
+	int ret = 0;
+	int err;
+
+	ret = __dma_atomic_pool_init(&atomic_pool_normal, atomic_pool_size,
+				     GFP_KERNEL);
+	if (IS_ENABLED(CONFIG_ZONE_DMA)) {
+		err = __dma_atomic_pool_init(&atomic_pool, atomic_pool_size,
+					     GFP_DMA);
+		if (!ret && err)
+			ret = err;
+	}
+	if (IS_ENABLED(CONFIG_ZONE_DMA32)) {
+		err = __dma_atomic_pool_init(&atomic_pool_dma32,
+					     atomic_pool_size, GFP_DMA32);
+		if (!ret && err)
+			ret = err;
+	}
+	return ret;
+}
 postcore_initcall(dma_atomic_pool_init);
 
 static bool dma_in_atomic_pool(struct device *dev, void *start, size_t size)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
