Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2305D397002
	for <lists.iommu@lfdr.de>; Tue,  1 Jun 2021 11:10:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C016783806;
	Tue,  1 Jun 2021 09:10:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZErFxmoJi5qN; Tue,  1 Jun 2021 09:10:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id D194A837DA;
	Tue,  1 Jun 2021 09:10:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A59DAC0024;
	Tue,  1 Jun 2021 09:10:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD6AFC0001
 for <iommu@lists.linux-foundation.org>; Tue,  1 Jun 2021 09:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4A7660A7A
 for <iommu@lists.linux-foundation.org>; Tue,  1 Jun 2021 09:10:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NNNxn40_PVcB for <iommu@lists.linux-foundation.org>;
 Tue,  1 Jun 2021 09:09:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5053E605D8
 for <iommu@lists.linux-foundation.org>; Tue,  1 Jun 2021 09:09:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E5D511D4;
 Tue,  1 Jun 2021 02:09:56 -0700 (PDT)
Received: from [10.57.73.64] (unknown [10.57.73.64])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7A2383F73D;
 Tue,  1 Jun 2021 02:09:55 -0700 (PDT)
Subject: Re: [PATCH] iommu: Print default strict or lazy mode at init time
To: John Garry <john.garry@huawei.com>, joro@8bytes.org, will@kernel.org
References: <1622209074-37899-1-git-send-email-john.garry@huawei.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <3ee986a0-29c1-100c-c72f-360f919caf7d@arm.com>
Date: Tue, 1 Jun 2021 10:09:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1622209074-37899-1-git-send-email-john.garry@huawei.com>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, hch@lst.de
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

On 2021-05-28 14:37, John Garry wrote:
> As well as the default domain type, it's useful to know whether strict
> or lazy mode is default for DMA domains, so add this info in a separate
> print.
> 
> Signed-off-by: John Garry <john.garry@huawei.com>
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 808ab70d5df5..f25fae62f077 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -138,6 +138,11 @@ static int __init iommu_subsys_init(void)
>   		(iommu_cmd_line & IOMMU_CMD_LINE_DMA_API) ?
>   			"(set via kernel command line)" : "");
>   
> +	pr_info("Default DMA domain mode: %s %s\n",

Nit: I think this might be a little unclear for end-users - *I'm* not 
even sure whether "Default" here is meant to refer to the mode setting 
itself or to default domains (of DMA type). Maybe something like "DMA 
domain TLB invalidation policy"? Certainly it seems like a good idea to 
explicitly mention invalidation to correlate with the documentation of 
the "iommu.strict" parameter.

Ack to the general idea though.

Thanks,
Robin.

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
