Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEF02D0F03
	for <lists.iommu@lfdr.de>; Mon,  7 Dec 2020 12:29:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2BF122E1CD;
	Mon,  7 Dec 2020 11:29:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RMRJw4NuH-6M; Mon,  7 Dec 2020 11:29:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 79F6F2E1B8;
	Mon,  7 Dec 2020 11:29:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69650C013B;
	Mon,  7 Dec 2020 11:29:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B51ECC013B
 for <iommu@lists.linux-foundation.org>; Mon,  7 Dec 2020 11:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 947692E1B8
 for <iommu@lists.linux-foundation.org>; Mon,  7 Dec 2020 11:29:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9+hBDd9rIVWx for <iommu@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 11:29:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 2419A2151F
 for <iommu@lists.linux-foundation.org>; Mon,  7 Dec 2020 11:29:49 +0000 (UTC)
Date: Mon, 7 Dec 2020 11:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607340588;
 bh=PevOltpfSoa2VOQzzFcjWvvt+OU00vpXvLK5/D5qUXs=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=AUlQ9xfaq8dqQacDDAfA5Uncdfa9Y/1YFXLxQOPDFvSbZFX9TYSD2L2X9hVQRznoc
 WrRiS/8fM+PI2qboUZ0dwY88Lhl55Skm+GRDg0J9D0ydxQQisAApZPp0Y0l96gXQ3R
 ayrNFU+nY8ztzdSjEz1ApPGkb+e1F3jyRnfk0b9dD6NWb4+k1jRewsO/gtXQou2MqL
 Sp4EMQH/mXCnnNjFg25z7RV7DfLfCIyefjNGXzYp+dbZv8T1B8uS84D3rWFaijwbp/
 Q4LohxUXYQj7pEEyOxZVtIswB8p3pU41/HlQ19FzTIFAhAZo285PXqh5A0bjpiVrw6
 IYvTNP0Rhmfbw==
From: Will Deacon <will@kernel.org>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Fix not checking return value about
 devm_add_action
Message-ID: <20201207112943.GC4379@willie-the-truck>
References: <1607340209-51539-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607340209-51539-1-git-send-email-tiantao6@hisilicon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: jean-philippe@linaro.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com,
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

On Mon, Dec 07, 2020 at 07:23:29PM +0800, Tian Tao wrote:
> Use devm_add_action_or_reset to avoid the situation where the release
> function is not called when devm_add_action returns an error.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> 
> v2:
> check the return value about evm_add_action_or_reset()
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 2ddf5ec..76c28e7 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2680,7 +2680,8 @@ static int arm_smmu_cmdq_init(struct arm_smmu_device *smmu)
>  		ret = -ENOMEM;
>  	} else {
>  		cmdq->valid_map = bitmap;
> -		devm_add_action(smmu->dev, arm_smmu_cmdq_free_bitmap, bitmap);
> +		ret = devm_add_action_or_reset(smmu->dev,
> +					       arm_smmu_cmdq_free_bitmap, bitmap);
>  	}
>  
>  	return ret;
> @@ -2938,7 +2939,7 @@ static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
>  	}
>  
>  	/* Add callback to free MSIs on teardown */
> -	devm_add_action(dev, arm_smmu_free_msis, dev);
> +	devm_add_action_or_reset(dev, arm_smmu_free_msis, dev);

Hmm, but you don't propagate the error here so couldn't this lead to a
use-after-free?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
