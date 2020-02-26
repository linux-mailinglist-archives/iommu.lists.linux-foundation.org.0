Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 812511705E1
	for <lists.iommu@lfdr.de>; Wed, 26 Feb 2020 18:19:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 31B1F87B45;
	Wed, 26 Feb 2020 17:19:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i7qzrOfFC0u2; Wed, 26 Feb 2020 17:19:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E572687B41;
	Wed, 26 Feb 2020 17:19:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3A37C08A0;
	Wed, 26 Feb 2020 17:19:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9550C0177
 for <iommu@lists.linux-foundation.org>; Wed, 26 Feb 2020 17:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D862D86B89
 for <iommu@lists.linux-foundation.org>; Wed, 26 Feb 2020 17:19:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7atiDbbpgCAk for <iommu@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 17:19:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 842D486B83
 for <iommu@lists.linux-foundation.org>; Wed, 26 Feb 2020 17:19:22 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5BE5068CEE; Wed, 26 Feb 2020 18:19:18 +0100 (CET)
Date: Wed, 26 Feb 2020 18:19:18 +0100
From: Christoph Hellwig <hch@lst.de>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: Proper way to check for restricted DMA addressing from device
 driver
Message-ID: <20200226171918.GA22703@lst.de>
References: <2608dfa05478d995586c9e477917349dc18618ac.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2608dfa05478d995586c9e477917349dc18618ac.camel@pengutronix.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

What you really needs is something like the dma_alloc_pages interface
here:

   http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma_alloc_pages

which has been preempted by a few other things, and the fact that
the AMD SEV encryption bit breaks various assumptions made in this
interface..

On Wed, Feb 26, 2020 at 04:44:14PM +0100, Lucas Stach wrote:
> Hi all,
> 
> I'm currently struggling with how to properly check for restricted DMA
> addressing from a device driver side. The basic issue I'm facing is
> that I have a embedded GPU, which isn't able to address all system
> memory due to interconnect being restricted to 32bit addressing. The
> limits are properly described in the system device-tree and thus
> SWIOTLB is working.
> 
> However graphics buffers are large and graphics drivers really like to
> keep the dma mapping alive for performance reasons, which means I'm
> running out of SWIOTLB space pretty easily, aside from the obvious
> performance implications of SWIOTLB.
> 
> As 3 out of the maximum 4GB system memory are located in the DMA32 zone
> and thus located in the GPU addressable space, I just want to avoid
> allocating graphics buffers outside of the DMA32 zone.
> 
> To add the DMA32 restriction to my drivers allocations, I need a
> reliable way from the device driver side to check if the GPU is in such
> a restricted system. What I'm currently doing in my WIP patch is this:
> 
>  /*
>   * If the GPU is part of a system with only 32bit bus addressing
>   * capabilities, request pages for our SHM backend buffers from the
>   * DMA32 zone to avoid performance killing SWIOTLB bounce buffering.
>   */
>  if (*gpu->dev->dma_mask < BIT_ULL(32) && !device_iommu_mapped(gpu->dev))
>          priv->shm_gfp_mask |= GFP_DMA32;
> 
> However I'm not sure if there are edge cases where this check would
> fool me. Is there any better way to check for DMA addressing
> restrictions from the device driver side?
> 
> Regards,
> Lucas
---end quoted text---
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
