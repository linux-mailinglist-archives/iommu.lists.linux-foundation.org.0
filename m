Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A5121342A
	for <lists.iommu@lfdr.de>; Fri,  3 Jul 2020 08:28:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EC4AC26424;
	Fri,  3 Jul 2020 06:28:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bDawqLGRIL7Y; Fri,  3 Jul 2020 06:28:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 903AD263F5;
	Fri,  3 Jul 2020 06:28:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F308C0733;
	Fri,  3 Jul 2020 06:28:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44F67C0733
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jul 2020 06:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 406CA8986D
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jul 2020 06:28:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id miYnyiLT3Ca8 for <iommu@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 06:28:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 939C3894A4
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jul 2020 06:28:07 +0000 (UTC)
IronPort-SDR: tqsnosYW9jfqPFqhNtcZ+0trrWV7Q3SGrVdvMLhZWWI5Wzv55U++LcYZVY9Jmk/Hzur2lRKet8
 URiJmG74xQ6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9670"; a="135380181"
X-IronPort-AV: E=Sophos;i="5.75,307,1589266800"; d="scan'208";a="135380181"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2020 23:28:07 -0700
IronPort-SDR: 88pE6rrXxPVAonSudZR5mIoD2guMeFMv/hILNrzi8qH0i3hdwgKl6ZB4A67KOBDd70cRtzJ+oR
 i5m23bdpVS7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,307,1589266800"; d="scan'208";a="313242480"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga008.jf.intel.com with ESMTP; 02 Jul 2020 23:28:06 -0700
Received: from fmsmsx157.amr.corp.intel.com (10.18.116.73) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 2 Jul 2020 23:28:06 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 FMSMSX157.amr.corp.intel.com (10.18.116.73) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 2 Jul 2020 23:28:05 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (104.47.45.50) by
 edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Thu, 2 Jul 2020 23:28:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqFMYL6sz0zUbQuOmFBNdqqcXGw/58HG9fibnA9pnqXaWbZxpuBDsd7frcMNahIlWqJFxs/AV03SJCGLp6ygHI5DeXajkd68MvhIX2oVWEVrrdYsHSiT0/FdI9TIIEZ4i/yB9f3fFRjNKWdJjZqNvFXInTDrPXDL82tL0N8BwcdrU71P/1g4zD5oqLtcaKLI7gNjG/FR76bHMuERQ3FY9CMeMCJ+29NFUHX79chrGfnenNAs0SsBCZeDKz0D24PUqXWqniaiLrumvVsHL937mN69IE3MnWzEU7+8BdmlDZhYZm+0Q975Vgww0kX8+BCbBPpWFNHyGQvWnc08YbMbyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yaZlS4KgzHdvMCxPSM5fMQHLohaLXeH51KdxouF9fk4=;
 b=ep5jj2Z2HuSbg9PiBNabtuBiONYLx7MF/yVD8C5jkZZiCOZ8QfJCEAoYw1x9fPlM2GqLTrJ806R0WD/3w8MM0UcNXPU4GM52LQG6bd9aTv+avg90LI80NO3t4KSyWqUq+or7zKiL2fOCEhGE+Bm+8ftRAfGzX47VEOxPUT+njXa4emAap7us2InbxSmejd7fFFMnAHvUrb3loCMlNaA+Dr3AXxhUm85UqdAgcca2wkP1uCY4f+JD+vFu87g2rLrjQxuqnJD0TLRI70DcBPddf1mRwvh/WYRktpJ5TPD57fx7HUZmzD+Rod5oEtIHVaCcfzHbyoq3FiGJ590a4a2awQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yaZlS4KgzHdvMCxPSM5fMQHLohaLXeH51KdxouF9fk4=;
 b=I3pXdhWQu/pTUaFeyTrLoQhm1j0cK39IVv3ZakuDQYohfscYirnwRnULm2kLm4DR9e7DwHHkI+QYkYoNAGhSgxSz8GB4eR1cNs1xf6s7J4bZYn7eO31tZGB8sNubtihPJZ0qZzldKv1P6QfOb1KKHzAy+/QROsIIIpnpNfBaDpM=
Received: from CY4PR11MB1432.namprd11.prod.outlook.com (2603:10b6:910:5::22)
 by CY4PR11MB0040.namprd11.prod.outlook.com (2603:10b6:910:7a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.25; Fri, 3 Jul
 2020 06:28:04 +0000
Received: from CY4PR11MB1432.namprd11.prod.outlook.com
 ([fe80::b46e:9dcb:b46b:884a]) by CY4PR11MB1432.namprd11.prod.outlook.com
 ([fe80::b46e:9dcb:b46b:884a%4]) with mapi id 15.20.3153.027; Fri, 3 Jul 2020
 06:28:04 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: RE: [PATCH v3 06/14] vfio/type1: Add VFIO_IOMMU_PASID_REQUEST
 (alloc/free)
Thread-Topic: [PATCH v3 06/14] vfio/type1: Add VFIO_IOMMU_PASID_REQUEST
 (alloc/free)
Thread-Index: AQHWSgRRzB2G/Oy5QEmxCHQWFS0FB6j02KQAgACUCyA=
Date: Fri, 3 Jul 2020 06:28:04 +0000
Message-ID: <CY4PR11MB1432DD97F44EB8AA5CCC87D8C36A0@CY4PR11MB1432.namprd11.prod.outlook.com>
References: <1592988927-48009-1-git-send-email-yi.l.liu@intel.com>
 <1592988927-48009-7-git-send-email-yi.l.liu@intel.com>
 <20200702151832.048b44d1@x1.home>
In-Reply-To: <20200702151832.048b44d1@x1.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.102.204.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7a1ad22-727b-4ea6-5e90-08d81f1a3e36
x-ms-traffictypediagnostic: CY4PR11MB0040:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CY4PR11MB0040119DE51F59F233A5E8B7C36A0@CY4PR11MB0040.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 045315E1EE
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8VPucveuOafx+G0yxnTLSKMt0ZhHFjUqr6EHNj8x+C8PLg7lOwBHpD3bDXejiO5fBz/UH0+rEvedhuD1QCJhBjZGWzcD/MHBBEiWjzX83fKKs6gHIkBK9kM7aNrBnTBj7+e4y3c1x4GsmuuB4OCgrLY0YKrwBV1XiPLq5Fw3/dDjVI6mswxMduo8NlLdnkdGxt6cJinDqeYHGidn/w289i/TLAI/yURPagJPWqi8dEKgULLlhnAwjLlDAaWiSfdqW3mWqvhxIZTwuHi5kRSPwVj3Ecr/ut4DFLolIjEGiHShnnKaF+ZTBQDosMQm+s7VCZsrwHyZKVB9tUyYD8j1Ew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR11MB1432.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(9686003)(76116006)(55016002)(66446008)(52536014)(316002)(71200400001)(64756008)(66476007)(66556008)(478600001)(33656002)(86362001)(30864003)(7416002)(5660300002)(6916009)(54906003)(7696005)(2906002)(66946007)(4326008)(186003)(8936002)(26005)(6506007)(83380400001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: /hxMziTvrCgkXH33oyjQ604kueMvPkUb7UX6jH2QmPZ4t61CvkoQhtVdz4FQP+oANYfm4y4oqZp40/WGhkZ6Y7ejl9VX9K4pJJfrtg1f7pD8PTYBs8enVvZrqapp8RBZODh9zY46S16u00rBXJmygdl4lSuV1V9+orFg+d1iOZTk0aRpU+awSZ/EBsT60Hptgb8QFA0OygrU6IbJjkLArJd2V3meoDVCNZBIJlRc52iOuOoPV1Lk9qWGZS6kq653VHhGO4fNjxoP+MfO+0O6fw0UFKVQf6z7TQBGq0Q55NHdIjwkPp/hDiSbLq+vvcR3WqfXrXi07F90Aw3cYMf9MOcZ05NMfa8neRacAdS9heQboY4fiiIuwYSA/IxZyekXZpQYoeUIZPK9FJ7Zrc13XQfmMf+XHZiIxHz4NztlO0UlpXoQsr4XIB6IoufqjxfQAJED+tF34orrejYwLaGEFrmONj4YNwRuXYG1GbbxgJqhEke939xP7SpjupDKTFO9
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB1432.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a1ad22-727b-4ea6-5e90-08d81f1a3e36
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2020 06:28:04.5236 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cQtA+7mcjdgOhQRqQhT4yFhRQ9M+9/cOHthPGw/0isJpXb5ZIlDqfWeQM3hwWar9dQ89c9i40Qu3fEm0ArDnZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB0040
X-OriginatorOrg: intel.com
Cc: "jean-philippe@linaro.org" <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Sun,
 Yi Y" <yi.y.sun@intel.com>, "Wu, Hao" <hao.wu@intel.com>, "Tian,
 Jun J" <jun.j.tian@intel.com>
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

Hi Alex,

> From: Alex Williamson <alex.williamson@redhat.com>
> Sent: Friday, July 3, 2020 5:19 AM
> 
> On Wed, 24 Jun 2020 01:55:19 -0700
> Liu Yi L <yi.l.liu@intel.com> wrote:
> 
> > This patch allows user space to request PASID allocation/free, e.g.
> > when serving the request from the guest.
> >
> > PASIDs that are not freed by userspace are automatically freed when
> > the IOASID set is destroyed when process exits.
> >
> > Cc: Kevin Tian <kevin.tian@intel.com>
> > CC: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > Cc: Alex Williamson <alex.williamson@redhat.com>
> > Cc: Eric Auger <eric.auger@redhat.com>
> > Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > Cc: Joerg Roedel <joro@8bytes.org>
> > Cc: Lu Baolu <baolu.lu@linux.intel.com>
> > Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
> > Signed-off-by: Yi Sun <yi.y.sun@linux.intel.com>
> > Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > ---
> > v1 -> v2:
> > *) move the vfio_mm related code to be a seprate module
> > *) use a single structure for alloc/free, could support a range of
> > PASIDs
> > *) fetch vfio_mm at group_attach time instead of at iommu driver open
> > time
> > ---
> >  drivers/vfio/Kconfig            |  1 +
> >  drivers/vfio/vfio_iommu_type1.c | 96
> ++++++++++++++++++++++++++++++++++++++++-
> >  drivers/vfio/vfio_pasid.c       | 10 +++++
> >  include/linux/vfio.h            |  6 +++
> >  include/uapi/linux/vfio.h       | 36 ++++++++++++++++
> >  5 files changed, 147 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig index
> > 3d8a108..95d90c6 100644
> > --- a/drivers/vfio/Kconfig
> > +++ b/drivers/vfio/Kconfig
> > @@ -2,6 +2,7 @@
> >  config VFIO_IOMMU_TYPE1
> >  	tristate
> >  	depends on VFIO
> > +	select VFIO_PASID if (X86)
> >  	default n
> >
> >  config VFIO_IOMMU_SPAPR_TCE
> > diff --git a/drivers/vfio/vfio_iommu_type1.c
> > b/drivers/vfio/vfio_iommu_type1.c index 8c143d5..d0891c5 100644
> > --- a/drivers/vfio/vfio_iommu_type1.c
> > +++ b/drivers/vfio/vfio_iommu_type1.c
> > @@ -73,6 +73,7 @@ struct vfio_iommu {
> >  	bool			v2;
> >  	bool			nesting;
> >  	struct iommu_nesting_info *nesting_info;
> > +	struct vfio_mm		*vmm;
> 
> Structure alignment again.

sure. may get agreement in the prior email.

> 
> >  	bool			dirty_page_tracking;
> >  	bool			pinned_page_dirty_scope;
> >  };
> > @@ -1933,6 +1934,17 @@ static void vfio_iommu_iova_insert_copy(struct
> > vfio_iommu *iommu,
> >
> >  	list_splice_tail(iova_copy, iova);
> >  }
> > +
> > +static void vfio_iommu_release_nesting_info(struct vfio_iommu *iommu)
> > +{
> > +	if (iommu->vmm) {
> > +		vfio_mm_put(iommu->vmm);
> > +		iommu->vmm = NULL;
> > +	}
> > +
> > +	kfree(iommu->nesting_info);
> 
> iommu->nesting_info = NULL;

got it.

> > +}
> > +
> >  static int vfio_iommu_type1_attach_group(void *iommu_data,
> >  					 struct iommu_group *iommu_group)
> { @@ -2067,6 +2079,25 @@
> > static int vfio_iommu_type1_attach_group(void *iommu_data,
> >  			goto out_detach;
> >  		}
> >  		iommu->nesting_info = info;
> > +
> > +		if (info->features & IOMMU_NESTING_FEAT_SYSWIDE_PASID) {
> > +			struct vfio_mm *vmm;
> > +			int sid;
> > +
> > +			vmm = vfio_mm_get_from_task(current);
> > +			if (IS_ERR(vmm)) {
> > +				ret = PTR_ERR(vmm);
> > +				goto out_detach;
> > +			}
> > +			iommu->vmm = vmm;
> > +
> > +			sid = vfio_mm_ioasid_sid(vmm);
> > +			ret = iommu_domain_set_attr(domain->domain,
> > +						    DOMAIN_ATTR_IOASID_SID,
> > +						    &sid);
> 
> This looks pretty dicey in the case of !CONFIG_VFIO_PASID, can we get here in
> that case?  If so it looks like we're doing bad things with setting the domain-
> >ioasid_sid.

I guess not. So far, vfio_iommu_type1 will select CONFIG_VFIO_PASID for X86.
do you think it is enough?

> 
> > +			if (ret)
> > +				goto out_detach;
> > +		}
> >  	}
> >
> >  	/* Get aperture info */
> > @@ -2178,7 +2209,8 @@ static int vfio_iommu_type1_attach_group(void
> *iommu_data,
> >  	return 0;
> >
> >  out_detach:
> > -	kfree(iommu->nesting_info);
> > +	if (iommu->nesting_info)
> > +		vfio_iommu_release_nesting_info(iommu);
> 
> Make vfio_iommu_release_nesting_info() check iommu->nesting_info, then call
> it unconditionally?

got it. :-)

> >  	vfio_iommu_detach_group(domain, group);
> >  out_domain:
> >  	iommu_domain_free(domain->domain);
> > @@ -2380,7 +2412,8 @@ static void vfio_iommu_type1_detach_group(void
> *iommu_data,
> >  				else
> >
> 	vfio_iommu_unmap_unpin_reaccount(iommu);
> >
> > -				kfree(iommu->nesting_info);
> > +				if (iommu->nesting_info)
> > +
> 	vfio_iommu_release_nesting_info(iommu);
> >  			}
> >  			iommu_domain_free(domain->domain);
> >  			list_del(&domain->next);
> > @@ -2852,6 +2885,63 @@ static int vfio_iommu_type1_dirty_pages(struct
> vfio_iommu *iommu,
> >  	return -EINVAL;
> >  }
> >
> > +static int vfio_iommu_type1_pasid_alloc(struct vfio_iommu *iommu,
> > +					unsigned int min,
> > +					unsigned int max)
> > +{
> > +	int ret = -ENOTSUPP;
> > +
> > +	mutex_lock(&iommu->lock);
> > +	if (iommu->vmm)
> > +		ret = vfio_pasid_alloc(iommu->vmm, min, max);
> > +	mutex_unlock(&iommu->lock);
> > +	return ret;
> > +}
> > +
> > +static int vfio_iommu_type1_pasid_free(struct vfio_iommu *iommu,
> > +					unsigned int min,
> > +					unsigned int max)
> > +{
> > +	int ret = -ENOTSUPP;
> > +
> > +	mutex_lock(&iommu->lock);
> > +	if (iommu->vmm) {
> > +		vfio_pasid_free_range(iommu->vmm, min, max);
> > +		ret = 0;
> > +	}
> > +	mutex_unlock(&iommu->lock);
> > +	return ret;
> > +}
> > +
> > +static int vfio_iommu_type1_pasid_request(struct vfio_iommu *iommu,
> > +					  unsigned long arg)
> > +{
> > +	struct vfio_iommu_type1_pasid_request req;
> > +	unsigned long minsz;
> > +
> > +	minsz = offsetofend(struct vfio_iommu_type1_pasid_request, range);
> > +
> > +	if (copy_from_user(&req, (void __user *)arg, minsz))
> > +		return -EFAULT;
> > +
> > +	if (req.argsz < minsz || (req.flags & ~VFIO_PASID_REQUEST_MASK))
> > +		return -EINVAL;
> > +
> > +	if (req.range.min > req.range.max)
> 
> Is it exploitable that a user can spin the kernel for a long time in the case of a free
> by calling this with [0, MAX_UINT] regardless of their actual allocations?

IOASID can ensure that user can only free the PASIDs allocated to the
user. but it's true, kernel needs to loop all the PASIDs within the
range provided by user. it may take a long time. is there anything we
can do? one thing may limit the range provided by user?

> > +		return -EINVAL;
> > +
> > +	switch (req.flags & VFIO_PASID_REQUEST_MASK) {
> > +	case VFIO_IOMMU_ALLOC_PASID:
> > +		return vfio_iommu_type1_pasid_alloc(iommu,
> > +					req.range.min, req.range.max);
> > +	case VFIO_IOMMU_FREE_PASID:
> > +		return vfio_iommu_type1_pasid_free(iommu,
> > +					req.range.min, req.range.max);
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +}
> > +
> >  static long vfio_iommu_type1_ioctl(void *iommu_data,
> >  				   unsigned int cmd, unsigned long arg)  { @@ -
> 2868,6 +2958,8 @@
> > static long vfio_iommu_type1_ioctl(void *iommu_data,
> >  		return vfio_iommu_type1_unmap_dma(iommu, arg);
> >  	case VFIO_IOMMU_DIRTY_PAGES:
> >  		return vfio_iommu_type1_dirty_pages(iommu, arg);
> > +	case VFIO_IOMMU_PASID_REQUEST:
> > +		return vfio_iommu_type1_pasid_request(iommu, arg);
> >  	}
> >
> >  	return -ENOTTY;
> > diff --git a/drivers/vfio/vfio_pasid.c b/drivers/vfio/vfio_pasid.c
> > index dd5b6d1..2ea9f1a 100644
> > --- a/drivers/vfio/vfio_pasid.c
> > +++ b/drivers/vfio/vfio_pasid.c
> > @@ -54,6 +54,7 @@ void vfio_mm_put(struct vfio_mm *vmm)  {
> >  	kref_put_mutex(&vmm->kref, vfio_mm_release,
> > &vfio_pasid.vfio_mm_lock);  }
> > +EXPORT_SYMBOL_GPL(vfio_mm_put);
> >
> >  static void vfio_mm_get(struct vfio_mm *vmm)  { @@ -103,6 +104,13 @@
> > struct vfio_mm *vfio_mm_get_from_task(struct task_struct *task)
> >  	mmput(mm);
> >  	return vmm;
> >  }
> > +EXPORT_SYMBOL_GPL(vfio_mm_get_from_task);
> > +
> > +int vfio_mm_ioasid_sid(struct vfio_mm *vmm) {
> > +	return vmm->ioasid_sid;
> > +}
> > +EXPORT_SYMBOL_GPL(vfio_mm_ioasid_sid);
> >
> >  int vfio_pasid_alloc(struct vfio_mm *vmm, int min, int max)  { @@
> > -112,6 +120,7 @@ int vfio_pasid_alloc(struct vfio_mm *vmm, int min,
> > int max)
> >
> >  	return (pasid == INVALID_IOASID) ? -ENOSPC : pasid;  }
> > +EXPORT_SYMBOL_GPL(vfio_pasid_alloc);
> >
> >  void vfio_pasid_free_range(struct vfio_mm *vmm,
> >  			    ioasid_t min, ioasid_t max)
> > @@ -129,6 +138,7 @@ void vfio_pasid_free_range(struct vfio_mm *vmm,
> >  	for (; pasid <= max; pasid++)
> >  		ioasid_free(pasid);
> >  }
> > +EXPORT_SYMBOL_GPL(vfio_pasid_free_range);
> >
> >  static int __init vfio_pasid_init(void)  { diff --git
> > a/include/linux/vfio.h b/include/linux/vfio.h index 74e077d..8e60a32
> > 100644
> > --- a/include/linux/vfio.h
> > +++ b/include/linux/vfio.h
> > @@ -101,6 +101,7 @@ struct vfio_mm;
> >  #if IS_ENABLED(CONFIG_VFIO_PASID)
> >  extern struct vfio_mm *vfio_mm_get_from_task(struct task_struct
> > *task);  extern void vfio_mm_put(struct vfio_mm *vmm);
> > +int vfio_mm_ioasid_sid(struct vfio_mm *vmm);
> >  extern int vfio_pasid_alloc(struct vfio_mm *vmm, int min, int max);
> > extern void vfio_pasid_free_range(struct vfio_mm *vmm,
> >  					ioasid_t min, ioasid_t max);
> > @@ -114,6 +115,11 @@ static inline void vfio_mm_put(struct vfio_mm
> > *vmm)  {  }
> >
> > +static inline int vfio_mm_ioasid_sid(struct vfio_mm *vmm) {
> > +	return -ENOTTY;
> > +}
> > +
> >  static inline int vfio_pasid_alloc(struct vfio_mm *vmm, int min, int
> > max)  {
> >  	return -ENOTTY;
> > diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> > index f1f39e1..657b2db 100644
> > --- a/include/uapi/linux/vfio.h
> > +++ b/include/uapi/linux/vfio.h
> > @@ -1162,6 +1162,42 @@ struct vfio_iommu_type1_dirty_bitmap_get {
> >
> >  #define VFIO_IOMMU_DIRTY_PAGES             _IO(VFIO_TYPE, VFIO_BASE + 17)
> >
> > +/**
> > + * VFIO_IOMMU_PASID_REQUEST - _IOWR(VFIO_TYPE, VFIO_BASE + 18,
> > + *				struct vfio_iommu_type1_pasid_request)
> > + *
> > + * PASID (Processor Address Space ID) is a PCIe concept for tagging
> > + * address spaces in DMA requests. When system-wide PASID allocation
> > + * is required by underlying iommu driver (e.g. Intel VT-d), this
> > + * provides an interface for userspace to request pasid alloc/free
> > + * for its assigned devices. Userspace should check the availability
> > + * of this API through VFIO_IOMMU_GET_INFO.
> > + *
> > + * @flags=VFIO_IOMMU_ALLOC_PASID, allocate a single PASID within @range.
> > + * @flags=VFIO_IOMMU_FREE_PASID, free the PASIDs within @range.
> > + * @range is [min, max], which means both @min and @max are inclusive.
> > + * ALLOC_PASID and FREE_PASID are mutually exclusive.
> > + *
> > + * returns: allocated PASID value on success, -errno on failure for
> > + *	     ALLOC_PASID;
> > + *	     0 for FREE_PASID operation;
> > + */
> > +struct vfio_iommu_type1_pasid_request {
> > +	__u32	argsz;
> > +#define VFIO_IOMMU_ALLOC_PASID	(1 << 0)
> > +#define VFIO_IOMMU_FREE_PASID	(1 << 1)
> 
> VFIO_IOMMU_PASID_FLAG_{ALLOC,FREE} would be more similar to other VFIO
> UAPI conventions.  Thanks,

yes, much better. will modify it.

Thanks,
Yi Liu

> Alex
> 
> > +	__u32	flags;
> > +	struct {
> > +		__u32	min;
> > +		__u32	max;
> > +	} range;
> > +};
> > +
> > +#define VFIO_PASID_REQUEST_MASK	(VFIO_IOMMU_ALLOC_PASID | \
> > +					 VFIO_IOMMU_FREE_PASID)
> > +
> > +#define VFIO_IOMMU_PASID_REQUEST	_IO(VFIO_TYPE, VFIO_BASE + 18)
> > +
> >  /* -------- Additional API for SPAPR TCE (Server POWERPC) IOMMU
> > -------- */
> >
> >  /*

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
