Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4280F2FB614
	for <lists.iommu@lfdr.de>; Tue, 19 Jan 2021 13:28:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C98B1861F4;
	Tue, 19 Jan 2021 12:28:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v5my68aeS628; Tue, 19 Jan 2021 12:28:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6D03386193;
	Tue, 19 Jan 2021 12:28:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5AF61C013A;
	Tue, 19 Jan 2021 12:28:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D927C013A
 for <iommu@lists.linux-foundation.org>; Tue, 19 Jan 2021 12:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 395DD2046C
 for <iommu@lists.linux-foundation.org>; Tue, 19 Jan 2021 12:28:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i9fbkUOFF73M for <iommu@lists.linux-foundation.org>;
 Tue, 19 Jan 2021 12:28:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by silver.osuosl.org (Postfix) with ESMTPS id 2EE2C20454
 for <iommu@lists.linux-foundation.org>; Tue, 19 Jan 2021 12:28:44 +0000 (UTC)
Received: from fraeml737-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4DKnqj5cwwz67cwg;
 Tue, 19 Jan 2021 20:23:13 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml737-chm.china.huawei.com (10.206.15.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 19 Jan 2021 13:28:40 +0100
Received: from localhost (10.47.77.36) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 19 Jan
 2021 12:28:39 +0000
Date: Tue, 19 Jan 2021 12:27:59 +0000
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v9 05/10] uacce: Enable IOMMU_DEV_FEAT_IOPF
Message-ID: <20210119122759.000048f9@Huawei.com>
In-Reply-To: <20210108145217.2254447-6-jean-philippe@linaro.org>
References: <20210108145217.2254447-1-jean-philippe@linaro.org>
 <20210108145217.2254447-6-jean-philippe@linaro.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.47.77.36]
X-ClientProxiedBy: lhreml735-chm.china.huawei.com (10.201.108.86) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
Cc: vivek.gautam@arm.com, guohanjun@huawei.com, will@kernel.org,
 linux-acpi@vger.kernel.org, zhangfei.gao@linaro.org, lenb@kernel.org,
 devicetree@vger.kernel.org, Arnd
 Bergmann <arnd@arndb.de>, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rjw@rjwysocki.net,
 iommu@lists.linux-foundation.org, sudeep.holla@arm.com, robin.murphy@arm.com,
 linux-accelerators@lists.ozlabs.org
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

On Fri, 8 Jan 2021 15:52:13 +0100
Jean-Philippe Brucker <jean-philippe@linaro.org> wrote:

> The IOPF (I/O Page Fault) feature is now enabled independently from the
> SVA feature, because some IOPF implementations are device-specific and
> do not require IOMMU support for PCIe PRI or Arm SMMU stall.
> 
> Enable IOPF unconditionally when enabling SVA for now. In the future, if
> a device driver implementing a uacce interface doesn't need IOPF
> support, it will need to tell the uacce module, for example with a new
> flag.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Hi Jean-Philippe,

A minor suggestion inline but I'm not that bothered so either way
looks good to me.

> ---
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Zhangfei Gao <zhangfei.gao@linaro.org>
> Cc: Zhou Wang <wangzhou1@hisilicon.com>
> ---
>  drivers/misc/uacce/uacce.c | 32 +++++++++++++++++++++++++-------
>  1 file changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/misc/uacce/uacce.c b/drivers/misc/uacce/uacce.c
> index d07af4edfcac..41ef1eb62a14 100644
> --- a/drivers/misc/uacce/uacce.c
> +++ b/drivers/misc/uacce/uacce.c
> @@ -385,6 +385,24 @@ static void uacce_release(struct device *dev)
>  	kfree(uacce);
>  }
>  
> +static unsigned int uacce_enable_sva(struct device *parent, unsigned int flags)
> +{
> +	if (!(flags & UACCE_DEV_SVA))
> +		return flags;
> +
> +	flags &= ~UACCE_DEV_SVA;
> +
> +	if (iommu_dev_enable_feature(parent, IOMMU_DEV_FEAT_IOPF))
> +		return flags;
> +
> +	if (iommu_dev_enable_feature(parent, IOMMU_DEV_FEAT_SVA)) {
> +		iommu_dev_disable_feature(parent, IOMMU_DEV_FEAT_IOPF);
> +		return flags;
> +	}
> +
> +	return flags | UACCE_DEV_SVA;
> +}

I'm a great fan of paired enable / disable functions.
Whilst it would be trivial, maybe it is worth introducing

uacce_disable_sva()?
Also make that do the flags check internally to make it match
up with the enable path.


> +
>  /**
>   * uacce_alloc() - alloc an accelerator
>   * @parent: pointer of uacce parent device
> @@ -404,11 +422,7 @@ struct uacce_device *uacce_alloc(struct device *parent,
>  	if (!uacce)
>  		return ERR_PTR(-ENOMEM);
>  
> -	if (flags & UACCE_DEV_SVA) {
> -		ret = iommu_dev_enable_feature(parent, IOMMU_DEV_FEAT_SVA);
> -		if (ret)
> -			flags &= ~UACCE_DEV_SVA;
> -	}
> +	flags = uacce_enable_sva(parent, flags);
>  
>  	uacce->parent = parent;
>  	uacce->flags = flags;
> @@ -432,8 +446,10 @@ struct uacce_device *uacce_alloc(struct device *parent,
>  	return uacce;
>  
>  err_with_uacce:
> -	if (flags & UACCE_DEV_SVA)
> +	if (flags & UACCE_DEV_SVA) {
>  		iommu_dev_disable_feature(uacce->parent, IOMMU_DEV_FEAT_SVA);
> +		iommu_dev_disable_feature(uacce->parent, IOMMU_DEV_FEAT_IOPF);
> +	}
>  	kfree(uacce);
>  	return ERR_PTR(ret);
>  }
> @@ -487,8 +503,10 @@ void uacce_remove(struct uacce_device *uacce)
>  	mutex_unlock(&uacce->queues_lock);
>  
>  	/* disable sva now since no opened queues */
> -	if (uacce->flags & UACCE_DEV_SVA)
> +	if (uacce->flags & UACCE_DEV_SVA) {
>  		iommu_dev_disable_feature(uacce->parent, IOMMU_DEV_FEAT_SVA);
> +		iommu_dev_disable_feature(uacce->parent, IOMMU_DEV_FEAT_IOPF);
> +	}
>  
>  	if (uacce->cdev)
>  		cdev_device_del(uacce->cdev, &uacce->dev);

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
