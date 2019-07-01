Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C500F3C466
	for <lists.iommu@lfdr.de>; Tue, 11 Jun 2019 08:42:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 534FAB1F;
	Tue, 11 Jun 2019 06:42:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F243D2C
	for <iommu@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 06:42:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8B67179
	for <iommu@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 06:42:27 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 25AC968B02; Tue, 11 Jun 2019 08:41:59 +0200 (CEST)
Date: Tue, 11 Jun 2019 08:41:58 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: How to resolve an issue in swiotlb environment?
Message-ID: <20190611064158.GA20601@lst.de>
References: <20190610123222.GA20985@lst.de>
	<Pine.LNX.4.44L0.1906101423200.1560-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1906101423200.1560-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>
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

Hi Alan,

thanks for the explanation.  It seems like what usb wants is to:

 - set sg_tablesize to 1 for devices that can't handle scatterlist at all
 - set the virt boundary as-is for devices supporting "basic" scatterlist,
   although that still assumes they can rejiggle them because for example
   you could still get a smaller than expected first segment ala (assuming
   a 1024 byte packet size and thus 1023 virt_boundary_mask):

        | 0 .. 511 | 512 .. 1023 | 1024 .. 1535 |

   as the virt_bondary does not guarantee that the first segment is
   the same size as all the mid segments.
 - do not set any limit on xhci

But that just goes back to the original problem, and that is that with
swiotlb we are limited in the total dma mapping size, and recent block
layer changes in the way we handle the virt_boundary mean we now build
much larger requests by default.  For SCSI ULDs to take that into
account I need to call dma_max_mapping_size() and use that as the
upper bound for the request size.  My plan is to do that in scsi_lib.c,
but for that we need to expose the actual struct device that the dma
mapping is perfomed on to the scsi layer.  If that device is different
from the sysfs hierchary struct device, which it is for usb the ULDD
needs to scsi_add_host_with_dma and pass the dma device as well.  How
do I get at the dma device (aka the HCDs pci_dev or similar) from
usb-storage/uas?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
