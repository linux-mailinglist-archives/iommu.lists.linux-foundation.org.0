Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0446E30F6AB
	for <lists.iommu@lfdr.de>; Thu,  4 Feb 2021 16:45:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8687287204;
	Thu,  4 Feb 2021 15:45:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aoCMC0DM+AsQ; Thu,  4 Feb 2021 15:45:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1CD9B8720A;
	Thu,  4 Feb 2021 15:45:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 086D0C013A;
	Thu,  4 Feb 2021 15:45:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A2A9C013A
 for <iommu@lists.linux-foundation.org>; Thu,  4 Feb 2021 15:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 00444203F8
 for <iommu@lists.linux-foundation.org>; Thu,  4 Feb 2021 15:45:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id shL-nh13okCr for <iommu@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 15:45:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 3631D203F7
 for <iommu@lists.linux-foundation.org>; Thu,  4 Feb 2021 15:45:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 39B5864F4A;
 Thu,  4 Feb 2021 15:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612453527;
 bh=lI0HC3GQbRFgXxSEIB/73Da0jQE/c8jAVtTEPB7vO28=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Hw7jGjaOFkLAvQ61LL+VxqPi61iCFS1TZYi2B+cwgM1q3w4+wR4x7emm3TtBViZSm
 2GrhUdgflJlyA+3u1JkgT7g8skKX5b+ttzIYkKYfQUS0BUV02aYO6Vu9aMuWtT+a/J
 HYXBSDBHv3esRV8xFzPZ0ZZsEwLG6E7+g0tJKRYthwIUBadcNIZ4Nl+Fc5PzKNxBkS
 P4ep96lwNbV642I7ry+o7/5eT0bzGj2Is8PseM6TWB5lR91u2uVlVK+KG6Guhsy/Mx
 FHr2kz+NeXH4zrLOD04Eq42qyz8QOF9S1LNXYEOhfHwN0aDczIa6cgbUbFdj5jW86r
 Sgee71aeHeEGQ==
Date: Thu, 4 Feb 2021 15:45:23 +0000
From: Will Deacon <will@kernel.org>
To: Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][next][V2] iommu/mediatek: Fix unsigned domid comparison
 with less than zero
Message-ID: <20210204154522.GD21058@willie-the-truck>
References: <20210204150001.102672-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204150001.102672-1-colin.king@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

On Thu, Feb 04, 2021 at 03:00:01PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the check for domid < 0 is always false because domid
> is unsigned. Fix this by casting domid to an int before making
> the comparison.
> 
> Addresses-Coverity: ("Unsigned comparison against 0")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: cast domid rather than making it an int. Replace L with : in
>     the commit message.
> 
> ---
>  drivers/iommu/mtk_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 0ad14a7604b1..1f262621ef19 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -645,7 +645,7 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
>  	struct iommu_resv_region *region;
>  	int prot = IOMMU_WRITE | IOMMU_READ;
>  
> -	if (domid < 0)
> +	if ((int)domid < 0)
>  		return;
>  	curdom = data->plat_data->iova_region + domid;
>  	for (i = 0; i < data->plat_data->iova_region_nr; i++) {

Thanks, Colin.

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
