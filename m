Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F005A1977AE
	for <lists.iommu@lfdr.de>; Mon, 30 Mar 2020 11:19:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 876B0203FB;
	Mon, 30 Mar 2020 09:19:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mGfXP+Tu0yKg; Mon, 30 Mar 2020 09:19:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7B07422CC6;
	Mon, 30 Mar 2020 09:19:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 63522C07FF;
	Mon, 30 Mar 2020 09:19:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3987EC07FF
 for <iommu@lists.linux-foundation.org>; Mon, 30 Mar 2020 09:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 35C8385EB8
 for <iommu@lists.linux-foundation.org>; Mon, 30 Mar 2020 09:19:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AfCcNbw4SSO3 for <iommu@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 09:19:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E3FA085EAC
 for <iommu@lists.linux-foundation.org>; Mon, 30 Mar 2020 09:19:39 +0000 (UTC)
IronPort-SDR: gKKfkvYq24UvJThiGV1ISOZf5YIw5zIoSXc3uFcsF+FXp8kO+IZCoHbutpdH95x0tgHVtMllIO
 9F1reyJUGOrg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2020 02:19:39 -0700
IronPort-SDR: nenw0c/QYlIZ+ezEmcT5mgKIqnKGs22ulwDq4iiQrlDz09QVb1KJ4hVKUKGASuz06B4unSR/pN
 l+oGwnoJ9HDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,323,1580803200"; d="scan'208";a="294534776"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by FMSMGA003.fm.intel.com with ESMTP; 30 Mar 2020 02:19:38 -0700
Received: from fmsmsx156.amr.corp.intel.com (10.18.116.74) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 30 Mar 2020 02:19:38 -0700
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 fmsmsx156.amr.corp.intel.com (10.18.116.74) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 30 Mar 2020 02:19:38 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.225]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.209]) with mapi id 14.03.0439.000;
 Mon, 30 Mar 2020 17:19:34 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "eric.auger@redhat.com" <eric.auger@redhat.com>
Subject: RE: [PATCH v1 2/8] vfio/type1: Add vfio_iommu_type1 parameter for
 quota tuning
Thread-Topic: [PATCH v1 2/8] vfio/type1: Add vfio_iommu_type1 parameter for
 quota tuning
Thread-Index: AQHWAEUbX2o9koiJmUSoQpAjbhigyahg28IA//9+x4CAAI0HsA==
Date: Mon, 30 Mar 2020 09:19:33 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7FF46F@SHSMSX104.ccr.corp.intel.com>
References: <1584880325-10561-1-git-send-email-yi.l.liu@intel.com>
 <1584880325-10561-3-git-send-email-yi.l.liu@intel.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7FF3C5@SHSMSX104.ccr.corp.intel.com>
 <A2975661238FB949B60364EF0F2C25743A217C68@SHSMSX104.ccr.corp.intel.com>
In-Reply-To: <A2975661238FB949B60364EF0F2C25743A217C68@SHSMSX104.ccr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "jean-philippe@linaro.org" <jean-philippe@linaro.org>, "Raj,
 Ashok" <ashok.raj@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Tian, Jun J" <jun.j.tian@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Sun,
 Yi Y" <yi.y.sun@intel.com>, "Wu, Hao" <hao.wu@intel.com>
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

> From: Liu, Yi L <yi.l.liu@intel.com>
> Sent: Monday, March 30, 2020 4:53 PM
> 
> > From: Tian, Kevin <kevin.tian@intel.com>
> > Sent: Monday, March 30, 2020 4:41 PM
> > To: Liu, Yi L <yi.l.liu@intel.com>; alex.williamson@redhat.com;
> > Subject: RE: [PATCH v1 2/8] vfio/type1: Add vfio_iommu_type1 parameter
> for quota
> > tuning
> >
> > > From: Liu, Yi L <yi.l.liu@intel.com>
> > > Sent: Sunday, March 22, 2020 8:32 PM
> > >
> > > From: Liu Yi L <yi.l.liu@intel.com>
> > >
> > > This patch adds a module option to make the PASID quota tunable by
> > > administrator.
> > >
> > > TODO: needs to think more on how to  make the tuning to be per-process.
> > >
> > > Previous discussions:
> > > https://patchwork.kernel.org/patch/11209429/
> > >
> > > Cc: Kevin Tian <kevin.tian@intel.com>
> > > CC: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > > Cc: Alex Williamson <alex.williamson@redhat.com>
> > > Cc: Eric Auger <eric.auger@redhat.com>
> > > Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
> > > ---
> > >  drivers/vfio/vfio.c             | 8 +++++++-
> > >  drivers/vfio/vfio_iommu_type1.c | 7 ++++++-
> > >  include/linux/vfio.h            | 3 ++-
> > >  3 files changed, 15 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/vfio/vfio.c b/drivers/vfio/vfio.c
> > > index d13b483..020a792 100644
> > > --- a/drivers/vfio/vfio.c
> > > +++ b/drivers/vfio/vfio.c
> > > @@ -2217,13 +2217,19 @@ struct vfio_mm
> *vfio_mm_get_from_task(struct
> > > task_struct *task)
> > >  }
> > >  EXPORT_SYMBOL_GPL(vfio_mm_get_from_task);
> > >
> > > -int vfio_mm_pasid_alloc(struct vfio_mm *vmm, int min, int max)
> > > +int vfio_mm_pasid_alloc(struct vfio_mm *vmm, int quota, int min, int
> max)
> > >  {
> > >  	ioasid_t pasid;
> > >  	int ret = -ENOSPC;
> > >
> > >  	mutex_lock(&vmm->pasid_lock);
> > >
> > > +	/* update quota as it is tunable by admin */
> > > +	if (vmm->pasid_quota != quota) {
> > > +		vmm->pasid_quota = quota;
> > > +		ioasid_adjust_set(vmm->ioasid_sid, quota);
> > > +	}
> > > +
> >
> > It's a bit weird to have quota adjusted in the alloc path, since the latter
> might
> > be initiated by non-privileged users. Why not doing the simple math in
> vfio_
> > create_mm to set the quota when the ioasid set is created? even in the
> future
> > you may allow per-process quota setting, that should come from separate
> > privileged path instead of thru alloc..
> 
> The reason is the kernel parameter modification has no event which
> can be used to adjust the quota. So I chose to adjust it in pasid_alloc
> path. If it's not good, how about adding one more IOCTL to let user-
> space trigger a quota adjustment event? Then even non-privileged
> user could trigger quota adjustment, the quota is actually controlled
> by privileged user. How about your opinion?
> 

why do you need an event to adjust? As I said, you can set the quota
when the set is created in vfio_create_mm...

Thanks
Kevin
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
