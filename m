Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C244A2DE2DE
	for <lists.iommu@lfdr.de>; Fri, 18 Dec 2020 13:38:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 832BD87A84;
	Fri, 18 Dec 2020 12:38:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CjP7k4pLFwqB; Fri, 18 Dec 2020 12:38:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 001BC87A97;
	Fri, 18 Dec 2020 12:38:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D961FC1DA2;
	Fri, 18 Dec 2020 12:38:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E468C0893
 for <iommu@lists.linux-foundation.org>; Fri, 18 Dec 2020 12:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 871EE87A90
 for <iommu@lists.linux-foundation.org>; Fri, 18 Dec 2020 12:38:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cj3zv+BoxFy7 for <iommu@lists.linux-foundation.org>;
 Fri, 18 Dec 2020 12:38:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5AD2487A84
 for <iommu@lists.linux-foundation.org>; Fri, 18 Dec 2020 12:38:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AABBF1FB;
 Fri, 18 Dec 2020 04:38:38 -0800 (PST)
Received: from [10.57.34.90] (unknown [10.57.34.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A12B3F66E;
 Fri, 18 Dec 2020 04:38:37 -0800 (PST)
Subject: Re: [PATCH 1/3] iommu/io-pgtable-arm: Prepare for modularization
To: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <1608280722-19841-1-git-send-email-isaacm@codeaurora.org>
 <1608280722-19841-2-git-send-email-isaacm@codeaurora.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <309ff39d-5fc5-83c6-d423-2d66f503c60c@arm.com>
Date: Fri, 18 Dec 2020 12:38:36 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1608280722-19841-2-git-send-email-isaacm@codeaurora.org>
Content-Language: en-GB
Cc: pratikp@codeaurora.org, kernel-team@android.com, will@kernel.org,
 pdaly@codeaurora.org
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

On 2020-12-18 08:38, Isaac J. Manjarres wrote:
> The io-pgtable-arm and io-pgtable-arm-v7s source files will
> be compiled as separate modules, along with the io-pgtable
> source. Export the symbols for the io-pgtable init function
> structures for the io-pgtable module to use.

In my current build tree, the io-pgtable glue itself is a whopping 379 
bytes of code and data - is there really any benefit to all the 
additional overhead of making that modular? Given the number of 
different users (including AMD now), I think at this point we should 
start considering this as part of the IOMMU core, and just tweak the 
interface such that formats can register their own init_fns dynamically 
instead of the static array that's always horrible.

Robin.

> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
> ---
>   drivers/iommu/io-pgtable-arm-v7s.c | 4 ++++
>   drivers/iommu/io-pgtable-arm.c     | 8 ++++++++
>   2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
> index 1d92ac9..f062c1c 100644
> --- a/drivers/iommu/io-pgtable-arm-v7s.c
> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
> @@ -28,6 +28,7 @@
>   #include <linux/iommu.h>
>   #include <linux/kernel.h>
>   #include <linux/kmemleak.h>
> +#include <linux/module.h>
>   #include <linux/sizes.h>
>   #include <linux/slab.h>
>   #include <linux/spinlock.h>
> @@ -839,6 +840,7 @@ struct io_pgtable_init_fns io_pgtable_arm_v7s_init_fns = {
>   	.alloc	= arm_v7s_alloc_pgtable,
>   	.free	= arm_v7s_free_pgtable,
>   };
> +EXPORT_SYMBOL_GPL(io_pgtable_arm_v7s_init_fns);
>   
>   #ifdef CONFIG_IOMMU_IO_PGTABLE_ARMV7S_SELFTEST
>   
> @@ -984,3 +986,5 @@ static int __init arm_v7s_do_selftests(void)
>   }
>   subsys_initcall(arm_v7s_do_selftests);
>   #endif
> +
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 87def58..2623d57 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -13,6 +13,7 @@
>   #include <linux/bitops.h>
>   #include <linux/io-pgtable.h>
>   #include <linux/kernel.h>
> +#include <linux/module.h>
>   #include <linux/sizes.h>
>   #include <linux/slab.h>
>   #include <linux/types.h>
> @@ -1047,26 +1048,31 @@ struct io_pgtable_init_fns io_pgtable_arm_64_lpae_s1_init_fns = {
>   	.alloc	= arm_64_lpae_alloc_pgtable_s1,
>   	.free	= arm_lpae_free_pgtable,
>   };
> +EXPORT_SYMBOL_GPL(io_pgtable_arm_64_lpae_s1_init_fns);
>   
>   struct io_pgtable_init_fns io_pgtable_arm_64_lpae_s2_init_fns = {
>   	.alloc	= arm_64_lpae_alloc_pgtable_s2,
>   	.free	= arm_lpae_free_pgtable,
>   };
> +EXPORT_SYMBOL_GPL(io_pgtable_arm_64_lpae_s2_init_fns);
>   
>   struct io_pgtable_init_fns io_pgtable_arm_32_lpae_s1_init_fns = {
>   	.alloc	= arm_32_lpae_alloc_pgtable_s1,
>   	.free	= arm_lpae_free_pgtable,
>   };
> +EXPORT_SYMBOL_GPL(io_pgtable_arm_32_lpae_s1_init_fns);
>   
>   struct io_pgtable_init_fns io_pgtable_arm_32_lpae_s2_init_fns = {
>   	.alloc	= arm_32_lpae_alloc_pgtable_s2,
>   	.free	= arm_lpae_free_pgtable,
>   };
> +EXPORT_SYMBOL_GPL(io_pgtable_arm_32_lpae_s2_init_fns);
>   
>   struct io_pgtable_init_fns io_pgtable_arm_mali_lpae_init_fns = {
>   	.alloc	= arm_mali_lpae_alloc_pgtable,
>   	.free	= arm_lpae_free_pgtable,
>   };
> +EXPORT_SYMBOL_GPL(io_pgtable_arm_mali_lpae_init_fns);
>   
>   #ifdef CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST
>   
> @@ -1252,3 +1258,5 @@ static int __init arm_lpae_do_selftests(void)
>   }
>   subsys_initcall(arm_lpae_do_selftests);
>   #endif
> +
> +MODULE_LICENSE("GPL v2");
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
