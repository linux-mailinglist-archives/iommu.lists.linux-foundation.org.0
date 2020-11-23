Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 848F52C052E
	for <lists.iommu@lfdr.de>; Mon, 23 Nov 2020 13:04:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2F82F870D3;
	Mon, 23 Nov 2020 12:04:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M+3HMZfIzCdq; Mon, 23 Nov 2020 12:04:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9C88C86A14;
	Mon, 23 Nov 2020 12:04:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6EBC9C1DA2;
	Mon, 23 Nov 2020 12:04:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E41D1C0052
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 12:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C086786254
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 12:04:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iKPeiGwkVSIb for <iommu@lists.linux-foundation.org>;
 Mon, 23 Nov 2020 12:04:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 11E2C8622A
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 12:04:56 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BF5D02076E;
 Mon, 23 Nov 2020 12:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606133095;
 bh=MqVVFAs9pfO9YZNXnnUX8fujL137NJNg36Zjw2SJUyU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X1ToGmIBXyPsLMRMtOH42VDt50r5Tb0w+lXjLm5anz9/DMWckpzkBLKOqMLo9Loz/
 vaLhnnvpyW42QaW6Z5ArmoWo841eOz1g3mFQWvfS4CV4dDLadravE3w7c58hCwkSq9
 TEUC9lX86FEg8yjUf31x0ajqnoLtql+gFEwHeRp0=
Date: Mon, 23 Nov 2020 12:04:50 +0000
From: Will Deacon <will@kernel.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v9 1/4] iommu: Move def_domain type check for untrusted
 device into core
Message-ID: <20201123120449.GB10233@willie-the-truck>
References: <20201121135620.3496419-1-baolu.lu@linux.intel.com>
 <20201121135620.3496419-2-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201121135620.3496419-2-baolu.lu@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ashok Raj <ashok.raj@intel.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
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

On Sat, Nov 21, 2020 at 09:56:17PM +0800, Lu Baolu wrote:
> So that the vendor iommu drivers are no more required to provide the
> def_domain_type callback to always isolate the untrusted devices.
> 
> Link: https://lore.kernel.org/linux-iommu/243ce89c33fe4b9da4c56ba35acebf81@huawei.com/
> Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/iommu/intel/iommu.c |  7 -------
>  drivers/iommu/iommu.c       | 21 ++++++++++++++-------
>  2 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index af3abd285214..6711f78141a4 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -2916,13 +2916,6 @@ static int device_def_domain_type(struct device *dev)
>  	if (dev_is_pci(dev)) {
>  		struct pci_dev *pdev = to_pci_dev(dev);
>  
> -		/*
> -		 * Prevent any device marked as untrusted from getting
> -		 * placed into the statically identity mapping domain.
> -		 */
> -		if (pdev->untrusted)
> -			return IOMMU_DOMAIN_DMA;
> -
>  		if ((iommu_identity_mapping & IDENTMAP_AZALIA) && IS_AZALIA(pdev))
>  			return IOMMU_DOMAIN_IDENTITY;
>  
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 88b0c9192d8c..3256784c0358 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1457,13 +1457,23 @@ struct iommu_group *fsl_mc_device_group(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(fsl_mc_device_group);
>  
> -static int iommu_get_def_domain_type(struct device *dev)
> +/* Get the mandatary def_domain type for device. Otherwise, return 0. */
> +static int iommu_get_mandatory_def_domain_type(struct device *dev)
>  {
>  	const struct iommu_ops *ops = dev->bus->iommu_ops;
> -	unsigned int type = 0;
> +
> +	if (dev_is_pci(dev) && to_pci_dev(dev)->untrusted)
> +		return IOMMU_DOMAIN_DMA;
>  
>  	if (ops->def_domain_type)
> -		type = ops->def_domain_type(dev);
> +		return ops->def_domain_type(dev);
> +
> +	return 0;
> +}
> +
> +static int iommu_get_def_domain_type(struct device *dev)
> +{
> +	int type = iommu_get_mandatory_def_domain_type(dev);
>  
>  	return (type == 0) ? iommu_def_domain_type : type;
>  }
> @@ -1645,13 +1655,10 @@ struct __group_domain_type {
>  
>  static int probe_get_default_domain_type(struct device *dev, void *data)
>  {
> -	const struct iommu_ops *ops = dev->bus->iommu_ops;
>  	struct __group_domain_type *gtype = data;
>  	unsigned int type = 0;
>  
> -	if (ops->def_domain_type)
> -		type = ops->def_domain_type(dev);
> -
> +	type = iommu_get_mandatory_def_domain_type(dev);

afaict, this code is only called from probe_alloc_default_domain(), which
has:

        /* Ask for default domain requirements of all devices in the group */
        __iommu_group_for_each_dev(group, &gtype,
                                   probe_get_default_domain_type);

        if (!gtype.type)
                gtype.type = iommu_def_domain_type;

so is there actually a need to introduce the new
iommu_get_mandatory_def_domain_type() function, given that a type of 0
always ends up resolving to the default domain type?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
