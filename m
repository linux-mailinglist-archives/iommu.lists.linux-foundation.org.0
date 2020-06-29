Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B5D20E995
	for <lists.iommu@lfdr.de>; Tue, 30 Jun 2020 01:49:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1BA1A86463;
	Mon, 29 Jun 2020 23:49:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zNKdXpGg93Ji; Mon, 29 Jun 2020 23:49:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 79B0986B04;
	Mon, 29 Jun 2020 23:49:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 52B0BC016E;
	Mon, 29 Jun 2020 23:49:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E584FC016E;
 Mon, 29 Jun 2020 23:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E0D2588C43;
 Mon, 29 Jun 2020 23:49:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b-sDnkKMg5wT; Mon, 29 Jun 2020 23:49:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 47E0488C33;
 Mon, 29 Jun 2020 23:49:08 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7889C20780;
 Mon, 29 Jun 2020 23:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593474548;
 bh=YbTxDsPQ5DXse6zCMw0MuvKG3mwFGMtOfnE1ikxlpqo=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=oupK0XZKr1tf9ZlB/vvhwl1g6l2FOT5EFgGIhASbYWQH4kL3mAqIIY0pFydyMp7AX
 ofoJ8l5Iy8Aj26eVYnf5X4wsVYL6+cyWfbFqp0keEtaF2uTu23UBwDyP6etUS+vytZ
 X2bXG5S9JLED91Z9FLDjXkzy6mkStrMTTdctv8GQ=
Date: Mon, 29 Jun 2020 16:49:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Peng Fan <peng.fan@nxp.com>
Subject: RE: [PATCH] xen: introduce xen_vring_use_dma
In-Reply-To: <DB6PR0402MB27601CA74B85DA5A9F5E5DD6886E0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2006291647450.8121@sstabellini-ThinkPad-T480s>
References: <20200624091732.23944-1-peng.fan@nxp.com>
 <20200624050355-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241047010.8121@sstabellini-ThinkPad-T480s>
 <20200624163940-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241351430.8121@sstabellini-ThinkPad-T480s>
 <20200624181026-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006251014230.8121@sstabellini-ThinkPad-T480s>
 <20200626110629-mutt-send-email-mst@kernel.org>
 <DB6PR0402MB27601CA74B85DA5A9F5E5DD6886E0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: "jgross@suse.com" <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

On Mon, 29 Jun 2020, Peng Fan wrote:
> > > If that is the case, how is it possible that virtio breaks on ARM
> > > using the default dma_ops? The breakage is not Xen related (except
> > > that Xen turns dma_ops on). The original message from Peng was:
> > >
> > >   vring_map_one_sg -> vring_use_dma_api
> > >                    -> dma_map_page
> > >   		       -> __swiotlb_map_page
> > >   		                ->swiotlb_map_page
> > >   				->__dma_map_area(phys_to_virt(dma_to_phys(dev,
> > dev_addr)), size, dir);
> > >   However we are using per device dma area for rpmsg, phys_to_virt
> > >   could not return a correct virtual address for virtual address in
> > >   vmalloc area. Then kernel panic.
> > >
> > > I must be missing something. Maybe it is because it has to do with RPMesg?
> > 
> > I think it's an RPMesg bug, yes
> 
> rpmsg bug is another issue, it should not use dma_alloc_coherent for reserved area,
> and use vmalloc_to_page.
> 
> Anyway here using dma api will also trigger issue.

Is the stack trace above for the RPMesg issue or for the Trusty issue?
If it is the stack trace for RPMesg, can you also post the Trusty stack
trace? Or are they indentical?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
