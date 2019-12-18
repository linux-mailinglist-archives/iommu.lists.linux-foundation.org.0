Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C92123E9B
	for <lists.iommu@lfdr.de>; Wed, 18 Dec 2019 05:40:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AAAF786A63;
	Wed, 18 Dec 2019 04:40:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lc1K5T_Xwfdj; Wed, 18 Dec 2019 04:40:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2351286ABB;
	Wed, 18 Dec 2019 04:40:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 103F2C077D;
	Wed, 18 Dec 2019 04:40:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 855C1C077D
 for <iommu@lists.linux-foundation.org>; Wed, 18 Dec 2019 04:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 817A422846
 for <iommu@lists.linux-foundation.org>; Wed, 18 Dec 2019 04:40:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aT5VOFH8euLj for <iommu@lists.linux-foundation.org>;
 Wed, 18 Dec 2019 04:40:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 70AB42050C
 for <iommu@lists.linux-foundation.org>; Wed, 18 Dec 2019 04:40:19 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id p9so387806plk.9
 for <iommu@lists.linux-foundation.org>; Tue, 17 Dec 2019 20:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ch1xpBs7tWZiDXbLKgnS0zrW6JPy9+Lj1zi5nVSNmf0=;
 b=i5vbLQU4qpVW5MGMSWfK+XMYKjxF2VPs4XfcTcMhcVIKpGJBe7PGcCxZpxAc8P5Fd7
 gZDAGvqSHgS6NKmEEv8zXuUI8q2kkkUODMXUK7FULz2j0p0L3yP7vhw6rVzyE7cfD65l
 rMnAdLpehDb9coTaVHTVJGiLjvVzH0a9p7d1cVlleDRwNq2ky7Jym1FUPjX3U478oWog
 JsJQbZPD870IFKg04kAcMV0Zz5KlumrEOGEm70pkAtq3SAuXbTM4CcCTp8tmPXuiyjkk
 MFfiLf5mosvUWYu6rtu83enHYlAQBLWMpRI5VaqInKHp5sonhQ+1VCbM4TrsVjtrHhLZ
 fzsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ch1xpBs7tWZiDXbLKgnS0zrW6JPy9+Lj1zi5nVSNmf0=;
 b=Ki0bxg0CdtqynZp5RACJzXdBkMYgVquqvfPyaH/jf0IW/FxetmliB1xY0/haJCLHUW
 Tyya8XAxXqKENyXV7/Q5v6RamG7l7c3zcg1qCthdK2VbeoWZSRmPggL9S9UUYGgqVppI
 q2pHWOejweOOtpYv6L7gBFAwVmtVVgGQNycYNXNaJXu2rkT3zMSCZ36QuDNVIyEmvH0k
 hGQtBdhSgJWC9nWGxa49zYN+sfXzyqWtqeH9MYLGwLlv/K0cZ5qG8yHEbkWYkLRZCNtK
 YXw0PtwQEVfjiHx+3Lp5vyskMX5Q3LtvZWku6s0DXNzaQVLFBq4gOV6kCM/jQjCy+E9w
 Yq4g==
X-Gm-Message-State: APjAAAWCv78gFdfkyRz3y+BExh93hdaafuXKwJ4ocOscNJ8yI+uao5Is
 leawR52aXgHFSgMkmxXjdL/CUfj8TG8=
X-Google-Smtp-Source: APXvYqy4jD0JjiT4VzPGi+Jz6Zn6cuxjRyWsHALLTYtWmuxVm7k4EjjcyWpARRZpVPPL25gDilrueg==
X-Received: by 2002:a17:902:6a87:: with SMTP id
 n7mr338770plk.273.1576644018804; 
 Tue, 17 Dec 2019 20:40:18 -0800 (PST)
Received: from tw-172-25-31-76.office.twttr.net ([8.25.197.24])
 by smtp.gmail.com with ESMTPSA id j21sm781105pfe.175.2019.12.17.20.40.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2019 20:40:18 -0800 (PST)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: iommu@lists.linux-foundation.org
Subject: [Patch v3 1/3] iommu: avoid unnecessary magazine allocations
Date: Tue, 17 Dec 2019 20:39:49 -0800
Message-Id: <20191218043951.10534-2-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191218043951.10534-1-xiyou.wangcong@gmail.com>
References: <20191218043951.10534-1-xiyou.wangcong@gmail.com>
MIME-Version: 1.0
Cc: Cong Wang <xiyou.wangcong@gmail.com>, robin.murphy@arm.com,
 linux-kernel@vger.kernel.org
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

The IOVA cache algorithm implemented in IOMMU code does not
exactly match the original algorithm described in the paper
"Magazines and Vmem: Extending the Slab Allocator to Many
CPUs and Arbitrary Resources".

Particularly, it doesn't need to free the loaded empty magazine
when trying to put it back to global depot. To make it work, we
have to pre-allocate magazines in the depot and only recycle them
when all of them are full.

Before this patch, rcache->depot[] contains either full or
freed entries, after this patch, it contains either full or
empty (but allocated) entries.

Together with a few other changes to make it exactly match
the pseudo code in the paper.

Cc: Joerg Roedel <joro@8bytes.org>
Cc: John Garry <john.garry@huawei.com>
Signed-off-by: Cong Wang <xiyou.wangcong@gmail.com>
---
 drivers/iommu/iova.c | 45 +++++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
index 41c605b0058f..cb473ddce4cf 100644
--- a/drivers/iommu/iova.c
+++ b/drivers/iommu/iova.c
@@ -862,12 +862,16 @@ static void init_iova_rcaches(struct iova_domain *iovad)
 	struct iova_cpu_rcache *cpu_rcache;
 	struct iova_rcache *rcache;
 	unsigned int cpu;
-	int i;
+	int i, j;
 
 	for (i = 0; i < IOVA_RANGE_CACHE_MAX_SIZE; ++i) {
 		rcache = &iovad->rcaches[i];
 		spin_lock_init(&rcache->lock);
 		rcache->depot_size = 0;
+		for (j = 0; j < MAX_GLOBAL_MAGS; ++j) {
+			rcache->depot[j] = iova_magazine_alloc(GFP_KERNEL);
+			WARN_ON(!rcache->depot[j]);
+		}
 		rcache->cpu_rcaches = __alloc_percpu(sizeof(*cpu_rcache), cache_line_size());
 		if (WARN_ON(!rcache->cpu_rcaches))
 			continue;
@@ -900,24 +904,30 @@ static bool __iova_rcache_insert(struct iova_domain *iovad,
 
 	if (!iova_magazine_full(cpu_rcache->loaded)) {
 		can_insert = true;
-	} else if (!iova_magazine_full(cpu_rcache->prev)) {
+	} else if (iova_magazine_empty(cpu_rcache->prev)) {
 		swap(cpu_rcache->prev, cpu_rcache->loaded);
 		can_insert = true;
 	} else {
-		struct iova_magazine *new_mag = iova_magazine_alloc(GFP_ATOMIC);
+		spin_lock(&rcache->lock);
+		if (rcache->depot_size < MAX_GLOBAL_MAGS) {
+			swap(rcache->depot[rcache->depot_size], cpu_rcache->prev);
+			swap(cpu_rcache->prev, cpu_rcache->loaded);
+			rcache->depot_size++;
+			can_insert = true;
+		} else {
+			mag_to_free = cpu_rcache->loaded;
+		}
+		spin_unlock(&rcache->lock);
+
+		if (mag_to_free) {
+			struct iova_magazine *new_mag = iova_magazine_alloc(GFP_ATOMIC);
 
-		if (new_mag) {
-			spin_lock(&rcache->lock);
-			if (rcache->depot_size < MAX_GLOBAL_MAGS) {
-				rcache->depot[rcache->depot_size++] =
-						cpu_rcache->loaded;
+			if (new_mag) {
+				cpu_rcache->loaded = new_mag;
+				can_insert = true;
 			} else {
-				mag_to_free = cpu_rcache->loaded;
+				mag_to_free = NULL;
 			}
-			spin_unlock(&rcache->lock);
-
-			cpu_rcache->loaded = new_mag;
-			can_insert = true;
 		}
 	}
 
@@ -963,14 +973,15 @@ static unsigned long __iova_rcache_get(struct iova_rcache *rcache,
 
 	if (!iova_magazine_empty(cpu_rcache->loaded)) {
 		has_pfn = true;
-	} else if (!iova_magazine_empty(cpu_rcache->prev)) {
+	} else if (iova_magazine_full(cpu_rcache->prev)) {
 		swap(cpu_rcache->prev, cpu_rcache->loaded);
 		has_pfn = true;
 	} else {
 		spin_lock(&rcache->lock);
 		if (rcache->depot_size > 0) {
-			iova_magazine_free(cpu_rcache->loaded);
-			cpu_rcache->loaded = rcache->depot[--rcache->depot_size];
+			swap(rcache->depot[rcache->depot_size - 1], cpu_rcache->prev);
+			swap(cpu_rcache->prev, cpu_rcache->loaded);
+			rcache->depot_size--;
 			has_pfn = true;
 		}
 		spin_unlock(&rcache->lock);
@@ -1019,7 +1030,7 @@ static void free_iova_rcaches(struct iova_domain *iovad)
 			iova_magazine_free(cpu_rcache->prev);
 		}
 		free_percpu(rcache->cpu_rcaches);
-		for (j = 0; j < rcache->depot_size; ++j)
+		for (j = 0; j < MAX_GLOBAL_MAGS; ++j)
 			iova_magazine_free(rcache->depot[j]);
 	}
 }
-- 
2.21.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
