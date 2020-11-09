Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EAD52AB08F
	for <lists.iommu@lfdr.de>; Mon,  9 Nov 2020 06:15:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E8EBE86929;
	Mon,  9 Nov 2020 05:15:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wt2yLA4HyvHv; Mon,  9 Nov 2020 05:15:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3301686968;
	Mon,  9 Nov 2020 05:15:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1450FC016F;
	Mon,  9 Nov 2020 05:15:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E8481C016F
 for <iommu@lists.linux-foundation.org>; Mon,  9 Nov 2020 05:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DC99185FB0
 for <iommu@lists.linux-foundation.org>; Mon,  9 Nov 2020 05:15:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AhQhCfoy9NIs for <iommu@lists.linux-foundation.org>;
 Mon,  9 Nov 2020 05:15:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B9DFF85FAE
 for <iommu@lists.linux-foundation.org>; Mon,  9 Nov 2020 05:15:35 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1604898937; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=uTh+L8CvHLLdJK+ls2fzca5EQ/1eBi1ZJpxQzSgROEU=;
 b=h/3lPF1AMsRRUuAZTITXPVDA7iziMb2LgNRwfb2YCxYhvYy1ZOkD1LKkqRcb1cgnZsXvh0wK
 4tb4kVoFIZMVeLU4BYLYxzQDr6UoaM/IC8pLgFw//JC7+pBV5Mrl4NAFFsuvB8aG0Yz5UIDx
 lxoT2QVZlRo9FkQDrOE99jRDOao=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5fa8d07360d9475652c6052c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 09 Nov 2020 05:15:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C56E7C433FF; Mon,  9 Nov 2020 05:15:31 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B63BCC433C8;
 Mon,  9 Nov 2020 05:15:30 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 09 Nov 2020 10:45:30 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Jordan Crouse <jcrouse@codeaurora.org>, Rob
 Clark <robdclark@gmail.com>
Subject: Re: [PATCHv7 0/7] System Cache support for GPU and required SMMU
 support
In-Reply-To: <cover.1604048969.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1604048969.git.saiprakash.ranjan@codeaurora.org>
Message-ID: <b4ec727f58cfffc6e5b941d1508a4212@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Akhil P Oommen <akhilpo@codeaurora.org>,
 iommu@lists.linux-foundation.org, "Kristian H .
 Kristensen" <hoegsberg@google.com>, freedreno@lists.freedesktop.org,
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

On 2020-10-30 14:53, Sai Prakash Ranjan wrote:
> Some hardware variants contain a system cache or the last level
> cache(llc). This cache is typically a large block which is shared
> by multiple clients on the SOC. GPU uses the system cache to cache
> both the GPU data buffers(like textures) as well the SMMU pagetables.
> This helps with improved render performance as well as lower power
> consumption by reducing the bus traffic to the system memory.
> 
> The system cache architecture allows the cache to be split into slices
> which then be used by multiple SOC clients. This patch series is an
> effort to enable and use two of those slices preallocated for the GPU,
> one for the GPU data buffers and another for the GPU SMMU hardware
> pagetables.
> 
> Patch 1 - Patch 5 adds system cache support in SMMU and GPU driver.
> Patch 6 and 7 are minor cleanups for arm-smmu impl.
> 
> Changes in v7:
>  * Squash Jordan's patch to support MMU500 targets
>  * Rebase on top of for-joerg/arm-smmu/updates and Jordan's short
> series for adreno-smmu impl
> 
> Changes in v6:
>  * Move table to arm-smmu-qcom (Robin)
> 
> Changes in v5:
>  * Drop cleanup of blank lines since it was intentional (Robin)
>  * Rebase again on top of msm-next-pgtables as it moves pretty fast
> 
> Changes in v4:
>  * Drop IOMMU_SYS_CACHE prot flag
>  * Rebase on top of
> https://gitlab.freedesktop.org/drm/msm/-/tree/msm-next-pgtables
> 
> Changes in v3:
>  * Fix domain attribute setting to before iommu_attach_device()
>  * Fix few code style and checkpatch warnings
>  * Rebase on top of Jordan's latest split pagetables and per-instance
>    pagetables support
> 
> Changes in v2:
>  * Addressed review comments and rebased on top of Jordan's split
>    pagetables series
> 
> Jordan Crouse (1):
>   drm/msm/a6xx: Add support for using system cache on MMU500 based
>     targets
> 
> Sai Prakash Ranjan (4):
>   iommu/io-pgtable-arm: Add support to use system cache
>   iommu/arm-smmu: Add domain attribute for system cache
>   iommu: arm-smmu-impl: Use table to list QCOM implementations
>   iommu: arm-smmu-impl: Add a space before open parenthesis
> 
> Sharat Masetty (2):
>   drm/msm: rearrange the gpu_rmw() function
>   drm/msm/a6xx: Add support for using system cache(LLC)
> 

Hi,

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
