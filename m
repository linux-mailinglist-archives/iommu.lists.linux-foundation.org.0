Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 344A33A0DFA
	for <lists.iommu@lfdr.de>; Wed,  9 Jun 2021 09:44:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0BE0402E7;
	Wed,  9 Jun 2021 07:44:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y80X9EWtnXi0; Wed,  9 Jun 2021 07:44:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F29D2402AF;
	Wed,  9 Jun 2021 07:44:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB1BDC000B;
	Wed,  9 Jun 2021 07:44:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C7C5C000B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 07:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19E55404C3
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 07:44:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ZpxL_m7_mFw for <iommu@lists.linux-foundation.org>;
 Wed,  9 Jun 2021 07:44:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BCE6A404B9
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 07:44:36 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 4AC0436A; Wed,  9 Jun 2021 09:44:33 +0200 (CEST)
Date: Wed, 9 Jun 2021 09:44:32 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 1/1] iommu: Delete a duplicate check in
 iommu_change_dev_def_domain()
Message-ID: <YMBxYKNjVGkQZJAH@8bytes.org>
References: <20210513075815.6382-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210513075815.6382-1-thunder.leizhen@huawei.com>
Cc: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>,
 iommu <iommu@lists.linux-foundation.org>, Will Deacon <will@kernel.org>
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

On Thu, May 13, 2021 at 03:58:15PM +0800, Zhen Lei wrote:
> Function iommu_group_store_type() is the only caller of the static
> function iommu_change_dev_def_domain() and has performed
> "if (WARN_ON(!group))" detection before calling it. So the one here is
> redundant.
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/iommu/iommu.c | 3 ---
>  1 file changed, 3 deletions(-)

Applied, thanks.

> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 971068da67cb91d..8cdf6a1c4bfd773 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -3059,9 +3059,6 @@ static int iommu_change_dev_def_domain(struct iommu_group *group,
>  	int ret, dev_def_dom;
>  	struct device *dev;
>  
> -	if (!group)
> -		return -EINVAL;
> -
>  	mutex_lock(&group->mutex);
>  
>  	if (group->default_domain != group->domain) {
> -- 
> 2.26.0.106.g9fadedd
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
