Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABC2F7688
	for <lists.iommu@lfdr.de>; Mon, 11 Nov 2019 15:37:46 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0A7E0CB0;
	Mon, 11 Nov 2019 14:37:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 065CEA95
	for <iommu@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 14:37:41 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BBD9712E
	for <iommu@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 14:37:40 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 956B321655;
	Mon, 11 Nov 2019 14:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573483060;
	bh=zRua+W/OXpoT6rPkS0FoAqe1tWUfeIAMJIZnqn4qqxg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vfXZ5zZoDzwQT5hwJ2MVW16ffjW1d5UUDhDCRgrE7mDMbtIXhRCyQ7immT/ZJpIPg
	vl88r5ejbTpLGm/AhRMEZ5CGznC1t4UG6ai2DtFCLzBCpzbLaoe2W6KztHJtf0XMnJ
	UnDcprY4jGSG+lXaW9Ld1kPpDSFuawDnFa6WuOGQ=
Date: Mon, 11 Nov 2019 14:37:36 +0000
From: Will Deacon <will@kernel.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH 2/2] iommu/arm-smmu: Remove duplicate error message
Message-ID: <20191111143736.GB10488@willie-the-truck>
References: <20191111111721.4145919-1-jean-philippe@linaro.org>
	<20191111111721.4145919-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191111111721.4145919-2-jean-philippe@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Mon, Nov 11, 2019 at 12:17:21PM +0100, Jean-Philippe Brucker wrote:
> Since commit 7723f4c5ecdb ("driver core: platform: Add an error message
> to platform_get_irq*()"), platform_get_irq() displays an error when the
> IRQ isn't found. Remove the error print from the SMMU driver. Note the
> slight change of behaviour: no message is printed if platform_get_irq()
> returns -EPROBE_DEFER, which probably doesn't concern the SMMU.
> 
> Fixes: 7723f4c5ecdb ("driver core: platform: Add an error message to platform_get_irq*()")
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  drivers/iommu/arm-smmu.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 7c503a6bc585..6f676686752c 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -2062,10 +2062,8 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>  	for (i = 0; i < num_irqs; ++i) {
>  		int irq = platform_get_irq(pdev, i);
>  
> -		if (irq < 0) {
> -			dev_err(dev, "failed to get irq index %d\n", i);
> +		if (irq < 0)
>  			return -ENODEV;
> -		}
>  		smmu->irqs[i] = irq;
>  	}

Acked-by: Will Deacon <will@kernel.org>

Thanks,

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
