Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id EB800348D42
	for <lists.iommu@lfdr.de>; Thu, 25 Mar 2021 10:43:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AF5840146;
	Thu, 25 Mar 2021 09:43:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NCy3rYEXaNZq; Thu, 25 Mar 2021 09:43:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B0F440193;
	Thu, 25 Mar 2021 09:43:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 558E1C000A;
	Thu, 25 Mar 2021 09:43:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF1C4C000A
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 09:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB85B606F6
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 09:43:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WS7Tjh5NupCm for <iommu@lists.linux-foundation.org>;
 Thu, 25 Mar 2021 09:43:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F3346058D
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 09:43:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C6F3961931;
 Thu, 25 Mar 2021 09:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616665430;
 bh=eENTV/2WbAryAaLD4hpq9VNWe08mSi4WHIkaaKt2C7c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DOdm2s3ChbtPnJs4nL0yY+ZnxIE01uypPPXNbASqHc1Cx7Wkt19ERUQX03Su+5rzi
 rfVH0i4sPoOtsrLCmBeSQ8RN74r0plUL/ZtMJBWDWuapbh5cUAXTIbf+yZomw5q1Q6
 8s9YOOmd/oZP47yU+4ciOTZG53ozcNmeaq6eUXWsF80FbEHvihZQOw8LTDka+m52ds
 mGepeG/ld/nEaNP53XIbk/yFqNpH6LA1sP0NiIpGA8vhjT4Ao6mV1im7SKPvajKg60
 TQ+U0ITn/INNY0SxfcGTiHaH0A5PLoNeE6M6C1Gqe6Os8ax3bf8Sp+TmV6pq9Wxhkq
 EkuachKz+4uCw==
Date: Thu, 25 Mar 2021 09:43:45 +0000
From: Will Deacon <will@kernel.org>
To: chenxiang <chenxiang66@hisilicon.com>, joro@8bytes.org
Subject: Re: [PATCH] iommu: Fix a boundary issue to avoid performance drop
Message-ID: <20210325094344.GB14042@willie-the-truck>
References: <1616643504-120688-1-git-send-email-chenxiang66@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616643504-120688-1-git-send-email-chenxiang66@hisilicon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, robin.murphy@arm.com,
 linuxarm@openeuler.org
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

[+ Joerg]

On Thu, Mar 25, 2021 at 11:38:24AM +0800, chenxiang wrote:
> From: Xiang Chen <chenxiang66@hisilicon.com>
> 
> After the change of patch ("iommu: Switch gather->end to the 
> inclusive end"), the performace drops from 1600+K IOPS to 1200K in our 
> kunpeng ARM64 platform.
> We find that the range [start1, end1) actually is joint from the range
> [end1, end2), but it is considered as disjoint after the change,
> so it needs more times of TLB sync, and spends more time on it.
> So fix the boundary issue to avoid performance drop.
> 
> Fixes: 862c3715de8f ("iommu: Switch gather->end to the inclusive end")
> Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
> ---
>  include/linux/iommu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index ae8eddd..4d5bcc2 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -547,7 +547,7 @@ static inline void iommu_iotlb_gather_add_page(struct iommu_domain *domain,
>  	 * structure can be rewritten.
>  	 */
>  	if (gather->pgsize != size ||
> -	    end < gather->start || start > gather->end) {
> +	    end + 1 < gather->start || start > gather->end + 1) {
>  		if (gather->pgsize)
>  			iommu_iotlb_sync(domain, gather);
>  		gather->pgsize = size;

Urgh, I must say I much preferred these things being exclusive, but this
looks like a necessary fix:

Acked-by: Will Deacon <will@kernel.org>

I wonder whether we should've just made these things u64s instead...

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
