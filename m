Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1211BE624
	for <lists.iommu@lfdr.de>; Mon, 29 Apr 2019 17:22:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3EEA12209;
	Mon, 29 Apr 2019 15:22:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D490321EF
	for <iommu@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 15:19:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 7BB43876
	for <iommu@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 15:19:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4327D80D;
	Mon, 29 Apr 2019 08:19:06 -0700 (PDT)
Received: from [10.1.196.75] (e110467-lin.cambridge.arm.com [10.1.196.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CD753F5C1;
	Mon, 29 Apr 2019 08:19:04 -0700 (PDT)
Subject: Re: [PATCH v2 7/7] iommu/dma-iommu: Remove iommu_dma_map_msi_msg()
To: Julien Grall <julien.grall@arm.com>, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org
References: <20190429144428.29254-1-julien.grall@arm.com>
	<20190429144428.29254-8-julien.grall@arm.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <74a6c2e6-126c-57f0-af5c-ab1130130eba@arm.com>
Date: Mon, 29 Apr 2019 16:19:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190429144428.29254-8-julien.grall@arm.com>
Content-Language: en-GB
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: jason@lakedaemon.net, douliyangs@gmail.com, marc.zyngier@arm.com,
	miquel.raynal@bootlin.com, tglx@linutronix.de,
	logang@deltatee.com, bigeasy@linutronix.de, linux-rt-users@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 29/04/2019 15:44, Julien Grall wrote:
> A recent change split iommu_dma_map_msi_msg() in two new functions. The
> function was still implemented to avoid modifying all the callers at
> once.
> 
> Now that all the callers have been reworked, iommu_dma_map_msi_msg() can
> be removed.

Yay! The end of my horrible bodge :)

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Julien Grall <julien.grall@arm.com>
> 
> ---
>      Changes in v2:
>          - Rework the commit message
> ---
>   drivers/iommu/dma-iommu.c | 20 --------------------
>   include/linux/dma-iommu.h |  5 -----
>   2 files changed, 25 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 2309f59cefa4..12f4464828a4 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -936,23 +936,3 @@ void iommu_dma_compose_msi_msg(struct msi_desc *desc,
>   	msg->address_lo &= cookie_msi_granule(domain->iova_cookie) - 1;
>   	msg->address_lo += lower_32_bits(msi_page->iova);
>   }
> -
> -void iommu_dma_map_msi_msg(int irq, struct msi_msg *msg)
> -{
> -	struct msi_desc *desc = irq_get_msi_desc(irq);
> -	phys_addr_t msi_addr = (u64)msg->address_hi << 32 | msg->address_lo;
> -
> -	if (WARN_ON(iommu_dma_prepare_msi(desc, msi_addr))) {
> -		/*
> -		 * We're called from a void callback, so the best we can do is
> -		 * 'fail' by filling the message with obviously bogus values.
> -		 * Since we got this far due to an IOMMU being present, it's
> -		 * not like the existing address would have worked anyway...
> -		 */
> -		msg->address_hi = ~0U;
> -		msg->address_lo = ~0U;
> -		msg->data = ~0U;
> -	} else {
> -		iommu_dma_compose_msi_msg(desc, msg);
> -	}
> -}
> diff --git a/include/linux/dma-iommu.h b/include/linux/dma-iommu.h
> index 3fc48fbd6f63..ddd217c197df 100644
> --- a/include/linux/dma-iommu.h
> +++ b/include/linux/dma-iommu.h
> @@ -82,7 +82,6 @@ int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr);
>   void iommu_dma_compose_msi_msg(struct msi_desc *desc,
>   			       struct msi_msg *msg);
>   
> -void iommu_dma_map_msi_msg(int irq, struct msi_msg *msg);
>   void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list);
>   
>   #else
> @@ -122,10 +121,6 @@ static inline void iommu_dma_compose_msi_msg(struct msi_desc *desc,
>   {
>   }
>   
> -static inline void iommu_dma_map_msi_msg(int irq, struct msi_msg *msg)
> -{
> -}
> -
>   static inline void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list)
>   {
>   }
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
