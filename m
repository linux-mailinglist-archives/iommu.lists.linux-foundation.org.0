Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C652B1787
	for <lists.iommu@lfdr.de>; Fri, 13 Nov 2020 09:50:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 93D8587394;
	Fri, 13 Nov 2020 08:50:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OF1aqeiAwIJn; Fri, 13 Nov 2020 08:50:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BF2B287389;
	Fri, 13 Nov 2020 08:50:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A46F4C0FAA;
	Fri, 13 Nov 2020 08:50:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B79C1C0FAA
 for <iommu@lists.linux-foundation.org>; Fri, 13 Nov 2020 08:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9A15987389
 for <iommu@lists.linux-foundation.org>; Fri, 13 Nov 2020 08:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9pB9z4vdbiUT for <iommu@lists.linux-foundation.org>;
 Fri, 13 Nov 2020 08:50:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0440B86E35
 for <iommu@lists.linux-foundation.org>; Fri, 13 Nov 2020 08:50:28 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1918467357; Fri, 13 Nov 2020 09:50:23 +0100 (CET)
Date: Fri, 13 Nov 2020 09:50:23 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: remove dma_virt_ops v2
Message-ID: <20201113085023.GA17412@lst.de>
References: <20201106181941.1878556-1-hch@lst.de>
 <20201112165935.GA932629@nvidia.com> <20201112170956.GA18813@lst.de>
 <20201112173906.GT244516@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201112173906.GT244516@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: rds-devel@oss.oracle.com, Zhu Yanjun <yanjunz@nvidia.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, linux-pci@vger.kernel.org,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <bhelgaas@google.com>,
 Bernard Metzler <bmt@zurich.ibm.com>, Logan Gunthorpe <logang@deltatee.com>,
 Christoph Hellwig <hch@lst.de>,
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

On Thu, Nov 12, 2020 at 01:39:06PM -0400, Jason Gunthorpe wrote:
> On Thu, Nov 12, 2020 at 06:09:56PM +0100, Christoph Hellwig wrote:
> > On Thu, Nov 12, 2020 at 12:59:35PM -0400, Jason Gunthorpe wrote:
> > >  RMDA/sw: Don't allow drivers using dma_virt_ops on highmem configs
> > 
> > I think this one actually is something needed in 5.10 and -stable.
> 
> Done, I added a
> 
> Fixes: 551199aca1c3 ("lib/dma-virt: Add dma_virt_ops")

Note that the drivers had open coded versions of this earlier.  I think
this goes back to the addition of the qib driver which is now gone
or the addition of the hfi1 or rxe drivers for something that still
matters.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
