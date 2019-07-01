Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 98869EEBD
	for <lists.iommu@lfdr.de>; Tue, 30 Apr 2019 04:18:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A77B4DA5;
	Tue, 30 Apr 2019 02:18:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4048ED7C
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 02:18:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D610C87A
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 02:18:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Apr 2019 19:18:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,412,1549958400"; d="scan'208";a="295651240"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by orsmga004.jf.intel.com with ESMTP; 29 Apr 2019 19:18:00 -0700
Subject: Re: [PATCH v3 5/8] iommu/vt-d: Implement def_domain_type iommu ops
	entry
To: Christoph Hellwig <hch@infradead.org>
References: <20190429020925.18136-1-baolu.lu@linux.intel.com>
	<20190429020925.18136-6-baolu.lu@linux.intel.com>
	<20190429200338.GA8412@infradead.org>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <9c1d1e16-fdab-0494-8720-97ff20013da4@linux.intel.com>
Date: Tue, 30 Apr 2019 10:11:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429200338.GA8412@infradead.org>
Content-Language: en-US
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, ashok.raj@intel.com, dima@arista.com,
	tmurphy@arista.com, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com,
	David Woodhouse <dwmw2@infradead.org>
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

Hi Christoph,

On 4/30/19 4:03 AM, Christoph Hellwig wrote:
>> @@ -3631,35 +3607,30 @@ static int iommu_no_mapping(struct device *dev)
>>   	if (iommu_dummy(dev))
>>   		return 1;
>>   
>> -	if (!iommu_identity_mapping)
>> -		return 0;
>> -
> 
> FYI, iommu_no_mapping has been refactored in for-next:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git/commit/?h=x86/vt-d&id=48b2c937ea37a3bece0094b46450ed5267525289

Oh, yes! Thanks for letting me know this. Will rebase the code.

> 
>>   	found = identity_mapping(dev);
>>   	if (found) {
>> +		/*
>> +		 * If the device's dma_mask is less than the system's memory
>> +		 * size then this is not a candidate for identity mapping.
>> +		 */
>> +		u64 dma_mask = *dev->dma_mask;
>> +
>> +		if (dev->coherent_dma_mask &&
>> +		    dev->coherent_dma_mask < dma_mask)
>> +			dma_mask = dev->coherent_dma_mask;
>> +
>> +		if (dma_mask < dma_get_required_mask(dev)) {
> 
> I know this is mostly existing code moved around, but it really needs
> some fixing.  For one dma_get_required_mask is supposed to return the
> required to not bounce mask for the given device.  E.g. for a device
> behind an iommu it should always just return 32-bit.  If you really
> want to check vs system memory please call dma_direct_get_required_mask
> without the dma_ops indirection.
> 
> Second I don't even think we need to check the coherent_dma_mask,
> dma_direct is pretty good at always finding memory even without
> an iommu.
> 
> Third this doesn't take take the bus_dma_mask into account.
> 
> This probably should just be:
> 
> 		if (min(*dev->dma_mask, dev->bus_dma_mask) <
> 		    dma_direct_get_required_mask(dev)) {

Agreed and will add this in the next version.

Best regards,
Lu Baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
