Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9B2387FEE
	for <lists.iommu@lfdr.de>; Tue, 18 May 2021 20:51:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FA4840E69;
	Tue, 18 May 2021 18:51:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EaL-5GXrY54j; Tue, 18 May 2021 18:51:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD3A740E65;
	Tue, 18 May 2021 18:51:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85379C001C;
	Tue, 18 May 2021 18:51:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B510C0001
 for <iommu@lists.linux-foundation.org>; Tue, 18 May 2021 18:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5048B40534
 for <iommu@lists.linux-foundation.org>; Tue, 18 May 2021 18:51:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fm909ZUeSwb2 for <iommu@lists.linux-foundation.org>;
 Tue, 18 May 2021 18:51:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56E84403E5
 for <iommu@lists.linux-foundation.org>; Tue, 18 May 2021 18:51:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BAB5101E;
 Tue, 18 May 2021 11:51:15 -0700 (PDT)
Received: from [10.57.66.179] (unknown [10.57.66.179])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96D703F719;
 Tue, 18 May 2021 11:51:14 -0700 (PDT)
Subject: Re: [PATCH 1/1] dma-contiguous: return early for dt case in
 dma_contiguous_reserve
To: Dong Aisheng <aisheng.dong@nxp.com>, iommu@lists.linux-foundation.org
References: <20210518112857.1198415-1-aisheng.dong@nxp.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <fe37a3d0-1360-77e8-f594-c9f32cc39cf2@arm.com>
Date: Tue, 18 May 2021 19:51:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518112857.1198415-1-aisheng.dong@nxp.com>
Content-Language: en-GB
Cc: Christoph Hellwig <hch@lst.de>, dongas86@gmail.com,
 linux-kernel@vger.kernel.org
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

On 2021-05-18 12:28, Dong Aisheng wrote:
> dma_contiguous_reserve() aims to support cmdline case for CMA memory
> reserve. But if users define reserved memory in DT,
> 'dma_contiguous_default_area' will not be 0, then it's meaningless
> to continue to run dma_contiguous_reserve(). So we return early
> if detect 'dma_contiguous_default_area' is unzero.

But dma_contiguous_default_area *shouldn't* be set if the command-line 
argument is present - see the "if (size_cmdline != -1 && default_cma)" 
part of rmem_cma_setup(). Are you seeing something different in practice?

> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>   kernel/dma/contiguous.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
> index 3d63d91cba5c..ebade9f43eff 100644
> --- a/kernel/dma/contiguous.c
> +++ b/kernel/dma/contiguous.c
> @@ -171,6 +171,9 @@ void __init dma_contiguous_reserve(phys_addr_t limit)
>   	phys_addr_t selected_limit = limit;
>   	bool fixed = false;
>   
> +	if (dma_contiguous_default_area)
> +		return;
> +
>   	pr_debug("%s(limit %08lx)\n", __func__, (unsigned long)limit);
>   
>   	if (size_cmdline != -1) {
> @@ -191,7 +194,7 @@ void __init dma_contiguous_reserve(phys_addr_t limit)
>   #endif
>   	}
>   
> -	if (selected_size && !dma_contiguous_default_area) {
> +	if (selected_size) {

Either way, does skipping a handful of trivial calculations and a 
debugging message really matter even when it is redundant? I can't 
imagine it has any measurable effect on boot times...

Robin.

>   		pr_debug("%s: reserving %ld MiB for global area\n", __func__,
>   			 (unsigned long)selected_size / SZ_1M);
>   
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
