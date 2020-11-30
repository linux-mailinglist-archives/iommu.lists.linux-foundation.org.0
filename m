Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDED2C86E9
	for <lists.iommu@lfdr.de>; Mon, 30 Nov 2020 15:37:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 599E721519;
	Mon, 30 Nov 2020 14:37:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cag8plHo0i0I; Mon, 30 Nov 2020 14:37:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0C42C203F3;
	Mon, 30 Nov 2020 14:37:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF3FBC0052;
	Mon, 30 Nov 2020 14:37:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25E1CC0052
 for <iommu@lists.linux-foundation.org>; Mon, 30 Nov 2020 14:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 06C43860AE
 for <iommu@lists.linux-foundation.org>; Mon, 30 Nov 2020 14:37:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id slQODmxw7FuV for <iommu@lists.linux-foundation.org>;
 Mon, 30 Nov 2020 14:37:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8B92E86078
 for <iommu@lists.linux-foundation.org>; Mon, 30 Nov 2020 14:37:03 +0000 (UTC)
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
 (Authenticated sender: gregory.clement@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 55CA5240019;
 Mon, 30 Nov 2020 14:36:58 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Tomasz Nowicki <tn@semihalf.com>, will@kernel.org, robin.murphy@arm.com,
 joro@8bytes.org, robh+dt@kernel.org, hannah@marvell.com
Subject: Re: [PATCH 1/1] arm64: dts: marvell: keep SMMU disabled by default
 for Armada 7040 and 8040
In-Reply-To: <20201105112602.164739-1-tn@semihalf.com>
References: <20201105112602.164739-1-tn@semihalf.com>
Date: Mon, 30 Nov 2020 15:36:57 +0100
Message-ID: <87tut6j4hi.fsf@BL-laptop>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, catalin.marinas@arm.com,
 d.odintsov@traviangames.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, nadavh@marvell.com, iommu@lists.linux-foundation.org,
 mw@semihalf.com, linux-arm-kernel@lists.infradead.org
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

Hi,

> FW has to configure devices' StreamIDs so that SMMU is able to lookup
> context and do proper translation later on. For Armada 7040 & 8040 and
> publicly available FW, most of the devices are configured properly,
> but some like ap_sdhci0, PCIe, NIC still remain unassigned which
> results in SMMU faults about unmatched StreamID (assuming
> ARM_SMMU_DISABLE_BYPASS_BY_DEFAUL=y).
>
> Since there is dependency on custom FW let SMMU be disabled by default.
> People who still willing to use SMMU need to enable manually and
> use ARM_SMMU_DISABLE_BYPASS_BY_DEFAUL=n (or via kernel command line)
> with extra caution.
>
> Fixes: 83a3545d9c37 ("arm64: dts: marvell: add SMMU support")
> Cc: <stable@vger.kernel.org> # 5.9+
> Signed-off-by: Tomasz Nowicki <tn@semihalf.com>


Applied on mvebu/dt64

Thanks,

Gregory

> ---
>  arch/arm64/boot/dts/marvell/armada-7040.dtsi | 4 ----
>  arch/arm64/boot/dts/marvell/armada-8040.dtsi | 4 ----
>  2 files changed, 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-7040.dtsi b/arch/arm64/boot/dts/marvell/armada-7040.dtsi
> index 7a3198cd7a07..2f440711d21d 100644
> --- a/arch/arm64/boot/dts/marvell/armada-7040.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-7040.dtsi
> @@ -15,10 +15,6 @@ / {
>  		     "marvell,armada-ap806";
>  };
>  
> -&smmu {
> -	status = "okay";
> -};
> -
>  &cp0_pcie0 {
>  	iommu-map =
>  		<0x0   &smmu 0x480 0x20>,
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040.dtsi b/arch/arm64/boot/dts/marvell/armada-8040.dtsi
> index 79e8ce59baa8..22c2d6ebf381 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-8040.dtsi
> @@ -15,10 +15,6 @@ / {
>  		     "marvell,armada-ap806";
>  };
>  
> -&smmu {
> -	status = "okay";
> -};
> -
>  &cp0_pcie0 {
>  	iommu-map =
>  		<0x0   &smmu 0x480 0x20>,
> -- 
> 2.25.1
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
