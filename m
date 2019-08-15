Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A028E9ED
	for <lists.iommu@lfdr.de>; Thu, 15 Aug 2019 13:14:20 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A0BCAEC9;
	Thu, 15 Aug 2019 11:14:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D5E2ED3E
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 11:14:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id EA567711
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 11:14:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F92428;
	Thu, 15 Aug 2019 04:14:16 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 451CD3F694;
	Thu, 15 Aug 2019 04:14:15 -0700 (PDT)
Subject: Re: [PATCH 04/15] iommu/arm-smmu: Rework cb_base handling
To: Will Deacon <will@kernel.org>
References: <cover.1565369764.git.robin.murphy@arm.com>
	<f4dccad78815ca0a2dd7926be7052759d099b920.1565369764.git.robin.murphy@arm.com>
	<20190814180556.5asp5qflrxxjipal@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <6acaf8b3-c425-99ed-a90d-11d2501e6305@arm.com>
Date: Thu, 15 Aug 2019 12:14:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190814180556.5asp5qflrxxjipal@willie-the-truck>
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

On 14/08/2019 19:05, Will Deacon wrote:
> On Fri, Aug 09, 2019 at 06:07:41PM +0100, Robin Murphy wrote:
>> To keep register-access quirks manageable, we want to structure things
>> to avoid needing too many individual overrides. It seems fairly clean to
>> have a single interface which handles both global and context registers
>> in terms of the architectural pages, so the first preparatory step is to
>> rework cb_base into a page number rather than an absolute address.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/iommu/arm-smmu.c | 22 ++++++++++++----------
>>   1 file changed, 12 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
>> index d9a93e5f422f..463bc8d98adb 100644
>> --- a/drivers/iommu/arm-smmu.c
>> +++ b/drivers/iommu/arm-smmu.c
>> @@ -95,7 +95,7 @@
>>   #endif
>>   
>>   /* Translation context bank */
>> -#define ARM_SMMU_CB(smmu, n)	((smmu)->cb_base + ((n) << (smmu)->pgshift))
>> +#define ARM_SMMU_CB(smmu, n)	((smmu)->base + (((smmu)->cb_base + (n)) << (smmu)->pgshift))
>>   
>>   #define MSI_IOVA_BASE			0x8000000
>>   #define MSI_IOVA_LENGTH			0x100000
>> @@ -168,8 +168,8 @@ struct arm_smmu_device {
>>   	struct device			*dev;
>>   
>>   	void __iomem			*base;
>> -	void __iomem			*cb_base;
>> -	unsigned long			pgshift;
>> +	unsigned int			cb_base;
> 
> I think this is now a misnomer. Would you be able to rename it cb_pfn or
> something, please?

Good point; in the architectural terms (section 8.1 of the spec), 
SMMU_CB_BASE is strictly a byte offset from SMMU_BASE, and the quantity 
we now have here is actually NUMPAGE. I've renamed it as such and 
tweaked the comments to be a bit more useful too.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
