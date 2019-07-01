Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C27A045EDE
	for <lists.iommu@lfdr.de>; Fri, 14 Jun 2019 15:47:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9E8EAED0;
	Fri, 14 Jun 2019 13:47:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 47B00DD0
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 13:47:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CB970174
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 13:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dFkeNCOjf/ZFyy3Yeij5x73pEQRUAveqwZi3TB+kN+8=;
	b=VbVxXB1x19VOko6tXcNmrk4Pyv
	SjUlfFCbw880+ikTCwEk6mC/KDydaMvSEovCcvs6F89NEqr15LLWJk4bPUUc5iIovBb+hY4GQzxDn
	A3nJYlB8l2SFIliuv9suZO4k9LxSid81J8gFZw2kEy67edfSbgvl1E1NL1llWCCGeD1lk2YnA7IMi
	DoyWUeRh9rXzQjzFAiM60S0ugdShe2YsChaMS6mNwJReLOulnpRnn7LylOoHd3K2E4aXSmo49bU+c
	tB2WaXRC8Uz6JNO0tiPTpByXc9BqAwWpSMjT4oTuINM5VSJ76ZEmbcuOxR6yA7jeo6IUae9c7flZ2
	9rkZNqlg==;
Received: from 213-225-9-13.nat.highway.a1.net ([213.225.9.13] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hbmYM-0004a2-N5; Fri, 14 Jun 2019 13:47:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>
Subject: [PATCH 02/16] drm/ati_pcigart: stop using drm_pci_alloc
Date: Fri, 14 Jun 2019 15:47:12 +0200
Message-Id: <20190614134726.3827-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614134726.3827-1-hch@lst.de>
References: <20190614134726.3827-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: devel@driverdev.osuosl.org, linux-s390@vger.kernel.org,
	Intel Linux Wireless <linuxwifi@intel.com>,
	linux-rdma@vger.kernel.org, netdev@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org, iommu@lists.linux-foundation.org,
	"moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
	linux-media@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Remove usage of the legacy drm PCI DMA wrappers, and with that the
incorrect usage cocktail of __GFP_COMP, virt_to_page on DMA allocation
and SetPageReserved.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/ati_pcigart.c | 27 +++++++++++----------------
 include/drm/ati_pcigart.h     |  5 ++++-
 2 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/ati_pcigart.c b/drivers/gpu/drm/ati_pcigart.c
index 2362f07fe1fc..f66d4fccd812 100644
--- a/drivers/gpu/drm/ati_pcigart.c
+++ b/drivers/gpu/drm/ati_pcigart.c
@@ -41,21 +41,14 @@
 static int drm_ati_alloc_pcigart_table(struct drm_device *dev,
 				       struct drm_ati_pcigart_info *gart_info)
 {
-	gart_info->table_handle = drm_pci_alloc(dev, gart_info->table_size,
-						PAGE_SIZE);
-	if (gart_info->table_handle == NULL)
+	gart_info->table_vaddr = dma_alloc_coherent(&dev->pdev->dev,
+			gart_info->table_size, &gart_info->table_handle,
+			GFP_KERNEL);
+	if (!gart_info->table_vaddr)
 		return -ENOMEM;
-
 	return 0;
 }
 
-static void drm_ati_free_pcigart_table(struct drm_device *dev,
-				       struct drm_ati_pcigart_info *gart_info)
-{
-	drm_pci_free(dev, gart_info->table_handle);
-	gart_info->table_handle = NULL;
-}
-
 int drm_ati_pcigart_cleanup(struct drm_device *dev, struct drm_ati_pcigart_info *gart_info)
 {
 	struct drm_sg_mem *entry = dev->sg;
@@ -87,8 +80,10 @@ int drm_ati_pcigart_cleanup(struct drm_device *dev, struct drm_ati_pcigart_info
 	}
 
 	if (gart_info->gart_table_location == DRM_ATI_GART_MAIN &&
-	    gart_info->table_handle) {
-		drm_ati_free_pcigart_table(dev, gart_info);
+	    gart_info->table_vaddr) {
+		dma_free_coherent(&dev->pdev->dev, gart_info->table_size,
+				gart_info->table_vaddr, gart_info->table_handle);
+		gart_info->table_vaddr = NULL;
 	}
 
 	return 1;
@@ -127,9 +122,9 @@ int drm_ati_pcigart_init(struct drm_device *dev, struct drm_ati_pcigart_info *ga
 			goto done;
 		}
 
-		pci_gart = gart_info->table_handle->vaddr;
-		address = gart_info->table_handle->vaddr;
-		bus_address = gart_info->table_handle->busaddr;
+		pci_gart = gart_info->table_vaddr;
+		address = gart_info->table_vaddr;
+		bus_address = gart_info->table_handle;
 	} else {
 		address = gart_info->addr;
 		bus_address = gart_info->bus_addr;
diff --git a/include/drm/ati_pcigart.h b/include/drm/ati_pcigart.h
index a728a1364e66..2ffe278ba3b3 100644
--- a/include/drm/ati_pcigart.h
+++ b/include/drm/ati_pcigart.h
@@ -18,7 +18,10 @@ struct drm_ati_pcigart_info {
 	void *addr;
 	dma_addr_t bus_addr;
 	dma_addr_t table_mask;
-	struct drm_dma_handle *table_handle;
+
+	dma_addr_t table_handle;
+	void *table_vaddr;
+
 	struct drm_local_map mapping;
 	int table_size;
 };
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
