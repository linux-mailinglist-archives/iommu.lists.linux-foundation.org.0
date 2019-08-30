Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F5BA36F0
	for <lists.iommu@lfdr.de>; Fri, 30 Aug 2019 14:42:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B86F66068;
	Fri, 30 Aug 2019 12:42:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5E8EF496B
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 12:41:11 +0000 (UTC)
X-Greylist: delayed 00:33:03 by SQLgrey-1.7.6
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C9EE51FB
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 12:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5KAK3GGIAW+vTDP3zQ/cvvjRXZvCcS3poVmmyqNR8xw=;
	b=RjQWf++oCH1waNajLdDE9OfH8l
	mpzggLTChCK+Ya8xO9qqPX13bG/MxSHfGYwVa8iQ+lxCnNudaybCBZV0Od/LBc/euBGjxdHrmYAqb
	dNOxRIyLCG1Et2bvbd3ciN3bCoUxJQX0XJqa7mizJGZi92LibkdV+fOt3nXOCtr/NnhN6n5nZGxy6
	UD6iJA2Bgsn0wXDkwUPs2NDJPXsvirQhot+7mxmE8AqTr83mtojDeov3ZrWvHwTgGtf5OhF5IdL1O
	eXzfZ2zKfFDJvsRS26XJGW/HP3oAlriuGA369xiZQDZaDsCbNexNVTP9uuRJJh77IGXYaRscEPiMI
	qxb+WFOg==;
Received: from [193.209.96.43] (helo=[10.21.26.179])
	by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
	id 1i3fif-0005DG-2n; Fri, 30 Aug 2019 15:09:33 +0300
Subject: Re: [PATCH 6/7] arm64: tegra: Add DT node for T194 SMMU
To: Krishna Reddy <vdumpa@nvidia.com>
References: <1567118827-26358-1-git-send-email-vdumpa@nvidia.com>
	<1567118827-26358-7-git-send-email-vdumpa@nvidia.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <ba06d6b8-c6b9-f9bd-c2c1-d5e39292f67d@kapsi.fi>
Date: Fri, 30 Aug 2019 15:09:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567118827-26358-7-git-send-email-vdumpa@nvidia.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 193.209.96.43
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,UPPERCASE_50_75
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: snikam@nvidia.com, thomasz@nvidia.com, jtukkinen@nvidia.com,
	mperttunen@nvidia.com, praithatha@nvidia.com,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	talho@nvidia.com, yhsu@nvidia.com, linux-tegra@vger.kernel.org,
	treding@nvidia.com, avanbrunt@nvidia.com,
	linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 30.8.2019 1.47, Krishna Reddy wrote:
> Add DT node for T194 SMMU to enable SMMU support.
> 
> Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
> ---
>   arch/arm64/boot/dts/nvidia/tegra194.dtsi | 75 ++++++++++++++++++++++++++++++++
>   1 file changed, 75 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> index d906958..ad509bb 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> @@ -1401,6 +1401,81 @@
>   			  0x82000000 0x0  0x40000000 0x1f 0x40000000 0x0 0xc0000000>; /* non-prefetchable memory (3GB) */
>   	};
>   
> +	smmu: iommu@12000000 {
> +		compatible = "nvidia,smmu-v2";

Should we have a compatibility string like "nvidia,tegra194-smmu" so 
that we can have other chips with SMMUv2 that could be different?

Mikko

> +		reg = <0 0x12000000 0 0x800000>,
> +		      <0 0x11000000 0 0x800000>,
> +		      <0 0x10000000 0 0x800000>;
> +		interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
> +		stream-match-mask = <0x7f80>;
> +		#global-interrupts = <1>;
> +		#iommu-cells = <1>;
> +	};
> +
>   	sysram@40000000 {
>   		compatible = "nvidia,tegra194-sysram", "mmio-sram";
>   		reg = <0x0 0x40000000 0x0 0x50000>;
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
