Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED5D3A7EB1
	for <lists.iommu@lfdr.de>; Tue, 15 Jun 2021 15:08:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F6A983486;
	Tue, 15 Jun 2021 13:08:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q5YFv7cLHOPL; Tue, 15 Jun 2021 13:08:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2121783B7D;
	Tue, 15 Jun 2021 13:08:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5B4CC000B;
	Tue, 15 Jun 2021 13:08:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D256FC000B
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 13:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDC56402A1
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 13:08:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QIybmNin6Cze for <iommu@lists.linux-foundation.org>;
 Tue, 15 Jun 2021 13:08:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 52F424000B
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 13:08:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B891311D4;
 Tue, 15 Jun 2021 06:08:22 -0700 (PDT)
Received: from [10.57.9.136] (unknown [10.57.9.136])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8234F3F719;
 Tue, 15 Jun 2021 06:08:21 -0700 (PDT)
Subject: Re: [PATCH v3 2/6] iommu/amd: Do not use flush-queue when NpCache is
 on
To: Nadav Amit <nadav.amit@gmail.com>, Joerg Roedel <joro@8bytes.org>
References: <20210607182541.119756-1-namit@vmware.com>
 <20210607182541.119756-3-namit@vmware.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <afd4e764-a003-32eb-c50e-a77543772db0@arm.com>
Date: Tue, 15 Jun 2021 14:08:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210607182541.119756-3-namit@vmware.com>
Content-Language: en-GB
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Nadav Amit <namit@vmware.com>, Jiajun Cao <caojiajun@vmware.com>,
 Will Deacon <will@kernel.org>
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

On 2021-06-07 19:25, Nadav Amit wrote:
> From: Nadav Amit <namit@vmware.com>
> 
> Do not use flush-queue on virtualized environments, where the NpCache
> capability of the IOMMU is set. This is required to reduce
> virtualization overheads.
> 
> This change follows a similar change to Intel's VT-d and a detailed
> explanation as for the rationale is described in commit 29b32839725f
> ("iommu/vt-d: Do not use flush-queue when caching-mode is on").
> 
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Jiajun Cao <caojiajun@vmware.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Nadav Amit <namit@vmware.com>
> ---
>   drivers/iommu/amd/init.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
> index d006724f4dc2..ba3b76ed776d 100644
> --- a/drivers/iommu/amd/init.c
> +++ b/drivers/iommu/amd/init.c
> @@ -1850,8 +1850,13 @@ static int __init iommu_init_pci(struct amd_iommu *iommu)
>   	if (ret)
>   		return ret;
>   
> -	if (iommu->cap & (1UL << IOMMU_CAP_NPCACHE))
> +	if (iommu->cap & (1UL << IOMMU_CAP_NPCACHE)) {
> +		if (!amd_iommu_unmap_flush)
> +			pr_warn_once("IOMMU batching is disabled due to virtualization");

Nit: you can just use pr_warn() (or arguably pr_info()) since the 
explicit conditions already only match once. Speaking of which, it might 
be better to use amd_iommu_np_cache instead, since other patches are 
planning to clean up the last remnants of amd_iommu_unmap_flush.

Robin.

> +
>   		amd_iommu_np_cache = true;
> +		amd_iommu_unmap_flush = true;
> +	}
>   
>   	init_iommu_perf_ctr(iommu);
>   
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
