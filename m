Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9B11AD6E7
	for <lists.iommu@lfdr.de>; Fri, 17 Apr 2020 09:06:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4A1EA862CA;
	Fri, 17 Apr 2020 07:06:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M-tS8oA1LJYw; Fri, 17 Apr 2020 07:06:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7A1B086214;
	Fri, 17 Apr 2020 07:06:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6197DC1D8D;
	Fri, 17 Apr 2020 07:06:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7708C0172
 for <iommu@lists.linux-foundation.org>; Fri, 17 Apr 2020 07:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AD841862C9
 for <iommu@lists.linux-foundation.org>; Fri, 17 Apr 2020 07:06:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 90l3oOJSKzwY for <iommu@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 07:06:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9224D86214
 for <iommu@lists.linux-foundation.org>; Fri, 17 Apr 2020 07:06:26 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6053468BFE; Fri, 17 Apr 2020 09:06:21 +0200 (CEST)
Date: Fri, 17 Apr 2020 09:06:20 +0200
From: Christoph Hellwig <hch@lst.de>
To: David Rientjes <rientjes@google.com>
Subject: Re: [patch 1/7] dma-remap: separate DMA atomic pools from direct
 remap code
Message-ID: <20200417070620.GA19153@lst.de>
References: <alpine.DEB.2.22.394.2004141700480.68516@chino.kir.corp.google.com>
 <alpine.DEB.2.22.394.2004141703030.68516@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2004141703030.68516@chino.kir.corp.google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Tom Lendacky <thomas.lendacky@amd.com>, x86@kernel.org,
 Brijesh Singh <brijesh.singh@amd.com>, Jon Grimm <jon.grimm@amd.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, Christoph Hellwig <hch@lst.de>
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

On Tue, Apr 14, 2020 at 05:04:52PM -0700, David Rientjes wrote:
> DMA atomic pools will be needed beyond only CONFIG_DMA_DIRECT_REMAP so
> separate them out into their own file.
> 
> This also adds a new Kconfig option that can be subsequently used for
> options, such as CONFIG_AMD_MEM_ENCRYPT, that will utilize the coherent
> pools but do not have a dependency on direct remapping.
> 
> For this patch alone, there is no functional change introduced.
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: David Rientjes <rientjes@google.com>
> ---
>  kernel/dma/Kconfig  |   6 ++-
>  kernel/dma/Makefile |   1 +
>  kernel/dma/pool.c   | 123 ++++++++++++++++++++++++++++++++++++++++++++
>  kernel/dma/remap.c  | 114 ----------------------------------------
>  4 files changed, 129 insertions(+), 115 deletions(-)
>  create mode 100644 kernel/dma/pool.c
> 
> diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
> index 4c103a24e380..d006668c0027 100644
> --- a/kernel/dma/Kconfig
> +++ b/kernel/dma/Kconfig
> @@ -79,10 +79,14 @@ config DMA_REMAP
>  	select DMA_NONCOHERENT_MMAP
>  	bool
>  
> -config DMA_DIRECT_REMAP
> +config DMA_COHERENT_POOL
>  	bool
>  	select DMA_REMAP
>  
> +config DMA_DIRECT_REMAP
> +	bool
> +	select DMA_COHERENT_POOL
> +
>  config DMA_CMA
>  	bool "DMA Contiguous Memory Allocator"
>  	depends on HAVE_DMA_CONTIGUOUS && CMA
> diff --git a/kernel/dma/Makefile b/kernel/dma/Makefile
> index d237cf3dc181..370f63344e9c 100644
> --- a/kernel/dma/Makefile
> +++ b/kernel/dma/Makefile
> @@ -6,4 +6,5 @@ obj-$(CONFIG_DMA_DECLARE_COHERENT)	+= coherent.o
>  obj-$(CONFIG_DMA_VIRT_OPS)		+= virt.o
>  obj-$(CONFIG_DMA_API_DEBUG)		+= debug.o
>  obj-$(CONFIG_SWIOTLB)			+= swiotlb.o
> +obj-$(CONFIG_DMA_COHERENT_POOL)		+= pool.o
>  obj-$(CONFIG_DMA_REMAP)			+= remap.o
> diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
> new file mode 100644
> index 000000000000..6612c2d51d3c
> --- /dev/null
> +++ b/kernel/dma/pool.c
> @@ -0,0 +1,123 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 Google LLC

This now also lost the ARM copyright in addition to the Linuxfoundation
one, but I can fix that up.  Otherwise it looks good to me.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
