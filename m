Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F94E19AC0A
	for <lists.iommu@lfdr.de>; Wed,  1 Apr 2020 14:52:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 32A5620022;
	Wed,  1 Apr 2020 12:52:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dU1eECoVwNip; Wed,  1 Apr 2020 12:52:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 56FB420794;
	Wed,  1 Apr 2020 12:52:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50C34C089F;
	Wed,  1 Apr 2020 12:52:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 842FEC089F
 for <iommu@lists.linux-foundation.org>; Wed,  1 Apr 2020 12:52:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 733AD85D30
 for <iommu@lists.linux-foundation.org>; Wed,  1 Apr 2020 12:52:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FgUlzbpAyxUP for <iommu@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 12:52:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3F9B685D11
 for <iommu@lists.linux-foundation.org>; Wed,  1 Apr 2020 12:52:05 +0000 (UTC)
IronPort-SDR: xtLgF7q/AN88/Xrd4kghPiBjc+Hswd2wBXNwJ0LeGfM67llOgHuXNw7QXSVFi4Jx4eADLjQ4Cl
 3We94MMZxZpw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2020 05:52:04 -0700
IronPort-SDR: mARSEAqYVJ6C6D6b35OEX3tlAKOtDWH3rdn0XTNobRLr1MupdzSy7Ipt8iOv4A8rs6pJN1Xo26
 c6oQZydb8TkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,331,1580803200"; d="scan'208";a="395967696"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga004.jf.intel.com with ESMTP; 01 Apr 2020 05:52:03 -0700
Received: from fmsmsx154.amr.corp.intel.com (10.18.116.70) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 1 Apr 2020 05:52:03 -0700
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 FMSMSX154.amr.corp.intel.com (10.18.116.70) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 1 Apr 2020 05:52:03 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.225]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.7]) with mapi id 14.03.0439.000;
 Wed, 1 Apr 2020 20:51:59 +0800
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Auger Eric <eric.auger@redhat.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>
Subject: RE: [PATCH v1 5/8] vfio/type1: Report 1st-level/stage-1 format to
 userspace
Thread-Topic: [PATCH v1 5/8] vfio/type1: Report 1st-level/stage-1 format to
 userspace
Thread-Index: AQHWAEUcqZEEdiOKbEGofjWp2Yic+6hjfq+AgAC/vLA=
Date: Wed, 1 Apr 2020 12:51:58 +0000
Message-ID: <A2975661238FB949B60364EF0F2C25743A21DB4E@SHSMSX104.ccr.corp.intel.com>
References: <1584880325-10561-1-git-send-email-yi.l.liu@intel.com>
 <1584880325-10561-6-git-send-email-yi.l.liu@intel.com>
 <cb68e9ab-77b0-7e97-a661-4836962041d9@redhat.com>
In-Reply-To: <cb68e9ab-77b0-7e97-a661-4836962041d9@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "jean-philippe@linaro.org" <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Raj, 
 Ashok" <ashok.raj@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Tian, Jun J" <jun.j.tian@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Sun, Yi
 Y" <yi.y.sun@intel.com>, "Wu, Hao" <hao.wu@intel.com>
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

Hi Eric,

> From: Auger Eric <eric.auger@redhat.com>
> Sent: Wednesday, April 1, 2020 4:51 PM
> To: Liu, Yi L <yi.l.liu@intel.com>; alex.williamson@redhat.com
> Subject: Re: [PATCH v1 5/8] vfio/type1: Report 1st-level/stage-1 format to
> userspace
> 
> Hi Yi,
> On 3/22/20 1:32 PM, Liu, Yi L wrote:
> > From: Liu Yi L <yi.l.liu@intel.com>
> >
> > VFIO exposes IOMMU nesting translation (a.k.a dual stage translation)
> > capability to userspace. Thus applications like QEMU could support
> > vIOMMU with hardware's nesting translation capability for pass-through
> > devices. Before setting up nesting translation for pass-through devices,
> > QEMU and other applications need to learn the supported 1st-lvl/stage-1
> > translation structure format like page table format.
> >
> > Take vSVA (virtual Shared Virtual Addressing) as an example, to support
> > vSVA for pass-through devices, QEMU setup nesting translation for pass-
> > through devices. The guest page table are configured to host as 1st-lvl/
> > stage-1 page table. Therefore, guest format should be compatible with
> > host side.
> >
> > This patch reports the supported 1st-lvl/stage-1 page table format on the
> > current platform to userspace. QEMU and other alike applications should
> > use this format info when trying to setup IOMMU nesting translation on
> > host IOMMU.
> >
> > Cc: Kevin Tian <kevin.tian@intel.com>
> > CC: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > Cc: Alex Williamson <alex.williamson@redhat.com>
> > Cc: Eric Auger <eric.auger@redhat.com>
> > Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
> > ---
> >  drivers/vfio/vfio_iommu_type1.c | 56
> +++++++++++++++++++++++++++++++++++++++++
> >  include/uapi/linux/vfio.h       |  1 +
> >  2 files changed, 57 insertions(+)
> >
> > diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> > index 9aa2a67..82a9e0b 100644
> > --- a/drivers/vfio/vfio_iommu_type1.c
> > +++ b/drivers/vfio/vfio_iommu_type1.c
> > @@ -2234,11 +2234,66 @@ static int vfio_iommu_type1_pasid_free(struct
> vfio_iommu *iommu,
> >  	return ret;
> >  }
> >
> > +static int vfio_iommu_get_stage1_format(struct vfio_iommu *iommu,
> > +					 u32 *stage1_format)
> vfio_pasid_format() to be homogeneous with vfio_pgsize_bitmap() which
> does the same kind of enumeration of the vfio_iommu domains

yes, similar.

> > +{
> > +	struct vfio_domain *domain;
> > +	u32 format = 0, tmp_format = 0;
> > +	int ret;
> ret = -EINVAL;

got it.

> > +
> > +	mutex_lock(&iommu->lock);
> > +	if (list_empty(&iommu->domain_list)) {
> goto out_unlock;

right.
> > +		mutex_unlock(&iommu->lock);
> > +		return -EINVAL;
> > +	}
> > +
> > +	list_for_each_entry(domain, &iommu->domain_list, next) {
> > +		if (iommu_domain_get_attr(domain->domain,
> > +			DOMAIN_ATTR_PASID_FORMAT, &format)) {
> I can find DOMAIN_ATTR_PASID_FORMAT in Jacob's v9 but not in v10

oops, I guess he somehow missed. you may find it in below link.

https://github.com/luxis1999/linux-vsva/commit/bf14b11a12f74d58ad3ee626a5d891de395082eb

> > +			ret = -EINVAL;
> could be removed

sure.

> > +			format = 0;
> > +			goto out_unlock;
> > +		}
> > +		/*
> > +		 * format is always non-zero (the first format is
> > +		 * IOMMU_PASID_FORMAT_INTEL_VTD which is 1). For
> > +		 * the reason of potential different backed IOMMU
> > +		 * formats, here we expect to have identical formats
> > +		 * in the domain list, no mixed formats support.
> > +		 * return -EINVAL to fail the attempt of setup
> > +		 * VFIO_TYPE1_NESTING_IOMMU if non-identical formats
> > +		 * are detected.
> > +		 */
> > +		if (tmp_format && tmp_format != format) {
> > +			ret = -EINVAL;
> could be removed

got it.

> > +			format = 0;
> > +			goto out_unlock;
> > +		}
> > +
> > +		tmp_format = format;
> > +	}
> > +	ret = 0;
> > +
> > +out_unlock:
> > +	if (format)
> if (!ret) ? then you can remove the format = 0 in case of error.

oh, yes.

> > +		*stage1_format = format;
> > +	mutex_unlock(&iommu->lock);
> > +	return ret;
> > +}
> > +
> >  static int vfio_iommu_info_add_nesting_cap(struct vfio_iommu *iommu,
> >  					 struct vfio_info_cap *caps)
> >  {
> >  	struct vfio_info_cap_header *header;
> >  	struct vfio_iommu_type1_info_cap_nesting *nesting_cap;
> > +	u32 formats = 0;
> > +	int ret;
> > +
> > +	ret = vfio_iommu_get_stage1_format(iommu, &formats);
> > +	if (ret) {
> > +		pr_warn("Failed to get stage-1 format\n");
> trace triggered by userspace to be removed?

sure.

> > +		return ret;
> > +	}
> >
> >  	header = vfio_info_cap_add(caps, sizeof(*nesting_cap),
> >  				   VFIO_IOMMU_TYPE1_INFO_CAP_NESTING, 1);
> > @@ -2254,6 +2309,7 @@ static int vfio_iommu_info_add_nesting_cap(struct
> vfio_iommu *iommu,
> >  		/* nesting iommu type supports PASID requests (alloc/free) */
> >  		nesting_cap->nesting_capabilities |= VFIO_IOMMU_PASID_REQS;
> What is the meaning for ARM?

I think it's just a software capability exposed to userspace, on
userspace side, it has a choice to use it or not. :-) The reason
define it and report it in cap nesting is that I'd like to make
the pasid alloc/free be available just for IOMMU with type
VFIO_IOMMU_TYPE1_NESTING. Please feel free tell me if it is not
good for ARM. We can find a proper way to report the availability.

> >  	}
> > +	nesting_cap->stage1_formats = formats;
> as spotted by Kevin, since a single format is supported, rename

ok, I was believing it may be possible on ARM or so. :-) will
rename it.

I'll refine the patch per your above comments.

Regards,
Yi Liu

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
