Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CC610247D3A
	for <lists.iommu@lfdr.de>; Tue, 18 Aug 2020 06:15:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 863A1860F9;
	Tue, 18 Aug 2020 04:15:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nlrlI+lp1yVJ; Tue, 18 Aug 2020 04:14:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9CFBD860D1;
	Tue, 18 Aug 2020 04:14:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89CF5C0051;
	Tue, 18 Aug 2020 04:14:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34CDBC0051
 for <iommu@lists.linux-foundation.org>; Tue, 18 Aug 2020 04:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 307D28762E
 for <iommu@lists.linux-foundation.org>; Tue, 18 Aug 2020 04:14:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4mAc8yxOzKax for <iommu@lists.linux-foundation.org>;
 Tue, 18 Aug 2020 04:14:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 428AD87554
 for <iommu@lists.linux-foundation.org>; Tue, 18 Aug 2020 04:14:54 +0000 (UTC)
IronPort-SDR: CoW3PdJllzrOPOpKz+PgNakdAVX2b12IRoHMIwx8oFovb4osSY/s0/NRiPBLqKqMDMgQ43Wt2a
 kDTwORKssPMQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="239662929"
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; d="scan'208";a="239662929"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 21:14:53 -0700
IronPort-SDR: YBMZ3OiG/Bfazb2jhyc1E6t3i8isqAw/xIrXgU06qO7osuPt2lOxKZR7PTx6ZDDAgFKzDK+fz2
 MXJ0tmscqpgA==
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; d="scan'208";a="336498730"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 21:14:53 -0700
Date: Mon, 17 Aug 2020 21:21:52 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v6 02/15] iommu: Report domain nesting info
Message-ID: <20200817212152.2820eedd@jacob-builder>
In-Reply-To: <342e8d77-1c1d-e637-0227-720ba67df8ba@redhat.com>
References: <1595917664-33276-1-git-send-email-yi.l.liu@intel.com>
 <1595917664-33276-3-git-send-email-yi.l.liu@intel.com>
 <5c911565-c76a-c361-845e-56a91744d504@redhat.com>
 <DM5PR11MB1435CC4503506228790CCB39C3400@DM5PR11MB1435.namprd11.prod.outlook.com>
 <342e8d77-1c1d-e637-0227-720ba67df8ba@redhat.com>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "jean-philippe@linaro.org" <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "stefanha@gmail.com" <stefanha@gmail.com>, "Sun, Yi Y" <yi.y.sun@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Wu,
 Hao" <hao.wu@intel.com>, "Tian, Jun J" <jun.j.tian@intel.com>
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

On Sun, 16 Aug 2020 14:40:57 +0200
Auger Eric <eric.auger@redhat.com> wrote:

> Hi Yi,
> 
> On 8/14/20 9:15 AM, Liu, Yi L wrote:
> > Hi Eric,
> >   
> >> From: Auger Eric <eric.auger@redhat.com>
> >> Sent: Thursday, August 13, 2020 8:53 PM
> >>
> >> Yi,
> >> On 7/28/20 8:27 AM, Liu Yi L wrote:  
> >>> IOMMUs that support nesting translation needs report the
> >>> capability info  
> >> s/needs/need to  
> >>> to userspace. It gives information about requirements the
> >>> userspace needs to implement plus other features characterizing
> >>> the physical implementation.
> >>>
> >>> This patch reports nesting info by DOMAIN_ATTR_NESTING. Caller
> >>> can get nesting info after setting DOMAIN_ATTR_NESTING. For VFIO,
> >>> it is after selecting VFIO_TYPE1_NESTING_IOMMU.  
> >> This is not what this patch does ;-) It introduces a new IOMMU UAPI
> >> struct that gives information about the nesting capabilities and
> >> features. This struct is supposed to be returned by
> >> iommu_domain_get_attr() with DOMAIN_ATTR_NESTING attribute
> >> parameter, one a domain whose type has been set to
> >> DOMAIN_ATTR_NESTING.  
> > 
> > got it. let me apply your suggestion. thanks. :-)
> >   
> >>>
> >>> Cc: Kevin Tian <kevin.tian@intel.com>
> >>> CC: Jacob Pan <jacob.jun.pan@linux.intel.com>
> >>> Cc: Alex Williamson <alex.williamson@redhat.com>
> >>> Cc: Eric Auger <eric.auger@redhat.com>
> >>> Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
> >>> Cc: Joerg Roedel <joro@8bytes.org>
> >>> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> >>> Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
> >>> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> >>> ---
> >>> v5 -> v6:
> >>> *) rephrase the feature notes per comments from Eric Auger.
> >>> *) rename @size of struct iommu_nesting_info to @argsz.
> >>>
> >>> v4 -> v5:
> >>> *) address comments from Eric Auger.
> >>>
> >>> v3 -> v4:
> >>> *) split the SMMU driver changes to be a separate patch
> >>> *) move the @addr_width and @pasid_bits from vendor specific
> >>>    part to generic part.
> >>> *) tweak the description for the @features field of struct
> >>>    iommu_nesting_info.
> >>> *) add description on the @data[] field of struct
> >>> iommu_nesting_info
> >>>
> >>> v2 -> v3:
> >>> *) remvoe cap/ecap_mask in iommu_nesting_info.
> >>> *) reuse DOMAIN_ATTR_NESTING to get nesting info.
> >>> *) return an empty iommu_nesting_info for SMMU drivers per Jean'
> >>>    suggestion.
> >>> ---
> >>>  include/uapi/linux/iommu.h | 74  
> >> ++++++++++++++++++++++++++++++++++++++++++++++  
> >>>  1 file changed, 74 insertions(+)
> >>>
> >>> diff --git a/include/uapi/linux/iommu.h
> >>> b/include/uapi/linux/iommu.h index 7c8e075..5e4745a 100644
> >>> --- a/include/uapi/linux/iommu.h
> >>> +++ b/include/uapi/linux/iommu.h
> >>> @@ -332,4 +332,78 @@ struct iommu_gpasid_bind_data {
> >>>  	} vendor;
> >>>  };
> >>>
> >>> +/*
> >>> + * struct iommu_nesting_info - Information for nesting-capable
> >>> IOMMU.
> >>> + *			       userspace should check it
> >>> before using
> >>> + *			       nesting capability.
> >>> + *
> >>> + * @argsz:	size of the whole structure.
> >>> + * @flags:	currently reserved for future extension. must
> >>> set to 0.
> >>> + * @format:	PASID table entry format, the same definition
> >>> as struct
> >>> + *		iommu_gpasid_bind_data @format.
> >>> + * @features:	supported nesting features.
> >>> + * @addr_width:	The output addr width of first
> >>> level/stage translation
> >>> + * @pasid_bits:	Maximum supported PASID bits, 0
> >>> represents no PASID
> >>> + *		support.
> >>> + * @data:	vendor specific cap info. data[] structure type
> >>> can be deduced
> >>> + *		from @format field.
> >>> + *
> >>> + *  
> >> +===============+===================================================
> >> ===+  
> >>> + * | feature       |
> >>> Notes                                               |
> >>> + *  
> >> +===============+===================================================
> >> ===+  
> >>> + * | SYSWIDE_PASID |  IOMMU vendor driver sets it to mandate
> >>> userspace    |
> >>> + * |               |  to allocate PASID from kernel. All PASID
> >>> allocation |
> >>> + * |               |  free must be mediated through the TBD
> >>> API.          |  
> >> s/TBD/IOMMU  
> > 
> > got it.
> >   
> >>> + *
> >>> +---------------+------------------------------------------------------+
> >>> + * | BIND_PGTBL    |  IOMMU vendor driver sets it to mandate
> >>> userspace    |
> >>> + * |               |  bind the first level/stage page table to
> >>> associated |  
> >> s/bind/to bind  
> > 
> > got it.
> >   
> >>> + * |               |  PASID (either the one specified in bind
> >>> request or  |
> >>> + * |               |  the default PASID of iommu domain),
> >>> through IOMMU   |
> >>> + * |               |
> >>> UAPI.                                               |
> >>> + *
> >>> +---------------+------------------------------------------------------+
> >>> + * | CACHE_INVLD   |  IOMMU vendor driver sets it to mandate
> >>> userspace    |  
> >>  
> >>> + * |               |  explicitly invalidate the IOMMU cache
> >>> through IOMMU |  
> >> to explicitly  
> > 
> > I see.
> >   
> >>> + * |               |  U
> >>> API according to vendor-specific requirement when  |
> >>> + * |               |  changing the 1st level/stage page
> >>> table.            |
> >>> + *
> >>> +---------------+------------------------------------------------------+
> >>> + *
> >>> + * @data[] types defined for @format:
> >>> + *  
> >> +================================+==================================
> >> ===+  
> >>> + * | @format                        |
> >>> @data[]                             |
> >>> + *  
> >> +================================+==================================
> >> ===+  
> >>> + * | IOMMU_PASID_FORMAT_INTEL_VTD   | struct
> >>> iommu_nesting_info_vtd       |
> >>> + *
> >>> +--------------------------------+-------------------------------------+
> >>> + *
> >>> + */
> >>> +struct iommu_nesting_info {
> >>> +	__u32	argsz;
> >>> +	__u32	flags;
> >>> +	__u32	format;
> >>> +#define IOMMU_NESTING_FEAT_SYSWIDE_PASID	(1 << 0)
> >>> +#define IOMMU_NESTING_FEAT_BIND_PGTBL		(1 << 1)
> >>> +#define IOMMU_NESTING_FEAT_CACHE_INVLD		(1 << 2)
> >>> +	__u32	features;
> >>> +	__u16	addr_width;
> >>> +	__u16	pasid_bits;
> >>> +	__u32	padding;
> >>> +	__u8	data[];
> >>> +};  
> >> As opposed to other IOMMU UAPI structs there is no union member at
> >> the end.  
> > 
> > nice catch. do you think it would be better to adding a union and
> > put the struct iommu_nesting_info_vtd in it?  
> Yes I think so. At least it would be consistent with the rest of the
> API and with the guidelines.
> >   
> >> Also this struct is not documented in [PATCH v7 1/7] docs: IOMMU
> >> user API. Shouldn't we align.
> >> You may also consider to move this patch in Jacob's series for
> >> consistency, thoughts?  
> > 
> > this was talked one time between Jacob and me. It was put in this
> > series as the major user of nesting_info is in this series. e.g.
> > vfio checks the SYSWIDE_PASID. but I'm open to merge it with Jacob's
> > series if it would make the merge easier.  
> Yep I think it would make sense to move in Jacob's series to have a
> general understanding of the uapi
> 
I a little reluctant to include this in my UAPI set, the reason is that
there are two dimensions IOMMU UAPI are extended:
1. Define the protocols in interaction with VFIO, sanity checking, and
backward compatibility.
2. Adding more UAPI data structures that are parallel to the existing
ones.

My patchset is to address #1, this patch is for #2. My thinking is that
once we have reached consensus on #1, new UAPI structures such as this
patch can just follow the suit.

If that is OK with you, I would like to keep them separate to avoid
diverging conversations.

Thanks,

Jacob

> Thanks
> 
> Eric
> > 
> > Thanks,
> > Yi Liu
> >   
> >>> +
> >>> +/*
> >>> + * struct iommu_nesting_info_vtd - Intel VT-d specific nesting
> >>> info.
> >>> + *
> >>> + * @flags:	VT-d specific flags. Currently reserved for
> >>> future
> >>> + *		extension. must be set to 0.
> >>> + * @cap_reg:	Describe basic capabilities as defined in
> >>> VT-d capability
> >>> + *		register.
> >>> + * @ecap_reg:	Describe the extended capabilities as
> >>> defined in VT-d
> >>> + *		extended capability register.
> >>> + */
> >>> +struct iommu_nesting_info_vtd {
> >>> +	__u32	flags;
> >>> +	__u32	padding;
> >>> +	__u64	cap_reg;
> >>> +	__u64	ecap_reg;
> >>> +};
> >>> +
> >>>  #endif /* _UAPI_IOMMU_H */
> >>>  
> >>
> >> Thanks
> >>
> >> Eric
> >>  
> >   
> 

[Jacob Pan]
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
