Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C38B2A84E5
	for <lists.iommu@lfdr.de>; Thu,  5 Nov 2020 18:29:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0186C870AC;
	Thu,  5 Nov 2020 17:29:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mvg-Rl8AZIwq; Thu,  5 Nov 2020 17:29:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 83F9D870AB;
	Thu,  5 Nov 2020 17:29:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69034C0889;
	Thu,  5 Nov 2020 17:29:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93D84C0889
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 17:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 79919870A7
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 17:29:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id binxHTY2FZIl for <iommu@lists.linux-foundation.org>;
 Thu,  5 Nov 2020 17:29:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4F5738666D
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 17:29:26 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B7E4D68C4E; Thu,  5 Nov 2020 18:29:21 +0100 (CET)
Date: Thu, 5 Nov 2020 18:29:21 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 4/6] PCI/P2PDMA: Remove the DMA_VIRT_OPS hacks
Message-ID: <20201105172921.GA9537@lst.de>
References: <20201105074205.1690638-1-hch@lst.de>
 <20201105074205.1690638-5-hch@lst.de> <20201105143418.GA4142106@ziepe.ca>
 <20201105170816.GC7502@lst.de> <20201105172357.GE36674@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105172357.GE36674@ziepe.ca>
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

On Thu, Nov 05, 2020 at 01:23:57PM -0400, Jason Gunthorpe wrote:
> But that depends on the calling driver doing this properly, and we
> don't expose an API to get the PCI device of the struct ib_device
> .. how does nvme even work here?

The PCI p2pdma APIs walk the parent chains of a struct device until
they find a PCI device.  And the ib_device eventually ends up there.

> 
> If we can't get here then why did you add the check to the unmap side?

Because I added them to the map and unmap side, but forgot to commit
the map side.  Mostly to be prepared for the case where we could
end up there.  And thinking out loud I actually need to double check
rdmavt if that is true there as well.  It certainly is for rxe and
siw as I checked it on a live system.

> The SW drivers can't handle PCI pages at all, they are going to try to
> memcpy them or something else not __iomem, so we really do need to
> prevent P2P pages going into them.

Ok, let's prevent it for now.  And if someone wants to do it there
they have to do all the work.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
