Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8123A402F
	for <lists.iommu@lfdr.de>; Fri, 11 Jun 2021 12:32:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99AC84068D;
	Fri, 11 Jun 2021 10:32:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D23pjjAEEHl8; Fri, 11 Jun 2021 10:32:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7A2C440669;
	Fri, 11 Jun 2021 10:32:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44864C0024;
	Fri, 11 Jun 2021 10:32:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1CF10C000B
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 10:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08A504062B
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 10:32:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zLMqzz-hh483 for <iommu@lists.linux-foundation.org>;
 Fri, 11 Jun 2021 10:32:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A42F94064A
 for <iommu@lists.linux-foundation.org>; Fri, 11 Jun 2021 10:32:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 31CD661029;
 Fri, 11 Jun 2021 10:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623407545;
 bh=/CQOsHwg/yOw2FDU3YrXjCu+y0Ik2X28NsqtPXbhA6Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=npq7cLhUXsPk0RJBjvF1b/YxEEogwk0HgMimUI08IvHdOTu8u8rx6aSUFpLoqAJxS
 UM6K4zSGNRX9iOHnTHkw8uNL4uUbuQgoCjMwtm61sKUfNiQX1FUcYR/fsuZOly0nvk
 BR14ShuEsN2M6bNVYtydAg9KVCJI/O6I8L18mhO+nbUrnDgp1b+v2OMQyvNeg8BQLu
 5dtriRIU7zxU144oI2iktLNzjA81YeSmQDD+nxDqiWsbElH1l8Mxg2LghUkO+oZmrr
 yaHpFPYcmsIK0tomykeq+nhvobzJgpTC9KrWcEr1054xTzh4nN9Sz6vm9wlFY2k1DC
 oBrVfTYUNiQAA==
Date: Fri, 11 Jun 2021 11:32:20 +0100
From: Will Deacon <will@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 1/1] iommu/arm-smmu-v3: remove unnecessary oom message
Message-ID: <20210611103220.GB15274@willie-the-truck>
References: <20210609125438.14369-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210609125438.14369-1-thunder.leizhen@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Robin Murphy <robin.murphy@arm.com>,
 iommu <iommu@lists.linux-foundation.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

On Wed, Jun 09, 2021 at 08:54:38PM +0800, Zhen Lei wrote:
> Fixes scripts/checkpatch.pl warning:
> WARNING: Possible unnecessary 'out of memory' message
> 
> Remove it can help us save a bit of memory.
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 2ddc3cd5a7d1..fd7c55b44881 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2787,10 +2787,8 @@ static int arm_smmu_init_l1_strtab(struct arm_smmu_device *smmu)
>  	void *strtab = smmu->strtab_cfg.strtab;
>  
>  	cfg->l1_desc = devm_kzalloc(smmu->dev, size, GFP_KERNEL);
> -	if (!cfg->l1_desc) {
> -		dev_err(smmu->dev, "failed to allocate l1 stream table desc\n");
> +	if (!cfg->l1_desc)

What error do you get if devm_kzalloc() fails? I'd like to make sure it's
easy to track down _which_ allocation failed in that case -- does it give
you a line number, for example?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
