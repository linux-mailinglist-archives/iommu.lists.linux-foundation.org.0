Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F08E268684
	for <lists.iommu@lfdr.de>; Mon, 14 Sep 2020 09:51:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 100DB203B8;
	Mon, 14 Sep 2020 07:51:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n+RDfWhbS8gO; Mon, 14 Sep 2020 07:51:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2B22020343;
	Mon, 14 Sep 2020 07:51:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 158B8C0859;
	Mon, 14 Sep 2020 07:51:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C52C0C0859
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 07:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B7C5486930
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 07:51:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P2aIH5Pj6d8m for <iommu@lists.linux-foundation.org>;
 Mon, 14 Sep 2020 07:51:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 069B786816
 for <iommu@lists.linux-foundation.org>; Mon, 14 Sep 2020 07:51:40 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CC8C720829;
 Mon, 14 Sep 2020 07:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600069900;
 bh=sLEmFEgLgQ6VIFDmYtTYiby9H19HNBdE2pb0auPAfNs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MUh+xMZ+3cK9OUG8yLvWphyyGhj7Or4v1gE0rD6UnExgdRYqIRszoy75p+Ht77soV
 dBzl7yjyDdoIBZvIAv/a8hHLpP7ud29rOK5ermxXFAxrIPMqc1KVs5mSVKaY1fISmm
 jyLnRqaaow9iBmMY+4C7qFm71KH/+bqz89eLJRHQ=
Date: Mon, 14 Sep 2020 09:51:40 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 5/6] usb: don't inherity DMA properties for USB devices
Message-ID: <20200914075140.GA1033580@kroah.com>
References: <20200914073343.1579578-1-hch@lst.de>
 <20200914073343.1579578-6-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200914073343.1579578-6-hch@lst.de>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-pci@vger.kernel.org,
 Frank Rowand <frowand.list@gmail.com>, linux-usb@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, Jim Quinlan <james.quinlan@broadcom.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
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

On Mon, Sep 14, 2020 at 09:33:42AM +0200, Christoph Hellwig wrote:
> As the comment in usb_alloc_dev correctly states, drivers can't use
> the DMA API on usb device, and at least calling dma_set_mask on them
> is highly dangerous.  Unlike what the comment states upper level drivers
> also can't really use the presence of a dma mask to check for DMA
> support, as the dma_mask is set by default for most busses.
> 
> Setting the dma_mask comes from "[PATCH] usbcore dma updates (and doc)"
> in BitKeeper times, as it seems like it was primarily for setting the
> NETIF_F_HIGHDMA flag in USB drivers, something that has long been
> fixed up since.
> 
> Setting the dma_pfn_offset comes from commit b44bbc46a8bb
> ("usb: core: setup dma_pfn_offset for USB devices and, interfaces"),
> which worked around the fact that the scsi_calculate_bounce_limits
> functions wasn't going through the proper driver interface to query
> DMA information, but that function was removed in commit 21e07dba9fb1
> ("scsi: reduce use of block bounce buffers") years ago.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
