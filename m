Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADD63D9CD2
	for <lists.iommu@lfdr.de>; Thu, 29 Jul 2021 06:38:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FA31400EB;
	Thu, 29 Jul 2021 04:38:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ElpHlLnGC9xs; Thu, 29 Jul 2021 04:38:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 453EB400B9;
	Thu, 29 Jul 2021 04:38:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF5CCC0022;
	Thu, 29 Jul 2021 04:38:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3DB32C000E
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 04:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with UTF8SMTP id 1D5EE400EB
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 04:38:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id y4_Eo-dkEPAk for <iommu@lists.linux-foundation.org>;
 Thu, 29 Jul 2021 04:38:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by smtp2.osuosl.org (Postfix) with UTF8SMTPS id 834BD400B9
 for <iommu@lists.linux-foundation.org>; Thu, 29 Jul 2021 04:38:27 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627533507; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=kEfEwT/ODxxc08E2cVLUhKxwnEHlWMj0LfLS8lLCtPU=;
 b=cabA9CcSDhOhB/3GKGoGkipfdUYEEIR7OAxg45BHBOht126PNrbDZrOki0EHaA9JlIKWoJss
 7/astOaOezHYCSWvl/csCsWYadRFh9s5+L+RZzS/KjxhmYzrc3xG6v1XmgEGuDwfq7EAeRsk
 uxbaUMvQYfj44Stm/yPyTiWcLoA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 610230bfe81205dd0a5514fb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Jul 2021 04:38:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 90FBDC433F1; Thu, 29 Jul 2021 04:38:23 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6DFA3C433D3;
 Thu, 29 Jul 2021 04:38:22 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 29 Jul 2021 10:08:22 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Georgi Djakov <djakov@kernel.org>
Subject: Re: [PATCH 0/3] iommu/drm/msm: Allow non-coherent masters to use
 system cache
In-Reply-To: <20210728140052.GB22887@mms-0441>
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <20210728140052.GB22887@mms-0441>
Message-ID: <8b2742c8891abe4fec3664730717a089@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: isaacm@codeaurora.org, David Airlie <airlied@linux.ie>,
 Will Deacon <will@kernel.org>, Akhil P Oommen <akhilpo@codeaurora.org>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Jordan Crouse <jcrouse@codeaurora.org>,
 Kristian H Kristensen <hoegsberg@google.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 freedreno <freedreno@lists.freedesktop.org>,
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

Hi Georgi,

On 2021-07-28 19:30, Georgi Djakov wrote:
> On Mon, Jan 11, 2021 at 07:45:02PM +0530, Sai Prakash Ranjan wrote:
>> commit ecd7274fb4cd ("iommu: Remove unused IOMMU_SYS_CACHE_ONLY flag")
>> removed unused IOMMU_SYS_CACHE_ONLY prot flag and along with it went
>> the memory type setting required for the non-coherent masters to use
>> system cache. Now that system cache support for GPU is added, we will
>> need to set the right PTE attribute for GPU buffers to be sys cached.
>> Without this, the system cache lines are not allocated for GPU.
>> 
>> So the patches in this series introduces a new prot flag IOMMU_LLC,
>> renames IO_PGTABLE_QUIRK_ARM_OUTER_WBWA to IO_PGTABLE_QUIRK_PTW_LLC
>> and makes GPU the user of this protection flag.
> 
> Hi Sai,
> 
> Thank you for the patchset! Are you planning to refresh it, as it does
> not apply anymore?
> 

I was waiting on Will's reply [1]. If there are no changes needed, then
I can repost the patch.

[1] 
https://lore.kernel.org/lkml/21239ba603d0bdc4e4c696588a905f88@codeaurora.org/

Thanks,
Sai

> 
>> 
>> The series slightly depends on following 2 patches posted earlier and
>> is based on msm-next branch:
>>  * https://lore.kernel.org/patchwork/patch/1363008/
>>  * https://lore.kernel.org/patchwork/patch/1363010/
>> 
>> Sai Prakash Ranjan (3):
>>   iommu/io-pgtable: Rename last-level cache quirk to
>>     IO_PGTABLE_QUIRK_PTW_LLC
>>   iommu/io-pgtable-arm: Add IOMMU_LLC page protection flag
>>   drm/msm: Use IOMMU_LLC page protection flag to map gpu buffers
>> 
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 3 +++
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>>  drivers/gpu/drm/msm/msm_iommu.c         | 3 +++
>>  drivers/gpu/drm/msm/msm_mmu.h           | 4 ++++
>>  drivers/iommu/io-pgtable-arm.c          | 9 ++++++---
>>  include/linux/io-pgtable.h              | 6 +++---
>>  include/linux/iommu.h                   | 6 ++++++
>>  7 files changed, 26 insertions(+), 7 deletions(-)
>> 
>> 
>> base-commit: 00fd44a1a4700718d5d962432b55c09820f7e709
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
>> member
>> of Code Aurora Forum, hosted by The Linux Foundation
>> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
