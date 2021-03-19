Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 53651341CE6
	for <lists.iommu@lfdr.de>; Fri, 19 Mar 2021 13:26:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC43783B93;
	Fri, 19 Mar 2021 12:26:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jnpw90JgvWLZ; Fri, 19 Mar 2021 12:26:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id B156383B81;
	Fri, 19 Mar 2021 12:26:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85B71C0010;
	Fri, 19 Mar 2021 12:26:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 507D3C0001
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 12:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30E674EC3F
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 12:26:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ljC8rtiNlkEv for <iommu@lists.linux-foundation.org>;
 Fri, 19 Mar 2021 12:26:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58A4F4EC1C
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 12:26:46 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 732662DA; Fri, 19 Mar 2021 13:26:42 +0100 (CET)
Date: Fri, 19 Mar 2021 13:26:40 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] iommu: Fix spelling mistake "sixe" -> "size"
Message-ID: <YFSYgNiQP7HOWS2i@8bytes.org>
References: <20210319095750.5624-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210319095750.5624-1-colin.king@canonical.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Baolin Wang <baolin.wang7@gmail.com>, Orson Zhai <orsonzhai@gmail.com>,
 Will Deacon <will@kernel.org>
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

On Fri, Mar 19, 2021 at 09:57:50AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a dev_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/iommu/sprd-iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

> 
> diff --git a/drivers/iommu/sprd-iommu.c b/drivers/iommu/sprd-iommu.c
> index 7100ed17dcce..e1dc2f7d5639 100644
> --- a/drivers/iommu/sprd-iommu.c
> +++ b/drivers/iommu/sprd-iommu.c
> @@ -297,7 +297,7 @@ static int sprd_iommu_map(struct iommu_domain *domain, unsigned long iova,
>  	}
>  
>  	if (iova < start || (iova + size) > (end + 1)) {
> -		dev_err(dom->sdev->dev, "(iova(0x%lx) + sixe(%zx)) are not in the range!\n",
> +		dev_err(dom->sdev->dev, "(iova(0x%lx) + size(%zx)) are not in the range!\n",
>  			iova, size);
>  		return -EINVAL;
>  	}
> -- 
> 2.30.2
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
