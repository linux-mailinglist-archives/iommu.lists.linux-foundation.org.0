Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C963D131760
	for <lists.iommu@lfdr.de>; Mon,  6 Jan 2020 19:19:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 784F5204A5;
	Mon,  6 Jan 2020 18:19:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oAs7aGc2C1Mj; Mon,  6 Jan 2020 18:19:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B68A5204A1;
	Mon,  6 Jan 2020 18:19:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C2DDC0881;
	Mon,  6 Jan 2020 18:19:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83EE8C0881
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jan 2020 18:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7A9F187B08
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jan 2020 18:19:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hU9RBQsIYQ6o for <iommu@lists.linux-foundation.org>;
 Mon,  6 Jan 2020 18:19:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9819387A5A
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jan 2020 18:19:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FBE9328;
 Mon,  6 Jan 2020 10:19:36 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6D2B43F534;
 Mon,  6 Jan 2020 10:19:35 -0800 (PST)
Subject: Re: [PATCH] iommu/dma: fix variable 'cookie' set but not used
To: Qian Cai <cai@lca.pw>, jroedel@suse.de
References: <20200106152727.1589-1-cai@lca.pw>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <418dcce0-f048-a4cc-3360-d4b9c7926a6d@arm.com>
Date: Mon, 6 Jan 2020 18:19:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200106152727.1589-1-cai@lca.pw>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

On 06/01/2020 3:27 pm, Qian Cai wrote:
> The commit c18647900ec8 ("iommu/dma: Relax locking in
> iommu_dma_prepare_msi()") introduced a compliation warning,
> 
> drivers/iommu/dma-iommu.c: In function 'iommu_dma_prepare_msi':
> drivers/iommu/dma-iommu.c:1206:27: warning: variable 'cookie' set but
> not used [-Wunused-but-set-variable]
>    struct iommu_dma_cookie *cookie;
>                             ^~~~~~

Fair enough... I guess this is a W=1 thing? Either way there's certainly 
no harm in cleaning up.

Acked-by: Robin Murphy <robin.murphy@arm.com>

> Fixes: c18647900ec8 ("iommu/dma: Relax locking in iommu_dma_prepare_msi()")
> Signed-off-by: Qian Cai <cai@lca.pw>
> ---
>   drivers/iommu/dma-iommu.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index c363294b3bb9..a2e96a5fd9a7 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -1203,7 +1203,6 @@ int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr)
>   {
>   	struct device *dev = msi_desc_to_dev(desc);
>   	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
> -	struct iommu_dma_cookie *cookie;
>   	struct iommu_dma_msi_page *msi_page;
>   	static DEFINE_MUTEX(msi_prepare_lock); /* see below */
>   
> @@ -1212,8 +1211,6 @@ int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr)
>   		return 0;
>   	}
>   
> -	cookie = domain->iova_cookie;
> -
>   	/*
>   	 * In fact the whole prepare operation should already be serialised by
>   	 * irq_domain_mutex further up the callchain, but that's pretty subtle
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
