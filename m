Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E331EB447
	for <lists.iommu@lfdr.de>; Tue,  2 Jun 2020 06:24:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2C83C810C0;
	Tue,  2 Jun 2020 04:24:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gFgpbEF9xIEy; Tue,  2 Jun 2020 04:24:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 97AB1805D5;
	Tue,  2 Jun 2020 04:24:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91501C0176;
	Tue,  2 Jun 2020 04:24:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A06ACC0176
 for <iommu@lists.linux-foundation.org>; Tue,  2 Jun 2020 04:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8E52287C70
 for <iommu@lists.linux-foundation.org>; Tue,  2 Jun 2020 04:24:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D0fnh794kXnd for <iommu@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 04:24:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2044B87697
 for <iommu@lists.linux-foundation.org>; Tue,  2 Jun 2020 04:24:09 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 51BA2206C3;
 Tue,  2 Jun 2020 04:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591071849;
 bh=sgwt4wu4ovM7Au/m6y7eibwKEZOw6hctJEhJzRNy5qA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2mCrwM+OCoJJbKpsOl7IzXvXzqSIQvvzFDvcgtE/h+tT1HxckMVCL8VlHx2bSKnFx
 qsZrZBk4RHyOzcOhWU8mvrbQCoOr6y7DjO19yKjTjIUYtAoedpIqKfRCx0SoSyLXoO
 7lFEOomn5NuR+TYks3LHPF5hQVc9Iq/BWxQkloLg=
Date: Tue, 2 Jun 2020 06:24:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Barry Song <song.bao.hua@hisilicon.com>
Subject: Re: [PATCH] driver core: platform: expose numa_node to users in sysfs
Message-ID: <20200602042406.GB2130884@kroah.com>
References: <20200602030139.73012-1-song.bao.hua@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200602030139.73012-1-song.bao.hua@hisilicon.com>
Cc: rafael@kernel.org, linuxarm@huawei.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Prime Zeng <prime.zeng@hisilicon.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

On Tue, Jun 02, 2020 at 03:01:39PM +1200, Barry Song wrote:
> For some platform devices like iommu, particually ARM smmu, users may
> care about the numa locality. for example, if threads and drivers run
> near iommu, they may get much better performance on dma_unmap_sg.
> For other platform devices, users may still want to know the hardware
> topology.
> 
> Cc: Prime Zeng <prime.zeng@hisilicon.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
> ---
>  drivers/base/platform.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index b27d0f6c18c9..7794b9a38d82 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -1062,13 +1062,37 @@ static ssize_t driver_override_show(struct device *dev,
>  }
>  static DEVICE_ATTR_RW(driver_override);
>  
> +static ssize_t numa_node_show(struct device *dev,
> +		struct device_attribute *attr, char *buf)
> +{
> +	return sprintf(buf, "%d\n", dev_to_node(dev));
> +}
> +static DEVICE_ATTR_RO(numa_node);
> +
> +static umode_t platform_dev_attrs_visible(struct kobject *kobj, struct attribute *a,
> +		int n)
> +{
> +	struct device *dev = container_of(kobj, typeof(*dev), kobj);
> +
> +	if (a == &dev_attr_numa_node.attr &&
> +			dev_to_node(dev) == NUMA_NO_NODE)
> +		return 0;
> +
> +	return a->mode;
> +}
>  
>  static struct attribute *platform_dev_attrs[] = {
>  	&dev_attr_modalias.attr,
> +	&dev_attr_numa_node.attr,
>  	&dev_attr_driver_override.attr,
>  	NULL,
>  };
> -ATTRIBUTE_GROUPS(platform_dev);
> +
> +static struct attribute_group platform_dev_group = {
> +	.attrs = platform_dev_attrs,
> +	.is_visible = platform_dev_attrs_visible,
> +};
> +__ATTRIBUTE_GROUPS(platform_dev);
>  
>  static int platform_uevent(struct device *dev, struct kobj_uevent_env *env)
>  {

Also you forgot a new entry in Documentation/ABI/ :(

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
