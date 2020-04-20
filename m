Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 455871B1194
	for <lists.iommu@lfdr.de>; Mon, 20 Apr 2020 18:28:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0497481B89;
	Mon, 20 Apr 2020 16:28:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id anQ+FnKi06sK; Mon, 20 Apr 2020 16:28:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7E833816E6;
	Mon, 20 Apr 2020 16:28:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66C24C0177;
	Mon, 20 Apr 2020 16:28:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0189FC0177
 for <iommu@lists.linux-foundation.org>; Mon, 20 Apr 2020 16:28:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E6CAD214F6
 for <iommu@lists.linux-foundation.org>; Mon, 20 Apr 2020 16:28:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yAaj0XEOWLar for <iommu@lists.linux-foundation.org>;
 Mon, 20 Apr 2020 16:28:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by silver.osuosl.org (Postfix) with ESMTPS id BCFF42094E
 for <iommu@lists.linux-foundation.org>; Mon, 20 Apr 2020 16:28:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1587400109; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=QA9CZuPAM8s1GI09MkFEN/LL8wgIB+Q0f+qXwJ/VpWg=;
 b=QPKcJMgO1YuE5PFMZYEbPb1J78X4FJBDj4yhK2adUQq0H/WSMmi79PqW8sXp8xzNkOYbBPL4
 NgJY3v04r2SaqQ3OfQvmtpaThxBRCR+g/cF7pZbALrQMi3Lipcq+8vZfGCJyJUulPXdAcq4l
 OAizwk7GyJv1kUkJ05urO+QRODQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9dcdac.7ff15c9e82d0-smtp-out-n02;
 Mon, 20 Apr 2020 16:28:28 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 85139C4478C; Mon, 20 Apr 2020 16:28:27 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3245DC433D2;
 Mon, 20 Apr 2020 16:28:26 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 20 Apr 2020 21:58:26 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCHv2 2/6] iommu/arm-smmu: Allow client devices to select
 direct mapping
In-Reply-To: <e35b10dc-8e58-f201-8485-9543dafbadfe@arm.com>
References: <cover.1587392905.git.saiprakash.ranjan@codeaurora.org>
 <14539e787e6d8b7bd0a6d8f8a001baae6f691988.1587392905.git.saiprakash.ranjan@codeaurora.org>
 <e35b10dc-8e58-f201-8485-9543dafbadfe@arm.com>
Message-ID: <65f21f15b90f73e16c0bb5bb75e835e6@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 Evan Green <evgreen@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, iommu@lists.linux-foundation.org,
 Sibi Sankar <sibis@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Will Deacon <will@kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 linux-kernel@vger.kernel.org
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

On 2020-04-20 21:27, Robin Murphy wrote:
> On 2020-04-20 3:37 pm, Sai Prakash Ranjan wrote:
>> From: Jordan Crouse <jcrouse@codeaurora.org>
>> 
>> Some client devices want to directly map the IOMMU themselves instead
>> of using the DMA domain. Allow those devices to opt in to direct
>> mapping by way of a list of compatible strings.
>> 
>> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
>> Co-developed-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>> ---
>>   drivers/iommu/arm-smmu-qcom.c | 19 +++++++++++++++++++
>>   drivers/iommu/arm-smmu.h      |  1 +
>>   2 files changed, 20 insertions(+)
>> 
>> diff --git a/drivers/iommu/arm-smmu-qcom.c 
>> b/drivers/iommu/arm-smmu-qcom.c
>> index 64a4ab270ab7..0b3f159065aa 100644
>> --- a/drivers/iommu/arm-smmu-qcom.c
>> +++ b/drivers/iommu/arm-smmu-qcom.c
>> @@ -3,6 +3,7 @@
>>    * Copyright (c) 2019, The Linux Foundation. All rights reserved.
>>    */
>>   +#include <linux/of_device.h>
>>   #include <linux/qcom_scm.h>
>>     #include "arm-smmu.h"
>> @@ -11,6 +12,23 @@ struct qcom_smmu {
>>   	struct arm_smmu_device smmu;
>>   };
>>   +static const struct of_device_id qcom_smmu_client_of_match[] = {
>> +	{ .compatible = "qcom,adreno" },
>> +	{ .compatible = "qcom,mdp4" },
>> +	{ .compatible = "qcom,mdss" },
>> +	{ .compatible = "qcom,sc7180-mdss" },
>> +	{ .compatible = "qcom,sdm845-mdss" },
>> +	{ }
>> +};
>> +
>> +static int qcom_smmu_request_domain(struct device *dev)
>> +{
>> +	const struct of_device_id *match =
>> +		of_match_device(qcom_smmu_client_of_match, dev);
>> +
>> +	return match ? IOMMU_DOMAIN_IDENTITY : 0;
>> +}
>> +
>>   static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
>>   {
>>   	int ret;
>> @@ -41,6 +59,7 @@ static int qcom_smmu500_reset(struct arm_smmu_device 
>> *smmu)
>>   }
>>     static const struct arm_smmu_impl qcom_smmu_impl = {
>> +	.req_domain = qcom_smmu_request_domain,
>>   	.reset = qcom_smmu500_reset,
>>   };
>>   diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
>> index 8d1cd54d82a6..662fdb4dccd2 100644
>> --- a/drivers/iommu/arm-smmu.h
>> +++ b/drivers/iommu/arm-smmu.h
>> @@ -386,6 +386,7 @@ struct arm_smmu_impl {
>>   	int (*init_context)(struct arm_smmu_domain *smmu_domain);
>>   	void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
>>   			 int status);
>> +	int (*req_domain)(struct device *dev);
> 
> Nit: since the point is to implement the full
> iommu_ops::def_domain_type interface, can we call it def_domain_type
> please?
> 

Sure, will send the next version shortly.

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
