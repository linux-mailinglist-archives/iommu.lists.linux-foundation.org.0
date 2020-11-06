Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3196C2A9392
	for <lists.iommu@lfdr.de>; Fri,  6 Nov 2020 11:01:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 98CD18674E;
	Fri,  6 Nov 2020 10:01:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rh1vm3-tiY+s; Fri,  6 Nov 2020 10:01:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D3FB78675F;
	Fri,  6 Nov 2020 10:01:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BBC61C0889;
	Fri,  6 Nov 2020 10:01:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00897C0889
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 10:01:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E1B5486FC1
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 10:01:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n04z8BY3LftA for <iommu@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 10:01:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 663EF86FBE
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 10:01:19 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 96D3468B02; Fri,  6 Nov 2020 11:01:15 +0100 (CET)
Date: Fri, 6 Nov 2020 11:01:15 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 3/6] RDMA/core: remove use of dma_virt_ops
Message-ID: <20201106100115.GA5951@lst.de>
References: <20201105074205.1690638-1-hch@lst.de>
 <20201105074205.1690638-4-hch@lst.de> <20201105175253.GA35235@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105175253.GA35235@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Zhu Yanjun <yanjunz@nvidia.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, linux-pci@vger.kernel.org,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <bhelgaas@google.com>,
 Bernard Metzler <bmt@zurich.ibm.com>, Logan Gunthorpe <logang@deltatee.com>,
 Christoph Hellwig <hch@lst.de>
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

On Thu, Nov 05, 2020 at 01:52:53PM -0400, Jason Gunthorpe wrote:
> On Thu, Nov 05, 2020 at 08:42:02AM +0100, Christoph Hellwig wrote:
> > @@ -1341,7 +1322,14 @@ int ib_register_device(struct ib_device *device, const char *name,
> >  	if (ret)
> >  		return ret;
> >  
> > -	setup_dma_device(device, dma_device);
> > +	/*
> > +	 * If the caller does not provide a DMA capable device then the IB core
> > +	 * will set up ib_sge and scatterlist structures that stash the kernel
> > +	 * virtual address into the address field.
> > +	 */
> > +	device->dma_device = dma_device;
> > +	WARN_ON(dma_device && !dma_device->dma_parms);
> 
> I noticed there were a couple of places expecting dma_device to be set
> to !NULL:
> 
> drivers/infiniband/core/umem.c:                 dma_get_max_seg_size(device->dma_device), sg, npages,

This needs to use ib_dma_max_seg_size.

> drivers/nvme/host/rdma.c:       ctrl->ctrl.numa_node = dev_to_node(ctrl->device->dev->dma_device);

> Don't know much about NUMA, but do you think the ib device setup
> should autocopy the numa node from the dma_device to the ib_device and
> this usage should just refer to the ib_device?

IMHO we could add a ib_device_get_numa_node API or something like that,
which uses dev_to_node on the DMA device is present and otherwise returns
-1.  If needed we can refine that later.

> net/rds/ib.c:                                              device->dma_device,
> 
> No sure what to do about RDS..

Yikes, this is completely broken.  We either need a wrapper for the
dma_pool API, or get rid of it.  Let me dig into that.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
