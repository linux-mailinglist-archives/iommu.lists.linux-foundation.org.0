Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A49FD2FCA6C
	for <lists.iommu@lfdr.de>; Wed, 20 Jan 2021 06:24:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 25CA684828;
	Wed, 20 Jan 2021 05:24:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nOpFnccyp1zC; Wed, 20 Jan 2021 05:24:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9FD4F84821;
	Wed, 20 Jan 2021 05:24:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76425C013A;
	Wed, 20 Jan 2021 05:24:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66162C013A
 for <iommu@lists.linux-foundation.org>; Wed, 20 Jan 2021 05:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 54DBF86365
 for <iommu@lists.linux-foundation.org>; Wed, 20 Jan 2021 05:24:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vCePDP4gdYxn for <iommu@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 05:24:08 +0000 (UTC)
X-Greylist: delayed 00:05:03 by SQLgrey-1.7.6
Received: from a1.mail.mailgun.net (a1.mail.mailgun.net [198.61.254.60])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 662F485EA8
 for <iommu@lists.linux-foundation.org>; Wed, 20 Jan 2021 05:24:08 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1611120248; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=elqg9TnQqVo3z+rjCzoXTDJ/nWUGnhtMTJRsONyCrT4=;
 b=hCZqdCJ8+LdItPkdlnSSFhrkm4lRgqgAumtn21OfmSamd9P5zAlXBSHz3IZSjV/jNkjTrDV5
 1oT70hn9QTflpJfzGLtnPSLnp21A05RESWBTahDKUzNOejzy/S2lplgFNUhgq7UDCrI0Ra8h
 dnOtZtUCbrKyLkMcDpElvsIjZgk=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6007bd3be23dedcc3a136899 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 20 Jan 2021 05:18:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 13973C433CA; Wed, 20 Jan 2021 05:18:51 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 52F8BC43464;
 Wed, 20 Jan 2021 05:18:50 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 20 Jan 2021 10:48:50 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Jordan Crouse <jcrouse@codeaurora.org>, Rob
 Clark <robdclark@gmail.com>, Akhil P Oommen <akhilpo@codeaurora.org>,
 isaacm@codeaurora.org
Subject: Re: [PATCH 0/3] iommu/drm/msm: Allow non-coherent masters to use
 system cache
In-Reply-To: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
Message-ID: <3e6ec220c07bcf91fae0985e1798f7a1@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 Kristian H Kristensen <hoegsberg@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno <freedreno@lists.freedesktop.org>,
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

On 2021-01-11 19:45, Sai Prakash Ranjan wrote:
> commit ecd7274fb4cd ("iommu: Remove unused IOMMU_SYS_CACHE_ONLY flag")
> removed unused IOMMU_SYS_CACHE_ONLY prot flag and along with it went
> the memory type setting required for the non-coherent masters to use
> system cache. Now that system cache support for GPU is added, we will
> need to set the right PTE attribute for GPU buffers to be sys cached.
> Without this, the system cache lines are not allocated for GPU.
> 
> So the patches in this series introduces a new prot flag IOMMU_LLC,
> renames IO_PGTABLE_QUIRK_ARM_OUTER_WBWA to IO_PGTABLE_QUIRK_PTW_LLC
> and makes GPU the user of this protection flag.
> 
> The series slightly depends on following 2 patches posted earlier and
> is based on msm-next branch:
>  * https://lore.kernel.org/patchwork/patch/1363008/
>  * https://lore.kernel.org/patchwork/patch/1363010/
> 
> Sai Prakash Ranjan (3):
>   iommu/io-pgtable: Rename last-level cache quirk to
>     IO_PGTABLE_QUIRK_PTW_LLC
>   iommu/io-pgtable-arm: Add IOMMU_LLC page protection flag
>   drm/msm: Use IOMMU_LLC page protection flag to map gpu buffers
> 
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 3 +++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>  drivers/gpu/drm/msm/msm_iommu.c         | 3 +++
>  drivers/gpu/drm/msm/msm_mmu.h           | 4 ++++
>  drivers/iommu/io-pgtable-arm.c          | 9 ++++++---
>  include/linux/io-pgtable.h              | 6 +++---
>  include/linux/iommu.h                   | 6 ++++++
>  7 files changed, 26 insertions(+), 7 deletions(-)
> 
> 
> base-commit: 00fd44a1a4700718d5d962432b55c09820f7e709


Gentle Ping!

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
