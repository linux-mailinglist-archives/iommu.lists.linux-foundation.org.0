Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0AC345EE4
	for <lists.iommu@lfdr.de>; Tue, 23 Mar 2021 14:05:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19F17404C5;
	Tue, 23 Mar 2021 13:05:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gYgLKNq8UZEx; Tue, 23 Mar 2021 13:05:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id F144E404A8;
	Tue, 23 Mar 2021 13:05:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D34ACC0001;
	Tue, 23 Mar 2021 13:05:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 785E8C0001
 for <iommu@lists.linux-foundation.org>; Tue, 23 Mar 2021 13:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5121A605D8
 for <iommu@lists.linux-foundation.org>; Tue, 23 Mar 2021 13:05:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fZKvwO5-KCEW for <iommu@lists.linux-foundation.org>;
 Tue, 23 Mar 2021 13:05:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64D4F6058B
 for <iommu@lists.linux-foundation.org>; Tue, 23 Mar 2021 13:05:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABBD6106F;
 Tue, 23 Mar 2021 06:05:07 -0700 (PDT)
Received: from [10.57.50.37] (unknown [10.57.50.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 721A03F719;
 Tue, 23 Mar 2021 06:05:06 -0700 (PDT)
Subject: Re: [PATCH 3/3] iova: Correct comment for free_cpu_cached_iovas()
To: John Garry <john.garry@huawei.com>, dwmw2@infradead.org,
 baolu.lu@linux.intel.com, joro@8bytes.org, will@kernel.org
References: <1614600741-15696-1-git-send-email-john.garry@huawei.com>
 <1614600741-15696-4-git-send-email-john.garry@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <87b4af01-2352-e963-824f-1cea1a6ee718@arm.com>
Date: Tue, 23 Mar 2021 13:05:01 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1614600741-15696-4-git-send-email-john.garry@huawei.com>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linuxarm@huawei.com
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

On 2021-03-01 12:12, John Garry wrote:
> Function free_cpu_cached_iovas() is not only called when a CPU is
> hotplugged, so remove that part of the code comment.

FWIW I read it as clarifying why this is broken out into a separate 
function vs. a monolithic "free all cached IOVAs" routine that handles 
both the per-cpu and global caches - it never said "*only* used..."

As such I'd hesitate to call it incorrect, but it's certainly arguable 
whether it needs to be stated or not, especially once the hotplug 
callsite is now obvious in the same file - on which note the function 
itself also shouldn't need to be public any more, no?

Robin.

> Signed-off-by: John Garry <john.garry@huawei.com>
> ---
>   drivers/iommu/iova.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
> index c78312560425..465b3b0eeeb0 100644
> --- a/drivers/iommu/iova.c
> +++ b/drivers/iommu/iova.c
> @@ -996,7 +996,7 @@ static void free_iova_rcaches(struct iova_domain *iovad)
>   }
>   
>   /*
> - * free all the IOVA ranges cached by a cpu (used when cpu is unplugged)
> + * free all the IOVA ranges cached by a cpu
>    */
>   void free_cpu_cached_iovas(unsigned int cpu, struct iova_domain *iovad)
>   {
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
