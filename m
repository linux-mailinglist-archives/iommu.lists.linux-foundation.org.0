Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D46283883
	for <lists.iommu@lfdr.de>; Mon,  5 Oct 2020 16:50:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 530078577C;
	Mon,  5 Oct 2020 14:50:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jjif2T9x6i-g; Mon,  5 Oct 2020 14:50:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DD2F18587E;
	Mon,  5 Oct 2020 14:50:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC967C0051;
	Mon,  5 Oct 2020 14:50:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6F6D5C0051
 for <iommu@lists.linux-foundation.org>; Mon,  5 Oct 2020 14:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5523686657
 for <iommu@lists.linux-foundation.org>; Mon,  5 Oct 2020 14:50:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2feRw144YNDf for <iommu@lists.linux-foundation.org>;
 Mon,  5 Oct 2020 14:50:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EF94A866E9
 for <iommu@lists.linux-foundation.org>; Mon,  5 Oct 2020 14:50:15 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EF75E28DB0E;
 Mon,  5 Oct 2020 15:50:12 +0100 (BST)
Date: Mon, 5 Oct 2020 16:50:08 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 1/3] iommu/io-pgtable-arm: Support coherency for Mali
 LPAE
Message-ID: <20201005165008.1f3b4e89@collabora.com>
In-Reply-To: <8df778355378127ea7eccc9521d6427e3e48d4f2.1600780574.git.robin.murphy@arm.com>
References: <cover.1600780574.git.robin.murphy@arm.com>
 <8df778355378127ea7eccc9521d6427e3e48d4f2.1600780574.git.robin.murphy@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: robh@kernel.org, tomeu.vizoso@collabora.com, narmstrong@baylibre.com,
 khilman@baylibre.com, dri-devel@lists.freedesktop.org, steven.price@arm.com,
 iommu@lists.linux-foundation.org, alyssa.rosenzweig@collabora.com,
 linux-amlogic@lists.infradead.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
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

On Tue, 22 Sep 2020 15:16:48 +0100
Robin Murphy <robin.murphy@arm.com> wrote:

> Midgard GPUs have ACE-Lite master interfaces which allows systems to
> integrate them in an I/O-coherent manner. It seems that from the GPU's
> viewpoint, the rest of the system is its outer shareable domain, and so
> even when snoop signals are wired up, they are only emitted for outer
> shareable accesses. As such, setting the TTBR_SHARE_OUTER bit does
> indeed get coherent pagetable walks working nicely for the coherent
> T620 in the Arm Juno SoC.
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> Tested-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/io-pgtable-arm.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index dc7bcf858b6d..b4072a18e45d 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -440,7 +440,13 @@ static arm_lpae_iopte arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
>  				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
>  	}
>  
> -	if (prot & IOMMU_CACHE)
> +	/*
> +	 * Also Mali has its own notions of shareability wherein its Inner
> +	 * domain covers the cores within the GPU, and its Outer domain is
> +	 * "outside the GPU" (i.e. either the Inner or System domain in CPU
> +	 * terms, depending on coherency).
> +	 */
> +	if (prot & IOMMU_CACHE && data->iop.fmt != ARM_MALI_LPAE)
>  		pte |= ARM_LPAE_PTE_SH_IS;
>  	else
>  		pte |= ARM_LPAE_PTE_SH_OS;

Actually, it still doesn't work on s922x :-/. For it to work I
correctly, I need to drop the outer shareable flag here.

> @@ -1049,6 +1055,9 @@ arm_mali_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
>  	cfg->arm_mali_lpae_cfg.transtab = virt_to_phys(data->pgd) |
>  					  ARM_MALI_LPAE_TTBR_READ_INNER |
>  					  ARM_MALI_LPAE_TTBR_ADRMODE_TABLE;
> +	if (cfg->coherent_walk)
> +		cfg->arm_mali_lpae_cfg.transtab |= ARM_MALI_LPAE_TTBR_SHARE_OUTER;
> +
>  	return &data->iop;
>  
>  out_free_data:

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
