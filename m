Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FBBE413B
	for <lists.iommu@lfdr.de>; Fri, 25 Oct 2019 03:45:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5EEFACAF;
	Fri, 25 Oct 2019 01:45:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9276FC8B
	for <iommu@lists.linux-foundation.org>;
	Fri, 25 Oct 2019 01:45:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2F40B87E
	for <iommu@lists.linux-foundation.org>;
	Fri, 25 Oct 2019 01:45:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Oct 2019 18:45:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,226,1569308400"; d="scan'208";a="197896429"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by fmsmga007.fm.intel.com with ESMTP; 24 Oct 2019 18:45:16 -0700
Subject: Re: [PATCH v6 01/10] iommu/vt-d: Enlightened PASID allocation
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
References: <1571788403-42095-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1571788403-42095-2-git-send-email-jacob.jun.pan@linux.intel.com>
	<20191023004503.GB100970@otc-nc-03>
	<f17d8df6-d77a-32b9-104c-1ae246c7a117@linux.intel.com>
	<20191023105523.75895d76@jacob-builder>
	<20191023141126.38bc1644@jacob-builder>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <d5f68e37-adba-0804-904b-660e8e812ece@linux.intel.com>
Date: Fri, 25 Oct 2019 09:42:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023141126.38bc1644@jacob-builder>
Content-Language: en-US
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
	Alex Williamson <alex.williamson@redhat.com>, "Raj,
	Ashok" <ashok.raj@intel.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.com>,
	LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
	David Woodhouse <dwmw2@infradead.org>, Jonathan Cameron <jic23@kernel.org>
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

Hi,

On 10/24/19 5:11 AM, Jacob Pan wrote:
> On Wed, 23 Oct 2019 10:55:23 -0700
> Jacob Pan <jacob.jun.pan@linux.intel.com> wrote:
> 
>>>> Do you have to check this everytime? every dmar_readq is going to
>>>> trap to the other side ...
>>>
>>> Yes. We don't need to check it every time. Check once and save the
>>> result during boot is enough.
>>>
>>> How about below incremental change?
>>>    
>> Below is good but I was thinking to include vccap in struct
>> intel_iommu{} where cap and ecaps reside. i.e.
>> diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
>> index 14b87ae2916a..e2cf25c9c956 100644
>> --- a/include/linux/intel-iommu.h
>> +++ b/include/linux/intel-iommu.h
>> @@ -528,6 +528,7 @@ struct intel_iommu {
>>          u64             reg_size; /* size of hw register set */
>>          u64             cap;
>>          u64             ecap;
>> +       u64             vccap;
>>
>> Also, we can use a static branch here.
>>
> On a second thought, we cannot use static(branch) here in that we
> cannot assume there is only one vIOMMU all the time. Have to cache the
> vccap per iommu.

intel_iommu is a per iommu structure, right? Or I missed anything?

> 
>>> diff --git a/drivers/iommu/intel-pasid.c
>>> b/drivers/iommu/intel-pasid.c index ff7e877b7a4d..c15d9d7e1e73
>>> 100644 --- a/drivers/iommu/intel-pasid.c
>>> +++ b/drivers/iommu/intel-pasid.c
>>> @@ -29,22 +29,29 @@ u32 intel_pasid_max_id = PASID_MAX;
>>>
> [Jacob Pan]
> 

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
