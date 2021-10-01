Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A6A41F324
	for <lists.iommu@lfdr.de>; Fri,  1 Oct 2021 19:30:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D7AF425EF;
	Fri,  1 Oct 2021 17:30:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9qedMJcz0PLm; Fri,  1 Oct 2021 17:30:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 36EEC425E1;
	Fri,  1 Oct 2021 17:30:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0EFB7C0022;
	Fri,  1 Oct 2021 17:30:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE455C000D
 for <iommu@lists.linux-foundation.org>; Fri,  1 Oct 2021 17:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E3D144032E
 for <iommu@lists.linux-foundation.org>; Fri,  1 Oct 2021 17:30:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fv5QBVADuPBk for <iommu@lists.linux-foundation.org>;
 Fri,  1 Oct 2021 17:30:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB69640145
 for <iommu@lists.linux-foundation.org>; Fri,  1 Oct 2021 17:30:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: alyssa) with ESMTPSA id D13E61F4579C
Date: Fri, 1 Oct 2021 13:30:43 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 4/5] drm/panfrost: Add a PANFROST_BO_GPUONLY flag
Message-ID: <YVdFw9FivIyUCgU4@maud>
References: <20211001143427.1564786-1-boris.brezillon@collabora.com>
 <20211001143427.1564786-5-boris.brezillon@collabora.com>
 <02cb188d-e77d-3dd6-ad62-fe56d42724ae@arm.com>
 <20211001182206.78eb87ab@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211001182206.78eb87ab@collabora.com>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Will Deacon <will@kernel.org>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
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

> > This seems reasonable to me - it matches the kbase
> > BASE_MEM_COHERENT_SYSTEM (only backwards obviously) and it worked
> > reasonably well for the blob.

Oh, is that what that was for? I remember seeing it set on Midgard for
varyings. Good to go full circle now.

> > But I'm wondering if we need to do anything special to deal with the
> > fact we will now have some non-coherent mappings on an otherwise
> > coherent device.
> > 
> > There are certainly some oddities around how these buffers will be
> > mapped into user space if requested, e.g. panfrost_gem_create_object()
> > sets 'map_wc' based on pfdev->coherent which is arguably wrong for
> > GPUONLY. So there are two things we could consider:
> > 
> > a) Actually prevent user space mapping GPUONLY flagged buffers. Which
> > matches the intention of the name.
> 
> I intended to do that, just forgot to add wrappers around
> drm_gem_shmem_{mmap,vmap}() to forbid CPU-mappings on gpuonly buffers.

This feels like the cleaner solution to me.

> > b) Attempt to provide user space with the tools to safely interact with
> > the buffers (this is the kbase approach). This does have the benefit of
> > allowing *mostly* GPU access. An example here is the tiler heap where
> > the CPU could zero out as necessary but mostly the GPU has ownership and
> > the CPU never reads the contents. GPUONLY/DEVONLY might not be the best
> > name in that case.
> 
> Uh, right, I forgot we had to zero the tiler heap on Midgard (most of
> the time done with a WRITE_VALUE job, but there's an exception on some
> old Midgard GPUs IIRC).

"Attempt" is the key word here :|

We indeed only touch the tiler heap from the CPU on v4, and life's too
short to care about new optimizations for v4. Unless the patch is
trivial, my vote is for a) preventing the mappings and only setting
GPUONLY on the tiler_heap starting with v5.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
