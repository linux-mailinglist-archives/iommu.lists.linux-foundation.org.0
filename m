Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 62511304BF8
	for <lists.iommu@lfdr.de>; Tue, 26 Jan 2021 23:23:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CEAB98522E;
	Tue, 26 Jan 2021 22:23:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W46S3I8z1HdE; Tue, 26 Jan 2021 22:23:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DC23885218;
	Tue, 26 Jan 2021 22:23:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CD84AC013A;
	Tue, 26 Jan 2021 22:23:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 32154C013A
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 22:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2241186FC5
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 22:23:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LMLyU0lcvn9f for <iommu@lists.linux-foundation.org>;
 Tue, 26 Jan 2021 22:23:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 17DC286FAD
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 22:23:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D75302065D;
 Tue, 26 Jan 2021 22:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611699792;
 bh=fdRIENxKcgc5beyovt2puqoCoi+rEtNpR+KyZhmJt9I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=achoEHu8k4uN8E83dNG429NPT1uvW4BKjuDha0qFlXbMfhUNqyWIOkGFmn5FIYQjx
 AAQs2T+cmT/3KagO8qWzYc02+OPzJ8Y0qoV6PONAnxAgS75ryj9A2u9zfPw9P6NK8M
 cHG5i9P/T7hfT5C7tU+Gu5rsDwAD1jYs0hcLmgrgWzCKcc2j5HXL5Tr/whN3VyMMdQ
 bx4w3RT7i0ULUk3PrLkCR1ZpN3A9ZiqNQD7ru816XaXg4IngNyw1pIqGVHsHxZ/upn
 BHC4hf5TqThjyZuxdwR0BPmGGFv4S+W11JMY00+TYtCZw7qigBK4Q9XevrSXLk7/eK
 peDrVc1pqOHww==
Date: Tue, 26 Jan 2021 22:23:06 +0000
From: Will Deacon <will@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v6 07/33] iommu: Avoid reallocate default domain for a
 group
Message-ID: <20210126222305.GB30460@willie-the-truck>
References: <20210111111914.22211-1-yong.wu@mediatek.com>
 <20210111111914.22211-8-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210111111914.22211-8-yong.wu@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
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

On Mon, Jan 11, 2021 at 07:18:48PM +0800, Yong Wu wrote:
> If group->default_domain exists, avoid reallocate it.
> 
> In some iommu drivers, there may be several devices share a group. Avoid
> realloc the default domain for this case.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/iommu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 3d099a31ddca..f4b87e6abe80 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -266,7 +266,8 @@ int iommu_probe_device(struct device *dev)
>  	 * support default domains, so the return value is not yet
>  	 * checked.
>  	 */
> -	iommu_alloc_default_domain(group, dev);
> +	if (!group->default_domain)
> +		iommu_alloc_default_domain(group, dev);

I don't really get what this achieves, since iommu_alloc_default_domain()
looks like this:

static int iommu_alloc_default_domain(struct iommu_group *group,
				      struct device *dev)
{
	unsigned int type;

	if (group->default_domain)
		return 0;

	...

in which case, it should be fine?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
