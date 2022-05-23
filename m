Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 235B4530E96
	for <lists.iommu@lfdr.de>; Mon, 23 May 2022 13:54:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAB6841923;
	Mon, 23 May 2022 11:54:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pPN2sC6uf5jU; Mon, 23 May 2022 11:54:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8EA3041920;
	Mon, 23 May 2022 11:54:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51380C0081;
	Mon, 23 May 2022 11:54:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15FD1C002D
 for <iommu@lists.linux-foundation.org>; Mon, 23 May 2022 11:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0306F60D75
 for <iommu@lists.linux-foundation.org>; Mon, 23 May 2022 11:54:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7W65iOUf_57o for <iommu@lists.linux-foundation.org>;
 Mon, 23 May 2022 11:54:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5E0E860BB0
 for <iommu@lists.linux-foundation.org>; Mon, 23 May 2022 11:54:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F0A82612DD;
 Mon, 23 May 2022 11:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D2DC385AA;
 Mon, 23 May 2022 11:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653306848;
 bh=yiHuvRq2ifZnUcEmcstVnk0KFOc8FpIy8LiSvJGaPUs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MBoIiS0IqElh+FJnYtAdIXyQJdqQ8pbXMPdfXmeNH2Sbrqx5nOeJSAV+V9pcOnl5X
 7RkL/HuANJjhMo5PPFj3/y62N5fv2ld+1YvURco2jEDmndYGy1EpRcDc2UWHCQ1jue
 5I9icP/Ho1+tq8VldMg0Ze4VSXUsb+oY94ot/fv7OlRixVkDYOOVoqWIjpVSNZlave
 XVmc7CBKq2BA+0cQrxa3TxJOX+FqlhFn9NwYbHEFYiQf4DD14xfdLijOho9S8AVdnD
 mjwDrMj5oB5kdQuE7I8/LnYUxGF+vrrsKX8Z1DaKHUFPjuYYMFtBuaFdyhHebZ5PMw
 mlMfQ0nFt7hAg==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1nt6dQ-00031b-De; Mon, 23 May 2022 13:54:04 +0200
Date: Mon, 23 May 2022 13:54:04 +0200
From: Johan Hovold <johan@kernel.org>
To: cgel.zte@gmail.com
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Avoid leak OF node on error
Message-ID: <Yot13L7XgvxTkgnE@hovoldconsulting.com>
References: <20220523111145.2976-1-chi.minghao@zte.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220523111145.2976-1-chi.minghao@zte.com.cn>
Cc: linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>,
 iommu@lists.linux-foundation.org, will@kernel.org,
 Zeal Robot <zealci@zte.com.cn>
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

On Mon, May 23, 2022 at 11:11:45AM +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> The OF node should be put before returning error in ipmmu_init(),
> otherwise node's refcount will be leaked.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> ---
>  drivers/iommu/ipmmu-vmsa.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> index 8fdb84b3642b..f6440b106f46 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -1179,11 +1179,10 @@ static int __init ipmmu_init(void)
>  		return 0;
>  
>  	np = of_find_matching_node(NULL, ipmmu_of_ids);
> +	of_node_put(np);
>  	if (!np)
>  		return 0;
>  
> -	of_node_put(np);
> -
>  	ret = platform_driver_register(&ipmmu_driver);
>  	if (ret < 0)
>  		return ret;

NAK
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
