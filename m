Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F333EBAFD
	for <lists.iommu@lfdr.de>; Fri, 13 Aug 2021 19:03:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0670360750;
	Fri, 13 Aug 2021 17:03:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nmNmp35i11vG; Fri, 13 Aug 2021 17:03:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A3F9F6070A;
	Fri, 13 Aug 2021 17:03:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F5BCC001F;
	Fri, 13 Aug 2021 17:03:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD29DC000E
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 17:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B65183B26
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 17:03:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T3ed26JjUxm1 for <iommu@lists.linux-foundation.org>;
 Fri, 13 Aug 2021 17:03:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93E8F83B23
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 17:03:41 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCFBFD6E;
 Fri, 13 Aug 2021 10:03:40 -0700 (PDT)
Received: from [10.57.36.146] (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C33B13F70D;
 Fri, 13 Aug 2021 10:03:39 -0700 (PDT)
Subject: Re: [GIT PULL] iommu/arm-smmu: Updates for 5.15
To: Will Deacon <will@kernel.org>, joro@8bytes.org
References: <20210813164735.GA8765@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <603960e8-e8cd-ed5c-32fd-93118401a221@arm.com>
Date: Fri, 13 Aug 2021 18:03:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210813164735.GA8765@willie-the-truck>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On 2021-08-13 17:47, Will Deacon wrote:
> Hi Joerg,
> 
> Please pull these Arm SMMU updates for 5.15. There's not tonnes here, but
> a good mixture of optimisations and cleanups -- summary in the tag.
> 
> This applies cleanly against iommu/next, but I suspect it will conflict
> with Robin's series on the list. Please shout if you need anything from
> me to help with that (e.g. rebase, checking a merge conflict).

In fact it merges cleanly into my local branch, so I hope we should be 
good :)

Robin.

> Cheers,
> 
> Will
> 
> --->8
> 
> The following changes since commit ff1176468d368232b684f75e82563369208bc371:
> 
>    Linux 5.14-rc3 (2021-07-25 15:35:14 -0700)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git tags/arm-smmu-updates
> 
> for you to fetch changes up to fac956710ab0812f9e395e9f7a27da551412830f:
> 
>    iommu/arm-smmu-v3: Stop pre-zeroing batch commands (2021-08-13 14:26:06 +0100)
> 
> ----------------------------------------------------------------
> Arm SMMU updates for 5.15
> 
> - SMMUv3
> 
>    * Minor optimisation to avoid zeroing struct members on CMD submission
> 
>    * Increased use of batched commands to reduce submission latency
> 
>    * Refactoring in preparation for ECMDQ support
> 
> - SMMUv2
> 
>    * Fix races when probing devices with identical StreamIDs
> 
>    * Optimise walk cache flushing for Qualcomm implementations
> 
>    * Allow deep sleep states for some Qualcomm SoCs with shared clocks
> 
> ----------------------------------------------------------------
> Ashish Mhetre (1):
>        iommu: Fix race condition during default domain allocation
> 
> John Garry (2):
>        iommu/arm-smmu-v3: Remove some unneeded init in arm_smmu_cmdq_issue_cmdlist()
>        iommu/arm-smmu-v3: Stop pre-zeroing batch commands
> 
> Krishna Reddy (1):
>        iommu/arm-smmu: Fix race condition during iommu_group creation
> 
> Sai Prakash Ranjan (2):
>        iommu/arm-smmu: Add clk_bulk_{prepare/unprepare} to system pm callbacks
>        iommu/arm-smmu: Optimize ->tlb_flush_walk() for qcom implementation
> 
> Zhen Lei (4):
>        iommu/arm-smmu-v3: Use command queue batching helpers to improve performance
>        iommu/arm-smmu-v3: Add and use static helper function arm_smmu_cmdq_issue_cmd_with_sync()
>        iommu/arm-smmu-v3: Add and use static helper function arm_smmu_get_cmdq()
>        iommu/arm-smmu-v3: Extract reusable function __arm_smmu_cmdq_skip_err()
> 
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 89 +++++++++++++++++------------
>   drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c  | 11 ++++
>   drivers/iommu/arm/arm-smmu/arm-smmu.c       | 45 ++++++++++++---
>   drivers/iommu/arm/arm-smmu/arm-smmu.h       |  1 +
>   drivers/iommu/iommu.c                       |  2 +
>   5 files changed, 106 insertions(+), 42 deletions(-)
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
