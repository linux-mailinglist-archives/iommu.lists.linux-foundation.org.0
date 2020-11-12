Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC7E2B021D
	for <lists.iommu@lfdr.de>; Thu, 12 Nov 2020 10:40:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8C26086E65;
	Thu, 12 Nov 2020 09:40:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id staVdF71e8DE; Thu, 12 Nov 2020 09:40:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2CABE86E64;
	Thu, 12 Nov 2020 09:40:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11181C0889;
	Thu, 12 Nov 2020 09:40:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 975ADC0889
 for <iommu@lists.linux-foundation.org>; Thu, 12 Nov 2020 09:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 85F6986E64
 for <iommu@lists.linux-foundation.org>; Thu, 12 Nov 2020 09:40:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GB2Qy11hbfmw for <iommu@lists.linux-foundation.org>;
 Thu, 12 Nov 2020 09:40:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 356EC86E59
 for <iommu@lists.linux-foundation.org>; Thu, 12 Nov 2020 09:40:35 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1A9D367373; Thu, 12 Nov 2020 10:40:31 +0100 (CET)
Date: Thu, 12 Nov 2020 10:40:30 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: remove dma_virt_ops v2
Message-ID: <20201112094030.GA19550@lst.de>
References: <20201106181941.1878556-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201106181941.1878556-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: rds-devel@oss.oracle.com, Zhu Yanjun <yanjunz@nvidia.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, linux-pci@vger.kernel.org,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <bhelgaas@google.com>,
 Bernard Metzler <bmt@zurich.ibm.com>, Logan Gunthorpe <logang@deltatee.com>,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>
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

ping?

On Fri, Nov 06, 2020 at 07:19:31PM +0100, Christoph Hellwig wrote:
> Hi Jason,
> 
> this series switches the RDMA core to opencode the special case of
> devices bypassing the DMA mapping in the RDMA ULPs.  The virt ops
> have caused a bit of trouble due to the P2P code node working with
> them due to the fact that we'd do two dma mapping iterations for a
> single I/O, but also are a bit of layering violation and lead to
> more code than necessary.
> 
> Tested with nvme-rdma over rxe.
> 
> Note that the rds changes are untested, as I could not find any
> simple rds test setup.
> 
> Changes since v2:
>  - simplify the INFINIBAND_VIRT_DMA dependencies
>  - add a ib_uses_virt_dma helper
>  - use ib_uses_virt_dma in nvmet-rdma to disable p2p for virt_dma devices
>  - use ib_dma_max_seg_size in umem
>  - stop using dmapool in rds
> 
> Changes since v1:
>  - disable software RDMA drivers for highmem configs
>  - update the PCI commit logs
---end quoted text---
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
