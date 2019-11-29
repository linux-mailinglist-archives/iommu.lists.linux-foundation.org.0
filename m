Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D122A10D627
	for <lists.iommu@lfdr.de>; Fri, 29 Nov 2019 14:34:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 630C986BF2;
	Fri, 29 Nov 2019 13:34:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b8sBZTRFjE5h; Fri, 29 Nov 2019 13:34:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 752F186BEF;
	Fri, 29 Nov 2019 13:34:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53BA0C0881;
	Fri, 29 Nov 2019 13:34:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4CAFBC0881
 for <iommu@lists.linux-foundation.org>; Fri, 29 Nov 2019 13:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 47BBA86BC9
 for <iommu@lists.linux-foundation.org>; Fri, 29 Nov 2019 13:34:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PN_9ZRmZjVxh for <iommu@lists.linux-foundation.org>;
 Fri, 29 Nov 2019 13:34:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (lhrrgout.huawei.com [185.176.76.210])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B2065869AB
 for <iommu@lists.linux-foundation.org>; Fri, 29 Nov 2019 13:34:06 +0000 (UTC)
Received: from LHREML714-CAH.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id AF5A731C83F1C5CE58D3;
 Fri, 29 Nov 2019 13:34:04 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 LHREML714-CAH.china.huawei.com (10.201.108.37) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 29 Nov 2019 13:34:04 +0000
Received: from [127.0.0.1] (10.202.226.46) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 29 Nov
 2019 13:34:04 +0000
Subject: Re: [Patch v2 3/3] iommu: avoid taking iova_rbtree_lock twice
To: Cong Wang <xiyou.wangcong@gmail.com>, <iommu@lists.linux-foundation.org>
References: <20191129004855.18506-1-xiyou.wangcong@gmail.com>
 <20191129004855.18506-4-xiyou.wangcong@gmail.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <dea0de02-cedc-7817-5b04-3888e0e86812@huawei.com>
Date: Fri, 29 Nov 2019 13:34:03 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191129004855.18506-4-xiyou.wangcong@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.202.226.46]
X-ClientProxiedBy: lhreml720-chm.china.huawei.com (10.201.108.71) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Cc: linux-kernel@vger.kernel.org
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

On 29/11/2019 00:48, Cong Wang wrote:
> Both find_iova() and __free_iova() take iova_rbtree_lock,
> there is no reason to take and release it twice inside
> free_iova().
> 
> Fold them into the critical section by calling the unlock
> versions instead.

Since generally the iova would be non-NULL, this seems a reasonable 
change (which could be mentioned in the commit log)

John

> 
> Cc: Joerg Roedel <joro@8bytes.org>
> Signed-off-by: Cong Wang <xiyou.wangcong@gmail.com>
> ---
>   drivers/iommu/iova.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
> index 184d4c0e20b5..f46f8f794678 100644
> --- a/drivers/iommu/iova.c
> +++ b/drivers/iommu/iova.c
> @@ -390,10 +390,14 @@ EXPORT_SYMBOL_GPL(__free_iova);
>   void
>   free_iova(struct iova_domain *iovad, unsigned long pfn)
>   {
> -	struct iova *iova = find_iova(iovad, pfn);
> +	unsigned long flags;
> +	struct iova *iova;
>   
> +	spin_lock_irqsave(&iovad->iova_rbtree_lock, flags);
> +	iova = private_find_iova(iovad, pfn);
>   	if (iova)
> -		__free_iova(iovad, iova);
> +		private_free_iova(iovad, iova);
> +	spin_unlock_irqrestore(&iovad->iova_rbtree_lock, flags);
>   
>   }
>   EXPORT_SYMBOL_GPL(free_iova);
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
