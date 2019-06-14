Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE2B4586D
	for <lists.iommu@lfdr.de>; Fri, 14 Jun 2019 11:18:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5F6E0107E;
	Fri, 14 Jun 2019 09:18:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 800B9105A
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 09:18:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D7CA6174
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 09:18:13 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 93CC960A24; Fri, 14 Jun 2019 09:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1560503893;
	bh=taSQc6f1m1AC8F98FAk930Z3ywbNtZl5ILcL7UVyjhs=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=pEQ1c09f6zfhNlwI5YmRf74pwGbSf2YMZ7/9Fthqo29HbW69Gu61EC8qZL0q+Xwzr
	U6Pg05xUkqXQpSmhC4YZuY1fe4v8aVfVV+rkTGnFSeeQQrQO1WA6WDWGyXJpZuiaWH
	zfHaAIsgWz6AQ49bKkG6AWMR4ikCpTDSM9G0+lEg=
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
Received: from [10.79.128.120]
	(blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com
	[103.229.18.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: vivek.gautam@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 357616077A;
	Fri, 14 Jun 2019 09:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1560503892;
	bh=taSQc6f1m1AC8F98FAk930Z3ywbNtZl5ILcL7UVyjhs=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=AoX5xdq17xYg0YcWjvvqziLsWUom6VVdEsYv3KTljOZhSx7q4ZBGQt3getF0EyuA/
	oesoLl2U2AdUzviGmzbx71xIXozouLobRVSD+TpjCLHn8lqe7A+2PhFUZjhbxk75o7
	dk39cd1qBml2CcPSGZjy/NlL4HnJPhqbXHTMGzLU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 357616077A
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Subject: Re: [PATCH v3 3/4] iommu/arm-smmu: Add support to handle Qcom's
	wait-for-safe logic
To: Bjorn Andersson <bjorn.andersson@linaro.org>, will.deacon@arm.com,
	robin.murphy@arm.com
References: <20190612071554.13573-1-vivek.gautam@codeaurora.org>
	<20190612071554.13573-4-vivek.gautam@codeaurora.org>
	<20190614040520.GK22737@tuxbook-pro>
From: Vivek Gautam <vivek.gautam@codeaurora.org>
Message-ID: <3e1f5e03-6448-8730-056d-fc47bdd71b3f@codeaurora.org>
Date: Fri, 14 Jun 2019 14:48:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190614040520.GK22737@tuxbook-pro>
Content-Language: en-US
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, robh+dt@kernel.org,
	david.brown@linaro.org, iommu@lists.linux-foundation.org, agross@kernel.org
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



On 6/14/2019 9:35 AM, Bjorn Andersson wrote:
> On Wed 12 Jun 00:15 PDT 2019, Vivek Gautam wrote:
>
>> Qcom's implementation of arm,mmu-500 adds a WAIT-FOR-SAFE logic
>> to address under-performance issues in real-time clients, such as
>> Display, and Camera.
>> On receiving an invalidation requests, the SMMU forwards SAFE request
>> to these clients and waits for SAFE ack signal from real-time clients.
>> The SAFE signal from such clients is used to qualify the start of
>> invalidation.
>> This logic is controlled by chicken bits, one for each - MDP (display),
>> IFE0, and IFE1 (camera), that can be accessed only from secure software
>> on sdm845.
>>
>> This configuration, however, degrades the performance of non-real time
>> clients, such as USB, and UFS etc. This happens because, with wait-for-safe
>> logic enabled the hardware tries to throttle non-real time clients while
>> waiting for SAFE ack signals from real-time clients.
>>
>> On MTP sdm845 devices, with wait-for-safe logic enabled at the boot time
>> by the bootloaders we see degraded performance of USB and UFS when kernel
>> enables the smmu stage-1 translations for these clients.
>> Turn off this wait-for-safe logic from the kernel gets us back the perf
>> of USB and UFS devices until we re-visit this when we start seeing perf
>> issues on display/camera on upstream supported SDM845 platforms.
>>
>> Now, different bootloaders with their access control policies allow this
>> register access differently through secure monitor calls -
>> 1) With one we can issue io-read/write secure monitor call (qcom-scm)
>>     to update the register, while,
>> 2) With other, such as one on MTP sdm845 we should use the specific
>>     qcom-scm command to send request to do the complete register
>>     configuration.
>> Adding a separate device tree flag for arm-smmu to identify which
>> firmware configuration of the two mentioned above we use.
>> Not adding code change to allow type-(1) bootloaders to toggle the
>> safe using io-read/write qcom-scm call.
>>
>> This change is inspired by the downstream change from Patrick Daly
>> to address performance issues with display and camera by handling
>> this wait-for-safe within separte io-pagetable ops to do TLB
>> maintenance. So a big thanks to him for the change.
>>
>> Without this change the UFS reads are pretty slow:
>> $ time dd if=/dev/sda of=/dev/zero bs=1048576 count=10 conv=sync
>> 10+0 records in
>> 10+0 records out
>> 10485760 bytes (10.0MB) copied, 22.394903 seconds, 457.2KB/s
>> real    0m 22.39s
>> user    0m 0.00s
>> sys     0m 0.01s
>>
>> With this change they are back to rock!
>> $ time dd if=/dev/sda of=/dev/zero bs=1048576 count=300 conv=sync
>> 300+0 records in
>> 300+0 records out
>> 314572800 bytes (300.0MB) copied, 1.030541 seconds, 291.1MB/s
>> real    0m 1.03s
>> user    0m 0.00s
>> sys     0m 0.54s
>>
>> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
>> ---
>>   drivers/iommu/arm-smmu.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
>> index 0ad086da399c..3c3ad43eda97 100644
>> --- a/drivers/iommu/arm-smmu.c
>> +++ b/drivers/iommu/arm-smmu.c
>> @@ -39,6 +39,7 @@
>>   #include <linux/pci.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/pm_runtime.h>
>> +#include <linux/qcom_scm.h>
>>   #include <linux/slab.h>
>>   #include <linux/spinlock.h>
>>   
>> @@ -177,6 +178,7 @@ struct arm_smmu_device {
>>   	u32				features;
>>   
>>   #define ARM_SMMU_OPT_SECURE_CFG_ACCESS (1 << 0)
>> +#define ARM_SMMU_OPT_QCOM_FW_IMPL_SAFE_ERRATA (1 << 1)
>>   	u32				options;
>>   	enum arm_smmu_arch_version	version;
>>   	enum arm_smmu_implementation	model;
>> @@ -262,6 +264,7 @@ static bool using_legacy_binding, using_generic_binding;
>>   
>>   static struct arm_smmu_option_prop arm_smmu_options[] = {
>>   	{ ARM_SMMU_OPT_SECURE_CFG_ACCESS, "calxeda,smmu-secure-config-access" },
>> +	{ ARM_SMMU_OPT_QCOM_FW_IMPL_SAFE_ERRATA, "qcom,smmu-500-fw-impl-safe-errata" },
> This should be added to the DT binding as well.

Ah right. I missed that. Will add this and respin unless Robin and Will 
have concerns with this change.

>
>>   	{ 0, NULL},
>>   };
>>   
>> @@ -2292,6 +2295,19 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>   	arm_smmu_device_reset(smmu);
>>   	arm_smmu_test_smr_masks(smmu);
>>   
>> +	/*
>> +	 * To address performance degradation in non-real time clients,
>> +	 * such as USB and UFS, turn off wait-for-safe on sdm845 platforms,
>> +	 * such as MTP, whose firmwares implement corresponding secure monitor
>> +	 * call handlers.
>> +	 */
>> +	if (of_device_is_compatible(smmu->dev->of_node, "qcom,sdm845-smmu-500") &&
>> +	    smmu->options & ARM_SMMU_OPT_QCOM_FW_IMPL_SAFE_ERRATA) {
>> +		err = qcom_scm_qsmmu500_wait_safe_toggle(0);
>> +		if (err)
>> +			dev_warn(dev, "Failed to turn off SAFE logic\n");
>> +	}
>> +
> This looks good, I presume at some point we can profile things and
> review if it's worth toggling this on the fly, but given that this is
> conditioned on smmu->options that should be an implementation detail..
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Thanks Bjorn.

Best regards
Vivek

> Regards,
> Bjorn
>
>>   	/*
>>   	 * We want to avoid touching dev->power.lock in fastpaths unless
>>   	 * it's really going to do something useful - pm_runtime_enabled()
>> -- 
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation
>>

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
