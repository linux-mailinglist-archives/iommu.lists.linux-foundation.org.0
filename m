Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B3E1C71F
	for <lists.iommu@lfdr.de>; Tue, 14 May 2019 12:41:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1161FDBE;
	Tue, 14 May 2019 10:41:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 25563DB2
	for <iommu@lists.linux-foundation.org>;
	Tue, 14 May 2019 10:41:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 97D5942D
	for <iommu@lists.linux-foundation.org>;
	Tue, 14 May 2019 10:41:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 372B4374;
	Tue, 14 May 2019 03:41:48 -0700 (PDT)
Received: from [10.1.196.129] (ostrya.cambridge.arm.com [10.1.196.129])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8AF0A3F703;
	Tue, 14 May 2019 03:41:46 -0700 (PDT)
Subject: Re: [PATCH v3 02/16] iommu: Introduce cache_invalidate API
To: Auger Eric <eric.auger@redhat.com>,
	Jacob Pan <jacob.jun.pan@linux.intel.com>
References: <1556922737-76313-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1556922737-76313-3-git-send-email-jacob.jun.pan@linux.intel.com>
	<d32d3d19-11c9-4af9-880b-bb8ebefd4f7f@redhat.com>
	<44d5ba37-a9e9-cc7a-2a3a-d32b840afa29@arm.com>
	<7807afe9-efab-9f48-4ca0-2332a7a54950@redhat.com>
	<1a5a5fad-ed21-5c79-9a9e-ff21fadfb95f@arm.com>
	<20190513151637.79c273e2@jacob-builder>
	<0da76e57-76f6-06fa-d34e-30cd0c294984@redhat.com>
From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
Message-ID: <f319bd4c-3092-84e1-233a-34832551249e@arm.com>
Date: Tue, 14 May 2019 11:41:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0da76e57-76f6-06fa-d34e-30cd0c294984@redhat.com>
Content-Language: en-US
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Andriy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 14/05/2019 08:36, Auger Eric wrote:
> Hi Jacob,
> 
> On 5/14/19 12:16 AM, Jacob Pan wrote:
>> On Mon, 13 May 2019 18:09:48 +0100
>> Jean-Philippe Brucker <jean-philippe.brucker@arm.com> wrote:
>>
>>> On 13/05/2019 17:50, Auger Eric wrote:
>>>>> struct iommu_inv_pasid_info {
>>>>> #define IOMMU_INV_PASID_FLAGS_PASID	(1 << 0)
>>>>> #define IOMMU_INV_PASID_FLAGS_ARCHID	(1 << 1)
>>>>> 	__u32	flags;
>>>>> 	__u32	archid;
>>>>> 	__u64	pasid;
>>>>> };  
>>>> I agree it does the job now. However it looks a bit strange to do a
>>>> PASID based invalidation in my case - SMMUv3 nested stage - where I
>>>> don't have any PASID involved.
>>>>
>>>> Couldn't we call it context based invalidation then? A context can
>>>> be tagged by a PASID or/and an ARCHID.  
>>>
>>> I think calling it "context" would be confusing as well (I shouldn't
>>> have used it earlier), since VT-d uses that name for device table
>>> entries (=STE on Arm SMMU). Maybe "addr_space"?
>>>
>> I am still struggling to understand what ARCHID is after scanning
>> through SMMUv3.1 spec. It seems to be a constant for a given SMMU. Why
>> do you need to pass it down every time? Could you point to me the
>> document or explain a little more on ARCHID use cases.
>> We have three fileds called pasid under this struct
>> iommu_cache_invalidate_info{}
>> Gets confusing :)
> archid is a generic term. That's why you did not find it in the spec ;-)
> 
> On ARM SMMU the archid is called the ASID (Address Space ID, up to 16
> bits. The ASID is stored in the Context Descriptor Entry (your PASID
> entry) and thus characterizes a given stage 1 translation
> "context"/"adress space".

Yes, another way to look at it is, for a given address space:
* PASID tags device-IOTLB (ATC) entries.
* ASID (here called archid) tags IOTLB entries.

They could have the same value, but it depends on the guest's allocation
policy which isn't in our control. With my PASID patches for SMMUv3,
they have different values. So we need both fields if we intend to
invalidate both ATC and IOTLB with a single call.

Thanks,
Jean

> 
> At the moment the ASID is allocated per iommu domain. With aux domains
> we should have one ASID per aux domain, Jean-Philippe said.
> 
> ASID tags IOTLB S1 entries. As the ASID is part of the "context
> descriptor" which is owned by the guest, the API must pass it somehow.
> 
> 4.4.1.2 CMD_TLBI_NH_ASID(VMID, ASID) invalidation command allows to
> invalidate all IOTLB S1 entries for a given VMID/ASID and this is the
> functionality which is currently missing in the API. This is not an
> address based invalidation or a "pure" PASID based invalidation. At the
> moment we don't support PASIDs on ARM and I need this capability.
> 
> Thanks
> 
> Eric
> 
> 
> 
>>> Thanks,
>>> Jean
>>>
>>>>
>>>> Domain invalidation would invalidate all the contexts belonging to
>>>> that domain.
>>>>
>>>> Thanks
>>>>
>>>> Eric  
>>
>> [Jacob Pan]
>>

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
