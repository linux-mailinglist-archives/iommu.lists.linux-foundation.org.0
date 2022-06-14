Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id AF85454AAD4
	for <lists.iommu@lfdr.de>; Tue, 14 Jun 2022 09:44:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C74BF8266A;
	Tue, 14 Jun 2022 07:44:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7XIzdlNefngQ; Tue, 14 Jun 2022 07:44:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CDE0C81A27;
	Tue, 14 Jun 2022 07:44:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C3B3C0081;
	Tue, 14 Jun 2022 07:44:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0FBEC002D
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jun 2022 07:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9C9A408F9
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jun 2022 07:44:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oufbu4AYijQO for <iommu@lists.linux-foundation.org>;
 Tue, 14 Jun 2022 07:44:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 390FC400BB
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jun 2022 07:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655192667; x=1686728667;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=WehaGt8hJaU+Ma/bzE5/Cn87XrAOis5/aygzc+ECE0w=;
 b=E60nWFNV9YWqs+TNntSKmrBCB1EJmDEx3jB8gCe1X+6UAanXXIF9kfmo
 kqN0lJdoHm4XNhS3nwop3ThrppD7yxqWtz8zlI0FwuLCps3eFfG0WfiRw
 Hicjkdrv/denGDt0ziNdG8DnkOg7skaxgpXLJ+UoaxFkA0eu9YXLWPsW8
 ABY4KZaT6mpgmpDZsPnxHCynM/SrXgw/gJYkj+w1W+rTi8X0yT3T1V8gF
 U/s/gb96zmi9d7Qj2DqkuzRNnZQSGSk6RHAPQ23lDDTLRNBjdzRrCdmEv
 HDig7f1LS3aCf3Q4n7bM5v4n3UVSthUaUj+1ySs3J7X75LVtW0JhAsEtE g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="303947508"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="303947508"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 00:44:26 -0700
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="910847959"
Received: from gren5-mobl1.ccr.corp.intel.com (HELO [10.255.29.39])
 ([10.255.29.39])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 00:44:23 -0700
Message-ID: <1e19074b-0f8d-b897-585c-582ff3e63367@linux.intel.com>
Date: Tue, 14 Jun 2022 15:44:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 10/12] iommu/vt-d: Fold __dmar_remove_one_dev_info()
 into its caller
Content-Language: en-US
To: "Tian, Kevin" <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 "Raj, Ashok" <ashok.raj@intel.com>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <20220614025137.1632762-1-baolu.lu@linux.intel.com>
 <20220614025137.1632762-11-baolu.lu@linux.intel.com>
 <BN9PR11MB527646793F6DFD18145A455D8CAA9@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <BN9PR11MB527646793F6DFD18145A455D8CAA9@BN9PR11MB5276.namprd11.prod.outlook.com>
Cc: Will Deacon <will@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Pan,
 Jacob jun" <jacob.jun.pan@intel.com>, Robin Murphy <robin.murphy@arm.com>
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

On 2022/6/14 15:07, Tian, Kevin wrote:
>> From: Lu Baolu<baolu.lu@linux.intel.com>
>> Sent: Tuesday, June 14, 2022 10:52 AM
>>
>> Fold __dmar_remove_one_dev_info() into dmar_remove_one_dev_info()
>> which
>> is its only caller. Make the spin lock critical range only cover the
>> device list change code and remove some unnecessary checks.
>>
>> Signed-off-by: Lu Baolu<baolu.lu@linux.intel.com>
>> ---
>>   drivers/iommu/intel/iommu.c | 34 +++++++++-------------------------
>>   1 file changed, 9 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
>> index af22690f44c8..8345e0c0824c 100644
>> --- a/drivers/iommu/intel/iommu.c
>> +++ b/drivers/iommu/intel/iommu.c
>> @@ -295,7 +295,6 @@ static LIST_HEAD(dmar_satc_units);
>>   static int g_num_of_iommus;
>>
>>   static void dmar_remove_one_dev_info(struct device *dev);
>> -static void __dmar_remove_one_dev_info(struct device_domain_info *info);
>>
>>   int dmar_disabled = !IS_ENABLED(CONFIG_INTEL_IOMMU_DEFAULT_ON);
>>   int intel_iommu_sm =
>> IS_ENABLED(CONFIG_INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON);
>> @@ -4141,20 +4140,14 @@ static void domain_context_clear(struct
>> device_domain_info *info)
>>   			       &domain_context_clear_one_cb, info);
>>   }
>>
>> -static void __dmar_remove_one_dev_info(struct device_domain_info *info)
>> +static void dmar_remove_one_dev_info(struct device *dev)
>>   {
>> -	struct dmar_domain *domain;
>> -	struct intel_iommu *iommu;
>> -
>> -	assert_spin_locked(&device_domain_lock);
>> -
>> -	if (WARN_ON(!info))
>> -		return;
>> -
>> -	iommu = info->iommu;
>> -	domain = info->domain;
>> +	struct device_domain_info *info = dev_iommu_priv_get(dev);
>> +	struct dmar_domain *domain = info->domain;
> this local variable is not required as there is just one reference
> to info->domain.

Yes. It could be removed and use info->domain directly.

> 
> btw I didn't see info->domain is cleared in this path. Is it correct?
> 

It's better to clear here. I will make this change in my in-process
blocking domain series.

But it doesn't cause any real problems because the Intel IOMMU driver
supports default domain, hence the logic here is info->domain is
replaced, but not cleared.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
