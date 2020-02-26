Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B89B170321
	for <lists.iommu@lfdr.de>; Wed, 26 Feb 2020 16:51:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D77F587A72;
	Wed, 26 Feb 2020 15:51:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4YMF5Fuk1l3E; Wed, 26 Feb 2020 15:51:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 343D287A80;
	Wed, 26 Feb 2020 15:51:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F365C1D8E;
	Wed, 26 Feb 2020 15:51:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D2BDC0177
 for <iommu@lists.linux-foundation.org>; Wed, 26 Feb 2020 15:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 34ED285DA0
 for <iommu@lists.linux-foundation.org>; Wed, 26 Feb 2020 15:51:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fx98lV+xM2qp for <iommu@lists.linux-foundation.org>;
 Wed, 26 Feb 2020 15:51:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5170685CC3
 for <iommu@lists.linux-foundation.org>; Wed, 26 Feb 2020 15:51:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BACE630E;
 Wed, 26 Feb 2020 07:51:33 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 283FA3F819;
 Wed, 26 Feb 2020 07:51:33 -0800 (PST)
Subject: Re: Proper way to check for restricted DMA addressing from device
 driver
To: Lucas Stach <l.stach@pengutronix.de>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
References: <2608dfa05478d995586c9e477917349dc18618ac.camel@pengutronix.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <bfecf850-5bd7-3092-b9b3-c5721d7a44ee@arm.com>
Date: Wed, 26 Feb 2020 15:51:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2608dfa05478d995586c9e477917349dc18618ac.camel@pengutronix.de>
Content-Language: en-GB
Cc: Christoph Hellwig <hch@lst.de>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 26/02/2020 3:44 pm, Lucas Stach wrote:
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
>   /*
>    * If the GPU is part of a system with only 32bit bus addressing
>    * capabilities, request pages for our SHM backend buffers from the
>    * DMA32 zone to avoid performance killing SWIOTLB bounce buffering.
>    */
>   if (*gpu->dev->dma_mask < BIT_ULL(32) && !device_iommu_mapped(gpu->dev))
>           priv->shm_gfp_mask |= GFP_DMA32;
> 
> However I'm not sure if there are edge cases where this check would
> fool me. Is there any better way to check for DMA addressing
> restrictions from the device driver side?

dma_addressing_limited()?

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
