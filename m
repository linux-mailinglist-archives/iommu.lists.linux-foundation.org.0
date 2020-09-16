Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EC526BD06
	for <lists.iommu@lfdr.de>; Wed, 16 Sep 2020 08:28:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F231F8734A;
	Wed, 16 Sep 2020 06:28:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u+7MzUbDwz6s; Wed, 16 Sep 2020 06:28:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 83F6787356;
	Wed, 16 Sep 2020 06:28:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76F25C0051;
	Wed, 16 Sep 2020 06:28:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3320AC0051
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 06:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1DC8022B6D
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 06:28:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZpKt0xmmJHoJ for <iommu@lists.linux-foundation.org>;
 Wed, 16 Sep 2020 06:28:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id 2C484228AC
 for <iommu@lists.linux-foundation.org>; Wed, 16 Sep 2020 06:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Sj9/6zg3jBvpe8GWBJtfj7ccMtl/cKmotOW4AeELf0k=; b=kaFJQyPGFngO1rYezn8V4WHTVt
 bifyPF57Tk4KW6ZXJihhjLUmUxhyNOZUK4hogmfIPx4IEGF7HmjMlXwQkKqSoC5DKQpOh5mz2TcwA
 h9nqDo+Hc9Y9pLTBIuIX5O9eFitiNQINnXhnSwQhAzSOotBpjP7fmuWmPg0Y9ZmrdERGPmzxV+V2b
 AZ/toz2BrsjHtlWvKHpmxhL+b5NqgTFXzS5c3QQEHrKB9waDNeovto1ihomE50eY44nWiFIVDJO+4
 QGH2ncs+/Sp2SIcFzjs2cQ98GYmTPQnEHa8fZDL77q5xqeenvtITFLDMI/+OrdxwONe8RJgfDTcCM
 4+kjLiaA==;
Received: from 089144214092.atnat0023.highway.a1.net ([89.144.214.92]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIQvG-0007fh-Mj; Wed, 16 Sep 2020 06:28:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org, Russell King <linux@armlinux.org.uk>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 5/6] usb: don't inherity DMA properties for USB devices
Date: Wed, 16 Sep 2020 08:14:58 +0200
Message-Id: <20200916061500.1970090-6-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200916061500.1970090-1-hch@lst.de>
References: <20200916061500.1970090-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, linux-sh@vger.kernel.org,
 Frank Rowand <frowand.list@gmail.com>, linux-usb@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nathan Chancellor <natechancellor@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

As the comment in usb_alloc_dev correctly states, drivers can't use
the DMA API on usb device, and at least calling dma_set_mask on them
is highly dangerous.  Unlike what the comment states upper level drivers
also can't really use the presence of a dma mask to check for DMA
support, as the dma_mask is set by default for most busses.

Setting the dma_mask comes from "[PATCH] usbcore dma updates (and doc)"
in BitKeeper times, as it seems like it was primarily for setting the
NETIF_F_HIGHDMA flag in USB drivers, something that has long been
fixed up since.

Setting the dma_pfn_offset comes from commit b44bbc46a8bb
("usb: core: setup dma_pfn_offset for USB devices and, interfaces"),
which worked around the fact that the scsi_calculate_bounce_limits
functions wasn't going through the proper driver interface to query
DMA information, but that function was removed in commit 21e07dba9fb1
("scsi: reduce use of block bounce buffers") years ago.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/core/message.c |  6 ------
 drivers/usb/core/usb.c     | 12 ------------
 2 files changed, 18 deletions(-)

diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
index 6197938dcc2d8f..9e45732dc1d1d1 100644
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -1954,12 +1954,6 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
 		intf->dev.bus = &usb_bus_type;
 		intf->dev.type = &usb_if_device_type;
 		intf->dev.groups = usb_interface_groups;
-		/*
-		 * Please refer to usb_alloc_dev() to see why we set
-		 * dma_mask and dma_pfn_offset.
-		 */
-		intf->dev.dma_mask = dev->dev.dma_mask;
-		intf->dev.dma_pfn_offset = dev->dev.dma_pfn_offset;
 		INIT_WORK(&intf->reset_ws, __usb_queue_reset_device);
 		intf->minor = -1;
 		device_initialize(&intf->dev);
diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
index bafc113f2b3ef3..9b4ac4415f1a47 100644
--- a/drivers/usb/core/usb.c
+++ b/drivers/usb/core/usb.c
@@ -599,18 +599,6 @@ struct usb_device *usb_alloc_dev(struct usb_device *parent,
 	dev->dev.bus = &usb_bus_type;
 	dev->dev.type = &usb_device_type;
 	dev->dev.groups = usb_device_groups;
-	/*
-	 * Fake a dma_mask/offset for the USB device:
-	 * We cannot really use the dma-mapping API (dma_alloc_* and
-	 * dma_map_*) for USB devices but instead need to use
-	 * usb_alloc_coherent and pass data in 'urb's, but some subsystems
-	 * manually look into the mask/offset pair to determine whether
-	 * they need bounce buffers.
-	 * Note: calling dma_set_mask() on a USB device would set the
-	 * mask for the entire HCD, so don't do that.
-	 */
-	dev->dev.dma_mask = bus->sysdev->dma_mask;
-	dev->dev.dma_pfn_offset = bus->sysdev->dma_pfn_offset;
 	set_dev_node(&dev->dev, dev_to_node(bus->sysdev));
 	dev->state = USB_STATE_ATTACHED;
 	dev->lpm_disable_count = 1;
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
