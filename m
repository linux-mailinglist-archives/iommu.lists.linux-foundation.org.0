Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B25264683
	for <lists.iommu@lfdr.de>; Thu, 10 Sep 2020 15:03:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0E4FA86D95;
	Thu, 10 Sep 2020 13:03:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wh9pM89zfaSm; Thu, 10 Sep 2020 13:03:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 93D38869C7;
	Thu, 10 Sep 2020 13:03:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F299C0051;
	Thu, 10 Sep 2020 13:03:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CCE96C0051
 for <iommu@lists.linux-foundation.org>; Thu, 10 Sep 2020 13:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8110A81E34
 for <iommu@lists.linux-foundation.org>; Thu, 10 Sep 2020 13:03:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Y16o8IKucL3 for <iommu@lists.linux-foundation.org>;
 Thu, 10 Sep 2020 13:03:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 96CDE8712A
 for <iommu@lists.linux-foundation.org>; Thu, 10 Sep 2020 13:03:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AA5113D5;
 Thu, 10 Sep 2020 06:03:20 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C6D53F66E;
 Thu, 10 Sep 2020 06:03:17 -0700 (PDT)
Subject: Re: [PATCH 08/12] dma-direct: use phys_to_dma_direct in
 dma_direct_alloc
To: Christoph Hellwig <hch@lst.de>, Tony Luck <tony.luck@intel.com>,
 Fenghua Yu <fenghua.yu@intel.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 iommu@lists.linux-foundation.org
References: <20200908164758.3177341-1-hch@lst.de>
 <20200908164758.3177341-9-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <84dfb537-c028-e6d1-88d3-b3d48fc7df3a@arm.com>
Date: Thu, 10 Sep 2020 14:03:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200908164758.3177341-9-hch@lst.de>
Content-Language: en-GB
Cc: linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
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

On 2020-09-08 17:47, Christoph Hellwig wrote:
> Replace the currently open code copy.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   kernel/dma/direct.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 12e9f5f75dfe4b..57a6e7d7cf8f16 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -240,10 +240,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>   			goto out_encrypt_pages;
>   	}
>   done:
> -	if (force_dma_unencrypted(dev))
> -		*dma_handle = __phys_to_dma(dev, page_to_phys(page));
> -	else
> -		*dma_handle = phys_to_dma(dev, page_to_phys(page));
> +	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
>   	return ret;
>   
>   out_encrypt_pages:
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
