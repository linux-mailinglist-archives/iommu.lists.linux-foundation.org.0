Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DABEB2C07F9
	for <lists.iommu@lfdr.de>; Mon, 23 Nov 2020 13:55:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8061E8666B;
	Mon, 23 Nov 2020 12:55:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ckzHyqcDj+yw; Mon, 23 Nov 2020 12:55:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AA09386456;
	Mon, 23 Nov 2020 12:55:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A364C0052;
	Mon, 23 Nov 2020 12:55:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65D52C0052
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 12:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5B4D9203DA
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 12:55:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ezsqn1SwxZmT for <iommu@lists.linux-foundation.org>;
 Mon, 23 Nov 2020 12:55:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by silver.osuosl.org (Postfix) with ESMTPS id 29ED52039C
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 12:55:24 +0000 (UTC)
IronPort-SDR: W4cJRETkfADCOymJ07pcpobwtAxWgtiNUbTfJL7lUy87GikvWhl8vhKq8j965ikEyTyFEtrxM1
 zIbTbKJIMuLg==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="235897989"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; d="scan'208";a="235897989"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 04:55:22 -0800
IronPort-SDR: 7SnQCMVGoTKSOBwRnjkKLjluEYFjAwA8X9qSYM3lfwaJNwL/Q8bL5KwYFnd+hEEM5UUypskIvD
 55eDHqj/VL2A==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; d="scan'208";a="546402202"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.210.240])
 ([10.254.210.240])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 04:55:20 -0800
Subject: Re: [PATCH v9 1/4] iommu: Move def_domain type check for untrusted
 device into core
To: Will Deacon <will@kernel.org>
References: <20201121135620.3496419-1-baolu.lu@linux.intel.com>
 <20201121135620.3496419-2-baolu.lu@linux.intel.com>
 <20201123120449.GB10233@willie-the-truck>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <5f6f0d5e-0cfc-2274-b186-180f50b8b1df@linux.intel.com>
Date: Mon, 23 Nov 2020 20:55:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201123120449.GB10233@willie-the-truck>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Will,

On 2020/11/23 20:04, Will Deacon wrote:
> On Sat, Nov 21, 2020 at 09:56:17PM +0800, Lu Baolu wrote:
>> So that the vendor iommu drivers are no more required to provide the
>> def_domain_type callback to always isolate the untrusted devices.
>>
>> Link: https://lore.kernel.org/linux-iommu/243ce89c33fe4b9da4c56ba35acebf81@huawei.com/
>> Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
>> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
>> ---
>>   drivers/iommu/intel/iommu.c |  7 -------
>>   drivers/iommu/iommu.c       | 21 ++++++++++++++-------
>>   2 files changed, 14 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
>> index af3abd285214..6711f78141a4 100644
>> --- a/drivers/iommu/intel/iommu.c
>> +++ b/drivers/iommu/intel/iommu.c
>> @@ -2916,13 +2916,6 @@ static int device_def_domain_type(struct device *dev)
>>   	if (dev_is_pci(dev)) {
>>   		struct pci_dev *pdev = to_pci_dev(dev);
>>   
>> -		/*
>> -		 * Prevent any device marked as untrusted from getting
>> -		 * placed into the statically identity mapping domain.
>> -		 */
>> -		if (pdev->untrusted)
>> -			return IOMMU_DOMAIN_DMA;
>> -
>>   		if ((iommu_identity_mapping & IDENTMAP_AZALIA) && IS_AZALIA(pdev))
>>   			return IOMMU_DOMAIN_IDENTITY;
>>   
>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>> index 88b0c9192d8c..3256784c0358 100644
>> --- a/drivers/iommu/iommu.c
>> +++ b/drivers/iommu/iommu.c
>> @@ -1457,13 +1457,23 @@ struct iommu_group *fsl_mc_device_group(struct device *dev)
>>   }
>>   EXPORT_SYMBOL_GPL(fsl_mc_device_group);
>>   
>> -static int iommu_get_def_domain_type(struct device *dev)
>> +/* Get the mandatary def_domain type for device. Otherwise, return 0. */
>> +static int iommu_get_mandatory_def_domain_type(struct device *dev)
>>   {
>>   	const struct iommu_ops *ops = dev->bus->iommu_ops;
>> -	unsigned int type = 0;
>> +
>> +	if (dev_is_pci(dev) && to_pci_dev(dev)->untrusted)
>> +		return IOMMU_DOMAIN_DMA;
>>   
>>   	if (ops->def_domain_type)
>> -		type = ops->def_domain_type(dev);
>> +		return ops->def_domain_type(dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static int iommu_get_def_domain_type(struct device *dev)
>> +{
>> +	int type = iommu_get_mandatory_def_domain_type(dev);
>>   
>>   	return (type == 0) ? iommu_def_domain_type : type;
>>   }
>> @@ -1645,13 +1655,10 @@ struct __group_domain_type {
>>   
>>   static int probe_get_default_domain_type(struct device *dev, void *data)
>>   {
>> -	const struct iommu_ops *ops = dev->bus->iommu_ops;
>>   	struct __group_domain_type *gtype = data;
>>   	unsigned int type = 0;
>>   
>> -	if (ops->def_domain_type)
>> -		type = ops->def_domain_type(dev);
>> -
>> +	type = iommu_get_mandatory_def_domain_type(dev);
> 
> afaict, this code is only called from probe_alloc_default_domain(), which
> has:
> 
>          /* Ask for default domain requirements of all devices in the group */
>          __iommu_group_for_each_dev(group, &gtype,
>                                     probe_get_default_domain_type);
> 
>          if (!gtype.type)
>                  gtype.type = iommu_def_domain_type;
> 
> so is there actually a need to introduce the new
> iommu_get_mandatory_def_domain_type() function, given that a type of 0
> always ends up resolving to the default domain type?

Another consumer of this helper is in the next patch:

+	dev_def_dom = iommu_get_mandatory_def_domain_type(dev);
+
+	/* Check if user requested domain is supported by the device or not */
+	if (!type) {
+		/*
+		 * If the user hasn't requested any specific type of domain and
+		 * if the device supports both the domains, then default to the
+		 * domain the device was booted with
+		 */
+		type = iommu_get_def_domain_type(dev);
+	} else if (dev_def_dom && type != dev_def_dom) {
+		dev_err_ratelimited(prev_dev, "Device cannot be in %s domain\n",
+				    iommu_domain_type_str(type));
+		ret = -EINVAL;
+		goto out;
+	}

I also added the untrusted device check in
iommu_get_mandatory_def_domain_type(), so that we don't need to care
about this in multiple places.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
