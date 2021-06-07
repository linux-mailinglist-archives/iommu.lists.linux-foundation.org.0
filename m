Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4BA39D32F
	for <lists.iommu@lfdr.de>; Mon,  7 Jun 2021 04:55:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59A8E4033E;
	Mon,  7 Jun 2021 02:55:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TlxR_0P2wHIp; Mon,  7 Jun 2021 02:55:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 465B840342;
	Mon,  7 Jun 2021 02:55:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC229C001C;
	Mon,  7 Jun 2021 02:55:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05803C0001
 for <iommu@lists.linux-foundation.org>; Mon,  7 Jun 2021 02:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with UTF8SMTP id E583040341
 for <iommu@lists.linux-foundation.org>; Mon,  7 Jun 2021 02:55:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id rgKoH22qr-jI for <iommu@lists.linux-foundation.org>;
 Mon,  7 Jun 2021 02:55:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by smtp4.osuosl.org (Postfix) with UTF8SMTPS id 7C41C4033E
 for <iommu@lists.linux-foundation.org>; Mon,  7 Jun 2021 02:55:41 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623034544; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=KJV8f/5MUtIQ+OIjIwk4fwm9EsA/WiuotihBkKF1cpI=;
 b=M04B9g3xV0T1qSS5BczE4v8H96G90E4YH+rInYijgGoThDncb9hA5vqpusro5K9p4u6+O/gG
 tgTwUg0z0XPvb1IyNOM96Frxss9aHD4muXz4khSqpc7BMQbuEO4tRYPwS1GXiuAViobwPmOM
 +V1EtXUthrhQqe8z22mOI71h/U4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60bd8aa4f726fa4188e784eb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 07 Jun 2021 02:55:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B2A32C43217; Mon,  7 Jun 2021 02:55:31 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 19236C433D3;
 Mon,  7 Jun 2021 02:55:31 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 07 Jun 2021 08:25:30 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCHv3 0/2] iommu/arm-smmu-qcom: Add SC7280 support
In-Reply-To: <664abf04654d78b08b118d11c7c03d99@codeaurora.org>
References: <cover.1618898456.git.saiprakash.ranjan@codeaurora.org>
 <664abf04654d78b08b118d11c7c03d99@codeaurora.org>
Message-ID: <8eee199f10daa93407914f58bfefd6c1@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 saiprakash.ranjan=codeaurora.org@codeaurora.org,
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

Hi Will,

On 2021-05-24 08:13, Sai Prakash Ranjan wrote:
> Hi Will,
> 
> On 2021-04-20 11:34, Sai Prakash Ranjan wrote:
>> Patch 1 adds the sc7280 smmu compatible.
>> Patch 2 moves the adreno smmu check before apss smmu to enable
>> adreno smmu specific implementation.
>> 
>> Note that dt-binding for sc7280 is already merged.
>> 
>> Changes in v3:
>>  * Collect acks and reviews
>>  * Rebase on top of for-joerg/arm-smmu/updates
>> 
>> Changes in v2:
>>  * Add a comment to make sure this order is not changed in future 
>> (Jordan)
>> 
>> Sai Prakash Ranjan (2):
>>   iommu/arm-smmu-qcom: Add SC7280 SMMU compatible
>>   iommu/arm-smmu-qcom: Move the adreno smmu specific impl earlier
>> 
>>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 14 +++++++++++---
>>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> Gentle Ping!
> 

Is this going to be taken for 5.14 or needs one more release cycle?

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
