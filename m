Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE07254EE4
	for <lists.iommu@lfdr.de>; Thu, 27 Aug 2020 21:41:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 29A2A88235;
	Thu, 27 Aug 2020 19:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HNpEWAxQ49uD; Thu, 27 Aug 2020 19:41:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1717F87D09;
	Thu, 27 Aug 2020 19:41:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0450DC0891;
	Thu, 27 Aug 2020 19:41:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CEB45C0051
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 19:41:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A37BE203E8
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 19:41:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U2ERYlaH+Liu for <iommu@lists.linux-foundation.org>;
 Thu, 27 Aug 2020 19:41:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id C8AA62038A
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 19:41:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82D0931B;
 Thu, 27 Aug 2020 12:41:38 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD8DC3F68F;
 Thu, 27 Aug 2020 12:41:37 -0700 (PDT)
Subject: Re: [PATCH] iommu/iova: Replace cmpxchg with xchg in queue_iova
To: Shaokun Zhang <zhangshaokun@hisilicon.com>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <1598517834-30275-1-git-send-email-zhangshaokun@hisilicon.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <3afcc7b2-0bfb-b79c-513f-1beb66c5f164@arm.com>
Date: Thu, 27 Aug 2020 20:41:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1598517834-30275-1-git-send-email-zhangshaokun@hisilicon.com>
Content-Language: en-GB
Cc: Yuqi Jin <jinyuqi@huawei.com>
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

On 2020-08-27 09:43, Shaokun Zhang wrote:
> From: Yuqi Jin <jinyuqi@huawei.com>
> 
> The performance of the atomic_xchg is better than atomic_cmpxchg because
> no comparison is required. While the value of @fq_timer_on can only be 0
> or 1. Let's use atomic_xchg instead of atomic_cmpxchg here because we
> only need to check that the value changes from 0 to 1 or from 1 to 1.

Looks reasonable to me - the "compare" part is already covered by the 
separate atomic_read(), and as you say there's no harm if the "exchange" 
part races as long as it's still atomic.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Cc: Joerg Roedel <joro@8bytes.org>
> Signed-off-by: Yuqi Jin <jinyuqi@huawei.com>
> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
> ---
>   drivers/iommu/iova.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
> index 45a251da5453..30d969a4c5fd 100644
> --- a/drivers/iommu/iova.c
> +++ b/drivers/iommu/iova.c
> @@ -579,7 +579,7 @@ void queue_iova(struct iova_domain *iovad,
>   
>   	/* Avoid false sharing as much as possible. */
>   	if (!atomic_read(&iovad->fq_timer_on) &&
> -	    !atomic_cmpxchg(&iovad->fq_timer_on, 0, 1))
> +	    !atomic_xchg(&iovad->fq_timer_on, 1))
>   		mod_timer(&iovad->fq_timer,
>   			  jiffies + msecs_to_jiffies(IOVA_FQ_TIMEOUT));
>   }
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
