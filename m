Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD3B8EA81
	for <lists.iommu@lfdr.de>; Thu, 15 Aug 2019 13:41:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4030B10A0;
	Thu, 15 Aug 2019 11:41:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8A9C31096
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 11:41:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id C0E2B67F
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 11:41:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2870E28;
	Thu, 15 Aug 2019 04:41:54 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5643F3F694;
	Thu, 15 Aug 2019 04:41:52 -0700 (PDT)
Subject: Re: [PATCH 08/15] iommu/arm-smmu: Abstract context bank accesses
To: Will Deacon <will@kernel.org>
References: <cover.1565369764.git.robin.murphy@arm.com>
	<1051d7568c96142ff90b004a2ec61e3b5dbe770e.1565369764.git.robin.murphy@arm.com>
	<20190815105611.fk7ouis2cs3uzvew@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <721e3f61-89f2-174a-da30-7aacc8c8865f@arm.com>
Date: Thu, 15 Aug 2019 12:41:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190815105611.fk7ouis2cs3uzvew@willie-the-truck>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: bjorn.andersson@linaro.org, iommu@lists.linux-foundation.org,
	gregory.clement@bootlin.com, linux-arm-kernel@lists.infradead.org
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

On 15/08/2019 11:56, Will Deacon wrote:
> On Fri, Aug 09, 2019 at 06:07:45PM +0100, Robin Murphy wrote:
>> Context bank accesses are fiddly enough to deserve a number of extra
>> helpers to keep the callsites looking sane, even though there are only
>> one or two of each.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/iommu/arm-smmu.c | 137 ++++++++++++++++++++-------------------
>>   1 file changed, 72 insertions(+), 65 deletions(-)
>>
>> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
>> index 72505647b77d..abdcc3f52e2e 100644
>> --- a/drivers/iommu/arm-smmu.c
>> +++ b/drivers/iommu/arm-smmu.c
>> @@ -82,9 +82,6 @@
>>   		((smmu->options & ARM_SMMU_OPT_SECURE_CFG_ACCESS)	\
>>   			? 0x400 : 0))
>>   
>> -/* Translation context bank */
>> -#define ARM_SMMU_CB(smmu, n)	((smmu)->base + (((smmu)->cb_base + (n)) << (smmu)->pgshift))
>> -
>>   #define MSI_IOVA_BASE			0x8000000
>>   #define MSI_IOVA_LENGTH			0x100000
>>   
>> @@ -265,9 +262,29 @@ static void arm_smmu_writel(struct arm_smmu_device *smmu, int page, int offset,
>>   	writel_relaxed(val, arm_smmu_page(smmu, page) + offset);
>>   }
>>   
>> +static u64 arm_smmu_readq(struct arm_smmu_device *smmu, int page, int offset)
>> +{
>> +	return readq_relaxed(arm_smmu_page(smmu, page) + offset);
>> +}
>> +
>> +static void arm_smmu_writeq(struct arm_smmu_device *smmu, int page, int offset,
>> +			    u64 val)
>> +{
>> +	writeq_relaxed(val, arm_smmu_page(smmu, page) + offset);
>> +}
>> +
>>   #define arm_smmu_read_gr1(s, r)		arm_smmu_readl((s), 1, (r))
>>   #define arm_smmu_write_gr1(s, r, v)	arm_smmu_writel((s), 1, (r), (v))
>>   
>> +#define arm_smmu_read_cb(s, n, r)				\
>> +	arm_smmu_readl((s), (s)->cb_base + (n), (r))
>> +#define arm_smmu_write_cb(s, n, r, v)				\
>> +	arm_smmu_writel((s), (s)->cb_base + (n), (r), (v))
>> +#define arm_smmu_read_cb_q(s, n, r)				\
>> +	arm_smmu_readq((s), (s)->cb_base + (n), (r))
>> +#define arm_smmu_write_cb_q(s, n, r, v)				\
>> +	arm_smmu_writeq((s), (s)->cb_base + (n), (r), (v))
> 
> 'r' for 'offset'? (maybe just rename offset => register in the helpers).

I think this all represents the mangled remains of an underlying notion 
of 'register offset' ;)

>>   struct arm_smmu_option_prop {
>>   	u32 opt;
>>   	const char *prop;
>> @@ -423,15 +440,17 @@ static void __arm_smmu_free_bitmap(unsigned long *map, int idx)
>>   }
>>   
>>   /* Wait for any pending TLB invalidations to complete */
>> -static void __arm_smmu_tlb_sync(struct arm_smmu_device *smmu,
>> -				void __iomem *sync, void __iomem *status)
>> +static void __arm_smmu_tlb_sync(struct arm_smmu_device *smmu, int page,
>> +				int sync, int status)
>>   {
>>   	unsigned int spin_cnt, delay;
>> +	u32 reg;
>>   
>> -	writel_relaxed(QCOM_DUMMY_VAL, sync);
>> +	arm_smmu_writel(smmu, page, sync, QCOM_DUMMY_VAL);
>>   	for (delay = 1; delay < TLB_LOOP_TIMEOUT; delay *= 2) {
>>   		for (spin_cnt = TLB_SPIN_COUNT; spin_cnt > 0; spin_cnt--) {
>> -			if (!(readl_relaxed(status) & sTLBGSTATUS_GSACTIVE))
>> +			reg = arm_smmu_readl(smmu, page, status);
>> +			if (!(reg & sTLBGSTATUS_GSACTIVE))
>>   				return;
>>   			cpu_relax();
>>   		}
>> @@ -443,12 +462,11 @@ static void __arm_smmu_tlb_sync(struct arm_smmu_device *smmu,
>>   
>>   static void arm_smmu_tlb_sync_global(struct arm_smmu_device *smmu)
>>   {
>> -	void __iomem *base = ARM_SMMU_GR0(smmu);
>>   	unsigned long flags;
>>   
>>   	spin_lock_irqsave(&smmu->global_sync_lock, flags);
>> -	__arm_smmu_tlb_sync(smmu, base + ARM_SMMU_GR0_sTLBGSYNC,
>> -			    base + ARM_SMMU_GR0_sTLBGSTATUS);
>> +	__arm_smmu_tlb_sync(smmu, 0, ARM_SMMU_GR0_sTLBGSYNC,
> 
> Can we have a #define for page zero, please?

Again, now I recall pondering the exact same thought, so clearly I don't 
have any grounds to object. I guess it's worth reworking the previous 
ARM_SMMU_{GR0,GR1,CB()} macros into the page number scheme rather than 
just killing them off - let me give that a try.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
