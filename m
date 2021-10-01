Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D97241F214
	for <lists.iommu@lfdr.de>; Fri,  1 Oct 2021 18:22:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA039614F8;
	Fri,  1 Oct 2021 16:22:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cYJXcPd6FEmr; Fri,  1 Oct 2021 16:22:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DB81F614E9;
	Fri,  1 Oct 2021 16:22:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B55C1C000D;
	Fri,  1 Oct 2021 16:22:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 496A6C000D
 for <iommu@lists.linux-foundation.org>; Fri,  1 Oct 2021 16:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2686184519
 for <iommu@lists.linux-foundation.org>; Fri,  1 Oct 2021 16:22:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0pEw2HLqfIdg for <iommu@lists.linux-foundation.org>;
 Fri,  1 Oct 2021 16:22:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3EE7C84518
 for <iommu@lists.linux-foundation.org>; Fri,  1 Oct 2021 16:22:12 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 1A4C51F45289;
 Fri,  1 Oct 2021 17:22:10 +0100 (BST)
Date: Fri, 1 Oct 2021 18:22:06 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 4/5] drm/panfrost: Add a PANFROST_BO_GPUONLY flag
Message-ID: <20211001182206.78eb87ab@collabora.com>
In-Reply-To: <02cb188d-e77d-3dd6-ad62-fe56d42724ae@arm.com>
References: <20211001143427.1564786-1-boris.brezillon@collabora.com>
 <20211001143427.1564786-5-boris.brezillon@collabora.com>
 <02cb188d-e77d-3dd6-ad62-fe56d42724ae@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Will Deacon <will@kernel.org>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

On Fri, 1 Oct 2021 16:13:42 +0100
Steven Price <steven.price@arm.com> wrote:

> On 01/10/2021 15:34, Boris Brezillon wrote:
> > This lets the driver reduce shareability domain of the MMU mapping,
> > which can in turn reduce access time and save power on cache-coherent
> > systems.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>  
> 
> This seems reasonable to me - it matches the kbase
> BASE_MEM_COHERENT_SYSTEM (only backwards obviously) and it worked
> reasonably well for the blob.
> 
> But I'm wondering if we need to do anything special to deal with the
> fact we will now have some non-coherent mappings on an otherwise
> coherent device.
> 
> There are certainly some oddities around how these buffers will be
> mapped into user space if requested, e.g. panfrost_gem_create_object()
> sets 'map_wc' based on pfdev->coherent which is arguably wrong for
> GPUONLY. So there are two things we could consider:
> 
> a) Actually prevent user space mapping GPUONLY flagged buffers. Which
> matches the intention of the name.

I intended to do that, just forgot to add wrappers around
drm_gem_shmem_{mmap,vmap}() to forbid CPU-mappings on gpuonly buffers.

> 
> b) Attempt to provide user space with the tools to safely interact with
> the buffers (this is the kbase approach). This does have the benefit of
> allowing *mostly* GPU access. An example here is the tiler heap where
> the CPU could zero out as necessary but mostly the GPU has ownership and
> the CPU never reads the contents. GPUONLY/DEVONLY might not be the best
> name in that case.

Uh, right, I forgot we had to zero the tiler heap on Midgard (most of
the time done with a WRITE_VALUE job, but there's an exception on some
old Midgard GPUs IIRC).
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
