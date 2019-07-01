Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6954345EFF
	for <lists.iommu@lfdr.de>; Fri, 14 Jun 2019 15:48:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7D353FE2;
	Fri, 14 Jun 2019 13:48:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 26449EC2
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 13:48:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CADCEE5
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 13:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/4FoCDBLnzPb2XMaauyatStM9o0VD0yD5rKIYuMBQ0E=;
	b=CunEZYdzj1zjPFvQ9vuv6tDtLy
	vk2B+7o+RESYX/Uj9YE1WPSM8gIuTAZ9+l9/VP7ellxJPLL3OCZwLpPkkg4YXW6iAK1W1D1NsQkRe
	R9/3wcIyp1y1J0ATOjHMugtXv7Iico5Aonf2oieKVDzXwypDKvx97YYahLtJLN0gNdbS9nFF40L8G
	5KFWLhTktOcQms4JvV3KcOo/4hbUdJHHZjKi58NphDT1sJOTHGcRUAlsD9UdoyaNfz245j984aH/g
	Vo2b1kxQcOlsnjlGFpHDFC20bvIYQtaIn5fpgbXQD6ANRo9p6tKP0Uc1+axVpGGcAW40+eMu8FIaS
	wqAUuf8Q==;
Received: from 213-225-9-13.nat.highway.a1.net ([213.225.9.13] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hbmYW-0004tD-Fb; Fri, 14 Jun 2019 13:47:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>
Subject: [PATCH 05/16] drm: don't mark pages returned from drm_pci_alloc
	reserved
Date: Fri, 14 Jun 2019 15:47:15 +0200
Message-Id: <20190614134726.3827-6-hch@lst.de>
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

We are not allowed to call virt_to_page on pages returned from
dma_alloc_coherent, as in many cases the virtual address returned
is aactually a kernel direct mapping.  Also there generally is no
need to mark dma memory as reserved.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/gpu/drm/drm_bufs.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_bufs.c b/drivers/gpu/drm/drm_bufs.c
index 7418872d87c6..b640437ce90f 100644
--- a/drivers/gpu/drm/drm_bufs.c
+++ b/drivers/gpu/drm/drm_bufs.c
@@ -77,13 +77,6 @@ drm_dma_handle_t *drm_pci_alloc(struct drm_device * dev, size_t size, size_t ali
 		return NULL;
 	}
 
-	/* XXX - Is virt_to_page() legal for consistent mem? */
-	/* Reserve */
-	for (addr = (unsigned long)dmah->vaddr, sz = size;
-	     sz > 0; addr += PAGE_SIZE, sz -= PAGE_SIZE) {
-		SetPageReserved(virt_to_page((void *)addr));
-	}
-
 	return dmah;
 }
 
@@ -97,16 +90,9 @@ void __drm_legacy_pci_free(struct drm_device * dev, drm_dma_handle_t * dmah)
 	unsigned long addr;
 	size_t sz;
 
-	if (dmah->vaddr) {
-		/* XXX - Is virt_to_page() legal for consistent mem? */
-		/* Unreserve */
-		for (addr = (unsigned long)dmah->vaddr, sz = dmah->size;
-		     sz > 0; addr += PAGE_SIZE, sz -= PAGE_SIZE) {
-			ClearPageReserved(virt_to_page((void *)addr));
-		}
+	if (dmah->vaddr)
 		dma_free_coherent(&dev->pdev->dev, dmah->size, dmah->vaddr,
 				  dmah->busaddr);
-	}
 }
 
 /**
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
