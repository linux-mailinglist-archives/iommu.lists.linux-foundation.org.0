Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7E83516FC
	for <lists.iommu@lfdr.de>; Thu,  1 Apr 2021 18:57:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9098760BE3;
	Thu,  1 Apr 2021 16:56:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vDMjDFSNWEMS; Thu,  1 Apr 2021 16:56:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9047760BFE;
	Thu,  1 Apr 2021 16:56:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C98E4C000C;
	Thu,  1 Apr 2021 16:56:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22B0DC000C;
 Thu,  1 Apr 2021 16:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4BD260BDE;
 Thu,  1 Apr 2021 16:56:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vUi7q1Q7KG5p; Thu,  1 Apr 2021 16:56:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D6C260BED;
 Thu,  1 Apr 2021 16:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=FM5u+3o8sOcsBcAa20JtCx7CBwzFoNdoMd1Vq/4oPf8=; b=gAOLWerYMtaF8otFLTR3inSr2k
 iFhFuHY0oLrUacCmRKMCd10hWuCAyHJo5MY+KpRjT3Wd0K5lcZJjPRlMjtjbXvM4JwZKQ/U3BUlTk
 tiqVm6BuZlvMihaQ61355ldlra8oe7u7jqH4zm6HTMUlQWCihlFH8eI/10jEB8cS98dpWlR8ZAhoV
 tS77+3+TmE4OnyfBl+hc2jj9otNArnPeyiSNWHaftteVItXDNh8KSgBTauEdjET5dKd/n5k+3Rsfr
 TPz1y+DueUEAM2Ge0zSauF1aLZebsss+tL+XJTqukHZUMFYL8QHPDUcTIzMSNSYe+FpRUG/MKz9tE
 DUHAf7MQ==;
Received: from [2001:4bb8:180:7517:83e4:a809:b0aa:ca74] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lRzdH-00CiaJ-U6; Thu, 01 Apr 2021 15:53:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 04/20] iommu/fsl_pamu: merge iommu_alloc_dma_domain into
 fsl_pamu_domain_alloc
Date: Thu,  1 Apr 2021 17:52:40 +0200
Message-Id: <20210401155256.298656-5-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210401155256.298656-1-hch@lst.de>
References: <20210401155256.298656-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: freedreno@lists.freedesktop.org, kvm@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org
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

Keep the functionality to allocate the domain together.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Will Deacon <will@kernel.org>
Acked-by: Li Yang <leoyang.li@nxp.com>
---
 drivers/iommu/fsl_pamu_domain.c | 34 ++++++++++-----------------------
 1 file changed, 10 insertions(+), 24 deletions(-)

diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index 7bd08ddad07779..a4da5597755d3d 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -292,25 +292,6 @@ static int check_size(u64 size, dma_addr_t iova)
 	return 0;
 }
 
-static struct fsl_dma_domain *iommu_alloc_dma_domain(void)
-{
-	struct fsl_dma_domain *domain;
-
-	domain = kmem_cache_zalloc(fsl_pamu_domain_cache, GFP_KERNEL);
-	if (!domain)
-		return NULL;
-
-	domain->stash_id = ~(u32)0;
-	domain->snoop_id = ~(u32)0;
-	domain->win_cnt = pamu_get_max_subwin_cnt();
-
-	INIT_LIST_HEAD(&domain->devices);
-
-	spin_lock_init(&domain->domain_lock);
-
-	return domain;
-}
-
 static void remove_device_ref(struct device_domain_info *info, u32 win_cnt)
 {
 	unsigned long flags;
@@ -412,12 +393,17 @@ static struct iommu_domain *fsl_pamu_domain_alloc(unsigned type)
 	if (type != IOMMU_DOMAIN_UNMANAGED)
 		return NULL;
 
-	dma_domain = iommu_alloc_dma_domain();
-	if (!dma_domain) {
-		pr_debug("dma_domain allocation failed\n");
+	dma_domain = kmem_cache_zalloc(fsl_pamu_domain_cache, GFP_KERNEL);
+	if (!dma_domain)
 		return NULL;
-	}
-	/* defaul geometry 64 GB i.e. maximum system address */
+
+	dma_domain->stash_id = ~(u32)0;
+	dma_domain->snoop_id = ~(u32)0;
+	dma_domain->win_cnt = pamu_get_max_subwin_cnt();
+	INIT_LIST_HEAD(&dma_domain->devices);
+	spin_lock_init(&dma_domain->domain_lock);
+
+	/* default geometry 64 GB i.e. maximum system address */
 	dma_domain->iommu_domain. geometry.aperture_start = 0;
 	dma_domain->iommu_domain.geometry.aperture_end = (1ULL << 36) - 1;
 	dma_domain->iommu_domain.geometry.force_aperture = true;
-- 
2.30.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
