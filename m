Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C8F1ABD86
	for <lists.iommu@lfdr.de>; Thu, 16 Apr 2020 12:05:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 289E18626B;
	Thu, 16 Apr 2020 10:05:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cZAxS13NtLfE; Thu, 16 Apr 2020 10:05:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3926686265;
	Thu, 16 Apr 2020 10:05:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A5C5C0172;
	Thu, 16 Apr 2020 10:05:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4A33C0172
 for <iommu@lists.linux-foundation.org>; Thu, 16 Apr 2020 10:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 988C0220CE
 for <iommu@lists.linux-foundation.org>; Thu, 16 Apr 2020 10:05:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eMPDC-VjoDs9 for <iommu@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 10:05:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id 45061214E4
 for <iommu@lists.linux-foundation.org>; Thu, 16 Apr 2020 10:05:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEFD6C14;
 Thu, 16 Apr 2020 03:05:28 -0700 (PDT)
Received: from [10.57.59.184] (unknown [10.57.59.184])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 897873F73D;
 Thu, 16 Apr 2020 03:05:27 -0700 (PDT)
Subject: Re: [PATCH] iommu/qcom:fix local_base status check
To: Tang Bin <tangbin@cmss.chinamobile.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, robdclark@gmail.com
References: <20200402063302.20640-1-tangbin@cmss.chinamobile.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <7f8cadbf-2568-19f5-610f-6ae7d9846ec6@arm.com>
Date: Thu, 16 Apr 2020 11:05:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200402063302.20640-1-tangbin@cmss.chinamobile.com>
Content-Language: en-GB
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
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

On 2020-04-02 7:33 am, Tang Bin wrote:
> Release resources when exiting on error.
> 
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>   drivers/iommu/qcom_iommu.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
> index 4328da0b0..c08aa9651 100644
> --- a/drivers/iommu/qcom_iommu.c
> +++ b/drivers/iommu/qcom_iommu.c
> @@ -813,8 +813,11 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>   	qcom_iommu->dev = dev;
>   
>   	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (res)
> +	if (res) {
>   		qcom_iommu->local_base = devm_ioremap_resource(dev, res);
> +		if (IS_ERR(qcom_iommu->local_base))
> +			return PTR_ERR(qcom_iommu->local_base);
> +	}

...or just use devm_platform_ioremap_resource() to make the whole thing 
simpler.

Robin.

>   
>   	qcom_iommu->iface_clk = devm_clk_get(dev, "iface");
>   	if (IS_ERR(qcom_iommu->iface_clk)) {
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
