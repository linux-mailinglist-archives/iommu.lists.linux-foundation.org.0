Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A37442C13D
	for <lists.iommu@lfdr.de>; Wed, 13 Oct 2021 15:19:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B44D5404EF;
	Wed, 13 Oct 2021 13:19:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PBo6-idddVND; Wed, 13 Oct 2021 13:19:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9F39B4018D;
	Wed, 13 Oct 2021 13:19:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C0A7C0022;
	Wed, 13 Oct 2021 13:19:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56575C000D
 for <iommu@lists.linux-foundation.org>; Wed, 13 Oct 2021 13:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34716404D7
 for <iommu@lists.linux-foundation.org>; Wed, 13 Oct 2021 13:19:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kr_ajr_PvL3c for <iommu@lists.linux-foundation.org>;
 Wed, 13 Oct 2021 13:19:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from rosenzweig.io (rosenzweig.io [138.197.143.207])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 118014018D
 for <iommu@lists.linux-foundation.org>; Wed, 13 Oct 2021 13:19:38 +0000 (UTC)
Date: Wed, 13 Oct 2021 08:51:04 -0400
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Wan Jiabing <wanjiabing@vivo.com>
Subject: Re: [PATCH] iommu/dart: use kmemdup instead of kzalloc and memcpy
Message-ID: <YWbWOMlMtx3h32Ei@sunset>
References: <20211013063441.29888-1-wanjiabing@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013063441.29888-1-wanjiabing@vivo.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 kael_w@yeah.net, Will Deacon <will@kernel.org>
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

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

On Wed, Oct 13, 2021 at 02:34:41AM -0400, Wan Jiabing wrote:
> Fix following coccicheck warning:
> drivers/iommu/apple-dart.c:704:20-27: WARNING opportunity for kmemdup
> 
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  drivers/iommu/apple-dart.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
> index 280ff8df728d..5eeb8d6b72e2 100644
> --- a/drivers/iommu/apple-dart.c
> +++ b/drivers/iommu/apple-dart.c
> @@ -701,13 +701,12 @@ static struct iommu_group *apple_dart_device_group(struct device *dev)
>  	if (!group)
>  		goto out;
>  
> -	group_master_cfg = kzalloc(sizeof(*group_master_cfg), GFP_KERNEL);
> +	group_master_cfg = kmemdup(cfg, sizeof(*group_master_cfg), GFP_KERNEL);
>  	if (!group_master_cfg) {
>  		iommu_group_put(group);
>  		goto out;
>  	}
>  
> -	memcpy(group_master_cfg, cfg, sizeof(*group_master_cfg));
>  	iommu_group_set_iommudata(group, group_master_cfg,
>  		apple_dart_release_group);
>  
> -- 
> 2.20.1
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
