Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8091A9680
	for <lists.iommu@lfdr.de>; Wed, 15 Apr 2020 10:30:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 03E9187E6E;
	Wed, 15 Apr 2020 08:30:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CJa9IdFWa9XP; Wed, 15 Apr 2020 08:30:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 73EDA87E4A;
	Wed, 15 Apr 2020 08:30:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C453C0172;
	Wed, 15 Apr 2020 08:30:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 640A6C0172
 for <iommu@lists.linux-foundation.org>; Wed, 15 Apr 2020 08:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2BF3620384
 for <iommu@lists.linux-foundation.org>; Wed, 15 Apr 2020 08:30:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W3aarbt8VAaw for <iommu@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 08:30:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by silver.osuosl.org (Postfix) with ESMTPS id 5D65720020
 for <iommu@lists.linux-foundation.org>; Wed, 15 Apr 2020 08:30:24 +0000 (UTC)
IronPort-SDR: Av1v7+vZde8Ci6PA3kWlg5UAhqkr/OHBthFf+/61RExM8AQrQZtgzoQgL9cUAWZ1h/7VarnlIx
 CDxkX4PX21RA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 01:30:23 -0700
IronPort-SDR: CjquGXrasSwTCvhBudoPJmdL6OaKLWC9jlj9FTOATiHLjGGp7TfNIZlkEqeVZdKjQzIGXaM+7G
 Hwp+t6iz4Tbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,386,1580803200"; d="scan'208";a="363612788"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.210.208])
 ([10.254.210.208])
 by fmsmga001.fm.intel.com with ESMTP; 15 Apr 2020 01:30:21 -0700
Subject: Re: [PATCH v2 2/7] iommu/vt-d: Multiple descriptors per
 qi_submit_sync()
To: "Tian, Kevin" <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>
References: <20200415052542.30421-1-baolu.lu@linux.intel.com>
 <20200415052542.30421-3-baolu.lu@linux.intel.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D82055A@SHSMSX104.ccr.corp.intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <85ee7356-dd36-e872-8196-ad44bbc1ad20@linux.intel.com>
Date: Wed, 15 Apr 2020 16:30:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D82055A@SHSMSX104.ccr.corp.intel.com>
Content-Language: en-US
Cc: "Raj, Ashok" <ashok.raj@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
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

On 2020/4/15 16:18, Tian, Kevin wrote:
>> From: Lu Baolu<baolu.lu@linux.intel.com>
>> Sent: Wednesday, April 15, 2020 1:26 PM
>>
>> Extend qi_submit_sync() function to support multiple descriptors.
>>
>> Signed-off-by: Jacob Pan<jacob.jun.pan@linux.intel.com>
>> Signed-off-by: Lu Baolu<baolu.lu@linux.intel.com>
>> ---
>>   drivers/iommu/dmar.c        | 39 +++++++++++++++++++++++--------------
>>   include/linux/intel-iommu.h |  1 +
>>   2 files changed, 25 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/iommu/dmar.c b/drivers/iommu/dmar.c
>> index bb42177e2369..61d049e91f84 100644
>> --- a/drivers/iommu/dmar.c
>> +++ b/drivers/iommu/dmar.c
>> @@ -1157,12 +1157,11 @@ static inline void reclaim_free_desc(struct
>> q_inval *qi)
>>   	}
>>   }
>>
>> -static int qi_check_fault(struct intel_iommu *iommu, int index)
>> +static int qi_check_fault(struct intel_iommu *iommu, int index, int
>> wait_index)
>>   {
>>   	u32 fault;
>>   	int head, tail;
>>   	struct q_inval *qi = iommu->qi;
>> -	int wait_index = (index + 1) % QI_LENGTH;
>>   	int shift = qi_shift(iommu);
>>
>>   	if (qi->desc_status[wait_index] == QI_ABORT)
>> @@ -1234,12 +1233,12 @@ static int qi_check_fault(struct intel_iommu
>> *iommu, int index)
>>   int qi_submit_sync(struct intel_iommu *iommu, struct qi_desc *desc,
>>   		   unsigned int count, unsigned long options)
>>   {
>> -	int rc;
>>   	struct q_inval *qi = iommu->qi;
>> -	int offset, shift, length;
>>   	struct qi_desc wait_desc;
>>   	int wait_index, index;
>>   	unsigned long flags;
>> +	int offset, shift;
>> +	int rc, i;
>>
>>   	if (!qi)
>>   		return 0;
>> @@ -1248,32 +1247,41 @@ int qi_submit_sync(struct intel_iommu *iommu,
>> struct qi_desc *desc,
>>   	rc = 0;
>>
>>   	raw_spin_lock_irqsave(&qi->q_lock, flags);
>> -	while (qi->free_cnt < 3) {
>> +	/*
>> +	 * Check if we have enough empty slots in the queue to submit,
>> +	 * the calculation is based on:
>> +	 * # of desc + 1 wait desc + 1 space between head and tail
>> +	 */
>> +	while (qi->free_cnt < count + 2) {
>>   		raw_spin_unlock_irqrestore(&qi->q_lock, flags);
>>   		cpu_relax();
>>   		raw_spin_lock_irqsave(&qi->q_lock, flags);
>>   	}
>>
>>   	index = qi->free_head;
>> -	wait_index = (index + 1) % QI_LENGTH;
>> +	wait_index = (index + count) % QI_LENGTH;
>>   	shift = qi_shift(iommu);
>> -	length = 1 << shift;
>>
>> -	qi->desc_status[index] = qi->desc_status[wait_index] = QI_IN_USE;
>> +	for (i = 0; i < count; i++) {
>> +		offset = ((index + i) % QI_LENGTH) << shift;
>> +		memcpy(qi->desc + offset, &desc[i], 1 << shift);
>> +		qi->desc_status[(index + i) % QI_LENGTH] = QI_IN_USE;
>> +	}
> what about doing one memcpy and leave the loop only for updating
> qi status?
> 

One memcpy might cross the table boundary.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
