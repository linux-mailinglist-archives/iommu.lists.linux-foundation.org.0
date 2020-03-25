Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DE11928E6
	for <lists.iommu@lfdr.de>; Wed, 25 Mar 2020 13:51:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EE9C386228;
	Wed, 25 Mar 2020 12:51:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id heZZTFHwrkvG; Wed, 25 Mar 2020 12:51:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 18001861C9;
	Wed, 25 Mar 2020 12:51:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EFC0DC0177;
	Wed, 25 Mar 2020 12:51:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6D69C0177
 for <iommu@lists.linux-foundation.org>; Wed, 25 Mar 2020 12:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CF298883AE
 for <iommu@lists.linux-foundation.org>; Wed, 25 Mar 2020 12:51:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NBiLGTjvx37E for <iommu@lists.linux-foundation.org>;
 Wed, 25 Mar 2020 12:51:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id DE8D8882E7
 for <iommu@lists.linux-foundation.org>; Wed, 25 Mar 2020 12:51:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 495FC31B;
 Wed, 25 Mar 2020 05:51:35 -0700 (PDT)
Received: from red-moon.cambridge.arm.com (unknown [10.57.20.165])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F43B3F71F;
 Wed, 25 Mar 2020 05:51:30 -0700 (PDT)
Date: Wed, 25 Mar 2020 12:51:18 +0000
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: laurentiu.tudor@nxp.com
Subject: Re: [RFC PATCH 1/4] bus: fsl-mc: add custom .dma_configure
 implementation
Message-ID: <20200325125109.GA5430@red-moon.cambridge.arm.com>
References: <20200227100542.13819-1-laurentiu.tudor@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200227100542.13819-1-laurentiu.tudor@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: jason@lakedaemon.net, calvin.johnson@nxp.com, ard.biesheuvel@linaro.org,
 maz@kernel.org, pankaj.bansal@nxp.com, diana.craciun@oss.nxp.com,
 jon@solid-run.com, linux-kernel@vger.kernel.org, jeremy.linton@arm.com,
 linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org,
 cristian.sovaiala@nxp.com, tglx@linutronix.de, makarand.pawagi@nxp.com,
 ioana.ciornei@nxp.com, Stuart.Yoder@arm.com, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, V.Sethi@nxp.com
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

On Thu, Feb 27, 2020 at 12:05:39PM +0200, laurentiu.tudor@nxp.com wrote:
> From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> 
> The devices on this bus are not discovered by way of device tree
> but by queries to the firmware. It makes little sense to trick the
> generic of layer into thinking that these devices are of related so
> that we can get our dma configuration. Instead of doing that, add
> our custom dma configuration implementation.
> 
> Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> ---
>  drivers/bus/fsl-mc/fsl-mc-bus.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
> index 36eb25f82c8e..eafaa0e0b906 100644
> --- a/drivers/bus/fsl-mc/fsl-mc-bus.c
> +++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
> @@ -132,11 +132,40 @@ static int fsl_mc_bus_uevent(struct device *dev, struct kobj_uevent_env *env)
>  static int fsl_mc_dma_configure(struct device *dev)
>  {
>  	struct device *dma_dev = dev;
> +	struct iommu_fwspec *fwspec;
> +	const struct iommu_ops *iommu_ops;
> +	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
> +	int ret;
> +	u32 icid;
>  
>  	while (dev_is_fsl_mc(dma_dev))
>  		dma_dev = dma_dev->parent;
>  
> -	return of_dma_configure(dev, dma_dev->of_node, 0);
> +	fwspec = dev_iommu_fwspec_get(dma_dev);
> +	if (!fwspec)
> +		return -ENODEV;
> +	iommu_ops = iommu_ops_from_fwnode(fwspec->iommu_fwnode);
> +	if (!iommu_ops)
> +		return -ENODEV;
> +
> +	ret = iommu_fwspec_init(dev, fwspec->iommu_fwnode, iommu_ops);
> +	if (ret)
> +		return ret;
> +
> +	icid = mc_dev->icid;
> +	ret = iommu_fwspec_add_ids(dev, &icid, 1);

I see. So with this patch we would use the MC named component only to
retrieve the iommu_ops - the streamid are injected directly here
bypassing OF/IORT bindings translations altogether. Am I reading this
code correctly ?

Thanks,
Lorenzo

> +	if (ret)
> +		return ret;
> +
> +	if (!device_iommu_mapped(dev)) {
> +		ret = iommu_probe_device(dev);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	arch_setup_dma_ops(dev, 0, *dma_dev->dma_mask + 1, iommu_ops, true);
> +
> +	return 0;
>  }
>  
>  static ssize_t modalias_show(struct device *dev, struct device_attribute *attr,
> -- 
> 2.17.1
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
