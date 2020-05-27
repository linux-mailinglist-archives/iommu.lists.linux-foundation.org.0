Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D271E4087
	for <lists.iommu@lfdr.de>; Wed, 27 May 2020 13:53:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8C52A2474E;
	Wed, 27 May 2020 11:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZMN-2z6urOUr; Wed, 27 May 2020 11:53:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 88D0A23E65;
	Wed, 27 May 2020 11:53:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 81D64C016F;
	Wed, 27 May 2020 11:53:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39936C0894
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 11:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 29FC387E2B
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 11:53:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VvfC9SxcW-an for <iommu@lists.linux-foundation.org>;
 Wed, 27 May 2020 11:53:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 15057872F8
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 11:53:30 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 5449F485; Wed, 27 May 2020 13:53:24 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 07/10] iommu/amd: Remove PD_DMA_OPS_MASK
Date: Wed, 27 May 2020 13:53:10 +0200
Message-Id: <20200527115313.7426-8-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200527115313.7426-1-joro@8bytes.org>
References: <20200527115313.7426-1-joro@8bytes.org>
Cc: iommu@lists.linux-foundation.org, jroedel@suse.de,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

From: Joerg Roedel <jroedel@suse.de>

This is covered by IOMMU_DOMAIN_DMA from the IOMMU core code already,
so remove it.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/amd/iommu.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 9e0737932e0c..7c87ef78f26a 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -1817,15 +1817,6 @@ static void free_gcr3_table(struct protection_domain *domain)
 	free_page((unsigned long)domain->gcr3_tbl);
 }
 
-/*
- * little helper function to check whether a given protection domain is a
- * dma_ops domain
- */
-static bool dma_ops_domain(struct protection_domain *domain)
-{
-	return domain->flags & PD_DMA_OPS_MASK;
-}
-
 static void set_dte_entry(u16 devid, struct protection_domain *domain,
 			  struct domain_pgtable *pgtable,
 			  bool ats, bool ppr)
@@ -2408,11 +2399,9 @@ static struct iommu_domain *amd_iommu_domain_alloc(unsigned type)
 	domain->domain.geometry.aperture_end   = ~0ULL;
 	domain->domain.geometry.force_aperture = true;
 
-	if (type == IOMMU_DOMAIN_DMA) {
-		if (iommu_get_dma_cookie(&domain->domain) == -ENOMEM)
-			goto free_domain;
-		domain->flags = PD_DMA_OPS_MASK;
-	}
+	if (type == IOMMU_DOMAIN_DMA &&
+	    iommu_get_dma_cookie(&domain->domain) == -ENOMEM)
+		goto free_domain;
 
 	return &domain->domain;
 
@@ -3024,17 +3013,18 @@ struct iommu_domain *amd_iommu_get_v2_domain(struct pci_dev *pdev)
 	if (!check_device(dev))
 		return NULL;
 
-	pdomain = get_dev_data(dev)->domain;
+	pdomain   = get_dev_data(dev)->domain;
+	io_domain = iommu_get_domain_for_dev(dev);
 	if (pdomain == NULL && get_dev_data(dev)->defer_attach) {
 		get_dev_data(dev)->defer_attach = false;
-		io_domain = iommu_get_domain_for_dev(dev);
 		pdomain = to_pdomain(io_domain);
 		attach_device(dev, pdomain);
 	}
+
 	if (pdomain == NULL)
 		return NULL;
 
-	if (!dma_ops_domain(pdomain))
+	if (io_domain->type != IOMMU_DOMAIN_DMA)
 		return NULL;
 
 	/* Only return IOMMUv2 domains */
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
