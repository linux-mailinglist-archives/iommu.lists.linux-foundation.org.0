Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 289524F8011
	for <lists.iommu@lfdr.de>; Thu,  7 Apr 2022 15:07:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A617C606CB;
	Thu,  7 Apr 2022 13:07:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8tzti9la9cKu; Thu,  7 Apr 2022 13:07:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DB4E560D5C;
	Thu,  7 Apr 2022 13:07:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A0074C0082;
	Thu,  7 Apr 2022 13:07:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C76FDC0012
 for <iommu@lists.linux-foundation.org>; Thu,  7 Apr 2022 13:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A726483FF0
 for <iommu@lists.linux-foundation.org>; Thu,  7 Apr 2022 13:07:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ndS-CYVBCnEG for <iommu@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 13:07:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91DC283FEF
 for <iommu@lists.linux-foundation.org>; Thu,  7 Apr 2022 13:07:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4E6712FC;
 Thu,  7 Apr 2022 06:07:27 -0700 (PDT)
Received: from [10.57.41.19] (unknown [10.57.41.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68ACE3F73B;
 Thu,  7 Apr 2022 06:07:26 -0700 (PDT)
Message-ID: <06570238-04a9-47ca-e6e2-c69606635446@arm.com>
Date: Thu, 7 Apr 2022 14:07:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] dma-iommu: Check that swiotlb is active before
 trying to use it
Content-Language: en-GB
To: Mario Limonciello <mario.limonciello@amd.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
References: <20220404204723.9767-1-mario.limonciello@amd.com>
 <20220404204723.9767-3-mario.limonciello@amd.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220404204723.9767-3-mario.limonciello@amd.com>
Cc: Christoph Hellwig <hch@infradead.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Hegde Vasant <Vasant.Hegde@amd.com>, open list <linux-kernel@vger.kernel.org>
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

On 2022-04-04 21:47, Mario Limonciello via iommu wrote:
> If the IOMMU is in use and an untrusted device is connected to an external
> facing port but the address requested isn't page aligned will cause the
> kernel to attempt to use bounce buffers.
> 
> If for some reason the bounce buffers have not been allocated this is a
> problem that should be made apparent to the user.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v1->v2:
>   * Move error message into the caller
> 
>   drivers/iommu/dma-iommu.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 09f6e1c0f9c0..1ca85d37eeab 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -971,6 +971,11 @@ static dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
>   		void *padding_start;
>   		size_t padding_size, aligned_size;
>   
> +		if (!is_swiotlb_active(dev)) {
> +			dev_warn_once(dev, "DMA bounce buffers are inactive, unable to map unaligned transaction.\n");
> +			return DMA_MAPPING_ERROR;
> +		}
> +
>   		aligned_size = iova_align(iovad, size);
>   		phys = swiotlb_tbl_map_single(dev, phys, size, aligned_size,
>   					      iova_mask(iovad), dir, attrs);
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
