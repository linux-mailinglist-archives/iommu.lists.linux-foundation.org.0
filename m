Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5951E0F02
	for <lists.iommu@lfdr.de>; Mon, 25 May 2020 15:03:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E14AB86959;
	Mon, 25 May 2020 13:03:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4wwOfEpzmvYI; Mon, 25 May 2020 13:03:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6C91C86937;
	Mon, 25 May 2020 13:03:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4559CC016F;
	Mon, 25 May 2020 13:03:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54330C016F
 for <iommu@lists.linux-foundation.org>; Mon, 25 May 2020 13:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3EB8086959
 for <iommu@lists.linux-foundation.org>; Mon, 25 May 2020 13:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l53NilhFVvlm for <iommu@lists.linux-foundation.org>;
 Mon, 25 May 2020 13:02:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 565A186937
 for <iommu@lists.linux-foundation.org>; Mon, 25 May 2020 13:02:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 17DBFACDB;
 Mon, 25 May 2020 13:02:58 +0000 (UTC)
Date: Mon, 25 May 2020 15:02:53 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH] iommu: Fix group refcount in iommu_alloc_default_domain()
Message-ID: <20200525130253.GH5075@suse.de>
References: <20200522130145.30067-1-saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200522130145.30067-1-saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Douglas Anderson <dianders@chromium.org>,
 iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

Hi,

On Fri, May 22, 2020 at 06:31:45PM +0530, Sai Prakash Ranjan wrote:
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index a4c2f122eb8b..05f7b77c432f 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -1491,6 +1491,7 @@ static int iommu_alloc_default_domain(struct device *dev)
>  {
>  	struct iommu_group *group;
>  	unsigned int type;
> +	int ret;
>  
>  	group = iommu_group_get(dev);
>  	if (!group)
> @@ -1501,7 +1502,11 @@ static int iommu_alloc_default_domain(struct device *dev)
>  
>  	type = iommu_get_def_domain_type(dev);
>  
> -	return iommu_group_alloc_default_domain(dev->bus, group, type);
> +	ret = iommu_group_alloc_default_domain(dev->bus, group, type);
> +
> +	iommu_group_put(group);
> +
> +	return ret;
>  }
>  
>  /**

Thanks for the report and the fix. I think it is better to fix this by
not taking a group reference in iommu_alloc_default_domain() at all and
pass group as a parameter. Please see the patch I just sent out.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
