Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB5F2500A0
	for <lists.iommu@lfdr.de>; Mon, 24 Aug 2020 17:13:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1AA2588222;
	Mon, 24 Aug 2020 15:13:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kcE3TYaIGtSt; Mon, 24 Aug 2020 15:13:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 38BE88820B;
	Mon, 24 Aug 2020 15:13:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13E8AC0051;
	Mon, 24 Aug 2020 15:13:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91644C0051;
 Mon, 24 Aug 2020 15:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7A2EB85FEF;
 Mon, 24 Aug 2020 15:13:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nlt021rrDdZe; Mon, 24 Aug 2020 15:13:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2AE00852E9;
 Mon, 24 Aug 2020 15:13:05 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 26FBD68AFE; Mon, 24 Aug 2020 17:13:01 +0200 (CEST)
Date: Mon, 24 Aug 2020 17:13:00 +0200
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: Is: virtio_gpu_object_shmem_init  issues? Was:Re: upstream
 boot error: general protection fault in swiotlb_map
Message-ID: <20200824151300.GA28575@lst.de>
References: <0000000000000c1f0005ac333382@google.com>
 <20200824150650.GD21321@char.us.oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200824150650.GD21321@char.us.oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: thomas.tai@oracle.com, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 kraxel@redhat.com, airlied@redhat.com, robin.murphy@arm.com, hch@lst.de,
 syzbot <syzbot+3f86afd0b1e4bf1cb64c@syzkaller.appspotmail.com>
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

On Mon, Aug 24, 2020 at 11:06:51AM -0400, Konrad Rzeszutek Wilk wrote:
> So it fails at
> 
> 683                 dev_WARN_ONCE(dev, 1,                                           
> 684                         "swiotlb addr %pad+%zu overflow (mask %llx, bus limit %llx).\n",
> 685                         &dma_addr, size, *dev->dma_mask, dev->bus_dma_limit);   
> 
> 
> which makes no sense to me as `dev` surely exists. I can see in the console log:
> 
> virtio-pci 0000:00:01.0: vgaarb: deactivate vga console
> 
> So what gives?

Well, look at the if around the WARN_ON - dma_capable failed on the
swiotlb buffer. This means the virtio drm thingy has a dma mask
(either the actual one set by the driver, or bus_dma_mask), which isn't
enough to address the swiotlb buffer.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
