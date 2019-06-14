Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 400BF45F25
	for <lists.iommu@lfdr.de>; Fri, 14 Jun 2019 15:48:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 883301026;
	Fri, 14 Jun 2019 13:48:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 400D91023
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 13:48:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DB6C5711
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 13:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7ZdZ3kFG7vLtpGzKUifkfy5au7mGeecDZr7pOAa/mbQ=;
	b=fFAKLKpeX1UXm3FTcf0KpVo86s
	TAVWErFRg7UqZpj/joIjhsfplRvSdKGAbFeP6PmZqe8B9ErySOXGc93t2ofqJ0PfW5tVLu+2bO7c7
	tlkcsmUTpcJGdiZudPM+9H/J7qA++YYntqBAP5nQMfi/0VmsaFYiz8iIh+FqmdmOSIDCUkX2AxyUg
	4+iPQe6FbA5imHkaPuPHdlmpbWkOZY2IPMBFcFQu5749gI0wQ18r1UkUghz38MdwIvcYqglGbv42Q
	OE9k8pQvOkUoTghcB7fXqj/U8J8TtUon4YKIlHWSSpbaJgmCuw3j4dq3Y7DAL3QyTY+SLK4x/iHsn
	p71d6N7w==;
Received: from 213-225-9-13.nat.highway.a1.net ([213.225.9.13] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hbmYk-0005GV-78; Fri, 14 Jun 2019 13:48:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>
Subject: [PATCH 09/16] cnic: stop passing bogus gfp flags arguments to
	dma_alloc_coherent
Date: Fri, 14 Jun 2019 15:47:19 +0200
Message-Id: <20190614134726.3827-10-hch@lst.de>
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

dma_alloc_coherent is not just the page allocator.  The only valid
arguments to pass are either GFP_ATOMIC or GFP_ATOMIC with possible
modifiers of __GFP_NORETRY or __GFP_NOWARN.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/net/ethernet/broadcom/cnic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/broadcom/cnic.c b/drivers/net/ethernet/broadcom/cnic.c
index 57dc3cbff36e..bd1c993680e5 100644
--- a/drivers/net/ethernet/broadcom/cnic.c
+++ b/drivers/net/ethernet/broadcom/cnic.c
@@ -1028,7 +1028,7 @@ static int __cnic_alloc_uio_rings(struct cnic_uio_dev *udev, int pages)
 	udev->l2_ring_size = pages * CNIC_PAGE_SIZE;
 	udev->l2_ring = dma_alloc_coherent(&udev->pdev->dev, udev->l2_ring_size,
 					   &udev->l2_ring_map,
-					   GFP_KERNEL | __GFP_COMP);
+					   GFP_KERNEL);
 	if (!udev->l2_ring)
 		return -ENOMEM;
 
@@ -1036,7 +1036,7 @@ static int __cnic_alloc_uio_rings(struct cnic_uio_dev *udev, int pages)
 	udev->l2_buf_size = CNIC_PAGE_ALIGN(udev->l2_buf_size);
 	udev->l2_buf = dma_alloc_coherent(&udev->pdev->dev, udev->l2_buf_size,
 					  &udev->l2_buf_map,
-					  GFP_KERNEL | __GFP_COMP);
+					  GFP_KERNEL);
 	if (!udev->l2_buf) {
 		__cnic_free_uio_rings(udev);
 		return -ENOMEM;
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
