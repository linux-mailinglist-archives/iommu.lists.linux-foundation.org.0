Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id ED595557010
	for <lists.iommu@lfdr.de>; Thu, 23 Jun 2022 03:46:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED1F86131A;
	Thu, 23 Jun 2022 01:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED1F86131A
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FZc3smMI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tx7Rjz0SfpxO; Thu, 23 Jun 2022 01:46:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C76E960BC8;
	Thu, 23 Jun 2022 01:46:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C76E960BC8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7ED65C0081;
	Thu, 23 Jun 2022 01:46:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8BF1C002D
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jun 2022 01:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74D566133D
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jun 2022 01:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74D566133D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KrHZqMakWKAa for <iommu@lists.linux-foundation.org>;
 Thu, 23 Jun 2022 01:46:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 755F36131A
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 755F36131A
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jun 2022 01:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655948783; x=1687484783;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=QCwPmWYcD+MquAMSOXPCydTeGHAkPZLuW112dPh/u+U=;
 b=FZc3smMI/y/VpCyOdHXdkYoGu453aYNzUGM4FSknhfPLvrgM+CC83JiM
 hWpsLnPccOiZfSTUISAlurZJLx5mURuWAJQXVgINTU2k5KSjBV6MBPO1l
 Mu07idVhgpLpHbm1ZXYDKgIqzx/W/TY9z8RtklNCN+78xYjlQmgazHqOW
 YjE/0blFq8J+I47y/RopKBFcIFs9I5XWgoLko7qeIvy7EvnWbv1oSOkWy
 9e7w9Yaq7KQRREtWTVEZcDebJQzmpDeqK/1IXWNQ9CnOttur3jMZIMppk
 Dde7bWEeSqikFLTlK4NXUkmttBYAl31IBK8TdPK8dGVi/TIwE/FaQCPM7 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="260413504"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="260413504"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 18:46:20 -0700
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="644487121"
Received: from yutaoxu-mobl.ccr.corp.intel.com (HELO [10.249.172.190])
 ([10.249.172.190])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 18:46:18 -0700
Message-ID: <e18cca4c-c324-c1ab-7a2f-0f97c6387475@linux.intel.com>
Date: Thu, 23 Jun 2022 09:46:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/2] vfio/type1: Simplify bus_type determination
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, alex.williamson@redhat.com,
 cohuck@redhat.com
References: <b1d13cade281a7d8acbfd0f6a33dcd086207952c.1655898523.git.robin.murphy@arm.com>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <b1d13cade281a7d8acbfd0f6a33dcd086207952c.1655898523.git.robin.murphy@arm.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
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

On 2022/6/22 20:04, Robin Murphy wrote:
> Since IOMMU groups are mandatory for drivers to support, it stands to
> reason that any device which has been successfully be added to a group
> must be on a bus supported by that IOMMU driver, and therefore a domain
> viable for any device in the group must be viable for all devices in
> the group. This already has to be the case for the IOMMU API's internal
> default domain, for instance. Thus even if the group contains devices on
> different buses, that can only mean that the IOMMU driver actually
> supports such an odd topology, and so without loss of generality we can
> expect the bus type of any device in a group to be suitable for IOMMU
> API calls.

Ideally we could remove bus->iommu_ops and all IOMMU APIs go through the
dev_iommu_ops().

> 
> Replace vfio_bus_type() with a simple call to resolve an appropriate
> member device from which to then derive a bus type. This is also a step
> towards removing the vague bus-based interfaces from the IOMMU API, when
> we can subsequently switch to using this device directly.
> 
> Furthermore, scrutiny reveals a lack of protection for the bus being
> removed while vfio_iommu_type1_attach_group() is using it; the reference
> that VFIO holds on the iommu_group ensures that data remains valid, but
> does not prevent the group's membership changing underfoot. Holding the
> vfio_device for as long as we need here also neatly solves this.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

> ---
> 
> After sleeping on it, I decided to type up the helper function approach
> to see how it looked in practice, and in doing so realised that with one
> more tweak it could also subsume the locking out of the common paths as
> well, so end up being a self-contained way for type1 to take care of its
> own concern, which I rather like.
> 
>   drivers/vfio/vfio.c             | 18 +++++++++++++++++-
>   drivers/vfio/vfio.h             |  3 +++
>   drivers/vfio/vfio_iommu_type1.c | 30 +++++++++++-------------------
>   3 files changed, 31 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> index 61e71c1154be..73bab04880d0 100644
> --- a/drivers/vfio/vfio.c
> +++ b/drivers/vfio/vfio.c
> @@ -448,7 +448,7 @@ static void vfio_group_get(struct vfio_group *group)
>    * Device objects - create, release, get, put, search
>    */
>   /* Device reference always implies a group reference */
> -static void vfio_device_put(struct vfio_device *device)
> +void vfio_device_put(struct vfio_device *device)
>   {
>   	if (refcount_dec_and_test(&device->refcount))
>   		complete(&device->comp);
> @@ -475,6 +475,22 @@ static struct vfio_device *vfio_group_get_device(struct vfio_group *group,
>   	return NULL;
>   }
>   
> +struct vfio_device *vfio_device_get_from_iommu(struct iommu_group *iommu_group)
> +{
> +	struct vfio_group *group = vfio_group_get_from_iommu(iommu_group);
> +	struct vfio_device *device;
> +
> +	mutex_lock(&group->device_lock);
> +	list_for_each_entry(device, &group->device_list, group_next) {
> +		if (vfio_device_try_get(device)) {
> +			mutex_unlock(&group->device_lock);
> +			return device;
> +		}
> +	}
> +	mutex_unlock(&group->device_lock);
> +	return NULL;
> +}
> +
>   /*
>    * VFIO driver API
>    */
> diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> index a67130221151..e8f21e64541b 100644
> --- a/drivers/vfio/vfio.h
> +++ b/drivers/vfio/vfio.h
> @@ -70,3 +70,6 @@ struct vfio_iommu_driver_ops {
>   
>   int vfio_register_iommu_driver(const struct vfio_iommu_driver_ops *ops);
>   void vfio_unregister_iommu_driver(const struct vfio_iommu_driver_ops *ops);
> +
> +struct vfio_device *vfio_device_get_from_iommu(struct iommu_group *iommu_group);
> +void vfio_device_put(struct vfio_device *device);
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index c13b9290e357..e38b8bfde677 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -1679,18 +1679,6 @@ static int vfio_dma_do_map(struct vfio_iommu *iommu,
>   	return ret;
>   }
>   
> -static int vfio_bus_type(struct device *dev, void *data)
> -{
> -	struct bus_type **bus = data;
> -
> -	if (*bus && *bus != dev->bus)
> -		return -EINVAL;
> -
> -	*bus = dev->bus;
> -
> -	return 0;
> -}
> -
>   static int vfio_iommu_replay(struct vfio_iommu *iommu,
>   			     struct vfio_domain *domain)
>   {
> @@ -2159,7 +2147,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
>   	struct vfio_iommu *iommu = iommu_data;
>   	struct vfio_iommu_group *group;
>   	struct vfio_domain *domain, *d;
> -	struct bus_type *bus = NULL;
> +	struct vfio_device *iommu_api_dev;
>   	bool resv_msi, msi_remap;
>   	phys_addr_t resv_msi_base = 0;
>   	struct iommu_domain_geometry *geo;
> @@ -2192,18 +2180,19 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
>   		goto out_unlock;
>   	}
>   
> -	/* Determine bus_type in order to allocate a domain */
> -	ret = iommu_group_for_each_dev(iommu_group, &bus, vfio_bus_type);
> -	if (ret)
> +	/* Resolve the group back to a member device for IOMMU API ops */
> +	ret = -ENODEV;
> +	iommu_api_dev = vfio_device_get_from_iommu(iommu_group);
> +	if (!iommu_api_dev)
>   		goto out_free_group;
>   
>   	ret = -ENOMEM;
>   	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
>   	if (!domain)
> -		goto out_free_group;
> +		goto out_put_dev;
>   
>   	ret = -EIO;
> -	domain->domain = iommu_domain_alloc(bus);
> +	domain->domain = iommu_domain_alloc(iommu_api_dev->dev->bus);
>   	if (!domain->domain)
>   		goto out_free_domain;
>   
> @@ -2258,7 +2247,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
>   	list_add(&group->next, &domain->group_list);
>   
>   	msi_remap = irq_domain_check_msi_remap() ||
> -		    iommu_capable(bus, IOMMU_CAP_INTR_REMAP);
> +		    iommu_capable(iommu_api_dev->dev->bus, IOMMU_CAP_INTR_REMAP);
>   
>   	if (!allow_unsafe_interrupts && !msi_remap) {
>   		pr_warn("%s: No interrupt remapping support.  Use the module param \"allow_unsafe_interrupts\" to enable VFIO IOMMU support on this platform\n",
> @@ -2331,6 +2320,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
>   	iommu->num_non_pinned_groups++;
>   	mutex_unlock(&iommu->lock);
>   	vfio_iommu_resv_free(&group_resv_regions);
> +	vfio_device_put(iommu_api_dev);
>   
>   	return 0;
>   
> @@ -2342,6 +2332,8 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
>   	vfio_iommu_resv_free(&group_resv_regions);
>   out_free_domain:
>   	kfree(domain);
> +out_put_dev:
> +	vfio_device_put(iommu_api_dev);
>   out_free_group:
>   	kfree(group);
>   out_unlock:

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
