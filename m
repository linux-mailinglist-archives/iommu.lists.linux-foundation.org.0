Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 3835230EFA1
	for <lists.iommu@lfdr.de>; Thu,  4 Feb 2021 10:26:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BB8BD203E8;
	Thu,  4 Feb 2021 09:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TjnYehvrrdYg; Thu,  4 Feb 2021 09:26:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 14E1220770;
	Thu,  4 Feb 2021 09:26:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5996C013A;
	Thu,  4 Feb 2021 09:26:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 604B6C013A
 for <iommu@lists.linux-foundation.org>; Thu,  4 Feb 2021 09:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 456FC85F19
 for <iommu@lists.linux-foundation.org>; Thu,  4 Feb 2021 09:26:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bdNZotUq2QxB for <iommu@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 09:26:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B8BB485E6B
 for <iommu@lists.linux-foundation.org>; Thu,  4 Feb 2021 09:26:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2B8A964F48;
 Thu,  4 Feb 2021 09:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612430764;
 bh=iPr0CA2pIHDHh2dXkae4rNvFekouTDxQFLqezinvrzI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pWSNLJIttnbgsu3Ltschs2qhIDAn3WsWGlCpTGDn5YCZSXTbF+ZoZJYp0uzRXGLOU
 tEkRiLiu80c4yGmWLO8kZbRsZ+ye9vUeOtYUWDa1aDk11OOplr9Z86NsjPVDmZlVFV
 62t8B3MrYdVi37kaqdN5IqTn8aVW6QFgVn6hlKoeiEKsQGjw+RNmZtUdsac/7qvYsG
 AHseRnGyZ9DloI+Ng/A6MPwGv6q8duHiDS5+0rIOv2Bj5rWl+XqbxC5pmGwORXlqkY
 dHcM2nOLZyKERvGRzkEWss4zBUQe6q9y7H4Oca3P3p2GswRWxJfqy5QbZG6UmA3syV
 7BbxUlIPU5i+w==
Date: Thu, 4 Feb 2021 09:25:58 +0000
From: Will Deacon <will@kernel.org>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next] iommu/mediatek: Fix unsigned domid comparison with
 less than zero
Message-ID: <20210204092558.GA20244@willie-the-truck>
References: <20210203135936.23016-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210203135936.23016-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Anan sun <anan.sun@mediatek.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chao Hao <chao.hao@mediatek.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
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

On Wed, Feb 03, 2021 at 01:59:36PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the check for domid < 0 is always false because domid
> is unsigned.  Fix this by making it signed.
> 
> Addresses-CoverityL ("Unsigned comparison against 0")

Typo here ('L' instead of ':')

> Fixes: ab1d5281a62b ("iommu/mediatek: Add iova reserved function")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/iommu/mtk_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 0ad14a7604b1..823d719945b2 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -640,7 +640,7 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
>  				       struct list_head *head)
>  {
>  	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
> -	unsigned int domid = mtk_iommu_get_domain_id(dev, data->plat_data), i;
> +	int domid = mtk_iommu_get_domain_id(dev, data->plat_data), i;

Not sure if it's intentional, but this also makes 'i' signed. It probably
should remain 'unsigned' to match 'iova_region_nr' in
'struct mtk_iommu_plat_data'.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
