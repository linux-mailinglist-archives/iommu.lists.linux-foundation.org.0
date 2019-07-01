Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3516CFF08
	for <lists.iommu@lfdr.de>; Tue, 30 Apr 2019 19:42:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8837A1EF6;
	Tue, 30 Apr 2019 17:42:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 246C01EF0
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 17:41:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6AE0D5F4
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 17:41:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D9A223086238;
	Tue, 30 Apr 2019 17:41:39 +0000 (UTC)
Received: from [10.36.116.17] (ovpn-116-17.ams2.redhat.com [10.36.116.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 921696D0B4;
	Tue, 30 Apr 2019 17:41:34 +0000 (UTC)
Subject: Re: [PATCH v2 18/19] iommu/vt-d: Support flushing more translation
	cache types
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
References: <1556062279-64135-1-git-send-email-jacob.jun.pan@linux.intel.com>
	<1556062279-64135-19-git-send-email-jacob.jun.pan@linux.intel.com>
	<5ad35536-4993-13f1-5199-ddd99f7009e5@redhat.com>
	<20190429142921.1d36f560@jacob-builder>
	<4c54cbe9-b639-d560-4546-0ad84a622e89@redhat.com>
	<20190430101523.000e57a0@jacob-builder>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <4f92210c-81ba-58b1-6843-f70460885eba@redhat.com>
Date: Tue, 30 Apr 2019 19:41:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190430101523.000e57a0@jacob-builder>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Tue, 30 Apr 2019 17:41:40 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
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

Hi Jacob,

On 4/30/19 7:15 PM, Jacob Pan wrote:
> On Tue, 30 Apr 2019 06:41:13 +0200
> Auger Eric <eric.auger@redhat.com> wrote:
> 
>> Hi Jacob,
>>
>> On 4/29/19 11:29 PM, Jacob Pan wrote:
>>> On Sat, 27 Apr 2019 11:04:04 +0200
>>> Auger Eric <eric.auger@redhat.com> wrote:
>>>   
>>>> Hi Jacob,
>>>>
>>>> On 4/24/19 1:31 AM, Jacob Pan wrote:  
>>>>> When Shared Virtual Memory is exposed to a guest via vIOMMU,
>>>>> extended IOTLB invalidation may be passed down from outside IOMMU
>>>>> subsystems. This patch adds invalidation functions that can be
>>>>> used for additional translation cache types.
>>>>>
>>>>> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
>>>>> ---
>>>>>  drivers/iommu/dmar.c        | 48
>>>>> +++++++++++++++++++++++++++++++++++++++++++++
>>>>> include/linux/intel-iommu.h | 21 ++++++++++++++++---- 2 files
>>>>> changed, 65 insertions(+), 4 deletions(-)
>>>>>
>>>>> diff --git a/drivers/iommu/dmar.c b/drivers/iommu/dmar.c
>>>>> index 9c49300..680894e 100644
>>>>> --- a/drivers/iommu/dmar.c
>>>>> +++ b/drivers/iommu/dmar.c
>>>>> @@ -1357,6 +1357,20 @@ void qi_flush_iotlb(struct intel_iommu
>>>>> *iommu, u16 did, u64 addr, qi_submit_sync(&desc, iommu);
>>>>>  }
>>>>>      
>>>> /* PASID-based IOTLB Invalidate */  
>>>>> +void qi_flush_piotlb(struct intel_iommu *iommu, u16 did, u64
>>>>> addr, u32 pasid,
>>>>> +		unsigned int size_order, u64 granu)
>>>>> +{
>>>>> +	struct qi_desc desc;
>>>>> +
>>>>> +	desc.qw0 = QI_EIOTLB_PASID(pasid) | QI_EIOTLB_DID(did) |
>>>>> +		QI_EIOTLB_GRAN(granu) | QI_EIOTLB_TYPE;
>>>>> +	desc.qw1 = QI_EIOTLB_ADDR(addr) | QI_EIOTLB_IH(0) |
>>>>> +		QI_EIOTLB_AM(size_order);    
>>>> I see IH it hardcoded to 0. Don't you envision to cascade the IH.
>>>> On ARM this was needed for perf sake.  
>>> Right, we should cascade IH based on IOMMU_INV_ADDR_FLAGS_LEAF. Just
>>> curious how do you deduce the IH information on ARM? I guess you
>>> need to get the non-leaf page directory info?
>>> I will add an argument for IH.  
>> On ARM we have the "Leaf" field in the stage1 TLB invalidation
>> command. "When Leaf==1, only cached entries for the last level of
>> translation table walk are required to be invalidated".
>>
> Thanks for explaining, I guess I didn't ask the right question. I was
> wondering how SMMU driver determines when to set the Leaf bit. I guess
> it is this function? It is not apparent to me whether the sharing of
> non-leaf TLBs are considered.
> io_pgtable_tlb_add_flush(iop, iova, blk_size, blk_size, true);

the leaf value is passed as arg to
tlb_sync cb = arm_smmu_tlb_inv_range_nosync so the actual decision is
made in io-pgtable-arm.c, see io_pgtable_tlb_sync call sites.

Thanks

Eric
> 
>> Thanks
>>
>> Eric
>>  [...]  
>>>> /* Pasid-based Device-TLB Invalidation */  
>>  [...]  
>>>>> +void qi_flush_dev_piotlb(struct intel_iommu *iommu, u16 sid, u16
>>>>> pfsid,
>>>>> +		u32 pasid,  u16 qdep, u64 addr, unsigned size,
>>>>> u64 granu) +{
>>>>> +	struct qi_desc desc;
>>>>> +
>>>>> +	desc.qw0 = QI_DEV_EIOTLB_PASID(pasid) |
>>>>> QI_DEV_EIOTLB_SID(sid) |
>>>>> +		QI_DEV_EIOTLB_QDEP(qdep) | QI_DEIOTLB_TYPE |
>>>>> +		QI_DEV_IOTLB_PFSID(pfsid);
>>>>> +	desc.qw1 |= QI_DEV_EIOTLB_GLOB(granu);  
>>> should be desc.qw1 =  
>>>>> +
>>>>> +	/* If S bit is 0, we only flush a single page. If S bit
>>>>> is set,
>>>>> +	 * The least significant zero bit indicates the size.
>>>>> VT-d spec
>>>>> +	 * 6.5.2.6
>>>>> +	 */
>>>>> +	if (!size)
>>>>> +		desc.qw0 = QI_DEV_EIOTLB_ADDR(addr) &
>>>>> ~QI_DEV_EIOTLB_SIZE;    
>>>> desc.q1 |= ?  
>>> Right, I also missed previous qw1 assignment.  
>>>>> +	else {
>>>>> +		unsigned long mask = 1UL << (VTD_PAGE_SHIFT +
>>>>> size); +
>>>>> +		desc.qw1 = QI_DEV_EIOTLB_ADDR(addr & ~mask) |
>>>>> QI_DEV_EIOTLB_SIZE;    
>>>> desc.q1 |=  
>>> right, thanks  
>>>>> +	}
>>>>> +	qi_submit_sync(&desc, iommu);
>>>>> +}
>>>>> +    
>>>> /* PASID-cache invalidation */  
>>>>> +void qi_flush_pasid_cache(struct intel_iommu *iommu, u16 did, u64
>>>>> granu, int pasid) +{
>>>>> +	struct qi_desc desc;
>>>>> +
>>>>> +	desc.qw0 = QI_PC_TYPE | QI_PC_DID(did) |
>>>>> QI_PC_GRAN(granu) | QI_PC_PASID(pasid);
>>>>> +	desc.qw1 = 0;
>>>>> +	desc.qw2 = 0;
>>>>> +	desc.qw3 = 0;
>>>>> +	qi_submit_sync(&desc, iommu);
>>>>> +}
>>>>>  /*
>>>>>   * Disable Queued Invalidation interface.
>>>>>   */
>>>>> diff --git a/include/linux/intel-iommu.h
>>>>> b/include/linux/intel-iommu.h index 5d67d0d4..38e5efb 100644
>>>>> --- a/include/linux/intel-iommu.h
>>>>> +++ b/include/linux/intel-iommu.h
>>>>> @@ -339,7 +339,7 @@ enum {
>>>>>  #define QI_IOTLB_GRAN(gran) 	(((u64)gran) >>
>>>>> (DMA_TLB_FLUSH_GRANU_OFFSET-4)) #define QI_IOTLB_ADDR(addr)
>>>>> (((u64)addr) & VTD_PAGE_MASK) #define
>>>>> QI_IOTLB_IH(ih)		(((u64)ih) << 6) -#define
>>>>> QI_IOTLB_AM(am)		(((u8)am)) +#define
>>>>> QI_IOTLB_AM(am)		(((u8)am) & 0x3f) 
>>>>>  #define QI_CC_FM(fm)		(((u64)fm) << 48)
>>>>>  #define QI_CC_SID(sid)		(((u64)sid) << 32)
>>>>> @@ -357,17 +357,22 @@ enum {
>>>>>  #define QI_PC_DID(did)		(((u64)did) << 16)
>>>>>  #define QI_PC_GRAN(gran)	(((u64)gran) << 4)
>>>>>  
>>>>> -#define QI_PC_ALL_PASIDS	(QI_PC_TYPE | QI_PC_GRAN(0))
>>>>> -#define QI_PC_PASID_SEL		(QI_PC_TYPE |
>>>>> QI_PC_GRAN(1)) +/* PASID cache invalidation granu */
>>>>> +#define QI_PC_ALL_PASIDS	0
>>>>> +#define QI_PC_PASID_SEL		1
>>>>>  
>>>>>  #define QI_EIOTLB_ADDR(addr)	((u64)(addr) & VTD_PAGE_MASK)
>>>>>  #define QI_EIOTLB_GL(gl)	(((u64)gl) << 7)
>>>>>  #define QI_EIOTLB_IH(ih)	(((u64)ih) << 6)
>>>>> -#define QI_EIOTLB_AM(am)	(((u64)am))
>>>>> +#define QI_EIOTLB_AM(am)	(((u64)am) & 0x3f)
>>>>>  #define QI_EIOTLB_PASID(pasid) 	(((u64)pasid) << 32)
>>>>>  #define QI_EIOTLB_DID(did)	(((u64)did) << 16)
>>>>>  #define QI_EIOTLB_GRAN(gran) 	(((u64)gran) << 4)
>>>>>  
>>>>> +/* QI Dev-IOTLB inv granu */
>>>>> +#define QI_DEV_IOTLB_GRAN_ALL		1
>>>>> +#define QI_DEV_IOTLB_GRAN_PASID_SEL	0
>>>>> +
>>>>>  #define QI_DEV_EIOTLB_ADDR(a)	((u64)(a) & VTD_PAGE_MASK)
>>>>>  #define QI_DEV_EIOTLB_SIZE	(((u64)1) << 11)
>>>>>  #define QI_DEV_EIOTLB_GLOB(g)	((u64)g)
>>>>> @@ -658,8 +663,16 @@ extern void qi_flush_context(struct
>>>>> intel_iommu *iommu, u16 did, u16 sid, u8 fm, u64 type);
>>>>>  extern void qi_flush_iotlb(struct intel_iommu *iommu, u16 did,
>>>>> u64 addr, unsigned int size_order, u64 type);
>>>>> +extern void qi_flush_piotlb(struct intel_iommu *iommu, u16 did,
>>>>> u64 addr,
>>>>> +			u32 pasid, unsigned int size_order, u64
>>>>> type); extern void qi_flush_dev_iotlb(struct intel_iommu *iommu,
>>>>> u16 sid, u16 pfsid, u16 qdep, u64 addr, unsigned mask);
>>>>> +
>>>>> +extern void qi_flush_dev_piotlb(struct intel_iommu *iommu, u16
>>>>> sid, u16 pfsid,
>>>>> +			u32 pasid, u16 qdep, u64 addr, unsigned
>>>>> size, u64 granu); +
>>>>> +extern void qi_flush_pasid_cache(struct intel_iommu *iommu, u16
>>>>> did, u64 granu, int pasid); +
>>>>>  extern int qi_submit_sync(struct qi_desc *desc, struct
>>>>> intel_iommu *iommu); 
>>>>>  extern int dmar_ir_support(void);
>>>>>     
>>>>
>>>> Thanks
>>>>
>>>> Eric  
>>>
>>> [Jacob Pan]
>>>   
> 
> [Jacob Pan]
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
