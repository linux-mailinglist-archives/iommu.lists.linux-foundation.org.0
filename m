Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FB7275D4A
	for <lists.iommu@lfdr.de>; Wed, 23 Sep 2020 18:24:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7EA4720397;
	Wed, 23 Sep 2020 16:24:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xxa8wsra9Z-R; Wed, 23 Sep 2020 16:24:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8C0282037B;
	Wed, 23 Sep 2020 16:24:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C1A1C0859;
	Wed, 23 Sep 2020 16:24:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F13EC0051
 for <iommu@lists.linux-foundation.org>; Wed, 23 Sep 2020 16:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5B7D183470
 for <iommu@lists.linux-foundation.org>; Wed, 23 Sep 2020 16:24:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lsN1Krk-zBdk for <iommu@lists.linux-foundation.org>;
 Wed, 23 Sep 2020 16:24:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 23A34823E6
 for <iommu@lists.linux-foundation.org>; Wed, 23 Sep 2020 16:24:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 736E630E;
 Wed, 23 Sep 2020 09:24:53 -0700 (PDT)
Received: from [10.57.48.76] (unknown [10.57.48.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2D263F718;
 Wed, 23 Sep 2020 09:24:52 -0700 (PDT)
Subject: Re: [PATCH] iommu: of: skip iommu_device_list traversal in
 of_iommu_xlate()
To: Charan Teja Reddy <charante@codeaurora.org>, joro@8bytes.org,
 iommu@lists.linux-foundation.org
References: <1600872826-2254-1-git-send-email-charante@codeaurora.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <8722e4bc-efe0-27c4-2b7d-626188da5bfb@arm.com>
Date: Wed, 23 Sep 2020 17:24:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <1600872826-2254-1-git-send-email-charante@codeaurora.org>
Content-Language: en-GB
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

On 2020-09-23 15:53, Charan Teja Reddy wrote:
> In of_iommu_xlate(), check if iommu device is enabled before traversing
> the iommu_device_list through iommu_ops_from_fwnode(). It is of no use
> in traversing the iommu_device_list only to return NO_IOMMU because of
> iommu device node is disabled.

Well, the "use" is that it keeps the code that much smaller and simpler 
to have a single path for returning this condition. This whole callstack 
isn't exactly a high-performance code path to begin with, and we've 
always assumed that IOMMUs present but disabled in DT would be a pretty 
rare exception. Do you have a system that challenges those assumptions 
and shows any benefit from this change?

Robin.

> Signed-off-by: Charan Teja Reddy <charante@codeaurora.org>
> ---
>   drivers/iommu/of_iommu.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index e505b91..225598c 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -94,9 +94,10 @@ static int of_iommu_xlate(struct device *dev,
>   	struct fwnode_handle *fwnode = &iommu_spec->np->fwnode;
>   	int ret;
>   
> +	if (!of_device_is_available(iommu_spec->np))
> +		return NO_IOMMU;
>   	ops = iommu_ops_from_fwnode(fwnode);
> -	if ((ops && !ops->of_xlate) ||
> -	    !of_device_is_available(iommu_spec->np))
> +	if (ops && !ops->of_xlate)
>   		return NO_IOMMU;
>   
>   	ret = iommu_fwspec_init(dev, &iommu_spec->np->fwnode, ops);
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
