Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C021E0F1E
	for <lists.iommu@lfdr.de>; Mon, 25 May 2020 15:10:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5D766859C1;
	Mon, 25 May 2020 13:10:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lZQtA_PIwU9G; Mon, 25 May 2020 13:10:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 62F9085910;
	Mon, 25 May 2020 13:10:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3DB67C016F;
	Mon, 25 May 2020 13:10:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E16BC016F
 for <iommu@lists.linux-foundation.org>; Mon, 25 May 2020 13:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 75D968682C
 for <iommu@lists.linux-foundation.org>; Mon, 25 May 2020 13:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7q9S-DJwYN-I for <iommu@lists.linux-foundation.org>;
 Mon, 25 May 2020 13:10:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E4AEF8679A
 for <iommu@lists.linux-foundation.org>; Mon, 25 May 2020 13:10:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1590412237; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=aF4c3OruqF54AfZxTOJsQX65D8kLmu7DWi/fjq3WVJo=;
 b=BXYxZ61y1eW6cDsb3E4F9OvIAdPEhtvGD/y2rxvBTx0WriEY1x2tIhMH63LPgraC3Xu2/vPL
 nyNPupS9d8BN42eQptHI29LWXdQFpL27+OeTxAYXPwWMXFc5729rDnxyQ2kLXqUxG9rz/5wb
 qXJKRh7UWvT6WWlmzpqoRNT46m0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5ecbc3bc7522fe8b084250ec (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 25 May 2020 13:10:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1B63DC43387; Mon, 25 May 2020 13:10:20 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7D3D6C433C6;
 Mon, 25 May 2020 13:10:19 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 25 May 2020 18:40:19 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH] iommu: Fix group refcount in iommu_alloc_default_domain()
In-Reply-To: <20200525130253.GH5075@suse.de>
References: <20200522130145.30067-1-saiprakash.ranjan@codeaurora.org>
 <20200525130253.GH5075@suse.de>
Message-ID: <132bf1acfb685d34db9caef6f55265de@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Douglas Anderson <dianders@chromium.org>,
 iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
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

Hi Joerg,

On 2020-05-25 18:32, Joerg Roedel wrote:
> Hi,
> 
> On Fri, May 22, 2020 at 06:31:45PM +0530, Sai Prakash Ranjan wrote:
>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>> index a4c2f122eb8b..05f7b77c432f 100644
>> --- a/drivers/iommu/iommu.c
>> +++ b/drivers/iommu/iommu.c
>> @@ -1491,6 +1491,7 @@ static int iommu_alloc_default_domain(struct 
>> device *dev)
>>  {
>>  	struct iommu_group *group;
>>  	unsigned int type;
>> +	int ret;
>> 
>>  	group = iommu_group_get(dev);
>>  	if (!group)
>> @@ -1501,7 +1502,11 @@ static int iommu_alloc_default_domain(struct 
>> device *dev)
>> 
>>  	type = iommu_get_def_domain_type(dev);
>> 
>> -	return iommu_group_alloc_default_domain(dev->bus, group, type);
>> +	ret = iommu_group_alloc_default_domain(dev->bus, group, type);
>> +
>> +	iommu_group_put(group);
>> +
>> +	return ret;
>>  }
>> 
>>  /**
> 
> Thanks for the report and the fix. I think it is better to fix this by
> not taking a group reference in iommu_alloc_default_domain() at all and
> pass group as a parameter. Please see the patch I just sent out.
> 

Thanks for the patch, it looks like the right thing to do. Testing it
out now.

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
