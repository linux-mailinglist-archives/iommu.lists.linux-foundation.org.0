Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4F52EBAA9
	for <lists.iommu@lfdr.de>; Wed,  6 Jan 2021 08:50:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0D0892047C;
	Wed,  6 Jan 2021 07:50:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cTPb8cZCjGP0; Wed,  6 Jan 2021 07:50:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CC30B20363;
	Wed,  6 Jan 2021 07:50:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2829C1E6F;
	Wed,  6 Jan 2021 07:50:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A7A4C013A
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jan 2021 07:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5336A20363
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jan 2021 07:50:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sDHdBp+jG8PN for <iommu@lists.linux-foundation.org>;
 Wed,  6 Jan 2021 07:50:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 343CA20370
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jan 2021 07:50:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7129D2070C;
 Wed,  6 Jan 2021 07:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1609919407;
 bh=Piu5gusr/UGLicaCqANy6GNdwM1M9LXLgq30KLvh2D4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=STtQBirTvMJHJfy3BDpBJr1nF4y3j9P09tA52QukFa2+zVDJOvZxlpH0YuQb1dKaI
 tkZ/1YHajtxpOZBb2tYYK9x5sW39V1FMN5v9MY2fd4frFWPosjKHysaj5P3pqOj5H4
 cLt1ndn2T4gOT+l7NViKlEBYi94u2sh/OTHke2vk=
Date: Wed, 6 Jan 2021 08:50:03 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Claire Chang <tientzu@chromium.org>
Subject: Re: [RFC PATCH v3 2/6] swiotlb: Add restricted DMA pool
Message-ID: <X/VrqxcaAMi65CF0@kroah.com>
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-3-tientzu@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210106034124.30560-3-tientzu@chromium.org>
Cc: heikki.krogerus@linux.intel.com, peterz@infradead.org,
 benh@kernel.crashing.org, grant.likely@arm.com, paulus@samba.org,
 frowand.list@gmail.com, mingo@kernel.org, sstabellini@kernel.org,
 saravanak@google.com, mpe@ellerman.id.au, rafael.j.wysocki@intel.com,
 hch@lst.de, bgolaszewski@baylibre.com, xen-devel@lists.xenproject.org,
 treding@nvidia.com, devicetree@vger.kernel.org, will@kernel.org,
 konrad.wilk@oracle.com, dan.j.williams@intel.com, robh+dt@kernel.org,
 boris.ostrovsky@oracle.com, andriy.shevchenko@linux.intel.com, jgross@suse.com,
 drinkcat@chromium.org, linuxppc-dev@lists.ozlabs.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 xypron.glpk@gmx.de, robin.murphy@arm.com
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

On Wed, Jan 06, 2021 at 11:41:20AM +0800, Claire Chang wrote:
> Add the initialization function to create restricted DMA pools from
> matching reserved-memory nodes in the device tree.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> ---
>  include/linux/device.h  |   4 ++
>  include/linux/swiotlb.h |   7 +-
>  kernel/dma/Kconfig      |   1 +
>  kernel/dma/swiotlb.c    | 144 ++++++++++++++++++++++++++++++++++------
>  4 files changed, 131 insertions(+), 25 deletions(-)
> 
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 89bb8b84173e..ca6f71ec8871 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -413,6 +413,7 @@ struct dev_links_info {
>   * @dma_pools:	Dma pools (if dma'ble device).
>   * @dma_mem:	Internal for coherent mem override.
>   * @cma_area:	Contiguous memory area for dma allocations
> + * @dma_io_tlb_mem: Internal for swiotlb io_tlb_mem override.

Why does this have to be added here?  Shouldn't the platform-specific
code handle it instead?

thanks,

greg k-h
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
