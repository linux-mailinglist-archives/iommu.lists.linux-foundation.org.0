Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A81E13CB45
	for <lists.iommu@lfdr.de>; Wed, 15 Jan 2020 18:45:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 039FD20767;
	Wed, 15 Jan 2020 17:45:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1xMB3hGWuJR4; Wed, 15 Jan 2020 17:45:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B16CF2076B;
	Wed, 15 Jan 2020 17:45:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3C29C077D;
	Wed, 15 Jan 2020 17:45:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 677C5C077D
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jan 2020 17:45:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4A221865D6
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jan 2020 17:45:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wxr0anPll7Zd for <iommu@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 17:45:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7A0A38656A
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jan 2020 17:45:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBAAA328;
 Wed, 15 Jan 2020 09:45:00 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E8643F6C4;
 Wed, 15 Jan 2020 09:44:58 -0800 (PST)
Subject: Re: [PATCH v4 11/13] iommu/arm-smmu-v3: Improve add_device() error
 handling
To: Will Deacon <will@kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20191219163033.2608177-1-jean-philippe@linaro.org>
 <20191219163033.2608177-12-jean-philippe@linaro.org>
 <20200114152538.GB2579@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <5287c59f-0331-4d2e-e8a0-292bf27683fb@arm.com>
Date: Wed, 15 Jan 2020 17:44:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200114152538.GB2579@willie-the-truck>
Content-Language: en-GB
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 sudeep.holla@arm.com, rjw@rjwysocki.net, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org, robh+dt@kernel.org, guohanjun@huawei.com,
 bhelgaas@google.com, zhangfei.gao@linaro.org,
 linux-arm-kernel@lists.infradead.org, lenb@kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 14/01/2020 3:25 pm, Will Deacon wrote:
> On Thu, Dec 19, 2019 at 05:30:31PM +0100, Jean-Philippe Brucker wrote:
>> Let add_device() clean up after itself. The iommu_bus_init() function
>> does call remove_device() on error, but other sites (e.g. of_iommu) do
>> not.
>>
>> Don't free level-2 stream tables because we'd have to track if we
>> allocated each of them or if they are used by other endpoints. It's not
>> worth the hassle since they are managed resources.
>>
>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>> ---
>>   drivers/iommu/arm-smmu-v3.c | 28 +++++++++++++++++++++-------
>>   1 file changed, 21 insertions(+), 7 deletions(-)
> 
> I think this is alright, with one caveat relating to:
> 
> 
> 	/*
> 	 * We _can_ actually withstand dodgy bus code re-calling add_device()
> 	 * without an intervening remove_device()/of_xlate() sequence, but
> 	 * we're not going to do so quietly...
> 	 */
> 	if (WARN_ON_ONCE(fwspec->iommu_priv)) {
> 		master = fwspec->iommu_priv;
> 		smmu = master->smmu;
> 	} ...
> 
> 
> which may be on shakey ground if the subsequent add_device() call can fail
> and free stuff that the first one allocated. At least, I don't know what
> we're trying to support with this, so it's hard to tell whether or not it
> still works as intended after your change.

Hmm, if add_device() ever did fail it should really be expected to 
return the device back to an un-added state, so I don't believe that 
particular concern should be significant regardless...
> How is this supposed to work? I don't recall ever seeing that WARN fire,
> so can we just remove this and bail instead? Robin?

However, I am inclined to agree that it's probably better to make it all 
moot. Although it indeed should never happen, ISTR at the time there 
appeared to be some possible path somewhere by which the notifier may 
have been triggered a second time - possibly if some other device failed 
or deferred after the first call, triggering the bus code to start all 
over again. Since then, though, we've made a lot of changes to how 
->add_device usually gets called, plus stuff like the 
iommu_device_link() call has snuck in that might not stand up to a 
replay anyway, so I don't see any problem with making this condition a 
hard failure. It's certainly much easier to reason about.

In fact, there will already be a WARN from iommu_probe_device() now 
(because the first call will have set the group), so I don't think we 
need any additional diagnostic in the driver any more.

Robin.

> Something like below before your changes...
> 
> Will
> 
> --->8
> 
> diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
> index effe72eb89e7..6ae3df2f3495 100644
> --- a/drivers/iommu/arm-smmu-v3.c
> +++ b/drivers/iommu/arm-smmu-v3.c
> @@ -2534,28 +2534,23 @@ static int arm_smmu_add_device(struct device *dev)
>   
>   	if (!fwspec || fwspec->ops != &arm_smmu_ops)
>   		return -ENODEV;
> -	/*
> -	 * We _can_ actually withstand dodgy bus code re-calling add_device()
> -	 * without an intervening remove_device()/of_xlate() sequence, but
> -	 * we're not going to do so quietly...
> -	 */
> -	if (WARN_ON_ONCE(fwspec->iommu_priv)) {
> -		master = fwspec->iommu_priv;
> -		smmu = master->smmu;
> -	} else {
> -		smmu = arm_smmu_get_by_fwnode(fwspec->iommu_fwnode);
> -		if (!smmu)
> -			return -ENODEV;
> -		master = kzalloc(sizeof(*master), GFP_KERNEL);
> -		if (!master)
> -			return -ENOMEM;
>   
> -		master->dev = dev;
> -		master->smmu = smmu;
> -		master->sids = fwspec->ids;
> -		master->num_sids = fwspec->num_ids;
> -		fwspec->iommu_priv = master;
> -	}
> +	if (WARN_ON_ONCE(fwspec->iommu_priv))
> +		return -EBUSY;
> +
> +	smmu = arm_smmu_get_by_fwnode(fwspec->iommu_fwnode);
> +	if (!smmu)
> +		return -ENODEV;
> +
> +	master = kzalloc(sizeof(*master), GFP_KERNEL);
> +	if (!master)
> +		return -ENOMEM;
> +
> +	master->dev = dev;
> +	master->smmu = smmu;
> +	master->sids = fwspec->ids;
> +	master->num_sids = fwspec->num_ids;
> +	fwspec->iommu_priv = master;
>   
>   	/* Check the SIDs are in range of the SMMU and our stream table */
>   	for (i = 0; i < master->num_sids; i++) {
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
