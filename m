Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F68C4733D5
	for <lists.iommu@lfdr.de>; Mon, 13 Dec 2021 19:19:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A556F812F7;
	Mon, 13 Dec 2021 18:19:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iV_uZe1C7Fe4; Mon, 13 Dec 2021 18:19:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C83D0812F8;
	Mon, 13 Dec 2021 18:18:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E225C0070;
	Mon, 13 Dec 2021 18:18:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2AF0C0012
 for <iommu@lists.linux-foundation.org>; Mon, 13 Dec 2021 18:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF5B6812F8
 for <iommu@lists.linux-foundation.org>; Mon, 13 Dec 2021 18:18:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZdE9OKr4xvpq for <iommu@lists.linux-foundation.org>;
 Mon, 13 Dec 2021 18:18:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36869812F7
 for <iommu@lists.linux-foundation.org>; Mon, 13 Dec 2021 18:18:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3D0B26119E;
 Mon, 13 Dec 2021 18:18:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23CEC34600;
 Mon, 13 Dec 2021 18:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639419535;
 bh=REYgSuVQdxp2bAFggNyzh9NNmOFZO6LbeZVIVnH6Uu8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SUFdmu55C4htemBDQWIPw/vyW7OKgjqa0nwzJt7rqMXVgRU5XY4XdNGBUY68C6dFp
 s65YM1n5cETbhRzRwV3v1BqwauyFQl9kwnnrK+Uz0qxyN6/VfxZnn3kkjPcQTbfjmq
 I2bNQL5Qj683EkRaAlyd9dVnbMq4B/UoplXVoefY4H2fDI4owuJOeU+kC0ptXDvB1p
 /C87W/uA/eFBeQU5D6t6ZW2es3Od7kj5q/+elPGr8H7xHbai2wP2ZCwmMBGyLCMr9I
 +8RgHRFnxsxmwsl5HTZjzNqG1G2OtzgT4uaGgHNlBUNOfd0AqNcPa9iwmkUn1tTNZH
 ijXsUVpMec7PA==
Date: Mon, 13 Dec 2021 18:18:50 +0000
From: Will Deacon <will@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 3/4] iommu/arm-smmu: Support Tegra234 SMMU
Message-ID: <20211213181849.GA12405@willie-the-truck>
References: <20211209163600.609613-1-thierry.reding@gmail.com>
 <20211209163600.609613-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211209163600.609613-3-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
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

On Thu, Dec 09, 2021 at 05:35:59PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Allow the NVIDIA-specific ARM SMMU implementation to bind to the SMMU
> instances found on Tegra234.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> index 2c25cce38060..658f3cc83278 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
> @@ -211,7 +211,8 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
>  	if (of_property_read_bool(np, "calxeda,smmu-secure-config-access"))
>  		smmu->impl = &calxeda_impl;
>  
> -	if (of_device_is_compatible(np, "nvidia,tegra194-smmu") ||
> +	if (of_device_is_compatible(np, "nvidia,tegra234-smmu") ||
> +	    of_device_is_compatible(np, "nvidia,tegra194-smmu") ||
>  	    of_device_is_compatible(np, "nvidia,tegra186-smmu"))
>  		return nvidia_smmu_impl_init(smmu);

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
