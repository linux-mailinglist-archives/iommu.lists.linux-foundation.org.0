Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B5C19A6B1
	for <lists.iommu@lfdr.de>; Wed,  1 Apr 2020 09:56:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B140B85D30;
	Wed,  1 Apr 2020 07:56:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jDdC45fxftn8; Wed,  1 Apr 2020 07:56:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AA41D85C9F;
	Wed,  1 Apr 2020 07:56:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94EE0C1D7F;
	Wed,  1 Apr 2020 07:56:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D24BC089F
 for <iommu@lists.linux-foundation.org>; Wed,  1 Apr 2020 07:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 766A420028
 for <iommu@lists.linux-foundation.org>; Wed,  1 Apr 2020 07:56:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QrAij2JW0bnI for <iommu@lists.linux-foundation.org>;
 Wed,  1 Apr 2020 07:56:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by silver.osuosl.org (Postfix) with ESMTPS id 1D5081FCA0
 for <iommu@lists.linux-foundation.org>; Wed,  1 Apr 2020 07:56:15 +0000 (UTC)
IronPort-SDR: wOqcQweSn6jLqyRtLiHnfGc0OskVs7Hu/7GdO6GpiyMB3Sco73SNDeI9ELzvhJc823LYPKL8mk
 ftI0f0E/SHHA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2020 00:56:14 -0700
IronPort-SDR: v3w9qyLUYek2gptnwh6/vLPLA95sVSH5EJOhDT/oAIVoCrg3zChAIYl9ZgNERTyeSOdGVbbnzT
 GoHHGlMxc7jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,330,1580803200"; d="scan'208";a="240416556"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga007.fm.intel.com with ESMTP; 01 Apr 2020 00:56:14 -0700
Received: from fmsmsx112.amr.corp.intel.com (10.18.116.6) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 1 Apr 2020 00:56:14 -0700
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 FMSMSX112.amr.corp.intel.com (10.18.116.6) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 1 Apr 2020 00:56:14 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.225]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.138]) with mapi id 14.03.0439.000;
 Wed, 1 Apr 2020 15:56:10 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "Liu, Yi L" <yi.l.liu@intel.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "eric.auger@redhat.com" <eric.auger@redhat.com>
Subject: RE: [PATCH v1 5/8] vfio/type1: Report 1st-level/stage-1 format to
 userspace
Thread-Topic: [PATCH v1 5/8] vfio/type1: Report 1st-level/stage-1 format to
 userspace
Thread-Index: AQHWAEUcrRt83jyTNECgMYM7VBywiqhg9Y6ggAJ0uwCAAIq3IA==
Date: Wed, 1 Apr 2020 07:56:09 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D803F42@SHSMSX104.ccr.corp.intel.com>
References: <1584880325-10561-1-git-send-email-yi.l.liu@intel.com>
 <1584880325-10561-6-git-send-email-yi.l.liu@intel.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7FF8BC@SHSMSX104.ccr.corp.intel.com>
 <A2975661238FB949B60364EF0F2C25743A21D5C2@SHSMSX104.ccr.corp.intel.com>
In-Reply-To: <A2975661238FB949B60364EF0F2C25743A21D5C2@SHSMSX104.ccr.corp.intel.com>
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
> Sent: Wednesday, April 1, 2020 3:38 PM
> 
>  > From: Tian, Kevin <kevin.tian@intel.com>
> > Sent: Monday, March 30, 2020 7:49 PM
> > To: Liu, Yi L <yi.l.liu@intel.com>; alex.williamson@redhat.com;
> > Subject: RE: [PATCH v1 5/8] vfio/type1: Report 1st-level/stage-1 format to
> > userspace
> >
> > > From: Liu, Yi L <yi.l.liu@intel.com>
> > > Sent: Sunday, March 22, 2020 8:32 PM
> > >
> > > From: Liu Yi L <yi.l.liu@intel.com>
> > >
> > > VFIO exposes IOMMU nesting translation (a.k.a dual stage translation)
> > > capability to userspace. Thus applications like QEMU could support
> > > vIOMMU with hardware's nesting translation capability for pass-through
> > > devices. Before setting up nesting translation for pass-through
> > > devices, QEMU and other applications need to learn the supported
> > > 1st-lvl/stage-1 translation structure format like page table format.
> > >
> > > Take vSVA (virtual Shared Virtual Addressing) as an example, to
> > > support vSVA for pass-through devices, QEMU setup nesting translation
> > > for pass- through devices. The guest page table are configured to host
> > > as 1st-lvl/
> > > stage-1 page table. Therefore, guest format should be compatible with
> > > host side.
> > >
> > > This patch reports the supported 1st-lvl/stage-1 page table format on
> > > the current platform to userspace. QEMU and other alike applications
> > > should use this format info when trying to setup IOMMU nesting
> > > translation on host IOMMU.
> > >
> > > Cc: Kevin Tian <kevin.tian@intel.com>
> > > CC: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > > Cc: Alex Williamson <alex.williamson@redhat.com>
> > > Cc: Eric Auger <eric.auger@redhat.com>
> > > Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
> > > ---
> > >  drivers/vfio/vfio_iommu_type1.c | 56
> > > +++++++++++++++++++++++++++++++++++++++++
> > >  include/uapi/linux/vfio.h       |  1 +
> > >  2 files changed, 57 insertions(+)
> > >
> > > diff --git a/drivers/vfio/vfio_iommu_type1.c
> > > b/drivers/vfio/vfio_iommu_type1.c index 9aa2a67..82a9e0b 100644
> > > --- a/drivers/vfio/vfio_iommu_type1.c
> > > +++ b/drivers/vfio/vfio_iommu_type1.c
> > > @@ -2234,11 +2234,66 @@ static int
> vfio_iommu_type1_pasid_free(struct
> > > vfio_iommu *iommu,
> > >  	return ret;
> > >  }
> > >
> > > +static int vfio_iommu_get_stage1_format(struct vfio_iommu *iommu,
> > > +					 u32 *stage1_format)
> > > +{
> > > +	struct vfio_domain *domain;
> > > +	u32 format = 0, tmp_format = 0;
> > > +	int ret;
> > > +
> > > +	mutex_lock(&iommu->lock);
> > > +	if (list_empty(&iommu->domain_list)) {
> > > +		mutex_unlock(&iommu->lock);
> > > +		return -EINVAL;
> > > +	}
> > > +
> > > +	list_for_each_entry(domain, &iommu->domain_list, next) {
> > > +		if (iommu_domain_get_attr(domain->domain,
> > > +			DOMAIN_ATTR_PASID_FORMAT, &format)) {
> > > +			ret = -EINVAL;
> > > +			format = 0;
> > > +			goto out_unlock;
> > > +		}
> > > +		/*
> > > +		 * format is always non-zero (the first format is
> > > +		 * IOMMU_PASID_FORMAT_INTEL_VTD which is 1). For
> > > +		 * the reason of potential different backed IOMMU
> > > +		 * formats, here we expect to have identical formats
> > > +		 * in the domain list, no mixed formats support.
> > > +		 * return -EINVAL to fail the attempt of setup
> > > +		 * VFIO_TYPE1_NESTING_IOMMU if non-identical formats
> > > +		 * are detected.
> > > +		 */
> > > +		if (tmp_format && tmp_format != format) {
> > > +			ret = -EINVAL;
> > > +			format = 0;
> > > +			goto out_unlock;
> > > +		}
> > > +
> > > +		tmp_format = format;
> > > +	}
> >
> > this path is invoked only in VFIO_IOMMU_GET_INFO path. If we don't want
> to
> > assume the status quo that one container holds only one device w/
> vIOMMU
> > (the prerequisite for vSVA), looks we also need check the format
> > compatibility when attaching a new group to this container?
> 
> right. if attaching to a nesting type container (vfio_iommu.nesting bit
> indicates it), it should check if it is compabile with prior domains in
> the domain list. But if it is the first one attached to this container,
> it's fine. is it good?

yes, but my point is whether we should check the format compatibility
in the attach path...

> 
> > > +	ret = 0;
> > > +
> > > +out_unlock:
> > > +	if (format)
> > > +		*stage1_format = format;
> > > +	mutex_unlock(&iommu->lock);
> > > +	return ret;
> > > +}
> > > +
> > >  static int vfio_iommu_info_add_nesting_cap(struct vfio_iommu *iommu,
> > >  					 struct vfio_info_cap *caps)
> > >  {
> > >  	struct vfio_info_cap_header *header;
> > >  	struct vfio_iommu_type1_info_cap_nesting *nesting_cap;
> > > +	u32 formats = 0;
> > > +	int ret;
> > > +
> > > +	ret = vfio_iommu_get_stage1_format(iommu, &formats);
> > > +	if (ret) {
> > > +		pr_warn("Failed to get stage-1 format\n");
> > > +		return ret;
> > > +	}
> > >
> > >  	header = vfio_info_cap_add(caps, sizeof(*nesting_cap),
> > >  				   VFIO_IOMMU_TYPE1_INFO_CAP_NESTING,
> > > 1);
> > > @@ -2254,6 +2309,7 @@ static int
> > > vfio_iommu_info_add_nesting_cap(struct
> > > vfio_iommu *iommu,
> > >  		/* nesting iommu type supports PASID requests (alloc/free)
> */
> > >  		nesting_cap->nesting_capabilities |=
> VFIO_IOMMU_PASID_REQS;
> > >  	}
> > > +	nesting_cap->stage1_formats = formats;
> > >
> > >  	return 0;
> > >  }
> > > diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> > > index ed9881d..ebeaf3e 100644
> > > --- a/include/uapi/linux/vfio.h
> > > +++ b/include/uapi/linux/vfio.h
> > > @@ -763,6 +763,7 @@ struct vfio_iommu_type1_info_cap_nesting {
> > >  	struct	vfio_info_cap_header header;
> > >  #define VFIO_IOMMU_PASID_REQS	(1 << 0)
> > >  	__u32	nesting_capabilities;
> > > +	__u32	stage1_formats;
> >
> > do you plan to support multiple formats? If not, use singular name.
> 
> I do have such plan. e.g. it may be helpful when one day a platform can
> support multiple formats.
> 
> Regards,
> Yi Liu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
