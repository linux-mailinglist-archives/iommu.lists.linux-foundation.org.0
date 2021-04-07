Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E3B356153
	for <lists.iommu@lfdr.de>; Wed,  7 Apr 2021 04:07:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 205B0405A6;
	Wed,  7 Apr 2021 02:07:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 53Ax0AWKFPhO; Wed,  7 Apr 2021 02:07:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20A574017B;
	Wed,  7 Apr 2021 02:07:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09061C000A;
	Wed,  7 Apr 2021 02:07:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A36B5C000A
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 02:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8547040200
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 02:07:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W6F2fWUvc56B for <iommu@lists.linux-foundation.org>;
 Wed,  7 Apr 2021 02:07:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9F9F44017B
 for <iommu@lists.linux-foundation.org>; Wed,  7 Apr 2021 02:07:38 +0000 (UTC)
IronPort-SDR: M5Ce6Bpx4CCJB2QGNyKvNjtCuFfXHuV+1PDu1HcX65s0vnmkm/Zcqow8OuIzKEjw8WB+Xdx7rL
 jtIse0CNFVWA==
X-IronPort-AV: E=McAfee;i="6000,8403,9946"; a="189994990"
X-IronPort-AV: E=Sophos;i="5.82,201,1613462400"; d="scan'208";a="189994990"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2021 19:07:38 -0700
IronPort-SDR: fDuRvZeWJpzEPmRn66RzhNe3/ZDoww0cSNF+LwBZVLnGb13yx5oCd77HZxLU9/AtWTRhoJQ/lP
 Ho6tkLrKH2oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,201,1613462400"; d="scan'208";a="441153756"
Received: from allen-box.sh.intel.com (HELO [10.239.159.128])
 ([10.239.159.128])
 by fmsmga004.fm.intel.com with ESMTP; 06 Apr 2021 19:07:33 -0700
Subject: Re: [PATCH v8 7/9] vfio/mdev: Add iommu related member in mdev_device
To: Jason Gunthorpe <jgg@nvidia.com>, Christoph Hellwig <hch@lst.de>
References: <20190325013036.18400-1-baolu.lu@linux.intel.com>
 <20190325013036.18400-8-baolu.lu@linux.intel.com>
 <20210406200030.GA425310@nvidia.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <1cbe97fb-5595-8cf5-9e0c-1a2edf8c5d9a@linux.intel.com>
Date: Wed, 7 Apr 2021 09:58:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210406200030.GA425310@nvidia.com>
Content-Language: en-US
Cc: kevin.tian@intel.com, ashok.raj@intel.com, tiwei.bie@intel.com,
 Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
 sanjay.k.kumar@intel.com, Kirti Wankhede <kwankhede@nvidia.com>,
 linux-kernel@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com, kvm@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>, yi.y.sun@intel.com
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

Hi Jason,

On 4/7/21 4:00 AM, Jason Gunthorpe wrote:
> On Mon, Mar 25, 2019 at 09:30:34AM +0800, Lu Baolu wrote:
>> A parent device might create different types of mediated
>> devices. For example, a mediated device could be created
>> by the parent device with full isolation and protection
>> provided by the IOMMU. One usage case could be found on
>> Intel platforms where a mediated device is an assignable
>> subset of a PCI, the DMA requests on behalf of it are all
>> tagged with a PASID. Since IOMMU supports PASID-granular
>> translations (scalable mode in VT-d 3.0), this mediated
>> device could be individually protected and isolated by an
>> IOMMU.
>>
>> This patch adds a new member in the struct mdev_device to
>> indicate that the mediated device represented by mdev could
>> be isolated and protected by attaching a domain to a device
>> represented by mdev->iommu_device. It also adds a helper to
>> add or set the iommu device.
>>
>> * mdev_device->iommu_device
>>    - This, if set, indicates that the mediated device could
>>      be fully isolated and protected by IOMMU via attaching
>>      an iommu domain to this device. If empty, it indicates
>>      using vendor defined isolation, hence bypass IOMMU.
>>
>> * mdev_set/get_iommu_device(dev, iommu_device)
>>    - Set or get the iommu device which represents this mdev
>>      in IOMMU's device scope. Drivers don't need to set the
>>      iommu device if it uses vendor defined isolation.
>>
>> Cc: Ashok Raj <ashok.raj@intel.com>
>> Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
>> Cc: Kevin Tian <kevin.tian@intel.com>
>> Cc: Liu Yi L <yi.l.liu@intel.com>
>> Suggested-by: Kevin Tian <kevin.tian@intel.com>
>> Suggested-by: Alex Williamson <alex.williamson@redhat.com>
>> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
>> Reviewed-by: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
>> ---
>>   drivers/vfio/mdev/mdev_core.c    | 18 ++++++++++++++++++
>>   drivers/vfio/mdev/mdev_private.h |  1 +
>>   include/linux/mdev.h             | 14 ++++++++++++++
>>   3 files changed, 33 insertions(+)
>>
>> diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
>> index b96fedc77ee5..1b6435529166 100644
>> +++ b/drivers/vfio/mdev/mdev_core.c
>> @@ -390,6 +390,24 @@ int mdev_device_remove(struct device *dev, bool force_remove)
>>   	return 0;
>>   }
>>   
>> +int mdev_set_iommu_device(struct device *dev, struct device *iommu_device)
>> +{
>> +	struct mdev_device *mdev = to_mdev_device(dev);
>> +
>> +	mdev->iommu_device = iommu_device;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(mdev_set_iommu_device);
> 
> I was looking at these functions when touching the mdev stuff and I
> have some concerns.
> 
> 1) Please don't merge dead code. It is a year later and there is still
>     no in-tree user for any of this. This is not our process. Even
>     worse it was exported so it looks like this dead code is supporting
>     out of tree modules.
> 
> 2) Why is this like this? Every struct device already has a connection
>     to the iommu layer and every mdev has a struct device all its own.
> 
>     Why did we need to add special 'if (mdev)' stuff all over the
>     place? This smells like the same abuse Thomas
>     and I pointed out for the interrupt domains.

I've ever tried to implement a bus iommu_ops for mdev devices.

https://lore.kernel.org/lkml/20201030045809.957927-1-baolu.lu@linux.intel.com/

Any comments?

Best regards,
baolu

> 
>     After my next series the mdev drivers will have direct access to
>     the vfio_device. So an alternative to using the struct device, or
>     adding 'if mdev' is to add an API to the vfio_device world to
>     inject what iommu configuration is needed from that direction
>     instead of trying to discover it from a struct device.
> 
> 3) The vfio_bus_is_mdev() and related symbol_get() nonsense in
>     drivers/vfio/vfio_iommu_type1.c has to go, for the same reasons
>     it was not acceptable to do this for the interrupt side either.
> 
> 4) It seems pretty clear to me this will be heavily impacted by the
>     /dev/ioasid discussion. Please consider removing the dead code now.
> 
> Basically, please fix this before trying to get idxd mdev merged as
> the first user.
> 
> Jason
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
