Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F74216FF9
	for <lists.iommu@lfdr.de>; Tue,  7 Jul 2020 17:15:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D9E1184F27;
	Tue,  7 Jul 2020 15:15:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OTf1Kq6yMtCu; Tue,  7 Jul 2020 15:15:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 48E7E890A0;
	Tue,  7 Jul 2020 15:14:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D931C016F;
	Tue,  7 Jul 2020 15:14:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E2382C016F
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 15:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D100A86A3C
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 15:14:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Fd3fpEHxfx0 for <iommu@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 15:14:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9DEFD84C2C
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 15:14:46 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E6E5268AFE; Tue,  7 Jul 2020 17:14:41 +0200 (CEST)
Date: Tue, 7 Jul 2020 17:14:40 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jonathan Lemon <jonathan.lemon@gmail.com>
Subject: Re: [PATCH 1/4] dma-mapping: add a new dma_need_sync API
Message-ID: <20200707151440.GA23816@lst.de>
References: <20200629130359.2690853-1-hch@lst.de>
 <20200629130359.2690853-2-hch@lst.de>
 <20200706194227.vfhv5o4lporxjxmq@bsd-mbp.dhcp.thefacebook.com>
 <20200707064730.GA23602@lst.de> <20200707151109.qui5uzzzq4dihfie@bsd-mbp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200707151109.qui5uzzzq4dihfie@bsd-mbp>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, bpf@vger.kernel.org,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 Christoph Hellwig <hch@lst.de>, Magnus Karlsson <magnus.karlsson@intel.com>
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

On Tue, Jul 07, 2020 at 08:11:09AM -0700, Jonathan Lemon wrote:
> > You need to check every mapping.  E.g. this API pairs with a
> > dma_map_single/page call.  For S/G mappings you'd need to call it for
> > each entry, although if you have a use case for that we really should
> > add a dma_sg_need_sync helper instea of open coding the scatterlist walk.
> 
> My use case is setting up a pinned memory area, and caching the dma
> mappings.  I'd like to bypass storing the DMA addresses if they aren't
> needed.  For example:
> 
> setup()
> {
>     if (dma_need_sync(dev, addr, len)) {
>         kvmalloc_array(...)
>         cache_dma_mappings(...)
>     }
> 
> 
> dev_get_dma(page)
> {
>     if (!cache)
>         return page_to_phys(page)
> 
>     return dma_cache_lookup(...)
> 
> 
> 
> The reason for doing it this way is that the page in question may be
> backed by either system memory, or device memory such as a GPU.  For the
> latter, the GPU provides a table of DMA addresses where data may be
> accessed, so I'm unable to use the dma_map_page() API.

dma_need_sync doesn't tell you if the unmap needs the dma_addr_t.
I've been think about replacing CONFIG_NEED_DMA_MAP_STATE with a runtime
for a while, which would give you exattly what you need.  For now it
isn't very useful as there are very few configs left that do not have
CONFIG_NEED_DMA_MAP_STATE set.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
