Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F333CF6D
	for <lists.iommu@lfdr.de>; Tue, 11 Jun 2019 16:51:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B44F0F04;
	Tue, 11 Jun 2019 14:51:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 198DFEF4
	for <iommu@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 14:51:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from iolanthe.rowland.org (iolanthe.rowland.org [192.131.102.54])
	by smtp1.linuxfoundation.org (Postfix) with SMTP id 5E61A174
	for <iommu@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 14:51:15 +0000 (UTC)
Received: (qmail 2357 invoked by uid 2102); 11 Jun 2019 10:51:14 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
	by localhost with SMTP; 11 Jun 2019 10:51:14 -0400
Date: Tue, 11 Jun 2019 10:51:14 -0400 (EDT)
From: Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To: Christoph Hellwig <hch@lst.de>
Subject: Re: How to resolve an issue in swiotlb environment?
In-Reply-To: <20190611064158.GA20601@lst.de>
Message-ID: <Pine.LNX.4.44L0.1906110956510.1535-100000@iolanthe.rowland.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
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

On Tue, 11 Jun 2019, Christoph Hellwig wrote:

> Hi Alan,
> 
> thanks for the explanation.  It seems like what usb wants is to:
> 
>  - set sg_tablesize to 1 for devices that can't handle scatterlist at all

Hmmm.  usb-storage (and possible other drivers too) currently handles
such controllers by setting up an SG transfer as a series of separate
URBs, one for each scatterlist entry.  But this is not the same thing,
for two reasons:

	It has less I/O overhead than setting sg_tablesize to 1 because 
	it sets up the whole transfer as a single SCSI command, which 
	requires much less time and traffic on the USB bus than sending 
	multiple commands.

	It has that requirement about each scatterlist element except
	the last being a multiple of the maximum packet size in length.
	(This is because the USB protocol says that a transfer ends
	whenever a less-than-maximum-size packet is encountered.)

We would like to avoid the extra I/O overhead for host controllers that
can't handle SG.  In fact, switching to sg_tablesize = 1 would probably
be considered a regression.

>  - set the virt boundary as-is for devices supporting "basic" scatterlist,
>    although that still assumes they can rejiggle them because for example
>    you could still get a smaller than expected first segment ala (assuming
>    a 1024 byte packet size and thus 1023 virt_boundary_mask):
> 
>         | 0 .. 511 | 512 .. 1023 | 1024 .. 1535 |
> 
>    as the virt_bondary does not guarantee that the first segment is
>    the same size as all the mid segments.

But that is exactly the problem we need to solve.

The issue which prompted the commit this thread is about arose in a
situation where the block layer set up a scatterlist containing buffer
sizes something like:

	4096 4096 1536 1024

and the maximum packet size was 1024.  The situation was a little 
unusual, because it involved vhci-hcd (a virtual HCD).  This doesn't 
matter much in normal practice because:

	Block devices normally have a block size of 512 bytes or more.
	Smaller values are very uncommon.  So scatterlist element sizes
	are always divisible by 512.

	xHCI is the only USB host controller type with a maximum packet 
	size larger than 512, and xHCI hardware can do full 
	scatter-gather so it doesn't care what the buffer sizes are.

So another approach would be to fix vhci-hcd and then trust that the
problem won't arise again, for the reasons above.  We would be okay so
long as nobody tried to use a USB-SCSI device with a block size of 256
bytes or less.

>  - do not set any limit on xhci
> 
> But that just goes back to the original problem, and that is that with
> swiotlb we are limited in the total dma mapping size, and recent block
> layer changes in the way we handle the virt_boundary mean we now build
> much larger requests by default.  For SCSI ULDs to take that into
> account I need to call dma_max_mapping_size() and use that as the
> upper bound for the request size.  My plan is to do that in scsi_lib.c,
> but for that we need to expose the actual struct device that the dma
> mapping is perfomed on to the scsi layer.  If that device is different
> from the sysfs hierchary struct device, which it is for usb the ULDD
> needs to scsi_add_host_with_dma and pass the dma device as well.  How
> do I get at the dma device (aka the HCDs pci_dev or similar) from
> usb-storage/uas?

From usb_stor_probe2(): us->pusb_dev->bus->sysdev.
From uas_probe(): udev->bus->sysdev.

The ->sysdev field points to the device used for DMA mapping.  It is
often the same as ->controller, but sometimes it is
->controller->parent because of the peculiarities of some platforms.

Alan Stern

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
