Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0969147E475
	for <lists.iommu@lfdr.de>; Thu, 23 Dec 2021 15:19:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D5AB4162A;
	Thu, 23 Dec 2021 14:19:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xmMTGT8FZeUn; Thu, 23 Dec 2021 14:19:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6CA8041625;
	Thu, 23 Dec 2021 14:19:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 31B6AC006E;
	Thu, 23 Dec 2021 14:19:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BDCCDC0012
 for <iommu@lists.linux-foundation.org>; Thu, 23 Dec 2021 14:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5A63415D9
 for <iommu@lists.linux-foundation.org>; Thu, 23 Dec 2021 14:19:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wlIjqp-60XX4 for <iommu@lists.linux-foundation.org>;
 Thu, 23 Dec 2021 14:19:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC16D41581
 for <iommu@lists.linux-foundation.org>; Thu, 23 Dec 2021 14:19:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2D186D6E;
 Thu, 23 Dec 2021 06:19:32 -0800 (PST)
Received: from [10.57.66.229] (unknown [10.57.66.229])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E41FB3F5A1;
 Thu, 23 Dec 2021 06:19:29 -0800 (PST)
Message-ID: <09bf1d0a-44d8-b382-2e08-e0c79f4fbbaf@arm.com>
Date: Thu, 23 Dec 2021 14:19:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 2/2] iommu/arm-smmu: Propagate errors from
 platform_get_irq()
Content-Language: en-GB
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Rob Clark <robdclark@chromium.org>, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org
References: <20211223130046.9365-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211223130046.9365-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20211223130046.9365-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Xin Tan <tanxin.ctf@gmail.com>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
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

On 2021-12-23 13:00, Lad Prabhakar wrote:
> The driver overrides the error code returned by platform_get_irq() to
> -ENODEV. Switch to propagating the error code upstream so that errors
> such as -EPROBE_DEFER are handled.

I wouldn't usually expect an SMMU to be wired up to a secondary 
interrupt controller that could cause deferral, but on the other hand I 
don't think there's any good reason *not* to propagate the original 
error anyway, so sure, why not.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Fixes: 9ec36cafe43b ("of/irq: do irq resolution in platform_get_irq")
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 4844cd075644..6cf5612efcda 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -2129,7 +2129,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>   		int irq = platform_get_irq(pdev, i);
>   
>   		if (irq < 0)
> -			return -ENODEV;
> +			return irq;
>   		smmu->irqs[i] = irq;
>   	}
>   
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
