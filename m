Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5341359FF
	for <lists.iommu@lfdr.de>; Thu,  9 Jan 2020 14:23:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 95AFE86B9E;
	Thu,  9 Jan 2020 13:23:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UlmiySyiUX9B; Thu,  9 Jan 2020 13:23:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8E94C86B7B;
	Thu,  9 Jan 2020 13:23:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6EECEC1796;
	Thu,  9 Jan 2020 13:23:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 543C4C0881
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 13:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3421588020
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 13:23:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WgrCWXceFiSn for <iommu@lists.linux-foundation.org>;
 Thu,  9 Jan 2020 13:23:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8E2C887C30
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 13:23:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C00EE31B;
 Thu,  9 Jan 2020 05:23:16 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAA833F534;
 Thu,  9 Jan 2020 05:23:15 -0800 (PST)
Subject: Re: [PATCH] iommu/arm-smmu-v3: fix resource_size check
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org
References: <20191226095056.30256-1-yamada.masahiro@socionext.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <2cd8ed11-56df-b46b-aa21-5ecc0e2e3082@arm.com>
Date: Thu, 9 Jan 2020 13:23:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191226095056.30256-1-yamada.masahiro@socionext.com>
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

On 26/12/2019 9:50 am, Masahiro Yamada wrote:
> This is an off-by-one mistake.
> 
> resource_size() returns res->end - res->start + 1.

Heh, despite the optimism of "Avoid one-off errors by introducing a 
resource_size() function", life finds a way...

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
>   drivers/iommu/arm-smmu-v3.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
> index d9e0d9c19b4f..b463599559d2 100644
> --- a/drivers/iommu/arm-smmu-v3.c
> +++ b/drivers/iommu/arm-smmu-v3.c
> @@ -3599,7 +3599,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>   
>   	/* Base address */
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (resource_size(res) + 1 < arm_smmu_resource_size(smmu)) {
> +	if (resource_size(res) < arm_smmu_resource_size(smmu)) {
>   		dev_err(dev, "MMIO region too small (%pr)\n", res);
>   		return -EINVAL;
>   	}
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
