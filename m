Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 846D53C397
	for <lists.iommu@lfdr.de>; Tue, 11 Jun 2019 07:50:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 825F9C59;
	Tue, 11 Jun 2019 05:50:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7B4B5C4E
	for <iommu@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 05:50:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5F959711
	for <iommu@lists.linux-foundation.org>;
	Tue, 11 Jun 2019 05:50:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Jun 2019 22:50:51 -0700
X-ExtLoop1: 1
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by orsmga004.jf.intel.com with ESMTP; 10 Jun 2019 22:50:49 -0700
Subject: Re: [PATCH 5/6] iommu/vt-d: Cleanup after delegating DMA domain to
	generic iommu
To: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>,
	"Mehta, Sohil" <sohil.mehta@intel.com>,
	"joro@8bytes.org" <joro@8bytes.org>, 
	"dwmw2@infradead.org" <dwmw2@infradead.org>
References: <20190609023803.23832-1-baolu.lu@linux.intel.com>
	<20190609023803.23832-6-baolu.lu@linux.intel.com>
	<1560192412.27481.12.camel@intel.com>
	<dbd8a4dcc9de6e7b3232c6c90597939a794860b9.camel@intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <e7e4af38-97ab-9f15-4072-654f704c9f31@linux.intel.com>
Date: Tue, 11 Jun 2019 13:43:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <dbd8a4dcc9de6e7b3232c6c90597939a794860b9.camel@intel.com>
Content-Language: en-US
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"cai@lca.pw" <cai@lca.pw>, "Pan, Jacob jun" <jacob.jun.pan@intel.com>
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

On 6/11/19 3:25 AM, Sai Praneeth Prakhya wrote:
> On Mon, 2019-06-10 at 11:45 -0700, Mehta, Sohil wrote:
>> On Sun, 2019-06-09 at 10:38 +0800, Lu Baolu wrote:
>>>   static int __init si_domain_init(int hw)
>>> @@ -3306,14 +3252,13 @@ static int __init init_dmars(void)
>>>                  if (pasid_supported(iommu))
>>>                          intel_svm_init(iommu);
>>>   #endif
>>> -       }
>>>   
>>> -       /*
>>> -        * Now that qi is enabled on all iommus, set the root entry
>>> and flush
>>> -        * caches. This is required on some Intel X58 chipsets,
>>> otherwise the
>>> -        * flush_context function will loop forever and the boot
>>> hangs.
>>> -        */
>>> -       for_each_active_iommu(iommu, drhd) {
>>> +               /*
>>> +                * Now that qi is enabled on all iommus, set the root
>>> entry and
>>> +                * flush caches. This is required on some Intel X58
>>> chipsets,
>>> +                * otherwise the flush_context function will loop
>>> forever and
>>> +                * the boot hangs.
>>> +                */
>>>                  iommu_flush_write_buffer(iommu);
>>>                  iommu_set_root_entry(iommu);
>>>                  iommu->flush.flush_context(iommu, 0, 0, 0,
>>> DMA_CCMD_GLOBAL_INVL);
>>
>> This changes the intent of the original code. As the comment says
>> enable QI on all IOMMUs, then flush the caches and set the root entry.
>> The order of setting the root entries has changed now.
>>
>> Refer:
>> Commit a4c34ff1c029 ('iommu/vt-d: Enable QI on all IOMMUs before
>> setting root entry')
> 
> Thanks Sohil! for catching the bug.
> Will send a V2 to Lu Baolu fixing this.

Okay, I will submit a v2 of this series later.

> 
> Regards,
> Sai

Best regards,
Baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
