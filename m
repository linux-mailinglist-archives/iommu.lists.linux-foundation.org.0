Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A8424D052
	for <lists.iommu@lfdr.de>; Fri, 21 Aug 2020 10:07:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 69707203FB;
	Fri, 21 Aug 2020 08:07:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LH+o98r9t1uj; Fri, 21 Aug 2020 08:07:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9623B2038A;
	Fri, 21 Aug 2020 08:07:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8436FC0051;
	Fri, 21 Aug 2020 08:07:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B70EC0051
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 08:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5A1D986C2D
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 08:07:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vueDWo7r-PS0 for <iommu@lists.linux-foundation.org>;
 Fri, 21 Aug 2020 08:07:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EBA4786C23
 for <iommu@lists.linux-foundation.org>; Fri, 21 Aug 2020 08:07:32 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4DA4C2078D;
 Fri, 21 Aug 2020 08:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597997252;
 bh=LaMlJ8OWitxR94LYzLAW+/aCIQp70S1xt+7fdRecGkM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lvzNVTn3kK+R6rhX3v2r5kGGWFVmcbdZ4VJtDADKQTwh2Aes+1MU5H+LAHiN8OQ+H
 ket2nq3Gs0f+y7KGGrtoh30Khl+NLrKZB5sMVZ4StNWFcKM28IvThm25QAGBbg8Bw9
 DAQdnRs+m1kjIK5XxPYS+MsULpHW1cs7ylBpEn4U=
Date: Fri, 21 Aug 2020 09:07:25 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 07/18] iommu/arm-smmu: Remove arch/arm workaround
Message-ID: <20200821080724.GA20060@willie-the-truck>
References: <cover.1597931875.git.robin.murphy@arm.com>
 <ef39be82b98d2471c9e99c82d0eeda37ba30e4fa.1597931876.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef39be82b98d2471c9e99c82d0eeda37ba30e4fa.1597931876.git.robin.murphy@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, digetx@gmail.com, hch@lst.de,
 linux-samsung-soc@vger.kernel.org, magnus.damm@gmail.com,
 linux@armlinux.org.uk, jonathanh@nvidia.com, agross@kernel.org,
 kyungmin.park@samsung.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, inki.dae@samsung.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com,
 iommu@lists.linux-foundation.org
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

On Thu, Aug 20, 2020 at 04:08:26PM +0100, Robin Murphy wrote:
> Now that arch/arm is wired up for default domains and iommu-dma, remove
> the add_device workaround.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 10 ----------
>  1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 09c42af9f31e..4e52d8cb67dd 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -1164,17 +1164,7 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>  		return -ENXIO;
>  	}
>  
> -	/*
> -	 * FIXME: The arch/arm DMA API code tries to attach devices to its own
> -	 * domains between of_xlate() and probe_device() - we have no way to cope
> -	 * with that, so until ARM gets converted to rely on groups and default
> -	 * domains, just say no (but more politely than by dereferencing NULL).
> -	 * This should be at least a WARN_ON once that's sorted.
> -	 */
>  	cfg = dev_iommu_priv_get(dev);
> -	if (!cfg)
> -		return -ENODEV;
> -
>  	smmu = cfg->smmu;
>  
>  	ret = arm_smmu_rpm_get(smmu);

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
