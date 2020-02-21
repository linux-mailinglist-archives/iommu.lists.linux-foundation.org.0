Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6541683C6
	for <lists.iommu@lfdr.de>; Fri, 21 Feb 2020 17:39:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F169B221AB;
	Fri, 21 Feb 2020 16:39:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hsa+-KCc5kMJ; Fri, 21 Feb 2020 16:39:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9E54A22128;
	Fri, 21 Feb 2020 16:39:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90C73C013E;
	Fri, 21 Feb 2020 16:39:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E87DC013E;
 Fri, 21 Feb 2020 16:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 37C9687FC9;
 Fri, 21 Feb 2020 16:39:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WmfkmnBDFa4V; Fri, 21 Feb 2020 16:39:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AADBB87FC3;
 Fri, 21 Feb 2020 16:39:41 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8C11368BFE; Fri, 21 Feb 2020 17:39:38 +0100 (CET)
Date: Fri, 21 Feb 2020 17:39:38 +0100
From: Christoph Hellwig <hch@lst.de>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 2/2] virtio: let virtio use DMA API when guest RAM is
 protected
Message-ID: <20200221163938.GC10054@lst.de>
References: <20200220160606.53156-1-pasic@linux.ibm.com>
 <20200220160606.53156-3-pasic@linux.ibm.com> <20200220161309.GB12709@lst.de>
 <20200221153340.4cdcde81.pasic@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221153340.4cdcde81.pasic@linux.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 iommu@lists.linux-foundation.org, David Gibson <david@gibson.dropbear.id.au>,
 Michael Mueller <mimu@linux.ibm.com>, "Lendacky,
 Thomas" <Thomas.Lendacky@amd.com>, Viktor Mihajlovski <mihajlov@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

On Fri, Feb 21, 2020 at 03:33:40PM +0100, Halil Pasic wrote:
> > Hell no.  This is a detail of the platform DMA direct implementation.
> 
> I beg to differ. If it was a detail of the DMA direct implementation, it
> should have/would have been private to kernel/dma/direct.c. 

It can't given that platforms have to implement it.  It is an arch hook
for dma-direct.

> Consider what would we have to do to make PCI devices do I/O trough
> pages that were shared when the guest is running in a protected VM. The
> s390_pci_dma_ops would also need to know whether to 'force dma uencrypted'
> or not, and it's the exact same logic. I doubt simply using DMA direct
> for zPCI would do, because we still have to do all the Z specific IOMMU
> management.

And your IOMMU can't deal with the encryption bit?  In the case we
could think of allowing IOMMU implementation to access it.  But the
point that it is an internal detail of the DMA implementation and by
now means for drivers.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
