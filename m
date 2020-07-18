Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F116224E0F
	for <lists.iommu@lfdr.de>; Sat, 18 Jul 2020 23:08:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2CE4085BCD;
	Sat, 18 Jul 2020 21:08:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ik-oqs5nxzR; Sat, 18 Jul 2020 21:08:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 753B985B25;
	Sat, 18 Jul 2020 21:08:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61686C0733;
	Sat, 18 Jul 2020 21:08:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5AAEBC0733
 for <iommu@lists.linux-foundation.org>; Sat, 18 Jul 2020 21:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 49BAD87F71
 for <iommu@lists.linux-foundation.org>; Sat, 18 Jul 2020 21:08:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9DYSIUh1mwGW for <iommu@lists.linux-foundation.org>;
 Sat, 18 Jul 2020 21:08:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E87BB87D09
 for <iommu@lists.linux-foundation.org>; Sat, 18 Jul 2020 21:08:52 +0000 (UTC)
X-Originating-IP: 91.175.115.186
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
 (Authenticated sender: gregory.clement@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 60014240005;
 Sat, 18 Jul 2020 21:08:48 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Tomasz Nowicki <tn@semihalf.com>, will@kernel.org, robin.murphy@arm.com,
 joro@8bytes.org, robh+dt@kernel.org, hannah@marvell.com
Subject: Re: [PATCH v4 4/4] arm64: dts: marvell: add SMMU support
In-Reply-To: <20200715070649.18733-5-tn@semihalf.com>
References: <20200715070649.18733-1-tn@semihalf.com>
 <20200715070649.18733-5-tn@semihalf.com>
Date: Sat, 18 Jul 2020 23:08:48 +0200
Message-ID: <87k0z0350f.fsf@FE-laptop>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, nadavh@marvell.com,
 iommu@lists.linux-foundation.org, mw@semihalf.com,
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

Tomasz Nowicki <tn@semihalf.com> writes:

> From: Marcin Wojtas <mw@semihalf.com>
>
> Add IOMMU node for Marvell AP806 based SoCs together with platform
> and PCI device Stream ID mapping.
>
> Signed-off-by: Marcin Wojtas <mw@semihalf.com>
> Signed-off-by: Tomasz Nowicki <tn@semihalf.com>

Applied on mvebu/dt64

Thanks,

Gregory
> ---
>  arch/arm64/boot/dts/marvell/armada-7040.dtsi  | 28 +++++++++++++
>  arch/arm64/boot/dts/marvell/armada-8040.dtsi  | 40 +++++++++++++++++++
>  arch/arm64/boot/dts/marvell/armada-ap80x.dtsi | 18 +++++++++
>  3 files changed, 86 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/marvell/armada-7040.dtsi b/arch/arm64/boot/dts/marvell/armada-7040.dtsi
> index 47247215770d..7a3198cd7a07 100644
> --- a/arch/arm64/boot/dts/marvell/armada-7040.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-7040.dtsi
> @@ -14,3 +14,31 @@
>  	compatible = "marvell,armada7040", "marvell,armada-ap806-quad",
>  		     "marvell,armada-ap806";
>  };
> +
> +&smmu {
> +	status = "okay";
> +};
> +
> +&cp0_pcie0 {
> +	iommu-map =
> +		<0x0   &smmu 0x480 0x20>,
> +		<0x100 &smmu 0x4a0 0x20>,
> +		<0x200 &smmu 0x4c0 0x20>;
> +	iommu-map-mask = <0x031f>;
> +};
> +
> +&cp0_sata0 {
> +	iommus = <&smmu 0x444>;
> +};
> +
> +&cp0_sdhci0 {
> +	iommus = <&smmu 0x445>;
> +};
> +
> +&cp0_usb3_0 {
> +	iommus = <&smmu 0x440>;
> +};
> +
> +&cp0_usb3_1 {
> +	iommus = <&smmu 0x441>;
> +};
> diff --git a/arch/arm64/boot/dts/marvell/armada-8040.dtsi b/arch/arm64/boot/dts/marvell/armada-8040.dtsi
> index 7699b19224c2..79e8ce59baa8 100644
> --- a/arch/arm64/boot/dts/marvell/armada-8040.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-8040.dtsi
> @@ -15,6 +15,18 @@
>  		     "marvell,armada-ap806";
>  };
>  
> +&smmu {
> +	status = "okay";
> +};
> +
> +&cp0_pcie0 {
> +	iommu-map =
> +		<0x0   &smmu 0x480 0x20>,
> +		<0x100 &smmu 0x4a0 0x20>,
> +		<0x200 &smmu 0x4c0 0x20>;
> +	iommu-map-mask = <0x031f>;
> +};
> +
>  /* The RTC requires external oscillator. But on Aramda 80x0, the RTC clock
>   * in CP master is not connected (by package) to the oscillator. So
>   * disable it. However, the RTC clock in CP slave is connected to the
> @@ -23,3 +35,31 @@
>  &cp0_rtc {
>  	status = "disabled";
>  };
> +
> +&cp0_sata0 {
> +	iommus = <&smmu 0x444>;
> +};
> +
> +&cp0_sdhci0 {
> +	iommus = <&smmu 0x445>;
> +};
> +
> +&cp0_usb3_0 {
> +	iommus = <&smmu 0x440>;
> +};
> +
> +&cp0_usb3_1 {
> +	iommus = <&smmu 0x441>;
> +};
> +
> +&cp1_sata0 {
> +	iommus = <&smmu 0x454>;
> +};
> +
> +&cp1_usb3_0 {
> +	iommus = <&smmu 0x450>;
> +};
> +
> +&cp1_usb3_1 {
> +	iommus = <&smmu 0x451>;
> +};
> diff --git a/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi b/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
> index 7f9b9a647717..12e477f1aeb9 100644
> --- a/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
> +++ b/arch/arm64/boot/dts/marvell/armada-ap80x.dtsi
> @@ -56,6 +56,24 @@
>  			compatible = "simple-bus";
>  			ranges = <0x0 0x0 0xf0000000 0x1000000>;
>  
> +			smmu: iommu@5000000 {
> +				compatible = "marvell,ap806-smmu-500", "arm,mmu-500";
> +				reg = <0x100000 0x100000>;
> +				dma-coherent;
> +				#iommu-cells = <1>;
> +				#global-interrupts = <1>;
> +				interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};
> +
>  			gic: interrupt-controller@210000 {
>  				compatible = "arm,gic-400";
>  				#interrupt-cells = <3>;
> -- 
> 2.17.1
>

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
