Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5902D4F8096
	for <lists.iommu@lfdr.de>; Thu,  7 Apr 2022 15:31:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B85C407D7;
	Thu,  7 Apr 2022 13:31:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H7PiDpi0VwER; Thu,  7 Apr 2022 13:31:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C78F44092F;
	Thu,  7 Apr 2022 13:31:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F781C0012;
	Thu,  7 Apr 2022 13:31:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58028C0012
 for <iommu@lists.linux-foundation.org>; Thu,  7 Apr 2022 13:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 451AD402A8
 for <iommu@lists.linux-foundation.org>; Thu,  7 Apr 2022 13:31:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H1epl5M13WTk for <iommu@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 13:31:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7646440C67
 for <iommu@lists.linux-foundation.org>; Thu,  7 Apr 2022 13:31:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1C9A12FC;
 Thu,  7 Apr 2022 06:31:51 -0700 (PDT)
Received: from [10.57.41.19] (unknown [10.57.41.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23C3D3F73B;
 Thu,  7 Apr 2022 06:31:50 -0700 (PDT)
Message-ID: <f7039f1f-81ef-2fab-4ade-728316b54942@arm.com>
Date: Thu, 7 Apr 2022 14:31:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] iommu/amd: Enable swiotlb in all cases
Content-Language: en-GB
To: Mario Limonciello <mario.limonciello@amd.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
References: <20220404204723.9767-1-mario.limonciello@amd.com>
 <20220404204723.9767-2-mario.limonciello@amd.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220404204723.9767-2-mario.limonciello@amd.com>
Cc: open list <linux-kernel@vger.kernel.org>,
 Hegde Vasant <Vasant.Hegde@amd.com>, Christoph Hellwig <hch@infradead.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>
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

On 2022-04-04 21:47, Mario Limonciello wrote:
> Previously the AMD IOMMU would only enable SWIOTLB in certain
> circumstances:
>   * IOMMU in passthrough mode
>   * SME enabled
> 
> This logic however doesn't work when an untrusted device is plugged in
> that doesn't do page aligned DMA transactions.  The expectation is
> that a bounce buffer is used for those transactions.
> 
> This fails like this:
> 
> swiotlb buffer is full (sz: 4096 bytes), total 0 (slots), used 0 (slots)
> 
> That happens because the bounce buffers have been allocated, followed by
> freed during startup but the bounce buffering code expects that all IOMMUs
> have left it enabled.
> 
> Remove the criteria to set up bounce buffers on AMD systems to ensure
> they're always available for supporting untrusted devices.

FWIW it's also broken for another niche case where 
iommu_default_passthrough() == false at init, but the user later changes 
a 32-bit device's default domain type to passthrough via sysfs, such 
that it starts needing regular dma-direct bouncing.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Fixes: 82612d66d51d ("iommu: Allow the dma-iommu api to use bounce buffers")
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v1->v2:
>   * Enable swiotlb for AMD instead of ignoring it for inactive
> 
>   drivers/iommu/amd/iommu.c | 7 -------
>   1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
> index a1ada7bff44e..079694f894b8 100644
> --- a/drivers/iommu/amd/iommu.c
> +++ b/drivers/iommu/amd/iommu.c
> @@ -1838,17 +1838,10 @@ void amd_iommu_domain_update(struct protection_domain *domain)
>   	amd_iommu_domain_flush_complete(domain);
>   }
>   
> -static void __init amd_iommu_init_dma_ops(void)
> -{
> -	swiotlb = (iommu_default_passthrough() || sme_me_mask) ? 1 : 0;
> -}
> -
>   int __init amd_iommu_init_api(void)
>   {
>   	int err;
>   
> -	amd_iommu_init_dma_ops();
> -
>   	err = bus_set_iommu(&pci_bus_type, &amd_iommu_ops);
>   	if (err)
>   		return err;
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
