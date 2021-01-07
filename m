Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D97E2ECA88
	for <lists.iommu@lfdr.de>; Thu,  7 Jan 2021 07:35:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1F39186A4C;
	Thu,  7 Jan 2021 06:35:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bOTQDeAVUv-8; Thu,  7 Jan 2021 06:35:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EAC3C86A3B;
	Thu,  7 Jan 2021 06:35:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA97EC1DA7;
	Thu,  7 Jan 2021 06:35:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C520CC013A
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jan 2021 06:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A9FAD847E5
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jan 2021 06:35:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EQE_BsnWgWBB for <iommu@lists.linux-foundation.org>;
 Thu,  7 Jan 2021 06:35:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from m43-15.mailgun.net (m43-15.mailgun.net [69.72.43.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 66FF486360
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jan 2021 06:35:18 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610001318; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=zaE4+TJQvH3SFoKXVDoAMLGGx6TuByIHlqy6fvPhicY=;
 b=KM4YBZMOfvQg9UScLojea8zW42tJsO6KddBotXlskG1pRYGleX3dmP4a4x42Bva1wCqGMM6/
 PdUw2SXarTgzWHwNz5nswHr8Ygoo23J7Pi40YclH/X803ZfvgFmyd6gqyZfHfQ1aIK/Lz3I4
 0i3HBeVa7uxgK5jLcnn3mr65xI4=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5ff6aba5b95fc5932673dcd6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 07 Jan 2021 06:35:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AD600C433ED; Thu,  7 Jan 2021 06:35:16 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CEEB5C433C6;
 Thu,  7 Jan 2021 06:35:15 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 07 Jan 2021 12:05:15 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Allow non-coherent masters to use
 system cache
In-Reply-To: <20210106115615.GA1763@willie-the-truck>
References: <20201224064007.2339-1-saiprakash.ranjan@codeaurora.org>
 <20210106115615.GA1763@willie-the-truck>
Message-ID: <ce8981988c84ccb015ea04fc439e8949@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@codeaurora.org>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

Hi Will,

On 2021-01-06 17:26, Will Deacon wrote:
> On Thu, Dec 24, 2020 at 12:10:07PM +0530, Sai Prakash Ranjan wrote:
>> commit ecd7274fb4cd ("iommu: Remove unused IOMMU_SYS_CACHE_ONLY flag")
>> removed unused IOMMU_SYS_CACHE_ONLY prot flag and along with it went
>> the memory type setting required for the non-coherent masters to use
>> system cache. Now that system cache support for GPU is added, we will
>> need to mark the memory as normal sys-cached for GPU to use system 
>> cache.
>> Without this, the system cache lines are not allocated for GPU. We use
>> the IO_PGTABLE_QUIRK_ARM_OUTER_WBWA quirk instead of a page protection
>> flag as the flag cannot be exposed via DMA api because of no in-tree
>> users.
>> 
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>  drivers/iommu/io-pgtable-arm.c | 3 +++
>>  1 file changed, 3 insertions(+)
>> 
>> diff --git a/drivers/iommu/io-pgtable-arm.c 
>> b/drivers/iommu/io-pgtable-arm.c
>> index 7c9ea9d7874a..3fb7de8304a2 100644
>> --- a/drivers/iommu/io-pgtable-arm.c
>> +++ b/drivers/iommu/io-pgtable-arm.c
>> @@ -415,6 +415,9 @@ static arm_lpae_iopte arm_lpae_prot_to_pte(struct 
>> arm_lpae_io_pgtable *data,
>>  		else if (prot & IOMMU_CACHE)
>>  			pte |= (ARM_LPAE_MAIR_ATTR_IDX_CACHE
>>  				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
>> +		else if (data->iop.cfg.quirks & IO_PGTABLE_QUIRK_ARM_OUTER_WBWA)
>> +			pte |= (ARM_LPAE_MAIR_ATTR_IDX_INC_OCACHE
>> +				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
>>  	}
> 
> drivers/iommu/io-pgtable.c currently documents this quirk as applying 
> only
> to the page-table walker. Given that we only have one user at the 
> moment,
> I think it's ok to change that, but please update the comment.
> 

Sure, how about this change in comment:

          * IO_PGTABLE_QUIRK_ARM_OUTER_WBWA: Override the 
outer-cacheability
-        *      attributes set in the TCR for a non-coherent page-table 
walker.
+        *      attributes set in the TCR for a non-coherent page-table 
walker
+        *      and also to set the correct cacheability attributes to 
use an
+        *      outer level of cache for non-coherent masters.

> We also need to decide on whether we want to allow the quirk to be 
> passed
> if the coherency of the page-table walker differs from the DMA device, 
> since
> we have these combinations:
> 
> 	Coherent walker?	IOMMU_CACHE	IO_PGTABLE_QUIRK_ARM_OUTER_WBWA
> 0:	N			0		0
> 1:	N			0		1
> 2:	N			1		0
> 3:	N			1		1
> 4:	Y			0		0
> 5:	Y			0		1
> 6:	Y			1		0
> 7:	Y			1		1
> 
> Some of them are obviously bogus, such as (7), but I don't know what to
> do about cases such as (3) and (5).
> 

I thought this was already decided when IOMMU_SYS_CACHE_ONLY prot flag 
was
added in this same location [1]. dma-coherent masters can use the normal
cached memory type to use the system cache and non dma-coherent masters
willing to use system cache should use normal sys-cached memory type 
with
this quirk.

[1] 
https://lore.kernel.org/linux-arm-msm/20190516093020.18028-1-vivek.gautam@codeaurora.org/

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
