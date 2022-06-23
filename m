Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EF832557A33
	for <lists.iommu@lfdr.de>; Thu, 23 Jun 2022 14:23:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DA07424D3;
	Thu, 23 Jun 2022 12:23:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DA07424D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WoScsscyEzYy; Thu, 23 Jun 2022 12:23:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EC7EE424D5;
	Thu, 23 Jun 2022 12:23:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC7EE424D5
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A796AC007E;
	Thu, 23 Jun 2022 12:23:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AE70DC002D
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jun 2022 12:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A38283ED3
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jun 2022 12:23:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A38283ED3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DMUhxDlF3f0z for <iommu@lists.linux-foundation.org>;
 Thu, 23 Jun 2022 12:23:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5899383E9A
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5899383E9A
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jun 2022 12:23:11 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D34E212FC;
 Thu, 23 Jun 2022 05:23:10 -0700 (PDT)
Received: from [10.57.85.4] (unknown [10.57.85.4])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A8CF3F534;
 Thu, 23 Jun 2022 05:23:09 -0700 (PDT)
Message-ID: <68263bd7-4528-7acb-b11f-6b1c6c8c72ef@arm.com>
Date: Thu, 23 Jun 2022 13:23:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] vfio/type1: Simplify bus_type determination
Content-Language: en-GB
To: Alex Williamson <alex.williamson@redhat.com>
References: <b1d13cade281a7d8acbfd0f6a33dcd086207952c.1655898523.git.robin.murphy@arm.com>
 <20220622161721.469fc9eb.alex.williamson@redhat.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220622161721.469fc9eb.alex.williamson@redhat.com>
Cc: kvm@vger.kernel.org, cohuck@redhat.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, iommu@lists.linux.dev, jgg@nvidia.com
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

On 2022-06-22 23:17, Alex Williamson wrote:
> On Wed, 22 Jun 2022 13:04:11 +0100
> Robin Murphy <robin.murphy@arm.com> wrote:
> 
>> Since IOMMU groups are mandatory for drivers to support, it stands to
>> reason that any device which has been successfully be added to a group
> 
> s/be //

Oops.

>> must be on a bus supported by that IOMMU driver, and therefore a domain
>> viable for any device in the group must be viable for all devices in
>> the group. This already has to be the case for the IOMMU API's internal
>> default domain, for instance. Thus even if the group contains devices on
>> different buses, that can only mean that the IOMMU driver actually
>> supports such an odd topology, and so without loss of generality we can
>> expect the bus type of any device in a group to be suitable for IOMMU
>> API calls.
>>
>> Replace vfio_bus_type() with a simple call to resolve an appropriate
>> member device from which to then derive a bus type. This is also a step
>> towards removing the vague bus-based interfaces from the IOMMU API, when
>> we can subsequently switch to using this device directly.
>>
>> Furthermore, scrutiny reveals a lack of protection for the bus being
>> removed while vfio_iommu_type1_attach_group() is using it; the reference
>> that VFIO holds on the iommu_group ensures that data remains valid, but
>> does not prevent the group's membership changing underfoot. Holding the
>> vfio_device for as long as we need here also neatly solves this.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>
>> After sleeping on it, I decided to type up the helper function approach
>> to see how it looked in practice, and in doing so realised that with one
>> more tweak it could also subsume the locking out of the common paths as
>> well, so end up being a self-contained way for type1 to take care of its
>> own concern, which I rather like.
>>
>>   drivers/vfio/vfio.c             | 18 +++++++++++++++++-
>>   drivers/vfio/vfio.h             |  3 +++
>>   drivers/vfio/vfio_iommu_type1.c | 30 +++++++++++-------------------
>>   3 files changed, 31 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
>> index 61e71c1154be..73bab04880d0 100644
>> --- a/drivers/vfio/vfio.c
>> +++ b/drivers/vfio/vfio.c
>> @@ -448,7 +448,7 @@ static void vfio_group_get(struct vfio_group *group)
>>    * Device objects - create, release, get, put, search
>>    */
>>   /* Device reference always implies a group reference */
>> -static void vfio_device_put(struct vfio_device *device)
>> +void vfio_device_put(struct vfio_device *device)
>>   {
>>   	if (refcount_dec_and_test(&device->refcount))
>>   		complete(&device->comp);
>> @@ -475,6 +475,22 @@ static struct vfio_device *vfio_group_get_device(struct vfio_group *group,
>>   	return NULL;
>>   }
>>   
>> +struct vfio_device *vfio_device_get_from_iommu(struct iommu_group *iommu_group)
>> +{
>> +	struct vfio_group *group = vfio_group_get_from_iommu(iommu_group);
>> +	struct vfio_device *device;
> 
> Check group for NULL.

OK - FWIW in context this should only ever make sense to call with an 
iommu_group which has already been derived from a vfio_group, and I did 
initially consider a check with a WARN_ON(), but then decided that the 
unguarded dereference would be a sufficiently strong message. No problem 
with bringing that back to make it more defensive if that's what you prefer.

>> +
>> +	mutex_lock(&group->device_lock);
>> +	list_for_each_entry(device, &group->device_list, group_next) {
>> +		if (vfio_device_try_get(device)) {
>> +			mutex_unlock(&group->device_lock);
>> +			return device;
>> +		}
>> +	}
>> +	mutex_unlock(&group->device_lock);
>> +	return NULL;
> 
> No vfio_group_put() on either path.

Oops indeed.

>> +}
>> +
>>   /*
>>    * VFIO driver API
>>    */
>> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
>> index a67130221151..e8f21e64541b 100644
>> --- a/drivers/vfio/vfio.h
>> +++ b/drivers/vfio/vfio.h
>> @@ -70,3 +70,6 @@ struct vfio_iommu_driver_ops {
>>   
>>   int vfio_register_iommu_driver(const struct vfio_iommu_driver_ops *ops);
>>   void vfio_unregister_iommu_driver(const struct vfio_iommu_driver_ops *ops);
>> +
>> +struct vfio_device *vfio_device_get_from_iommu(struct iommu_group *iommu_group);
>> +void vfio_device_put(struct vfio_device *device);
>> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
>> index c13b9290e357..e38b8bfde677 100644
>> --- a/drivers/vfio/vfio_iommu_type1.c
>> +++ b/drivers/vfio/vfio_iommu_type1.c
>> @@ -1679,18 +1679,6 @@ static int vfio_dma_do_map(struct vfio_iommu *iommu,
>>   	return ret;
>>   }
>>   
>> -static int vfio_bus_type(struct device *dev, void *data)
>> -{
>> -	struct bus_type **bus = data;
>> -
>> -	if (*bus && *bus != dev->bus)
>> -		return -EINVAL;
>> -
>> -	*bus = dev->bus;
>> -
>> -	return 0;
>> -}
>> -
>>   static int vfio_iommu_replay(struct vfio_iommu *iommu,
>>   			     struct vfio_domain *domain)
>>   {
>> @@ -2159,7 +2147,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
>>   	struct vfio_iommu *iommu = iommu_data;
>>   	struct vfio_iommu_group *group;
>>   	struct vfio_domain *domain, *d;
>> -	struct bus_type *bus = NULL;
>> +	struct vfio_device *iommu_api_dev;
>>   	bool resv_msi, msi_remap;
>>   	phys_addr_t resv_msi_base = 0;
>>   	struct iommu_domain_geometry *geo;
>> @@ -2192,18 +2180,19 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
>>   		goto out_unlock;
>>   	}
>>   
>> -	/* Determine bus_type in order to allocate a domain */
>> -	ret = iommu_group_for_each_dev(iommu_group, &bus, vfio_bus_type);
>> -	if (ret)
>> +	/* Resolve the group back to a member device for IOMMU API ops */
>> +	ret = -ENODEV;
>> +	iommu_api_dev = vfio_device_get_from_iommu(iommu_group);
>> +	if (!iommu_api_dev)
>>   		goto out_free_group;
>>   
>>   	ret = -ENOMEM;
>>   	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
>>   	if (!domain)
>> -		goto out_free_group;
>> +		goto out_put_dev;
>>   
>>   	ret = -EIO;
>> -	domain->domain = iommu_domain_alloc(bus);
>> +	domain->domain = iommu_domain_alloc(iommu_api_dev->dev->bus);
> 
> It makes sense to move away from a bus centric interface to iommu ops
> and I can see that having a device interface when we have device level
> address-ability within a group makes sense, but does it make sense to
> only have that device level interface?  For example, if an iommu_group
> is going to remain an aspect of the iommu subsystem, shouldn't we be
> able to allocate a domain and test capabilities based on the group and
> the iommu driver should have enough embedded information reachable from
> the struct iommu_group to do those things?  This "perform group level
> operations based on an arbitrary device in the group" is pretty klunky.

The fact* is that devices (and domains) are the fundamental units of the 
IOMMU API internals, due to what's most practical within the Linux 
driver model, while groups remain more of a mid-level abstraction - 
IOMMU drivers themselves are only aware of groups at all in terms of 
whether they can physically distinguish a given device from others. The 
client-driver-facing API is already moving back to being device-centric, 
because that's what fits everyone else's usage models, and we concluded 
that exposing the complexity of groups everywhere was more trouble than 
it's worth.

So yes, technically we could implement an iommu_group_capable() and an 
iommu_group_domain_alloc(), which would still just internally resolve 
the IOMMU ops and instance data from a member device to perform the 
driver-level call, but once again it would be for the benefit of 
precisely one user. And I really have minimal enthusiasm for diverging 
any further into one IOMMU API for everyone else plus a separate special 
IOMMU API for VFIO type1, when type1 is supposed to be the 
VFIO-to-IOMMU-API translation layer anyway! To look at it another way, 
if most of the complexity of groups is for VFIO's benefit, then why 
*shouldn't* VFIO take responsibility for some of the fiddly details that 
don't matter to anyone else?

Thanks,
Robin.


* with some inescapable degree of subjective opinion, of course
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
