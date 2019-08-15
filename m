Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BF40B8EA20
	for <lists.iommu@lfdr.de>; Thu, 15 Aug 2019 13:22:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D11621050;
	Thu, 15 Aug 2019 11:22:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D2E00D3E
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 11:22:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 7F372711
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 11:22:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30F0428;
	Thu, 15 Aug 2019 04:22:32 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B00463F694;
	Thu, 15 Aug 2019 04:22:30 -0700 (PDT)
Subject: Re: [PATCH 05/15] iommu/arm-smmu: Split
	arm_smmu_tlb_inv_range_nosync()
To: Will Deacon <will@kernel.org>
References: <cover.1565369764.git.robin.murphy@arm.com>
	<33a49ca158509c95d50b0d3f9cba03bba2facdf3.1565369764.git.robin.murphy@arm.com>
	<20190815105602.hk53orjumysfezff@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <0f6362e2-38ac-0ad6-5da9-645f4695b6fd@arm.com>
Date: Thu, 15 Aug 2019 12:22:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190815105602.hk53orjumysfezff@willie-the-truck>
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
> On Fri, Aug 09, 2019 at 06:07:42PM +0100, Robin Murphy wrote:
>> Since we now use separate iommu_gather_ops for stage 1 and stage 2
>> contexts, we may as well divide up the monolithic callback into its
>> respective stage 1 and stage 2 parts.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/iommu/arm-smmu.c | 66 ++++++++++++++++++++++------------------
>>   1 file changed, 37 insertions(+), 29 deletions(-)
> 
> This will conflict with my iommu API batching stuff, but I can sort that
> out if/when it gets queued by Joerg.
> 
>> -		if (cfg->fmt != ARM_SMMU_CTX_FMT_AARCH64) {
>> -			iova &= ~12UL;
>> -			iova |= cfg->asid;
>> -			do {
>> -				writel_relaxed(iova, reg);
>> -				iova += granule;
>> -			} while (size -= granule);
>> -		} else {
>> -			iova >>= 12;
>> -			iova |= (u64)cfg->asid << 48;
>> -			do {
>> -				writeq_relaxed(iova, reg);
>> -				iova += granule >> 12;
>> -			} while (size -= granule);
>> -		}
>> -	} else {
>> -		reg += leaf ? ARM_SMMU_CB_S2_TLBIIPAS2L :
>> -			      ARM_SMMU_CB_S2_TLBIIPAS2;
>> -		iova >>= 12;
>> +	if (cfg->fmt != ARM_SMMU_CTX_FMT_AARCH64) {
>> +		iova &= ~12UL;
> 
> Oh baby. You should move code around more often, so I'm forced to take a
> second look!

Oh dear lord... The worst part is that I do now remember seeing this and 
having a similar moment of disbelief, but apparently I was easily 
distracted with rebasing and forgot about it too quickly :(

> Can you cook a fix for this that we can route separately, please? I see
> it also made its way into qcom_iommu.c...

Sure, I'll split it out to the front of the series for the moment.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
