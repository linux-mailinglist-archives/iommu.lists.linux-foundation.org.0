Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEFF89058
	for <lists.iommu@lfdr.de>; Sun, 11 Aug 2019 10:06:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0A144AF7;
	Sun, 11 Aug 2019 08:06:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C841BAC8
	for <iommu@lists.linux-foundation.org>;
	Sun, 11 Aug 2019 08:06:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7B55F6E0
	for <iommu@lists.linux-foundation.org>;
	Sun, 11 Aug 2019 08:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5H4DKSyLtnJ8RX8GrhMYzxFLFlnlKxpwlI+kM8oQhzA=;
	b=gIc0HPMb2kkD9y746pngg/tZIN
	BBONBD5zHBfeFgLgtqVgkSReL2hz0BiQ8tWxlcZBGdXTJzS4Ath+2GX6SY8kDOgn0wGDxJbRWR6Ym
	/kGAt2D4y49bBi/D+c8YLGeSgiKu65k8qY+B3QSANY1FckAeC9Cxp6H6mKqnPTwSRCSdBfyPNe+Py
	jkvjkjUHLKDmgOogJ8JSIT5mTrSbJWKkEAwbjNO7fZuw2itIciNFU03pBKETjnELhrnm+Eo2l4+0L
	C2x20Pytwg6b/m1KFfyevb6gdPJ44xpY5hWZTqAQWyT8c+YytwOVfVY7bLH8Iq+nqurohNbdxi0Mq
	envVcypQ==;
Received: from [2001:4bb8:180:1ec3:c70:4a89:bc61:2] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hwirC-0001w6-G8; Sun, 11 Aug 2019 08:05:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH 4/6] usb/max3421: remove the dummy {un,
	}map_urb_for_dma methods
Date: Sun, 11 Aug 2019 10:05:18 +0200
Message-Id: <20190811080520.21712-5-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190811080520.21712-1-hch@lst.de>
References: <20190811080520.21712-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-arch@vger.kernel.org, Olav Kongas <ok@artecdesign.ee>,
	Gavin Li <git@thegavinli.com>, linuxppc-dev@lists.ozlabs.org,
	Mathias Nyman <mathias.nyman@intel.com>,
	Geoff Levand <geoff@infradead.org>, Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-usb@vger.kernel.org,
	Michal Simek <michal.simek@xilinx.com>,
	linux-kernel@vger.kernel.org, Tony Prisk <linux@prisktech.co.nz>,
	iommu@lists.linux-foundation.org, Alan Stern <stern@rowland.harvard.edu>,
	NXP Linux Team <linux-imx@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Shawn Guo <shawnguo@kernel.org>, Bin Liu <b-liu@ti.com>,
	linux-arm-kernel@lists.infradead.org
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

Now that we have an explicit HCD_DMA flag, there is not need to override
these methods.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/usb/host/max3421-hcd.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
index afa321ab55fc..8819f502b6a6 100644
--- a/drivers/usb/host/max3421-hcd.c
+++ b/drivers/usb/host/max3421-hcd.c
@@ -1800,21 +1800,6 @@ max3421_bus_resume(struct usb_hcd *hcd)
 	return -1;
 }
 
-/*
- * The SPI driver already takes care of DMA-mapping/unmapping, so no
- * reason to do it twice.
- */
-static int
-max3421_map_urb_for_dma(struct usb_hcd *hcd, struct urb *urb, gfp_t mem_flags)
-{
-	return 0;
-}
-
-static void
-max3421_unmap_urb_for_dma(struct usb_hcd *hcd, struct urb *urb)
-{
-}
-
 static const struct hc_driver max3421_hcd_desc = {
 	.description =		"max3421",
 	.product_desc =		DRIVER_DESC,
@@ -1826,8 +1811,6 @@ static const struct hc_driver max3421_hcd_desc = {
 	.get_frame_number =	max3421_get_frame_number,
 	.urb_enqueue =		max3421_urb_enqueue,
 	.urb_dequeue =		max3421_urb_dequeue,
-	.map_urb_for_dma =	max3421_map_urb_for_dma,
-	.unmap_urb_for_dma =	max3421_unmap_urb_for_dma,
 	.endpoint_disable =	max3421_endpoint_disable,
 	.hub_status_data =	max3421_hub_status_data,
 	.hub_control =		max3421_hub_control,
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
