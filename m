Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E481E72BA
	for <lists.iommu@lfdr.de>; Fri, 29 May 2020 04:46:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 76DA887D1D;
	Fri, 29 May 2020 02:46:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GiTWe9HPJO0p; Fri, 29 May 2020 02:46:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5D0DA87C70;
	Fri, 29 May 2020 02:46:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4AA5AC07FF;
	Fri, 29 May 2020 02:46:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3938C016F
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 02:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8F1D2220CE
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 02:46:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LPSotxE5gevd for <iommu@lists.linux-foundation.org>;
 Fri, 29 May 2020 02:46:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by silver.osuosl.org (Postfix) with ESMTPS id EE0A92155D
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 02:46:49 +0000 (UTC)
IronPort-SDR: R+aamR8lJZ0z/v3z38M3wq1pJ/KQ5VEnLFSqn+iFvdpiDB6F+Sk3o1I2VdlQKVKbV0TYg8Dczb
 LmPcqfq3eZ+g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 19:46:49 -0700
IronPort-SDR: qfZsN6ZHrKQQldKsIP6B0zBmk+Juqaw9CqQ6sq3cmoyQrr2IArve/cUOrkOEyy0fq2gSoozg60
 Rh4wFJrCa3vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,447,1583222400"; d="scan'208";a="292221553"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139])
 ([10.239.159.139])
 by fmsmga004.fm.intel.com with ESMTP; 28 May 2020 19:46:46 -0700
Subject: Re: [PATCH V3 1/3] iommu: Add support to change default domain of an
 iommu_group
To: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>,
 iommu@lists.linux-foundation.org
References: <cover.1590686413.git.sai.praneeth.prakhya@intel.com>
 <c76e3912c49d5a28bd9c8c30fb35d546a2f26724.1590686413.git.sai.praneeth.prakhya@intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <f7a5d302-2dbe-29bd-0d1b-4560c6ae4688@linux.intel.com>
Date: Fri, 29 May 2020 10:43:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <c76e3912c49d5a28bd9c8c30fb35d546a2f26724.1590686413.git.sai.praneeth.prakhya@intel.com>
Content-Language: en-US
Cc: Ashok Raj <ashok.raj@intel.com>, Will Deacon <will.deacon@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

Hi Sai,

On 5/29/20 3:23 AM, Sai Praneeth Prakhya wrote:
> Presently, the default domain of an iommu_group is allocated during boot
> time (i.e. when a device is being added to a group) and it cannot be
              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

This is inaccurate as Joerg's code has deferred default domain
allocation and attaching after group allocation. I'd suggest to remove
this.

> changed later. So, the device would typically be either in identity (also
> known as pass_through) mode (controlled by "iommu=pt" kernel command line
                                               ^^^^^^^^

There are other kernel parameters to put device in pass_through mode.
I'd suggest to remove this.

> argument) or the device would be in DMA mode as long as the machine is up
> and running. There is no way to change the default domain type dynamically
> i.e. after booting, a device cannot switch between identity mode and DMA
> mode.
> 
> But, assume a use case wherein the user trusts the device and believes that
> the OS is secure enough and hence wants *only* this device to bypass IOMMU
> (so that it could be high performing) whereas all the other devices to go
> through IOMMU (so that the system is protected). Presently, this use case
> is not supported. It will be helpful if there is some way to change the
> default domain of a B:D.F dynamically. Hence, add such support.
   ^^^^^^^^^^^^^^^^^^^^^^^^^

Currently default domain is per iommu_group, we have no per device
default domain yet. Probably, "default domain of an iommu group"?

> 
> A privileged user could request the kernel to change the default domain
> type of a iommu_group by writing to
> "/sys/kernel/iommu_groups/<grp_id>/type" file. Presently, only three values
> are supported
> 1. identity: all the DMA transactions from the device in this group are
>               *not* translated by the iommu
> 2. DMA: all the DMA transactions from the device in this group are
>          translated by the iommu
> 3. auto: change to the type the device was booted with
> 
> Note:
> 1. Default domain of an iommu group with two or more devices cannot be
>     changed.
> 2. The device in the iommu group shouldn't be bound to any driver.
> 3. The device shouldn't be assigned to user for direct access.
> 
> Please see "Documentation/ABI/testing/sysfs-kernel-iommu_groups" for more
> information.
> 
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Ashok Raj <ashok.raj@intel.com>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Cc: Sohil Mehta <sohil.mehta@intel.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Signed-off-by: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
> ---
>   drivers/iommu/iommu.c | 211 +++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 210 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index a4c2f122eb8b..2b6cca799055 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -92,6 +92,8 @@ static void __iommu_detach_group(struct iommu_domain *domain,
>   static int iommu_create_device_direct_mappings(struct iommu_group *group,
>   					       struct device *dev);
>   static struct iommu_group *iommu_group_get_for_dev(struct device *dev);
> +static ssize_t iommu_group_store_type(struct iommu_group *group,
> +				      const char *buf, size_t count);
>   
>   #define IOMMU_GROUP_ATTR(_name, _mode, _show, _store)		\
>   struct iommu_group_attribute iommu_group_attr_##_name =		\
> @@ -524,7 +526,8 @@ static IOMMU_GROUP_ATTR(name, S_IRUGO, iommu_group_show_name, NULL);
>   static IOMMU_GROUP_ATTR(reserved_regions, 0444,
>   			iommu_group_show_resv_regions, NULL);
>   
> -static IOMMU_GROUP_ATTR(type, 0444, iommu_group_show_type, NULL);
> +static IOMMU_GROUP_ATTR(type, 0644, iommu_group_show_type,
> +			iommu_group_store_type);
>   
>   static void iommu_group_release(struct kobject *kobj)
>   {
> @@ -2847,3 +2850,209 @@ int iommu_sva_get_pasid(struct iommu_sva *handle)
>   	return ops->sva_get_pasid(handle);
>   }
>   EXPORT_SYMBOL_GPL(iommu_sva_get_pasid);
> +
> +/*
> + * Changes the default domain of a device
> + *
> + * @dev: The *only* device in the group

All devices in a group have been linked in group->devices, so you don't
need to pass it in as a parameter. Otherwise, you also need some sanity
check against @dev, right?

> + * @group: The group for which the default domain should be changed
> + * @prev_domain: The previous domain that is being switched from

The same as @dev, the default domain in use is saved in
group->default_domain. No need a separated parameter to save space and
sanity check.

> + * @type: The type of the new default domain that gets associated with the group
> + *
> + * Returns 0 on success and error code on failure
> + *
> + * Note:
> + * 1. Presently, this function is called only when user requests to change the
> + *    group's default domain type through /sys/kernel/iommu_groups/<grp_id>/type
> + *    Please take a closer look if intended to use for other purposes.
> + * 2. Assumes that group->mutex is already taken and releases before returning

You could assume that the caller should hold the group->mutex and 
shouldn't be released in this helper. A reference design could be found
here.

https://lkml.org/lkml/2020/3/13/1164

> + */
> +static int iommu_change_dev_def_domain(struct device *dev,
> +				       struct iommu_group *group,
> +				       struct iommu_domain *prev_dom, int type)
> +{
> +	int ret = 0;
> +
> +	/* Sets group->default_domain to the newly allocated domain */
> +	ret = iommu_group_alloc_default_domain(dev->bus, group, type);
> +	if (ret)
> +		goto out;
> +
> +	ret = __iommu_attach_device(group->default_domain, dev);
> +	if (ret)
> +		goto free_new_domain;
> +
> +	group->domain = group->default_domain;
> +
> +	ret = iommu_create_device_direct_mappings(group, dev);
> +	if (ret)
> +		goto free_new_domain;
> +
> +	/*
> +	 * Release the mutex here because ops->probe_finalize() call-back of
> +	 * some vendor IOMMU drivers calls arm_iommu_attach_device() which
> +	 * in-turn might call back into IOMMU core code, where it tries to take
> +	 * group->mutex, resulting in a deadlock.
> +	 */
> +	mutex_unlock(&group->mutex);
> +
> +	/* Make sure dma_ops is appropriatley set */
> +	iommu_group_do_probe_finalize(dev, group->default_domain);
> +	iommu_domain_free(prev_dom);
> +	return 0;
> +
> +free_new_domain:
> +	iommu_domain_free(group->default_domain);
> +	group->default_domain = prev_dom;
> +	group->domain = prev_dom;
> +
> +out:
> +	mutex_unlock(&group->mutex);
> +
> +	return ret;
> +}
> +
> +static ssize_t iommu_group_store_type(struct iommu_group *group,
> +				      const char *buf, size_t count)
> +{
> +	int ret, req_type = 0, req_auto = 0, dev_def_dom;
> +	struct iommu_domain *prev_dom;
> +	struct group_device *grp_dev;
> +	const struct iommu_ops *ops;
> +	struct device *dev;
> +
> +	if (!capable(CAP_SYS_ADMIN) || !capable(CAP_SYS_RAWIO))
> +		return -EACCES;
> +
> +	if (WARN_ON(!group))
> +		return -EINVAL;
> +
> +	if (sysfs_streq(buf, "identity"))
> +		req_type = IOMMU_DOMAIN_IDENTITY;
> +	else if (sysfs_streq(buf, "DMA"))
> +		req_type = IOMMU_DOMAIN_DMA;
> +	else if (sysfs_streq(buf, "auto"))
> +		req_auto = 1;

How about let req_type = 0 for auto case. This keeps it consistent with
the return value of iommu_ops->def_domain_type(). With

if (!req_type)
	req_type = ops->def_domain_type(dev);

you don't need req_auto and dev_def_dom any more.

> +	else
> +		return -EINVAL;
> +
> +	/* Lock the group to make sure that the device count doesn't change */
> +	mutex_lock(&group->mutex);
> +	if (iommu_group_device_count(group) != 1) {
> +		mutex_unlock(&group->mutex);
> +		pr_err("Cannot change default domain of a group with two or more devices\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Since group has only one device */
> +	list_for_each_entry(grp_dev, &group->devices, list)
> +		dev = grp_dev->dev;
> +
> +	/*
> +	 * Don't hold onto the group mutex because taking group mutex first and
> +	 * then the device lock could potentially cause a deadlock as below.
> +	 * Assume two threads T1 and T2. T1 is trying to change default domain
> +	 * of an iommu group and T2 is trying to hot unplug a device or release
> +	 * [1] VF of a PCIe device which is in the same iommu group. T1 takes
> +	 * group mutex and before it could take device lock assume T2 has taken
> +	 * device lock and is yet to take group mutex. Now, both the threads
> +	 * will be waiting for the other thread to release lock.
> +	 *
> +	 * [1] Typical device release path
> +	 * device_lock() from device/driver core code
> +	 *  -> bus_notifier()
> +	 *   -> iommu_bus_notifier()
> +	 *    -> iommu_release_device()
> +	 *     -> ops->release_device() vendor driver calls back iommu core code
> +	 *      -> mutex_lock() from iommu core code
> +	 */
> +	mutex_unlock(&group->mutex);

Since you only support single device group, how about

-> lock_device
     -> lock group
         -> change default domain
     -> unlock group
-> unlock device
?

> +
> +	/* Check if the device in the group still has a driver bound to it */
> +	device_lock(dev);
> +	if (device_is_bound(dev)) {
> +		pr_err("Device is still bound to driver\n");
> +		ret = -EBUSY;
> +		goto dev_unlock;
> +	}
> +
> +	/*
> +	 * iommu group wasn't locked while acquiring device lock. So, make sure
> +	 * that the device count hasn't changed while acquiring device lock.
> +	 *
> +	 * Changing default domain of an iommu group with two or more devices
> +	 * isn't supported because there could be a potential deadlock. Consider
> +	 * the following scenario. T1 is trying to acquire device locks of all
> +	 * the devices in the group and before it could acquire all of them,
> +	 * there could be another thread T2 (from different sub-system and use
> +	 * case) that has already acquired some of the device locks and might be
> +	 * waiting for T1 to release other device locks.
> +	 */
> +	mutex_lock(&group->mutex);
> +	if (iommu_group_device_count(group) != 1) {
> +		pr_err("Cannot change default domain of a group with two or more devices\n");
> +		ret = -EINVAL;
> +		goto group_unlock;
> +	}
> +
> +	/*
> +	 * Check if any user level driver (that doesn't use kernel driver like
> +	 * VFIO) is directly using the group. VFIO use case is detected by
> +	 * device_is_bound() check above
> +	 */
> +	if (group->default_domain != group->domain) {
> +		pr_err("Group assigned to user level for direct access\n");
> +		ret = -EINVAL;

-EBUSY?

> +		goto group_unlock;
> +	}
> +
> +	prev_dom = group->default_domain;
> +	if (!prev_dom || !prev_dom->ops || !prev_dom->ops->def_domain_type) {
> +		pr_err("'def_domain_type' call back isn't registered\n");
> +		ret = -EINVAL;
> +		goto group_unlock;
> +	}
> +

--- start ---
> +	ops = prev_dom->ops;
> +	dev_def_dom = ops->def_domain_type(dev);
> +
> +	/* Check if user requested domain is supported by the device or not */
> +	if (!req_auto && dev_def_dom && req_type != dev_def_dom) {
> +		pr_err("Device cannot be in %s domain\n", buf);
> +		ret = -EINVAL;
> +		goto group_unlock;
> +	}
> +
> +	if (req_auto) {
> +		/*
> +		 * If user requested "auto" and the device supports both the
> +		 * domains, then default to the domain the device was booted
> +		 * with
> +		 */
> +		if (!dev_def_dom)
> +			req_type = iommu_def_domain_type;
> +		else
> +			req_type = dev_def_dom;
> +	}
--- end ---

Isn't this could could be simply replaced with:

if (!req_type)
	req_type = ops->default_domain_type(dev) ? : iommu_def_domain_type;

> +
> +	/*
> +	 * Switch to a new domain only if the requested domain type is different
> +	 * from the existing default domain type
> +	 */
> +	if (prev_dom->type == req_type) {
> +		ret = count;
> +		goto group_unlock;
> +	} > +
> +	ret = iommu_change_dev_def_domain(dev, group, prev_dom, req_type);
> +	device_unlock(dev);
> +	return ret ?: count;
> +
> +group_unlock:
> +	mutex_unlock(&group->mutex);
> +
> +dev_unlock:
> +	device_unlock(dev);
> +
> +	return ret;
> +}
> 

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
