Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE3B3E53E9
	for <lists.iommu@lfdr.de>; Tue, 10 Aug 2021 08:51:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B355B8343E;
	Tue, 10 Aug 2021 06:51:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id umXxvkwZAONB; Tue, 10 Aug 2021 06:51:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8B7C683252;
	Tue, 10 Aug 2021 06:51:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C297C001F;
	Tue, 10 Aug 2021 06:51:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5570FC000E
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 06:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with UTF8SMTP id 400324011C
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 06:51:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id 0ougcibUT3N6 for <iommu@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 06:51:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by smtp2.osuosl.org (Postfix) with UTF8SMTPS id D493840012
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 06:51:21 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1628578284; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=8oRIj7t0naG4PykQRt1+vreUOu6CouCHfSgpFKLfPUw=;
 b=HkT+UAt/MkEPIy1T1kMnTswsnzFTv7wjeAOrEfyYSXljYKA2gDWY/Z9XUf47oOalj613uyAe
 85YPq6iHCulr5U8AScaZRxzdExgCCGCM3FEK+ZI0FS6apVwKLJ7Pk8XM8NOmv6EW7wPpKr/n
 tK4pPz4sJpT+tZ01atbcMAgVUwE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 611221dab14e7e2ecb50a1a9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Aug 2021 06:51:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 614F0C4323A; Tue, 10 Aug 2021 06:51:06 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 02DB3C433D3;
 Tue, 10 Aug 2021 06:51:00 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 10 Aug 2021 12:21:00 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH] iommu/arm-smmu: Add clk_bulk_{prepare/unprepare} to
 system pm callbacks
In-Reply-To: <5aefcc8950ec8ced0a67815c92e985df@codeaurora.org>
References: <20210727093322.13202-1-saiprakash.ranjan@codeaurora.org>
 <20210802161206.GA29168@willie-the-truck>
 <5aefcc8950ec8ced0a67815c92e985df@codeaurora.org>
Message-ID: <8fd84f2580ea0e67c9143ee97e54dbaa@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: Taniya Das <tdas@codeaurora.org>, robdclark@chromium.org,
 Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, srimuc <srimuc@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org
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

On 2021-08-03 11:36, Sai Prakash Ranjan wrote:
> On 2021-08-02 21:42, Will Deacon wrote:
>> On Tue, Jul 27, 2021 at 03:03:22PM +0530, Sai Prakash Ranjan wrote:
>>> Some clocks for SMMU can have parent as XO such as 
>>> gpu_cc_hub_cx_int_clk
>>> of GPU SMMU in QTI SC7280 SoC and in order to enter deep sleep states 
>>> in
>>> such cases, we would need to drop the XO clock vote in unprepare call 
>>> and
>>> this unprepare callback for XO is in RPMh (Resource Power 
>>> Manager-Hardened)
>>> clock driver which controls RPMh managed clock resources for new QTI 
>>> SoCs
>>> and is a blocking call.
>>> 
>>> Given we cannot have a sleeping calls such as clk_bulk_prepare() and
>>> clk_bulk_unprepare() in arm-smmu runtime pm callbacks since the iommu
>>> operations like map and unmap can be in atomic context and are in 
>>> fast
>>> path, add this prepare and unprepare call to drop the XO vote only 
>>> for
>>> system pm callbacks since it is not a fast path and we expect the 
>>> system
>>> to enter deep sleep states with system pm as opposed to runtime pm.
>>> 
>>> This is a similar sequence of clock requests (prepare,enable and
>>> disable,unprepare) in arm-smmu probe and remove.
>>> 
>>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>> Co-developed-by: Rajendra Nayak <rnayak@codeaurora.org>
>>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>>> ---
>>>  drivers/iommu/arm/arm-smmu/arm-smmu.c | 20 ++++++++++++++++++--
>>>  1 file changed, 18 insertions(+), 2 deletions(-)
>> 
>> [+Rob]
>> 
>> How does this work with that funny GPU which writes to the SMMU 
>> registers
>> directly? Does the SMMU need to remain independently clocked for that 
>> to
>> work or is it all in the same clock domain?
>> 
> 
> As Rob mentioned, device link should take care of all the dependencies 
> between
> SMMU and its consumers. But not sure how the question relates to this
> patch as this
> change is for system pm and not runtime pm, so it is exactly the 
> sequence of
> SMMU probe/remove which if works currently for that GPU SMMU, then it
> should work
> just fine for system suspend and resume as well.
> 
>>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c 
>>> b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> index d3c6f54110a5..9561ba4c5d39 100644
>>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>>> @@ -2277,6 +2277,13 @@ static int __maybe_unused 
>>> arm_smmu_runtime_suspend(struct device *dev)
>>> 
>>>  static int __maybe_unused arm_smmu_pm_resume(struct device *dev)
>>>  {
>>> +	int ret;
>>> +	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>>> +
>>> +	ret = clk_bulk_prepare(smmu->num_clks, smmu->clks);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>>  	if (pm_runtime_suspended(dev))
>>>  		return 0;
>> 
>> If we subsequently fail to enable the clks in 
>> arm_smmu_runtime_resume()
>> should we unprepare them again?
>> 
> 
> If we are unable to turn on the clks then its fatal and we will not
> live for long.
> 

Nonetheless, it won't hurt to unprepare if clk enable fails as that is
the correct thing anyway, so I have added it and sent a v2.

Thanks,
Sai

> 
>> Will
>> 
>>> @@ -2285,10 +2292,19 @@ static int __maybe_unused 
>>> arm_smmu_pm_resume(struct device *dev)
>>> 
>>>  static int __maybe_unused arm_smmu_pm_suspend(struct device *dev)
>>>  {
>>> +	int ret = 0;
>>> +	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>>> +
>>>  	if (pm_runtime_suspended(dev))
>>> -		return 0;
>>> +		goto clk_unprepare;
>>> 
>>> -	return arm_smmu_runtime_suspend(dev);
>>> +	ret = arm_smmu_runtime_suspend(dev);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +clk_unprepare:
>>> +	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
>>> +	return ret;
>>>  }
>>> 
>>>  static const struct dev_pm_ops arm_smmu_pm_ops = {
>>> --
>>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>>> member
>>> of Code Aurora Forum, hosted by The Linux Foundation
>>> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
