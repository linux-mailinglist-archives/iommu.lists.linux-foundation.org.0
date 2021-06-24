Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id AF15B3B335A
	for <lists.iommu@lfdr.de>; Thu, 24 Jun 2021 18:00:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5029741608;
	Thu, 24 Jun 2021 16:00:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QSrrAMwRqBAq; Thu, 24 Jun 2021 16:00:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C5CBA41647;
	Thu, 24 Jun 2021 16:00:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A0FDEC001A;
	Thu, 24 Jun 2021 16:00:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 166FDC001A
 for <iommu@lists.linux-foundation.org>; Thu, 24 Jun 2021 16:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4595B83DDF
 for <iommu@lists.linux-foundation.org>; Thu, 24 Jun 2021 15:58:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X2rh38D10-pE for <iommu@lists.linux-foundation.org>;
 Thu, 24 Jun 2021 15:58:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28FE083DE2
 for <iommu@lists.linux-foundation.org>; Thu, 24 Jun 2021 15:58:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52299ED1;
 Thu, 24 Jun 2021 08:58:13 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C2A63F719;
 Thu, 24 Jun 2021 08:58:12 -0700 (PDT)
Date: Thu, 24 Jun 2021 16:57:53 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Add default domain quirk for Arm
 Fast Models
Message-ID: <20210624165753.7f47bdbc@slackpad.fritz.box>
In-Reply-To: <bf7020acf5ca7306a51d1950e3ff2afe2229e037.1624032324.git.robin.murphy@arm.com>
References: <bf7020acf5ca7306a51d1950e3ff2afe2229e037.1624032324.git.robin.murphy@arm.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Cc: will@kernel.org, iommu@lists.linux-foundation.org,
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

On Fri, 18 Jun 2021 17:24:49 +0100
Robin Murphy <robin.murphy@arm.com> wrote:

Hi Robin,

> Arm Fast Models are still implementing legacy virtio-pci devices behind
> the SMMU, which continue to be problematic as "real hardware" devices
> (from the point of view of the simulated system) without the mitigating
> VIRTIO_F_ACCESS_PLATFORM feature.
> 
> Since we now have the ability to force passthrough on a device-specific
> basis, let's use it to work around this particular oddity so that people
> who just want to boot Linux on a model don't have to fiddle around with
> things to avoid the SMMU getting in the way by default (and I don't have
> to keep telling them which things...)
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

So it looks somewhat quirky, but it indeed fixes the boot problems on
the RevC model for me.
And given that currently an out-of-the-box kernel build fails booting
(with the kernel DT), I'd like to see that merged.

Tested-by: Andre Przywara <andre.przywara@arm.com>

Thanks,
Andre

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 54b2f27b81d4..13cf16e8f45b 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2649,6 +2649,20 @@ static int arm_smmu_dev_disable_feature(struct device *dev,
>  	}
>  }
>  
> +static int arm_smmu_def_domain_type(struct device *dev)
> +{
> +	if (dev_is_pci(dev)) {
> +		struct pci_dev *pdev = to_pci_dev(dev);
> +
> +		/* Legacy virtio-block devices on Arm Fast Models */
> +		if (pdev->vendor == 0x1af4 && pdev->device == 0x1001 &&
> +		    pdev->subsystem_vendor == 0x00ff && pdev->subsystem_device == 0x0002)
> +			return IOMMU_DOMAIN_IDENTITY;
> +	}
> +
> +	return 0;
> +}
> +
>  static struct iommu_ops arm_smmu_ops = {
>  	.capable		= arm_smmu_capable,
>  	.domain_alloc		= arm_smmu_domain_alloc,
> @@ -2673,6 +2687,7 @@ static struct iommu_ops arm_smmu_ops = {
>  	.sva_bind		= arm_smmu_sva_bind,
>  	.sva_unbind		= arm_smmu_sva_unbind,
>  	.sva_get_pasid		= arm_smmu_sva_get_pasid,
> +	.def_domain_type	= arm_smmu_def_domain_type,
>  	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
>  	.owner			= THIS_MODULE,
>  };

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
