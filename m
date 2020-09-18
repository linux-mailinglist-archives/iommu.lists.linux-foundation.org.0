Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCCD27006E
	for <lists.iommu@lfdr.de>; Fri, 18 Sep 2020 17:02:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E1E6287812;
	Fri, 18 Sep 2020 15:02:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id syRKO4wrx7Pu; Fri, 18 Sep 2020 15:02:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AADEE8781B;
	Fri, 18 Sep 2020 15:02:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 77FC7C0891;
	Fri, 18 Sep 2020 15:02:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 882E2C0051
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 15:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 749ED873CB
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 15:02:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pPXHq-byTKhy for <iommu@lists.linux-foundation.org>;
 Fri, 18 Sep 2020 15:02:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 44D19873C9
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 15:02:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9808B1045;
 Fri, 18 Sep 2020 08:02:45 -0700 (PDT)
Received: from [10.57.47.84] (unknown [10.57.47.84])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 806233F73B;
 Fri, 18 Sep 2020 08:02:29 -0700 (PDT)
Subject: Re: [PATCH] iommu/arm-smmu-v3: Fix endianness annotations
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, will@kernel.org
References: <20200918141856.629722-1-jean-philippe@linaro.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <67ae1b1b-16af-f488-9a07-7c0bf4a03147@arm.com>
Date: Fri, 18 Sep 2020 16:02:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200918141856.629722-1-jean-philippe@linaro.org>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

On 2020-09-18 15:18, Jean-Philippe Brucker wrote:
> When building with C=1, sparse reports some issues regarding endianness
> annotations:
> 
> arm-smmu-v3.c:221:26: warning: cast to restricted __le64
> arm-smmu-v3.c:221:24: warning: incorrect type in assignment (different base types)
> arm-smmu-v3.c:221:24:    expected restricted __le64 [usertype]
> arm-smmu-v3.c:221:24:    got unsigned long long [usertype]
> arm-smmu-v3.c:229:20: warning: incorrect type in argument 1 (different base types)
> arm-smmu-v3.c:229:20:    expected restricted __le64 [usertype] *[assigned] dst
> arm-smmu-v3.c:229:20:    got unsigned long long [usertype] *ent
> arm-smmu-v3.c:229:25: warning: incorrect type in argument 2 (different base types)
> arm-smmu-v3.c:229:25:    expected unsigned long long [usertype] *[assigned] src
> arm-smmu-v3.c:229:25:    got restricted __le64 [usertype] *
> arm-smmu-v3.c:396:20: warning: incorrect type in argument 1 (different base types)
> arm-smmu-v3.c:396:20:    expected restricted __le64 [usertype] *[assigned] dst
> arm-smmu-v3.c:396:20:    got unsigned long long *
> arm-smmu-v3.c:396:25: warning: incorrect type in argument 2 (different base types)
> arm-smmu-v3.c:396:25:    expected unsigned long long [usertype] *[assigned] src
> arm-smmu-v3.c:396:25:    got restricted __le64 [usertype] *
> arm-smmu-v3.c:1349:32: warning: invalid assignment: |=
> arm-smmu-v3.c:1349:32:    left side has type restricted __le64
> arm-smmu-v3.c:1349:32:    right side has type unsigned long
> arm-smmu-v3.c:1396:53: warning: incorrect type in argument 3 (different base types)
> arm-smmu-v3.c:1396:53:    expected restricted __le64 [usertype] *dst
> arm-smmu-v3.c:1396:53:    got unsigned long long [usertype] *strtab
> arm-smmu-v3.c:1424:39: warning: incorrect type in argument 1 (different base types)
> arm-smmu-v3.c:1424:39:    expected unsigned long long [usertype] *[assigned] strtab
> arm-smmu-v3.c:1424:39:    got restricted __le64 [usertype] *l2ptr
> 
> While harmless, they are incorrect and could hide actual errors during
> development. Fix them.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> 
> There is another false positive due to passing INT_MIN to cmpxchg, and
> __cmpxchg* to truncate them to u8 and u16:
> 
> arch/arm64/include/asm/cmpxchg.h:172:1: warning: cast truncates bits from constant value (ffffffff80000000 becomes 0)
> arch/arm64/include/asm/cmpxchg.h:172:1: warning: cast truncates bits from constant value (ffffffff80000000 becomes 0)
> 
> I haven't found a satisfying fix so far, except adding __force to
> __cmpxchg_case* which could hide actual bugs.

I guess that's a general issue with the switch(sizeof()) idiom of sparse 
not being aware that those cases are unreachable?

Robin.

> ---
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index c192544e874b..83acc1e5888e 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -867,7 +867,7 @@ static void queue_write(__le64 *dst, u64 *src, size_t n_dwords)
>   		*dst++ = cpu_to_le64(*src++);
>   }
>   
> -static void queue_read(__le64 *dst, u64 *src, size_t n_dwords)
> +static void queue_read(u64 *dst, __le64 *src, size_t n_dwords)
>   {
>   	int i;
>   
> @@ -1939,7 +1939,7 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>   		arm_smmu_cmdq_issue_cmd(smmu, &prefetch_cmd);
>   }
>   
> -static void arm_smmu_init_bypass_stes(u64 *strtab, unsigned int nent)
> +static void arm_smmu_init_bypass_stes(__le64 *strtab, unsigned int nent)
>   {
>   	unsigned int i;
>   
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
