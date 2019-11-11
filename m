Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A4222F76C4
	for <lists.iommu@lfdr.de>; Mon, 11 Nov 2019 15:43:43 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 378BDCBD;
	Mon, 11 Nov 2019 14:43:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F2393AD0
	for <iommu@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 14:43:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 996F012E
	for <iommu@lists.linux-foundation.org>;
	Mon, 11 Nov 2019 14:43:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 052C131B;
	Mon, 11 Nov 2019 06:43:35 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2AC603F52E;
	Mon, 11 Nov 2019 06:43:33 -0800 (PST)
Subject: Re: [PATCH 2/2] iommu/arm-smmu: Remove duplicate error message
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org
References: <20191111111721.4145919-1-jean-philippe@linaro.org>
	<20191111111721.4145919-2-jean-philippe@linaro.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <09ac62ed-c483-79ba-bd31-939b50e8d20f@arm.com>
Date: Mon, 11 Nov 2019 14:43:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191111111721.4145919-2-jean-philippe@linaro.org>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: will@kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 11/11/2019 11:17, Jean-Philippe Brucker wrote:
> Since commit 7723f4c5ecdb ("driver core: platform: Add an error message
> to platform_get_irq*()"), platform_get_irq() displays an error when the
> IRQ isn't found. Remove the error print from the SMMU driver. Note the
> slight change of behaviour: no message is printed if platform_get_irq()
> returns -EPROBE_DEFER, which probably doesn't concern the SMMU.
> 
> Fixes: 7723f4c5ecdb ("driver core: platform: Add an error message to platform_get_irq*()")
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>   drivers/iommu/arm-smmu.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
> index 7c503a6bc585..6f676686752c 100644
> --- a/drivers/iommu/arm-smmu.c
> +++ b/drivers/iommu/arm-smmu.c
> @@ -2062,10 +2062,8 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>   	for (i = 0; i < num_irqs; ++i) {
>   		int irq = platform_get_irq(pdev, i);
>   
> -		if (irq < 0) {
> -			dev_err(dev, "failed to get irq index %d\n", i);
> +		if (irq < 0)
>   			return -ENODEV;

It's a preexisting issue, but we should really "return irq" here.

Robin.

> -		}
>   		smmu->irqs[i] = irq;
>   	}
>   
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
