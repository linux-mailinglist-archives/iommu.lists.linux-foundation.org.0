Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C543A221B
	for <lists.iommu@lfdr.de>; Thu, 10 Jun 2021 04:04:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02D84405A0;
	Thu, 10 Jun 2021 02:04:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ezbyM8HNs9co; Thu, 10 Jun 2021 02:04:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id F2D5A40537;
	Thu, 10 Jun 2021 02:04:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39B9CC0023;
	Thu, 10 Jun 2021 02:04:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11347C000B
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 02:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF44240540
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 02:04:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lvmFkWOPL4P8 for <iommu@lists.linux-foundation.org>;
 Thu, 10 Jun 2021 02:04:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F9EE405A1
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 02:04:19 +0000 (UTC)
IronPort-SDR: jYML6s/K9kAb1POJMz4qxOrw0Wk0yaEKOg10lDJmHl+zUna8YQPCV1ZYJ1WRk9fRCpfbmvgbPL
 P13jw6tsWglg==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="202184393"
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="202184393"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 19:04:09 -0700
IronPort-SDR: +Z+QrKX8KnYYugTxGGcER11EvuQjPqC95N6G/MGzYV6oFW3sh7o0nw8memUvBMF0rXjWT5Ky5C
 m7UnaF9G/Ngg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="402500602"
Received: from allen-box.sh.intel.com ([10.239.159.105])
 by orsmga006.jf.intel.com with ESMTP; 09 Jun 2021 19:04:06 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 23/23] iommu/vt-d: No need to typecast
Date: Thu, 10 Jun 2021 10:01:15 +0800
Message-Id: <20210610020115.1637656-24-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610020115.1637656-1-baolu.lu@linux.intel.com>
References: <20210610020115.1637656-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: Fenghua Yu <fenghua.yu@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Aditya Srivastava <yashsri421@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 YueHaibing <yuehaibing@huawei.com>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 iommu@lists.linux-foundation.org, Colin Ian King <colin.king@canonical.com>,
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

From: Parav Pandit <parav@nvidia.com>

Page directory assignment by alloc_pgtable_page() or phys_to_virt()
doesn't need typecasting as both routines return void*. Hence, remove
typecasting from both the calls.

Signed-off-by: Parav Pandit <parav@nvidia.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Link: https://lore.kernel.org/r/20210530075053.264218-1-parav@nvidia.com
---
 drivers/iommu/intel/iommu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index d9a248ee5779..bd93c7ec879e 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -4506,7 +4506,7 @@ static int md_domain_init(struct dmar_domain *domain, int guest_width)
 	domain->max_addr = 0;
 
 	/* always allocate the top pgd */
-	domain->pgd = (struct dma_pte *)alloc_pgtable_page(domain->nid);
+	domain->pgd = alloc_pgtable_page(domain->nid);
 	if (!domain->pgd)
 		return -ENOMEM;
 	domain_flush_cache(domain, domain->pgd, PAGE_SIZE);
@@ -4774,8 +4774,7 @@ static int prepare_domain_attach_device(struct iommu_domain *domain,
 
 		pte = dmar_domain->pgd;
 		if (dma_pte_present(pte)) {
-			dmar_domain->pgd = (struct dma_pte *)
-				phys_to_virt(dma_pte_addr(pte));
+			dmar_domain->pgd = phys_to_virt(dma_pte_addr(pte));
 			free_pgtable_page(pte);
 		}
 		dmar_domain->agaw--;
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
