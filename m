Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 981D4352B4D
	for <lists.iommu@lfdr.de>; Fri,  2 Apr 2021 16:33:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10784400AF;
	Fri,  2 Apr 2021 14:33:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jSDb6fzjIBbU; Fri,  2 Apr 2021 14:33:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C49A40272;
	Fri,  2 Apr 2021 14:33:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9538C000A;
	Fri,  2 Apr 2021 14:33:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64599C000A
 for <iommu@lists.linux-foundation.org>; Fri,  2 Apr 2021 14:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 456254064A
 for <iommu@lists.linux-foundation.org>; Fri,  2 Apr 2021 14:33:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Me2eZnaJgOoM for <iommu@lists.linux-foundation.org>;
 Fri,  2 Apr 2021 14:33:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B35C240224
 for <iommu@lists.linux-foundation.org>; Fri,  2 Apr 2021 14:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=7d4w1MQ58wkPpyi6Y13RnhFSX3lz3QOpT4LAyaT/2YA=; b=d0eU+IBGV6Je7o6EmQNVav3ZW2
 HjyGUVNqPy29mzvqWxofRtCrzdOo+Nt/FB783Vn/65LFLXhNfBfrelbblSvPCHO8quU+qKy3pO73Y
 UgMESRwhxQfrWmghdA1v6bSFxC+WW0lGFXbq0NUvb9/4FC7aUQ4JzGpSnLxl3SAX/hKqbefygFGCx
 MI7fDXdiZv2hELACGKUwDs00U1Lgl7YUroiOspi+xGSU2YitpXAah9p6NMkxGwgTeN+RmPOqjkADg
 Q9DqRFS+T8tyyLu25gu6fR1G85dLFkiP9qz1jRgBNkaNZIS3f8AHCnSk6njTrYsRfdRbW9jpJ7ISf
 AvUtYy4Q==;
Received: from [2001:4bb8:180:7517:6acc:e698:6fa4:15da] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lSKrP-00FAFX-Mf; Fri, 02 Apr 2021 14:33:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 2/4] iommu/amd: remove the unused amd_iommu_get_v2_domain
 function
Date: Fri,  2 Apr 2021 16:33:10 +0200
Message-Id: <20210402143312.372386-3-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210402143312.372386-1-hch@lst.de>
References: <20210402143312.372386-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: iommu@lists.linux-foundation.org
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

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/amd/amd_iommu.h |  1 -
 drivers/iommu/amd/iommu.c     | 34 ----------------------------------
 2 files changed, 35 deletions(-)

diff --git a/drivers/iommu/amd/amd_iommu.h b/drivers/iommu/amd/amd_iommu.h
index 026ce7f8d993b0..ed46dc754a2ad4 100644
--- a/drivers/iommu/amd/amd_iommu.h
+++ b/drivers/iommu/amd/amd_iommu.h
@@ -65,7 +65,6 @@ extern int amd_iommu_flush_tlb(struct iommu_domain *dom, u32 pasid);
 extern int amd_iommu_domain_set_gcr3(struct iommu_domain *dom, u32 pasid,
 				     unsigned long cr3);
 extern int amd_iommu_domain_clear_gcr3(struct iommu_domain *dom, u32 pasid);
-extern struct iommu_domain *amd_iommu_get_v2_domain(struct pci_dev *pdev);
 
 #ifdef CONFIG_IRQ_REMAP
 extern int amd_iommu_create_irq_domain(struct amd_iommu *iommu);
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 65ef07b048934c..42bd8f93e74ddf 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -2525,40 +2525,6 @@ int amd_iommu_complete_ppr(struct pci_dev *pdev, u32 pasid,
 }
 EXPORT_SYMBOL(amd_iommu_complete_ppr);
 
-struct iommu_domain *amd_iommu_get_v2_domain(struct pci_dev *pdev)
-{
-	struct protection_domain *pdomain;
-	struct iommu_dev_data *dev_data;
-	struct device *dev = &pdev->dev;
-	struct iommu_domain *io_domain;
-
-	if (!check_device(dev))
-		return NULL;
-
-	dev_data  = dev_iommu_priv_get(&pdev->dev);
-	pdomain   = dev_data->domain;
-	io_domain = iommu_get_domain_for_dev(dev);
-
-	if (pdomain == NULL && dev_data->defer_attach) {
-		dev_data->defer_attach = false;
-		pdomain = to_pdomain(io_domain);
-		attach_device(dev, pdomain);
-	}
-
-	if (pdomain == NULL)
-		return NULL;
-
-	if (io_domain->type != IOMMU_DOMAIN_DMA)
-		return NULL;
-
-	/* Only return IOMMUv2 domains */
-	if (!(pdomain->flags & PD_IOMMUV2_MASK))
-		return NULL;
-
-	return &pdomain->domain;
-}
-EXPORT_SYMBOL(amd_iommu_get_v2_domain);
-
 int amd_iommu_device_info(struct pci_dev *pdev,
                           struct amd_iommu_device_info *info)
 {
-- 
2.30.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
