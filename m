Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F877233A68
	for <lists.iommu@lfdr.de>; Thu, 30 Jul 2020 23:17:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B45F186B70;
	Thu, 30 Jul 2020 21:17:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KQODb5g8C38d; Thu, 30 Jul 2020 21:17:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1C69C86B67;
	Thu, 30 Jul 2020 21:17:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 100F1C004D;
	Thu, 30 Jul 2020 21:17:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0470DC004D
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jul 2020 21:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id ED71988478
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jul 2020 21:17:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xMcckxMIvw3q for <iommu@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 21:17:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C0DE68846A
 for <iommu@lists.linux-foundation.org>; Thu, 30 Jul 2020 21:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596143830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bZGuV4rD0Ceq1ep6s52mf/yK6aOPC8Nt7kiDKbGKZCM=;
 b=fSD5EdSO4Nry2NbMtGCBXHpYrFugAVbC9tkpespU/M+T6/H60af3AvbeEfXb5bwupHm6Wo
 JpDKJEyb5PqHjcrbr89Ft3/exIDM4FvC+IcUKDDNtkC4v5YQ7vNaRAbJP7mVrjDsCEqhY8
 mg87dFG8lwmzXvMNYApNlZMzdPiF818=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-x-mLPphPMe-v_LHwNhgtoA-1; Thu, 30 Jul 2020 17:17:06 -0400
X-MC-Unique: x-mLPphPMe-v_LHwNhgtoA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B53B1100A8F2;
 Thu, 30 Jul 2020 21:17:04 +0000 (UTC)
Received: from x1.home (ovpn-112-71.phx2.redhat.com [10.3.112.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C301519D7B;
 Thu, 30 Jul 2020 21:17:03 +0000 (UTC)
Date: Thu, 30 Jul 2020 15:17:03 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v3 4/4] vfio/type1: Use iommu_aux_at(de)tach_group() APIs
Message-ID: <20200730151703.5daf8ad4@x1.home>
In-Reply-To: <af6c95a7-3238-1cbd-8656-014c12498587@linux.intel.com>
References: <20200714055703.5510-1-baolu.lu@linux.intel.com>
 <20200714055703.5510-5-baolu.lu@linux.intel.com>
 <20200729143258.22533170@x1.home>
 <af6c95a7-3238-1cbd-8656-014c12498587@linux.intel.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Kevin Tian <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Thu, 30 Jul 2020 10:41:32 +0800
Lu Baolu <baolu.lu@linux.intel.com> wrote:

> Hi Alex,
> 
> On 7/30/20 4:32 AM, Alex Williamson wrote:
> > On Tue, 14 Jul 2020 13:57:03 +0800
> > Lu Baolu <baolu.lu@linux.intel.com> wrote:
> >   
> >> Replace iommu_aux_at(de)tach_device() with iommu_aux_at(de)tach_group().
> >> It also saves the IOMMU_DEV_FEAT_AUX-capable physcail device in the
> >> vfio_group data structure so that it could be reused in other places.
> >>
> >> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> >> ---
> >>   drivers/vfio/vfio_iommu_type1.c | 44 ++++++---------------------------
> >>   1 file changed, 7 insertions(+), 37 deletions(-)
> >>
> >> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> >> index 5e556ac9102a..f8812e68de77 100644
> >> --- a/drivers/vfio/vfio_iommu_type1.c
> >> +++ b/drivers/vfio/vfio_iommu_type1.c
> >> @@ -100,6 +100,7 @@ struct vfio_dma {
> >>   struct vfio_group {
> >>   	struct iommu_group	*iommu_group;
> >>   	struct list_head	next;
> >> +	struct device		*iommu_device;
> >>   	bool			mdev_group;	/* An mdev group */
> >>   	bool			pinned_page_dirty_scope;
> >>   };
> >> @@ -1627,45 +1628,13 @@ static struct device *vfio_mdev_get_iommu_device(struct device *dev)
> >>   	return NULL;
> >>   }
> >>   
> >> -static int vfio_mdev_attach_domain(struct device *dev, void *data)
> >> -{
> >> -	struct iommu_domain *domain = data;
> >> -	struct device *iommu_device;
> >> -
> >> -	iommu_device = vfio_mdev_get_iommu_device(dev);
> >> -	if (iommu_device) {
> >> -		if (iommu_dev_feature_enabled(iommu_device, IOMMU_DEV_FEAT_AUX))
> >> -			return iommu_aux_attach_device(domain, iommu_device);
> >> -		else
> >> -			return iommu_attach_device(domain, iommu_device);
> >> -	}
> >> -
> >> -	return -EINVAL;
> >> -}
> >> -
> >> -static int vfio_mdev_detach_domain(struct device *dev, void *data)
> >> -{
> >> -	struct iommu_domain *domain = data;
> >> -	struct device *iommu_device;
> >> -
> >> -	iommu_device = vfio_mdev_get_iommu_device(dev);
> >> -	if (iommu_device) {
> >> -		if (iommu_dev_feature_enabled(iommu_device, IOMMU_DEV_FEAT_AUX))
> >> -			iommu_aux_detach_device(domain, iommu_device);
> >> -		else
> >> -			iommu_detach_device(domain, iommu_device);
> >> -	}
> >> -
> >> -	return 0;
> >> -}
> >> -
> >>   static int vfio_iommu_attach_group(struct vfio_domain *domain,
> >>   				   struct vfio_group *group)
> >>   {
> >>   	if (group->mdev_group)
> >> -		return iommu_group_for_each_dev(group->iommu_group,
> >> -						domain->domain,
> >> -						vfio_mdev_attach_domain);
> >> +		return iommu_aux_attach_group(domain->domain,
> >> +					      group->iommu_group,
> >> +					      group->iommu_device);  
> > 
> > No, we previously iterated all devices in the group and used the aux
> > interface only when we have an iommu_device supporting aux.  If we
> > simply assume an mdev group only uses an aux domain we break existing
> > users, ex. SR-IOV VF backed mdevs.  Thanks,  
> 
> Oh, yes. Sorry! I didn't consider the physical device backed mdevs
> cases.
> 
> Looked into this part of code, it seems that there's a lock issue here.
> The group->mutex is held in iommu_group_for_each_dev() and will be
> acquired again in iommu_attach_device().

These are two different groups.  We walk the devices in the mdev's
group with iommu_group_for_each_dev(), holding the mdev's group lock,
but we call iommu_attach_device() with iommu_device, which results in
acquiring the lock for the iommu_device's group.

> How about making it like:
> 
> static int vfio_iommu_attach_group(struct vfio_domain *domain,
>                                     struct vfio_group *group)
> {
>          if (group->mdev_group) {
>                  struct device *iommu_device = group->iommu_device;
> 
>                  if (WARN_ON(!iommu_device))
>                          return -EINVAL;
> 
>                  if (iommu_dev_feature_enabled(iommu_device, 
> IOMMU_DEV_FEAT_AUX))
>                          return iommu_aux_attach_device(domain->domain, 
> iommu_device);
>                  else
>                          return iommu_attach_device(domain->domain, 
> iommu_device);
>          } else {
>                  return iommu_attach_group(domain->domain, 
> group->iommu_group);
>          }
> }
> 
> The caller (vfio_iommu_type1_attach_group) has guaranteed that all mdevs
> in an iommu group should be derived from a same physical device.

Have we?  iommu_attach_device() will fail if the group is not
singleton, but that's just encouraging us to use the _attach_group()
interface where the _attach_device() interface is relegated to special
cases.  Ideally we'd get out of those special cases and create an
_attach_group() for aux that doesn't further promote these notions.

> Any thoughts?

See my reply to Kevin, I'm thinking we need to provide a callback that
can enlighten the IOMMU layer to be able to do _attach_group() with
aux or separate IOMMU backed devices.  Thanks,

Alex

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
