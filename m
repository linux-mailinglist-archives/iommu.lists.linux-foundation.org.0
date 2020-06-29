Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6437520CE62
	for <lists.iommu@lfdr.de>; Mon, 29 Jun 2020 13:56:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 16640884E8;
	Mon, 29 Jun 2020 11:56:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a4JgkwFPyqMr; Mon, 29 Jun 2020 11:56:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C674988631;
	Mon, 29 Jun 2020 11:56:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB0D8C016E;
	Mon, 29 Jun 2020 11:56:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D1DEC016E
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 11:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6B65587546
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 11:56:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C0ZwOs0zoYhF for <iommu@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 11:56:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 499BD8751E
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 11:56:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7DD1143D;
 Mon, 29 Jun 2020 04:56:48 -0700 (PDT)
Received: from [10.57.21.32] (unknown [10.57.21.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 509373F73C;
 Mon, 29 Jun 2020 04:56:47 -0700 (PDT)
Subject: Re: [PATCH 1/2] iommu: Add iommu_group_get/set_domain()
To: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>
References: <20200627031532.28046-1-baolu.lu@linux.intel.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <acc0a8fd-bd23-fc34-aecc-67796ab216e7@arm.com>
Date: Mon, 29 Jun 2020 12:56:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200627031532.28046-1-baolu.lu@linux.intel.com>
Content-Language: en-GB
Cc: Kevin Tian <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, kvm@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org
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

On 2020-06-27 04:15, Lu Baolu wrote:
> The hardware assistant vfio mediated device is a use case of iommu
> aux-domain. The interactions between vfio/mdev and iommu during mdev
> creation and passthr are:
> 
> - Create a group for mdev with iommu_group_alloc();
> - Add the device to the group with
>          group = iommu_group_alloc();
>          if (IS_ERR(group))
>                  return PTR_ERR(group);
> 
>          ret = iommu_group_add_device(group, &mdev->dev);
>          if (!ret)
>                  dev_info(&mdev->dev, "MDEV: group_id = %d\n",
>                           iommu_group_id(group));
> - Allocate an aux-domain
> 	iommu_domain_alloc()
> - Attach the aux-domain to the physical device from which the mdev is
>    created.
> 	iommu_aux_attach_device()
> 
> In the whole process, an iommu group was allocated for the mdev and an
> iommu domain was attached to the group, but the group->domain leaves
> NULL. As the result, iommu_get_domain_for_dev() doesn't work anymore.
> 
> This adds iommu_group_get/set_domain() so that group->domain could be
> managed whenever a domain is attached or detached through the aux-domain
> api's.

Letting external callers poke around directly in the internals of 
iommu_group doesn't look right to me.

If a regular device is attached to one or more aux domains for PASID 
use, iommu_get_domain_for_dev() is still going to return the primary 
domain, so why should it be expected to behave differently for mediated 
devices? AFAICS it's perfectly legitimate to have no primary domain if 
traffic-without-PASID is invalid.

Robin.

> Fixes: 7bd50f0cd2fd5 ("vfio/type1: Add domain at(de)taching group helpers")
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>   drivers/iommu/iommu.c | 28 ++++++++++++++++++++++++++++
>   include/linux/iommu.h | 14 ++++++++++++++
>   2 files changed, 42 insertions(+)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index d43120eb1dc5..e2b665303d70 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -715,6 +715,34 @@ int iommu_group_set_name(struct iommu_group *group, const char *name)
>   }
>   EXPORT_SYMBOL_GPL(iommu_group_set_name);
>   
> +/**
> + * iommu_group_get_domain - get domain of a group
> + * @group: the group
> + *
> + * This is called to get the domain of a group.
> + */
> +struct iommu_domain *iommu_group_get_domain(struct iommu_group *group)
> +{
> +	return group->domain;
> +}
> +EXPORT_SYMBOL_GPL(iommu_group_get_domain);
> +
> +/**
> + * iommu_group_set_domain - set domain for a group
> + * @group: the group
> + * @domain: iommu domain
> + *
> + * This is called to set the domain for a group. In aux-domain case, a domain
> + * might attach or detach to an iommu group through the aux-domain apis, but
> + * the group->domain doesn't get a chance to be updated there.
> + */
> +void iommu_group_set_domain(struct iommu_group *group,
> +			    struct iommu_domain *domain)
> +{
> +	group->domain = domain;
> +}
> +EXPORT_SYMBOL_GPL(iommu_group_set_domain);
> +
>   static int iommu_create_device_direct_mappings(struct iommu_group *group,
>   					       struct device *dev)
>   {
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 5f0b7859d2eb..ff88d548a870 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -496,6 +496,9 @@ extern void iommu_group_set_iommudata(struct iommu_group *group,
>   				      void *iommu_data,
>   				      void (*release)(void *iommu_data));
>   extern int iommu_group_set_name(struct iommu_group *group, const char *name);
> +extern struct iommu_domain *iommu_group_get_domain(struct iommu_group *group);
> +extern void iommu_group_set_domain(struct iommu_group *group,
> +				   struct iommu_domain *domain);
>   extern int iommu_group_add_device(struct iommu_group *group,
>   				  struct device *dev);
>   extern void iommu_group_remove_device(struct device *dev);
> @@ -840,6 +843,17 @@ static inline int iommu_group_set_name(struct iommu_group *group,
>   	return -ENODEV;
>   }
>   
> +static inline
> +struct iommu_domain *iommu_group_get_domain(struct iommu_group *group)
> +{
> +	return NULL;
> +}
> +
> +static inline void iommu_group_set_domain(struct iommu_group *group,
> +					  struct iommu_domain *domain)
> +{
> +}
> +
>   static inline int iommu_group_add_device(struct iommu_group *group,
>   					 struct device *dev)
>   {
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
