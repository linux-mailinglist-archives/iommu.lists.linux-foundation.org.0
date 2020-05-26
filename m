Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A23851BF801
	for <lists.iommu@lfdr.de>; Thu, 30 Apr 2020 14:18:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5F48587DF3;
	Thu, 30 Apr 2020 12:18:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sLya1-F6VZm3; Thu, 30 Apr 2020 12:18:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E6EF8883AE;
	Thu, 30 Apr 2020 12:18:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C1063C088F;
	Thu, 30 Apr 2020 12:18:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22979C016F
 for <iommu@lists.linux-foundation.org>; Thu, 30 Apr 2020 12:17:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1E9FE882B1
 for <iommu@lists.linux-foundation.org>; Thu, 30 Apr 2020 12:17:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cz2SDvxSfZca for <iommu@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 12:17:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9FEF187DF3
 for <iommu@lists.linux-foundation.org>; Thu, 30 Apr 2020 12:17:58 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 532902078D;
 Thu, 30 Apr 2020 12:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588249078;
 bh=Jxl7X4/2xHZsq2VoerxXMaWQ7OlOsC6VeBsNq81l13I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qIub6Ac+iYrS/qJmT8E2550S9CwB8sr7irDEUjXVh5qpdHc+Kd87zf7zzd98jcv7e
 0yJp37EYJxQQwPvtPgIktgpo8QUIMfTSTUwJiC9W9nqeWRQ8UJLuiZmJRO9lakYCbE
 PWghczXzDkJMiZtGZ4G7IMyxSoCFP0mLsTNNT6i4=
Date: Thu, 30 Apr 2020 13:17:53 +0100
From: Will Deacon <will@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] drivers/iommu: properly export iommu_group_get_for_dev
Message-ID: <20200430121753.GA22842@willie-the-truck>
References: <20200430120120.2948448-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200430120120.2948448-1-gregkh@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Joerg Roedel <jroedel@suse.de>, iommu@lists.linux-foundation.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Thu, Apr 30, 2020 at 02:01:20PM +0200, Greg Kroah-Hartman wrote:
> In commit a7ba5c3d008d ("drivers/iommu: Export core IOMMU API symbols to
> permit modular drivers") a bunch of iommu symbols were exported, all
> with _GPL markings except iommu_group_get_for_dev().  That export should
> also be _GPL like the others.
> 
> Cc: Will Deacon <will@kernel.org>
> Cc: Joerg Roedel <jroedel@suse.de>
> Cc: John Garry <john.garry@huawei.com>
> Fixes: a7ba5c3d008d ("drivers/iommu: Export core IOMMU API symbols to permit modular drivers")
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/iommu/iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 2b471419e26c..1ecbc8788fe7 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1428,7 +1428,7 @@ struct iommu_group *iommu_group_get_for_dev(struct device *dev)
>  
>  	return group;
>  }
> -EXPORT_SYMBOL(iommu_group_get_for_dev);
> +EXPORT_SYMBOL_GPL(iommu_group_get_for_dev);
>  
>  struct iommu_domain *iommu_group_default_domain(struct iommu_group *group)
>  {

Thanks, not sure how I managed to screw this up in the original patch!

Acked-by: Will Deacon <will@kernel.org>

Joerg -- can you pick this one up please?

Cheers,

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
