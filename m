Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8053A6B02
	for <lists.iommu@lfdr.de>; Mon, 14 Jun 2021 17:54:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 475FA4018A;
	Mon, 14 Jun 2021 15:54:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dWtHPXqBOgup; Mon, 14 Jun 2021 15:54:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 68B53400C3;
	Mon, 14 Jun 2021 15:54:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E5C7C000B;
	Mon, 14 Jun 2021 15:54:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A0898C000B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 15:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C1B683A9F
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 15:54:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uNobM17ZRV4D for <iommu@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 15:54:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEF1083122
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 15:54:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48FDC11D4;
 Mon, 14 Jun 2021 08:54:42 -0700 (PDT)
Received: from [10.57.9.136] (unknown [10.57.9.136])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2AF73F70D;
 Mon, 14 Jun 2021 08:54:40 -0700 (PDT)
Subject: Re: [PATCH v12 1/5] iommu: Print strict or lazy mode at init time
To: John Garry <john.garry@huawei.com>, joro@8bytes.org, will@kernel.org,
 dwmw2@infradead.org, baolu.lu@linux.intel.com
References: <1623414043-40745-1-git-send-email-john.garry@huawei.com>
 <1623414043-40745-2-git-send-email-john.garry@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <5d98ab53-2ff0-fcbb-3177-bb04a9d2b554@arm.com>
Date: Mon, 14 Jun 2021 16:54:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1623414043-40745-2-git-send-email-john.garry@huawei.com>
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

On 2021-06-11 13:20, John Garry wrote:
> As well as the default domain type, it's useful to know whether strict
> or lazy for DMA domains, so add this info in a separate print.
> 
> The (stict/lazy) mode may be also set via iommu.strict earlyparm, but
> this will be processed prior to iommu_subsys_init(), so that print will be
> accurate for drivers which don't set the mode via custom means.
> 
> For the drivers which do set the mode via custom means - the AMD and Intel
> drivers - they still maintain prints to notify the change in policy.

Note that you then start removing said prints later in the series, but 
if we repurpose then as deprecation warnings instead as Baolu suggests 
then I reckon it all works out OK. Assuming that,

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: John Garry <john.garry@huawei.com>
> ---
>   drivers/iommu/iommu.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 5419c4b9f27a..cf58949cc2f3 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -138,6 +138,11 @@ static int __init iommu_subsys_init(void)
>   		(iommu_cmd_line & IOMMU_CMD_LINE_DMA_API) ?
>   			"(set via kernel command line)" : "");
>   
> +	pr_info("DMA domain TLB invalidation policy: %s mode %s\n",
> +		iommu_dma_strict ? "strict" : "lazy",
> +		(iommu_cmd_line & IOMMU_CMD_LINE_STRICT) ?
> +			"(set via kernel command line)" : "");
> +
>   	return 0;
>   }
>   subsys_initcall(iommu_subsys_init);
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
