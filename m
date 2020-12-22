Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E43262DE8D0
	for <lists.iommu@lfdr.de>; Fri, 18 Dec 2020 19:10:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 82DEC87B63;
	Fri, 18 Dec 2020 18:10:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dk8UCJXr50Kj; Fri, 18 Dec 2020 18:10:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 88F5187B9F;
	Fri, 18 Dec 2020 18:10:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55F10C0893;
	Fri, 18 Dec 2020 18:10:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6247C0893
 for <iommu@lists.linux-foundation.org>; Fri, 18 Dec 2020 18:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BB04F2E318
 for <iommu@lists.linux-foundation.org>; Fri, 18 Dec 2020 18:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nKG0kuCwVdXF for <iommu@lists.linux-foundation.org>;
 Fri, 18 Dec 2020 18:10:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id 3C8FE2E313
 for <iommu@lists.linux-foundation.org>; Fri, 18 Dec 2020 18:10:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8133D30E;
 Fri, 18 Dec 2020 10:10:00 -0800 (PST)
Received: from [10.57.34.90] (unknown [10.57.34.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 757983F66E;
 Fri, 18 Dec 2020 10:09:59 -0800 (PST)
Subject: Re: [PATCH] dma-mapping: benchmark: check the validity of dma mask
 bits
To: Barry Song <song.bao.hua@hisilicon.com>, hch@lst.de,
 m.szyprowski@samsung.com
References: <20201212101844.23612-1-song.bao.hua@hisilicon.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <69d8ff1a-8993-758f-1aec-e133024cf0b7@arm.com>
Date: Fri, 18 Dec 2020 18:09:58 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201212101844.23612-1-song.bao.hua@hisilicon.com>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, linuxarm@huawei.com,
 Dan Carpenter <dan.carpenter@oracle.com>
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

On 2020-12-12 10:18, Barry Song wrote:
> While dma_mask_bits is larger than 64, the bahvaiour is undefined. On the
> other hand, dma_mask_bits which is smaller than 20 (1MB) makes no sense
> in real hardware.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
> ---
>   kernel/dma/map_benchmark.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/kernel/dma/map_benchmark.c b/kernel/dma/map_benchmark.c
> index b1496e744c68..19f661692073 100644
> --- a/kernel/dma/map_benchmark.c
> +++ b/kernel/dma/map_benchmark.c
> @@ -214,6 +214,12 @@ static long map_benchmark_ioctl(struct file *file, unsigned int cmd,
>   			return -EINVAL;
>   		}
>   
> +		if (map->bparam.dma_bits < 20 ||

FWIW I don't think we need to bother with a lower limit here - it's 
unsigned, and a pointlessly small value will fail gracefully when we 
come to actually set the mask anyway. We only need to protect kernel 
code from going wrong, not userspace from being stupid to its own detriment.

Robin.

> +		    map->bparam.dma_bits > 64) {
> +			pr_err("invalid dma_bits\n");
> +			return -EINVAL;
> +		}
> +
>   		if (map->bparam.node != NUMA_NO_NODE &&
>   		    !node_possible(map->bparam.node)) {
>   			pr_err("invalid numa node\n");
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
