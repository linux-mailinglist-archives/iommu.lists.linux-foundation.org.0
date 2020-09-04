Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FE325D541
	for <lists.iommu@lfdr.de>; Fri,  4 Sep 2020 11:37:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2C2B8874F6;
	Fri,  4 Sep 2020 09:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id maKD+nf9ENbZ; Fri,  4 Sep 2020 09:37:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A838D87510;
	Fri,  4 Sep 2020 09:37:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8FD63C0051;
	Fri,  4 Sep 2020 09:37:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 265A0C0051
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 09:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 099BA86D99
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 09:37:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J-h408M7CVgK for <iommu@lists.linux-foundation.org>;
 Fri,  4 Sep 2020 09:37:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 59A2186D70
 for <iommu@lists.linux-foundation.org>; Fri,  4 Sep 2020 09:37:35 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 92BC3A6D; Fri,  4 Sep 2020 11:37:33 +0200 (CEST)
Date: Fri, 4 Sep 2020 11:37:32 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Shaokun Zhang <zhangshaokun@hisilicon.com>
Subject: Re: [PATCH] iommu/iova: Replace cmpxchg with xchg in queue_iova
Message-ID: <20200904093732.GN6714@8bytes.org>
References: <1598517834-30275-1-git-send-email-zhangshaokun@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598517834-30275-1-git-send-email-zhangshaokun@hisilicon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Yuqi Jin <jinyuqi@huawei.com>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Adding Robin.

On Thu, Aug 27, 2020 at 04:43:54PM +0800, Shaokun Zhang wrote:
> From: Yuqi Jin <jinyuqi@huawei.com>
> 
> The performance of the atomic_xchg is better than atomic_cmpxchg because
> no comparison is required. While the value of @fq_timer_on can only be 0
> or 1. Let's use atomic_xchg instead of atomic_cmpxchg here because we
> only need to check that the value changes from 0 to 1 or from 1 to 1.
> 
> Cc: Joerg Roedel <joro@8bytes.org>
> Signed-off-by: Yuqi Jin <jinyuqi@huawei.com>
> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
> ---
>  drivers/iommu/iova.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
> index 45a251da5453..30d969a4c5fd 100644
> --- a/drivers/iommu/iova.c
> +++ b/drivers/iommu/iova.c
> @@ -579,7 +579,7 @@ void queue_iova(struct iova_domain *iovad,
>  
>  	/* Avoid false sharing as much as possible. */
>  	if (!atomic_read(&iovad->fq_timer_on) &&
> -	    !atomic_cmpxchg(&iovad->fq_timer_on, 0, 1))
> +	    !atomic_xchg(&iovad->fq_timer_on, 1))
>  		mod_timer(&iovad->fq_timer,
>  			  jiffies + msecs_to_jiffies(IOVA_FQ_TIMEOUT));
>  }
> -- 
> 2.7.4
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
