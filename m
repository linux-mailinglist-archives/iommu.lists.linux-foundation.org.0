Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D424139F269
	for <lists.iommu@lfdr.de>; Tue,  8 Jun 2021 11:30:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50FC54043D;
	Tue,  8 Jun 2021 09:30:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mnBBlAQ1ZFVI; Tue,  8 Jun 2021 09:30:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45EC6403ED;
	Tue,  8 Jun 2021 09:30:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0CCDDC0001;
	Tue,  8 Jun 2021 09:30:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9594C0001
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 09:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A750240291
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 09:30:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F4j8EadKTYVc for <iommu@lists.linux-foundation.org>;
 Tue,  8 Jun 2021 09:30:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9057F400DF
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 09:30:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9446D61278;
 Tue,  8 Jun 2021 09:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623144603;
 bh=MhokyPxqdEzZc6RC+avxqxp0BKKYNFp7L+EMYDuA2a8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pnPVfHt9Tyl2Tb3E3ugOua/bzj+uG374ur35ZQ0HwbgRP+yx9Dz0uCaFhay5a9VoQ
 RL/1sm0Jnd1wp0hZU6D+iIdsFeSFPGxDzqxR3qFY6N0EBbOkl3hBrqLgPu+NFAu3ys
 Lk8/abZR2hXWtYG4qRJLS4BteETl12Lp1mO73vyuz3qbIY+uVRNp8dBUWZUbb43209
 TWH+1WZdJZukihn6qloH4L5LdtsSEsgoIZvUi4Hlbf+xZdo+AFib1dmj1uVLzWMgZR
 6zDqLCFCBOJp4vfxMiFFWZgjMk5HsXi+5n9Dzp0ZcDFHHQppk5Kep732yOLJXTcZz+
 +tBL3vyJdzEIw==
Date: Tue, 8 Jun 2021 10:29:58 +0100
From: Will Deacon <will@kernel.org>
To: Amey Narkhede <ameynarkhede03@gmail.com>
Subject: Re: [PATCH] iommu/qcom: Cleanup resources in case of probe error path
Message-ID: <20210608092958.GA8935@willie-the-truck>
References: <20210421221030.70647-1-ameynarkhede03@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210421221030.70647-1-ameynarkhede03@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
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

On Thu, Apr 22, 2021 at 03:40:30AM +0530, Amey Narkhede wrote:
> If device registration fails, remove sysfs attribute
> and if setting bus callbacks fails, unregister the device
> and cleanup the sysfs attribute.
> 
> Signed-off-by: Amey Narkhede <ameynarkhede03@gmail.com>
> ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> index 4294abe389b2..5fa128a1f7f0 100644
> --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> @@ -850,10 +850,12 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>  	ret = iommu_device_register(&qcom_iommu->iommu, &qcom_iommu_ops, dev);
>  	if (ret) {
>  		dev_err(dev, "Failed to register iommu\n");
> -		return ret;
> +		goto err_sysfs_remove;
>  	}
> 
> -	bus_set_iommu(&platform_bus_type, &qcom_iommu_ops);
> +	ret = bus_set_iommu(&platform_bus_type, &qcom_iommu_ops);
> +	if (ret)
> +		goto err_unregister_device;
> 
>  	if (qcom_iommu->local_base) {
>  		pm_runtime_get_sync(dev);
> @@ -862,6 +864,14 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
>  	}
> 
>  	return 0;
> +
> +err_unregister_device:
> +	iommu_device_unregister(&qcom_iommu->iommu);
> +
> +err_sysfs_remove:
> +	iommu_device_sysfs_remove(&qcom_iommu->iommu);
> +
> +	return ret;

It looks like we're also missing this logic in arm-smmu/arm-smmu.c and
arm-smmu-v3/arm-smmu-v3.c. Would you be able to fix those up too, please?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
