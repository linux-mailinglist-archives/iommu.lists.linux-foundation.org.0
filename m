Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E9B1E0180
	for <lists.iommu@lfdr.de>; Sun, 24 May 2020 20:38:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B02F12266C;
	Sun, 24 May 2020 18:38:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZTQ+9sITrUbH; Sun, 24 May 2020 18:38:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4782E2264C;
	Sun, 24 May 2020 18:38:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3117BC0894;
	Sun, 24 May 2020 18:38:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 89D77C016F
 for <iommu@lists.linux-foundation.org>; Sun, 24 May 2020 18:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6AF858691A
 for <iommu@lists.linux-foundation.org>; Sun, 24 May 2020 18:38:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xrUdkZKfUjz6 for <iommu@lists.linux-foundation.org>;
 Sun, 24 May 2020 18:38:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DBBBB868E7
 for <iommu@lists.linux-foundation.org>; Sun, 24 May 2020 18:38:35 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id x27so9331668lfg.9
 for <iommu@lists.linux-foundation.org>; Sun, 24 May 2020 11:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pYT9f0p49OrTiOELlvubWq1vIb7g6shIaYTIu0Gm+zg=;
 b=u5H9vvT5k8scDsx+POyU0shZVifa4FherTo/OapzZoNXp7Zidf7P3c5Od5c4Dd0L7Y
 bRuxN1Mn0dqnL60ncB6+6EE8cGHbaCU7mxDPTJrC5O8UuCosT0HE4RAt44nUkkHTzEb+
 iHThTWg3wd3gv/PMdzJdBL8ceQNRY2iCj6/p2+I+uxggEsD3jgP5OgU50yk3Qw+YCwlc
 vQpStpZNdyvOs0zE8QRpRaIpUUf/Y0fPgaXbyO6mrwKGKLf+cGfx0GhMLt9Eqc0ggWZA
 ZbQvFottb8EhvzKXW9E9DcTzIWIIoiaDn/ge5gjp3UXCyGYesfaCzjJmfxpEaqiUHj4X
 W/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pYT9f0p49OrTiOELlvubWq1vIb7g6shIaYTIu0Gm+zg=;
 b=ABXVQkf6yJEnvLSMmFgvZ2CEHgU5/pYY7lKRLDniXCdGZ5Dkk6bsvMxD1Yz8mf4RMH
 9ICvwPV4uIz7rH8c9CRSrajwp89gp+Hp4lH65HY2jRnXXI1C99O9lgYsPgEOijfeNnld
 BmK+d5jiLaHKpoaLvCaBKaONKeHhmqn8ZlC4P6spfcqytjlvTo7dTZ96iZQ9ZX5yhq/Z
 Sqvb1Y5VA1bglZus+nfjRf2XukOCrVm3Ewklz/RyLUou0NR2kioOb6eGtdZjELqYTsZA
 9DT5UX5cfMLqGeCy/4IzQObcTFXx+0PKTUoB3G2duMFcr9ib/3Y3+c7U9ihg9aspB3xB
 P0NA==
X-Gm-Message-State: AOAM533bdtJfa/omOyN0IlD7xUK5MKjQi85mVQZ3497NzJj4giOrYC/b
 zTX3nYZR2B0kDTTWrrc6PKc=
X-Google-Smtp-Source: ABdhPJzUNqnOTqln023qni+m9VSVMUUYbEvwMh/SkJCeg0imawJKLvbeaV3mZRh2K0yxoCmHRIUK7w==
X-Received: by 2002:a19:be11:: with SMTP id o17mr12401587lff.187.1590345513713; 
 Sun, 24 May 2020 11:38:33 -0700 (PDT)
Received: from localhost.localdomain (ppp91-76-17-204.pppoe.mtu-net.ru.
 [91.76.17.204])
 by smtp.gmail.com with ESMTPSA id w25sm4079428lfn.42.2020.05.24.11.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 May 2020 11:38:33 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH v1] iommu/tegra-smmu: Add missing locks around mapping
 operations
Date: Sun, 24 May 2020 21:37:55 +0300
Message-Id: <20200524183755.3774-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Cc: linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
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

The mapping operations of the Tegra SMMU driver are subjected to a race
condition issues because SMMU Address Space isn't allocated and freed
atomically, while it should be. This patch makes the mapping operations
atomic, it fixes an accidentally released Host1x Address Space problem
which happens while running multiple graphics tests in parallel on
Tegra30, i.e. by having multiple threads racing with each other in the
Host1x's submission and completion code paths, performing IOVA mappings
and unmappings in parallel.

Cc: <stable@vger.kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/iommu/tegra-smmu.c | 43 +++++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 7426b7666e2b..4f956a797838 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -12,6 +12,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/dma-mapping.h>
 
 #include <soc/tegra/ahb.h>
@@ -49,6 +50,7 @@ struct tegra_smmu_as {
 	struct iommu_domain domain;
 	struct tegra_smmu *smmu;
 	unsigned int use_count;
+	spinlock_t lock;
 	u32 *count;
 	struct page **pts;
 	struct page *pd;
@@ -308,6 +310,8 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
 		return NULL;
 	}
 
+	spin_lock_init(&as->lock);
+
 	/* setup aperture */
 	as->domain.geometry.aperture_start = 0;
 	as->domain.geometry.aperture_end = 0xffffffff;
@@ -578,7 +582,7 @@ static u32 *as_get_pte(struct tegra_smmu_as *as, dma_addr_t iova,
 		struct page *page;
 		dma_addr_t dma;
 
-		page = alloc_page(GFP_KERNEL | __GFP_DMA | __GFP_ZERO);
+		page = alloc_page(GFP_ATOMIC | __GFP_DMA | __GFP_ZERO);
 		if (!page)
 			return NULL;
 
@@ -655,8 +659,9 @@ static void tegra_smmu_set_pte(struct tegra_smmu_as *as, unsigned long iova,
 	smmu_flush(smmu);
 }
 
-static int tegra_smmu_map(struct iommu_domain *domain, unsigned long iova,
-			  phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
+static int
+tegra_smmu_map_locked(struct iommu_domain *domain, unsigned long iova,
+		      phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
 {
 	struct tegra_smmu_as *as = to_smmu_as(domain);
 	dma_addr_t pte_dma;
@@ -685,8 +690,9 @@ static int tegra_smmu_map(struct iommu_domain *domain, unsigned long iova,
 	return 0;
 }
 
-static size_t tegra_smmu_unmap(struct iommu_domain *domain, unsigned long iova,
-			       size_t size, struct iommu_iotlb_gather *gather)
+static size_t
+tegra_smmu_unmap_locked(struct iommu_domain *domain, unsigned long iova,
+			size_t size, struct iommu_iotlb_gather *gather)
 {
 	struct tegra_smmu_as *as = to_smmu_as(domain);
 	dma_addr_t pte_dma;
@@ -702,6 +708,33 @@ static size_t tegra_smmu_unmap(struct iommu_domain *domain, unsigned long iova,
 	return size;
 }
 
+static int tegra_smmu_map(struct iommu_domain *domain, unsigned long iova,
+			  phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
+{
+	struct tegra_smmu_as *as = to_smmu_as(domain);
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&as->lock, flags);
+	ret = tegra_smmu_map_locked(domain, iova, paddr, size, prot, gfp);
+	spin_unlock_irqrestore(&as->lock, flags);
+
+	return ret;
+}
+
+static size_t tegra_smmu_unmap(struct iommu_domain *domain, unsigned long iova,
+			       size_t size, struct iommu_iotlb_gather *gather)
+{
+	struct tegra_smmu_as *as = to_smmu_as(domain);
+	unsigned long flags;
+
+	spin_lock_irqsave(&as->lock, flags);
+	size = tegra_smmu_unmap_locked(domain, iova, size, gather);
+	spin_unlock_irqrestore(&as->lock, flags);
+
+	return size;
+}
+
 static phys_addr_t tegra_smmu_iova_to_phys(struct iommu_domain *domain,
 					   dma_addr_t iova)
 {
-- 
2.26.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
