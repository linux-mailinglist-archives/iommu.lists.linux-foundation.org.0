Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D47942329AA
	for <lists.iommu@lfdr.de>; Thu, 30 Jul 2020 03:51:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3A69488453;
	Thu, 30 Jul 2020 01:51:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CMpqu-LUnQXe; Thu, 30 Jul 2020 01:51:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5CACA883F6;
	Thu, 30 Jul 2020 01:51:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4111DC004D;
	Thu, 30 Jul 2020 01:51:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B93CC004D
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jul 2020 01:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EE699233B9
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jul 2020 01:51:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pRBZ-ix4BpIq for <iommu@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 01:51:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by silver.osuosl.org (Postfix) with ESMTPS id 33BE822846
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jul 2020 01:51:49 +0000 (UTC)
IronPort-SDR: EMKLzl7b6r+9uEEIJ4ObfhhuoaNow1ECZL8lk/wbevh06sGcgRCnsF04Hh2aHtavofVunrSOTp
 92eUFjFxqtrw==
X-IronPort-AV: E=McAfee;i="6000,8403,9697"; a="169647157"
X-IronPort-AV: E=Sophos;i="5.75,412,1589266800"; d="scan'208";a="169647157"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2020 18:51:48 -0700
IronPort-SDR: mT16C5NyPsxn9MJXNYqMS14s5QIUvuwtRvX/76esEFS1SspGL7kzTyn8n88de3vL1Hj02sl5kJ
 ipd+68EVbFPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,412,1589266800"; d="scan'208";a="394831078"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139])
 ([10.239.159.139])
 by fmsmga001.fm.intel.com with ESMTP; 29 Jul 2020 18:51:45 -0700
Subject: Re: [PATCH v3 1/4] iommu: Check IOMMU_DEV_FEAT_AUX feature in aux
 api's
To: Alex Williamson <alex.williamson@redhat.com>
References: <20200714055703.5510-1-baolu.lu@linux.intel.com>
 <20200714055703.5510-2-baolu.lu@linux.intel.com>
 <20200729140343.2b7047b2@x1.home>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <64c11e95-125a-0654-5a3a-2a2739f96d3a@linux.intel.com>
Date: Thu, 30 Jul 2020 09:46:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200729140343.2b7047b2@x1.home>
Content-Language: en-US
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Kevin Tian <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, kvm@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
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

Hi Alex,

On 7/30/20 4:03 AM, Alex Williamson wrote:
> On Tue, 14 Jul 2020 13:57:00 +0800
> Lu Baolu <baolu.lu@linux.intel.com> wrote:
> 
>> The iommu aux-domain api's work only when IOMMU_DEV_FEAT_AUX is enabled
>> for the device. Add this check to avoid misuse.
> 
> Shouldn't this really be the IOMMU driver's responsibility to test?  If
> nothing else, iommu_dev_feature_enabled() needs to get the iommu_ops
> from dev->bus->iommu_ops, which is presumably the same iommu_ops we're
> then calling from domain->ops to attach/detach the device, so it'd be
> more efficient for the IOMMU driver to error on devices that don't
> support aux.  Thanks,

Fair enough. The vendor iommu driver always knows the status of aux-
domain support. So this check is duplicated. I will drop this patch.

Best regards,
baolu

> 
> Alex
> 
>> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
>> ---
>>   drivers/iommu/iommu.c | 16 +++++++++-------
>>   1 file changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>> index 1ed1e14a1f0c..e1fdd3531d65 100644
>> --- a/drivers/iommu/iommu.c
>> +++ b/drivers/iommu/iommu.c
>> @@ -2725,11 +2725,13 @@ EXPORT_SYMBOL_GPL(iommu_dev_feature_enabled);
>>    */
>>   int iommu_aux_attach_device(struct iommu_domain *domain, struct device *dev)
>>   {
>> -	int ret = -ENODEV;
>> +	int ret;
>>   
>> -	if (domain->ops->aux_attach_dev)
>> -		ret = domain->ops->aux_attach_dev(domain, dev);
>> +	if (!iommu_dev_feature_enabled(dev, IOMMU_DEV_FEAT_AUX) ||
>> +	    !domain->ops->aux_attach_dev)
>> +		return -ENODEV;
>>   
>> +	ret = domain->ops->aux_attach_dev(domain, dev);
>>   	if (!ret)
>>   		trace_attach_device_to_domain(dev);
>>   
>> @@ -2748,12 +2750,12 @@ EXPORT_SYMBOL_GPL(iommu_aux_detach_device);
>>   
>>   int iommu_aux_get_pasid(struct iommu_domain *domain, struct device *dev)
>>   {
>> -	int ret = -ENODEV;
>> +	if (!iommu_dev_feature_enabled(dev, IOMMU_DEV_FEAT_AUX) ||
>> +	    !domain->ops->aux_get_pasid)
>> +		return -ENODEV;
>>   
>> -	if (domain->ops->aux_get_pasid)
>> -		ret = domain->ops->aux_get_pasid(domain, dev);
>> +	return domain->ops->aux_get_pasid(domain, dev);
>>   
>> -	return ret;
>>   }
>>   EXPORT_SYMBOL_GPL(iommu_aux_get_pasid);
>>   
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
