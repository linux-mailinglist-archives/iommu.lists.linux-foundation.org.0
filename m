Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DEF217D41
	for <lists.iommu@lfdr.de>; Wed,  8 Jul 2020 04:58:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1D6BD86B02;
	Wed,  8 Jul 2020 02:58:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XTxek-tMcQLK; Wed,  8 Jul 2020 02:58:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 875A4869F7;
	Wed,  8 Jul 2020 02:58:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A825C016F;
	Wed,  8 Jul 2020 02:58:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 452E6C016F
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 02:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 168E3234BD
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 02:57:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P4EzUgMhqG0r for <iommu@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 02:57:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by silver.osuosl.org (Postfix) with ESMTPS id BB5E523453
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 02:57:45 +0000 (UTC)
IronPort-SDR: KAAgyK2mPls48eI3G5X4LzkqbObBN9VP4EpruI41YD57jJ0/sxL7s4dRtOFz3vCdvCzlPPikSY
 Z6GF9G9brBCw==
X-IronPort-AV: E=McAfee;i="6000,8403,9675"; a="127810670"
X-IronPort-AV: E=Sophos;i="5.75,326,1589266800"; d="scan'208";a="127810670"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2020 19:57:44 -0700
IronPort-SDR: NWBGavxXZ0Y2OEfeOpa5yL3dbxWEkLftrQJ1t6KHDS/S4/wLSkPMlMJ/7R0rlPEJGtpdkhJq4B
 C2UnIQJWPqPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,326,1589266800"; d="scan'208";a="457339798"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139])
 ([10.239.159.139])
 by orsmga005.jf.intel.com with ESMTP; 07 Jul 2020 19:57:41 -0700
Subject: Re: [PATCH v2 1/2] iommu: iommu_aux_at(de)tach_device() extension
To: Alex Williamson <alex.williamson@redhat.com>
References: <20200707013957.23672-1-baolu.lu@linux.intel.com>
 <20200707013957.23672-2-baolu.lu@linux.intel.com>
 <20200707150408.474d81f1@x1.home>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <dc98a109-7121-36b7-0854-f899b09692a4@linux.intel.com>
Date: Wed, 8 Jul 2020 10:53:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200707150408.474d81f1@x1.home>
Content-Language: en-US
Cc: Kevin Tian <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, kvm@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
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

Hi Alex,

Thanks a lot for your comments. Please check my reply inline.

On 7/8/20 5:04 AM, Alex Williamson wrote:
> On Tue,  7 Jul 2020 09:39:56 +0800
> Lu Baolu<baolu.lu@linux.intel.com>  wrote:
> 
>> The hardware assistant vfio mediated device is a use case of iommu
>> aux-domain. The interactions between vfio/mdev and iommu during mdev
>> creation and passthr are:
>>
>> - Create a group for mdev with iommu_group_alloc();
>> - Add the device to the group with
>>          group = iommu_group_alloc();
>>          if (IS_ERR(group))
>>                  return PTR_ERR(group);
>>
>>          ret = iommu_group_add_device(group, &mdev->dev);
>>          if (!ret)
>>                  dev_info(&mdev->dev, "MDEV: group_id = %d\n",
>>                           iommu_group_id(group));
>> - Allocate an aux-domain
>>          iommu_domain_alloc()
>> - Attach the aux-domain to the physical device from which the mdev is
>>    created.
>>          iommu_aux_attach_device()
>>
>> In the whole process, an iommu group was allocated for the mdev and an
>> iommu domain was attached to the group, but the group->domain leaves
>> NULL. As the result, iommu_get_domain_for_dev() doesn't work anymore.
>>
>> The iommu_get_domain_for_dev() is a necessary interface for device
>> drivers that want to support aux-domain. For example,
>>
>>          struct iommu_domain *domain;
>>          struct device *dev = mdev_dev(mdev);
>>          unsigned long pasid;
>>
>>          domain = iommu_get_domain_for_dev(dev);
>>          if (!domain)
>>                  return -ENODEV;
>>
>>          pasid = iommu_aux_get_pasid(domain, dev->parent);
> How did we know this was an aux domain? ie. How did we know we could
> use it with iommu_aux_get_pasid()?

Yes. It's a bit confusing if iommu_get_domain_for_dev() is reused here
for aux-domain.

> 
> Why did we assume the parent device is the iommu device for the aux
> domain?  Should that level of detail be already known by the aux domain?
> 
> Nits - The iomu device of an mdev device is found via
> mdev_get_iommu_device(dev), it should not be assumed to be the parent.
> The parent of an mdev device is found via mdev_parent_dev(mdev).

My bad. The driver should use mdev_get_iommu_device() instead.

> 
> The leaps in logic here make me wonder if we should instead be exposing
> more of an aux domain API rather than blurring the differences between
> these domains.  Thanks,

How about add below API?

/**
  * iommu_aux_get_domain_for_dev - get aux domain for a device
  * @dev: the accessory device
  *
  * The caller should pass a valid @dev to iommu_aux_attach_device() before
  * calling this api. Return an attached aux-domain, or NULL otherwise.
  */
struct iommu_domain *iommu_aux_get_domain_for_dev(struct device *dev)
{
         struct iommu_domain *domain = NULL;
         struct iommu_group *group;

         group = iommu_group_get(dev);
         if (!group)
                 return NULL;

         if (group->aux_domain_attached)
                 domain = group->domain;

         iommu_group_put(group);

         return domain;
}
EXPORT_SYMBOL_GPL(iommu_aux_get_domain_for_dev);

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
