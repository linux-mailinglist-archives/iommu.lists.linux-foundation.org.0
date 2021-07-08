Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 111DD3BF799
	for <lists.iommu@lfdr.de>; Thu,  8 Jul 2021 11:29:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DEC4406AB;
	Thu,  8 Jul 2021 09:29:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pozix439MxEu; Thu,  8 Jul 2021 09:29:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 47B004157A;
	Thu,  8 Jul 2021 09:29:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C524C001F;
	Thu,  8 Jul 2021 09:29:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E977EC000E
 for <iommu@lists.linux-foundation.org>; Thu,  8 Jul 2021 09:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D848760665
 for <iommu@lists.linux-foundation.org>; Thu,  8 Jul 2021 09:29:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W5fi4T73CVrG for <iommu@lists.linux-foundation.org>;
 Thu,  8 Jul 2021 09:29:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2FE0660658
 for <iommu@lists.linux-foundation.org>; Thu,  8 Jul 2021 09:29:22 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 3AF02312; Thu,  8 Jul 2021 11:29:20 +0200 (CEST)
Date: Thu, 8 Jul 2021 11:29:18 +0200
From: Joerg Roedel <joro@8bytes.org>
To: David Stevens <stevensd@chromium.org>, Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 0/4] Add dynamic iommu backed bounce buffers
Message-ID: <YObFbqEk1nGVuHLF@8bytes.org>
References: <20210707075505.2896824-1-stevensd@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210707075505.2896824-1-stevensd@google.com>
Cc: David Stevens <stevensd@google.com>, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
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

Adding Robin too.

On Wed, Jul 07, 2021 at 04:55:01PM +0900, David Stevens wrote:
> Add support for per-domain dynamic pools of iommu bounce buffers to the 
> dma-iommu API. This allows iommu mappings to be reused while still
> maintaining strict iommu protection. Allocating buffers dynamically
> instead of using swiotlb carveouts makes per-domain pools more amenable
> on systems with large numbers of devices or where devices are unknown.
> 
> When enabled, all non-direct streaming mappings below a configurable
> size will go through bounce buffers. Note that this means drivers which
> don't properly use the DMA API (e.g. i915) cannot use an iommu when this
> feature is enabled. However, all drivers which work with swiotlb=force
> should work.
> 
> Bounce buffers serve as an optimization in situations where interactions
> with the iommu are very costly. For example, virtio-iommu operations in
> a guest on a linux host require a vmexit, involvement the VMM, and a
> VFIO syscall. For relatively small DMA operations, memcpy can be
> significantly faster.
> 
> As a performance comparison, on a device with an i5-10210U, I ran fio
> with a VFIO passthrough NVMe drive with '--direct=1 --rw=read
> --ioengine=libaio --iodepth=64' and block sizes 4k, 16k, 64k, and
> 128k. Test throughput increased by 2.8x, 4.7x, 3.6x, and 3.6x. Time
> spent in iommu_dma_unmap_(page|sg) per GB processed decreased by 97%,
> 94%, 90%, and 87%. Time spent in iommu_dma_map_(page|sg) decreased
> by >99%, as bounce buffers don't require syncing here in the read case.
> Running with multiple jobs doesn't serve as a useful performance
> comparison because virtio-iommu and vfio_iommu_type1 both have big
> locks that significantly limit mulithreaded DMA performance.
> 
> This patch set is based on v5.13-rc7 plus the patches at [1].
> 
> David Stevens (4):
>   dma-iommu: add kalloc gfp flag to alloc helper
>   dma-iommu: replace device arguments
>   dma-iommu: expose a few helper functions to module
>   dma-iommu: Add iommu bounce buffers to dma-iommu api
> 
>  drivers/iommu/Kconfig          |  10 +
>  drivers/iommu/Makefile         |   1 +
>  drivers/iommu/dma-iommu.c      | 119 ++++--
>  drivers/iommu/io-buffer-pool.c | 656 +++++++++++++++++++++++++++++++++
>  drivers/iommu/io-buffer-pool.h |  91 +++++
>  include/linux/dma-iommu.h      |  12 +
>  6 files changed, 861 insertions(+), 28 deletions(-)
>  create mode 100644 drivers/iommu/io-buffer-pool.c
>  create mode 100644 drivers/iommu/io-buffer-pool.h
> 
> -- 
> 2.32.0.93.g670b81a890-goog
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
