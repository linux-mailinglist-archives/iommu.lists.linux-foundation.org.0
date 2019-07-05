Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4084460A41
	for <lists.iommu@lfdr.de>; Fri,  5 Jul 2019 18:29:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4B1ECEED;
	Fri,  5 Jul 2019 16:29:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 944E0CCE
	for <iommu@lists.linux-foundation.org>;
	Fri,  5 Jul 2019 16:29:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 1094887E
	for <iommu@lists.linux-foundation.org>;
	Fri,  5 Jul 2019 16:29:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 736042B;
	Fri,  5 Jul 2019 09:29:10 -0700 (PDT)
Received: from [10.1.38.41] (unknown [10.1.38.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D90FC3F246;
	Fri,  5 Jul 2019 09:29:07 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Subject: Re: [PATCH 6/8] iommu/arm-smmu-v3: Support auxiliary domains
To: Will Deacon <will@kernel.org>
References: <20190610184714.6786-1-jean-philippe.brucker@arm.com>
	<20190610184714.6786-7-jean-philippe.brucker@arm.com>
	<20190626175959.ubxvb2qn4taclact@willie-the-truck>
Message-ID: <7cad065e-5eba-bd22-5c1d-c55ad315ace0@arm.com>
Date: Fri, 5 Jul 2019 17:29:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190626175959.ubxvb2qn4taclact@willie-the-truck>
Content-Language: en-US
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Mark Rutland <Mark.Rutland@arm.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Will Deacon <Will.Deacon@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	Robin Murphy <Robin.Murphy@arm.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 26/06/2019 18:59, Will Deacon wrote:
>> +static void arm_smmu_aux_detach_dev(struct iommu_domain *domain, struct device *dev)
>> +{
>> +	struct iommu_domain *parent_domain;
>> +	struct arm_smmu_domain *parent_smmu_domain;
>> +	struct arm_smmu_master *master = dev_to_master(dev);
>> +	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
>> +
>> +	if (!arm_smmu_dev_feature_enabled(dev, IOMMU_DEV_FEAT_AUX))
>> +		return;
>> +
>> +	parent_domain = iommu_get_domain_for_dev(dev);
>> +	if (!parent_domain)
>> +		return;
>> +	parent_smmu_domain = to_smmu_domain(parent_domain);
>> +
>> +	mutex_lock(&smmu_domain->init_mutex);
>> +	if (!smmu_domain->aux_nr_devs)
>> +		goto out_unlock;
>> +
>> +	if (!--smmu_domain->aux_nr_devs) {
>> +		arm_smmu_write_ctx_desc(parent_smmu_domain, smmu_domain->ssid,
>> +					NULL);
>> +		/*
>> +		 * TLB doesn't need invalidation since accesses from the device
>> +		 * can't use this domain's ASID once the CD is clear.
>> +		 *
>> +		 * Sadly that doesn't apply to ATCs, which are PASID tagged.
>> +		 * Invalidate all other devices as well, because even though
>> +		 * they weren't 'officially' attached to the auxiliary domain,
>> +		 * they could have formed ATC entries.
>> +		 */
>> +		arm_smmu_atc_inv_domain(smmu_domain, 0, 0);
> 
> I've been struggling to understand the locking here, since both
> arm_smmu_write_ctx_desc and arm_smmu_atc_inv_domain take and release the
> devices_lock for the domain. Is there not a problem with devices coming and
> going in-between the two calls?

Yes it's a problem. I suppose we could take the parent's init_mutex
(making sure that it protects detach_dev() as well.

First I need to figure out how to prevent the parent domain from
disappearing when auxiliary domains are attached, I seem to have forgotten
that. I think checking if AUXD is enabled in the device passed to
attach_dev() should be sufficient - that's what I do for SVA. But the
IOMMU API isn't quite ready to handle failure in iommu_detach_device() at
the moment. VFIO will free the domain even if it's still attached.

> 
>> +	} else {
>> +		struct arm_smmu_cmdq_ent cmd;
>> +
>> +		/* Invalidate only this device's ATC */
>> +		if (master->ats_enabled) {
>> +			arm_smmu_atc_inv_to_cmd(smmu_domain->ssid, 0, 0, &cmd);
>> +			arm_smmu_atc_inv_master(master, &cmd);
>> +		}
>> +	}
>> +out_unlock:
>> +	mutex_unlock(&smmu_domain->init_mutex);
>> +}
>> +
>> +static int arm_smmu_aux_get_pasid(struct iommu_domain *domain, struct device *dev)
>> +{
>> +	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
>> +
>> +	return smmu_domain->ssid ?: -EINVAL;
>> +}
>> +
>>  static struct iommu_ops arm_smmu_ops = {
>>  	.capable		= arm_smmu_capable,
>>  	.domain_alloc		= arm_smmu_domain_alloc,
>> @@ -2539,6 +2772,13 @@ static struct iommu_ops arm_smmu_ops = {
>>  	.of_xlate		= arm_smmu_of_xlate,
>>  	.get_resv_regions	= arm_smmu_get_resv_regions,
>>  	.put_resv_regions	= arm_smmu_put_resv_regions,
>> +	.dev_has_feat		= arm_smmu_dev_has_feature,
>> +	.dev_feat_enabled	= arm_smmu_dev_feature_enabled,
>> +	.dev_enable_feat	= arm_smmu_dev_enable_feature,
>> +	.dev_disable_feat	= arm_smmu_dev_disable_feature,
> 
> Why can't we use the existing ->capable and ->dev_{get,set}_attr callbacks
> for this?

->capable isn't very useful because it applies to all SMMUs in the
system. The existing ->{get,set}_attr callbacks apply to an
iommu_domain. The main reason for doing it on endpoints was that it
would be tedious to keep track of capabilities when attaching and
detaching devices to a domain, especially for drivers that allow
multiple IOMMUs per domain [1]. There were more discussions, and in the
end Joerg proposed the current API for device attributes [2]

[1]
https://lore.kernel.org/lkml/aa1ff748-c2ec-acc0-f1d9-cdff2b131e58@linux.intel.com/
[2] https://lore.kernel.org/linux-iommu/20181207102926.GM16835@8bytes.org/

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
