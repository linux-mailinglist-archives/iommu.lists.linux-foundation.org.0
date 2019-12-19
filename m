Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 959C8126515
	for <lists.iommu@lfdr.de>; Thu, 19 Dec 2019 15:44:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 32025203E6;
	Thu, 19 Dec 2019 14:44:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O7W1s21bC2aM; Thu, 19 Dec 2019 14:44:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 40CBC203D6;
	Thu, 19 Dec 2019 14:44:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 29664C1AE8;
	Thu, 19 Dec 2019 14:44:42 +0000 (UTC)
X-Original-To: iommu@lists.linuxfoundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E461C077D
 for <iommu@lists.linuxfoundation.org>; Thu, 19 Dec 2019 14:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 87B9B87DF9
 for <iommu@lists.linuxfoundation.org>; Thu, 19 Dec 2019 14:44:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gvOpQCrCsvRK for <iommu@lists.linuxfoundation.org>;
 Thu, 19 Dec 2019 14:44:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BE05587C1A
 for <iommu@lists.linuxfoundation.org>; Thu, 19 Dec 2019 14:44:39 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 023002053B;
 Thu, 19 Dec 2019 14:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576766679;
 bh=iBCCOBfdUocj9ErEbbwolLOJyXKBe9AF60kSb2bQdTY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FyUDAGxz2+B/KcpfAP2Yy2PFN7zkcKQjn1o+MOPo6qdhWdHJnYhhhRzjE6R6zdXtO
 q2HWmL+x0amT9u2nUqJH8zmFrUDPtdgfuFkTSCTv/VPp3Uxr/w/5OIKQUqcS/k6SXn
 Q7DrQCBwKwhphxZaWZ2LL/CfAa0gJjJZF4XvIE6c=
Date: Thu, 19 Dec 2019 15:44:37 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 05/16] drivers/iommu: Take a ref to the IOMMU driver
 prior to ->add_device()
Message-ID: <20191219144437.GA1959534@kroah.com>
References: <20191219120352.382-1-will@kernel.org>
 <20191219120352.382-6-will@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191219120352.382-6-will@kernel.org>
Cc: iommu@lists.linuxfoundation.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Saravana Kannan <saravanak@google.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, kernel-team@android.com,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>
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

On Thu, Dec 19, 2019 at 12:03:41PM +0000, Will Deacon wrote:
> To avoid accidental removal of an active IOMMU driver module, take a
> reference to the driver module in 'iommu_probe_device()' immediately
> prior to invoking the '->add_device()' callback and hold it until the
> after the device has been removed by '->remove_device()'.
> 
> Suggested-by: Joerg Roedel <joro@8bytes.org>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  drivers/iommu/iommu.c | 19 +++++++++++++++++--
>  include/linux/iommu.h |  4 +++-
>  2 files changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 7c92197d53f3..bc8edf90e729 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -22,6 +22,7 @@
>  #include <linux/bitops.h>
>  #include <linux/property.h>
>  #include <linux/fsl/mc.h>
> +#include <linux/module.h>
>  #include <trace/events/iommu.h>
>  
>  static struct kset *iommu_group_kset;
> @@ -185,10 +186,21 @@ int iommu_probe_device(struct device *dev)
>  	if (!iommu_get_dev_param(dev))
>  		return -ENOMEM;
>  
> +	if (!try_module_get(ops->owner)) {
> +		ret = -EINVAL;
> +		goto err_free_dev_param;
> +	}
> +
>  	ret = ops->add_device(dev);
>  	if (ret)
> -		iommu_free_dev_param(dev);
> +		goto err_module_put;
> +
> +	return 0;
>  
> +err_module_put:
> +	module_put(ops->owner);
> +err_free_dev_param:
> +	iommu_free_dev_param(dev);
>  	return ret;
>  }
>  
> @@ -199,7 +211,10 @@ void iommu_release_device(struct device *dev)
>  	if (dev->iommu_group)
>  		ops->remove_device(dev);
>  
> -	iommu_free_dev_param(dev);
> +	if (dev->iommu_param) {
> +		module_put(ops->owner);
> +		iommu_free_dev_param(dev);
> +	}
>  }
>  
>  static struct iommu_domain *__iommu_domain_alloc(struct bus_type *bus,
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index f2223cbb5fd5..e9f94d3f7a04 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -246,9 +246,10 @@ struct iommu_iotlb_gather {
>   * @sva_get_pasid: Get PASID associated to a SVA handle
>   * @page_response: handle page request response
>   * @cache_invalidate: invalidate translation caches
> - * @pgsize_bitmap: bitmap of all possible supported page sizes
>   * @sva_bind_gpasid: bind guest pasid and mm
>   * @sva_unbind_gpasid: unbind guest pasid and mm
> + * @pgsize_bitmap: bitmap of all possible supported page sizes
> + * @owner: Driver module providing these ops
>   */
>  struct iommu_ops {
>  	bool (*capable)(enum iommu_cap);
> @@ -318,6 +319,7 @@ struct iommu_ops {
>  	int (*sva_unbind_gpasid)(struct device *dev, int pasid);
>  
>  	unsigned long pgsize_bitmap;
> +	struct module *owner;

Everyone is always going to forget to set this field.  I don't think you
even set it for all of the different iommu_ops possible in this series,
right?

The "trick" we did to keep people from having to remember this is to do
what we did for the bus registering functions.

Look at pci_register_driver in pci.h:
#define pci_register_driver(driver)             \
        __pci_register_driver(driver, THIS_MODULE, KBUILD_MODNAME)

Then we set the .owner field in the "real" __pci_register_driver() call.

Same thing for USB and lots, if not all, other driver register
functions.

You can do the same thing here, and I would recommend it.

No need to stop this series from happening now, just an add-on that is
easy to make to ensure that no one ever forgets to set this field
properly.

thanks,

greg k-h
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
