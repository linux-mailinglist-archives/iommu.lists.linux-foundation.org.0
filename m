Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id A415B3680EE
	for <lists.iommu@lfdr.de>; Thu, 22 Apr 2021 14:56:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B4CF40E49;
	Thu, 22 Apr 2021 12:56:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Us3C7YU4OSR0; Thu, 22 Apr 2021 12:56:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2032406A6;
	Thu, 22 Apr 2021 12:56:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BDED5C000B;
	Thu, 22 Apr 2021 12:56:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD479C000B
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 12:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF1A140200
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 12:56:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H83gOrCBTMGz for <iommu@lists.linux-foundation.org>;
 Thu, 22 Apr 2021 12:56:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 12A41401EC
 for <iommu@lists.linux-foundation.org>; Thu, 22 Apr 2021 12:56:22 +0000 (UTC)
IronPort-SDR: uvTtdlbSRiuRsnYj8+qGG3dHt0WHLCTmrfvhq6w2yIB9+TLz68r6h+wdH+8EXa8soE9NWS/SLT
 Hghy/FZ8Sa+g==
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="183364240"
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; d="scan'208";a="183364240"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2021 05:56:22 -0700
IronPort-SDR: y1fbkouyq0pnuB+LErciUqaGFcqjHgtZrsWF26wfwvrJ3dQFNFuVxqLxJfuF3qhXa4XEqx3Vrr
 nxcKimXuEhSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,242,1613462400"; d="scan'208";a="446262806"
Received: from yiliu-dev.bj.intel.com (HELO yiliu-dev) ([10.238.156.135])
 by fmsmga004.fm.intel.com with ESMTP; 22 Apr 2021 05:56:17 -0700
Date: Thu, 22 Apr 2021 20:55:05 +0800
From: Liu Yi L <yi.l.liu@linux.intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH V4 05/18] iommu/ioasid: Redefine IOASID set and
 allocation APIs
Message-ID: <20210422205505.75f086f8@yiliu-dev>
In-Reply-To: <20210421133312.15307c44@redhat.com>
References: <20210401134236.GF1463678@nvidia.com>
 <BN6PR11MB4068C4DE7AF43D44DE70F4C1C37B9@BN6PR11MB4068.namprd11.prod.outlook.com>
 <20210401160337.GJ1463678@nvidia.com>
 <4bea6eb9-08ad-4b6b-1e0f-c97ece58a078@redhat.com>
 <20210415230732.GG1370958@nvidia.com>
 <20210416061258.325e762e@jacob-builder>
 <20210416094547.1774e1a3@redhat.com>
 <BN6PR11MB406854F56D18E1187A2C98ACC3479@BN6PR11MB4068.namprd11.prod.outlook.com>
 <20210421162307.GM1370958@nvidia.com>
 <20210421105451.56d3670a@redhat.com>
 <20210421175203.GN1370958@nvidia.com>
 <20210421133312.15307c44@redhat.com>
Organization: IAGS/SSE(OTC)
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Jiang, Dave" <dave.jiang@intel.com>, "Raj,
 Ashok" <ashok.raj@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Li Zefan <lizefan@huawei.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>, "Wu, Hao" <hao.wu@intel.com>
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

On Wed, 21 Apr 2021 13:33:12 -0600, Alex Williamson wrote:

> On Wed, 21 Apr 2021 14:52:03 -0300
> Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
> > On Wed, Apr 21, 2021 at 10:54:51AM -0600, Alex Williamson wrote:
> >   
> > > That's essentially replacing vfio-core, where I think we're more    
> > 
> > I am only talking about /dev/vfio here which is basically the IOMMU
> > interface part.
> > 
> > I still expect that VFIO_GROUP_SET_CONTAINER will be used to connect
> > /dev/{ioasid,vfio} to the VFIO group and all the group and device
> > logic stays inside VFIO.  
> 
> But that group and device logic is also tied to the container, where
> the IOMMU backend is the interchangeable thing that provides the IOMMU
> manipulation for that container.  If you're using
> VFIO_GROUP_SET_CONTAINER to associate a group to a /dev/ioasid, then
> you're really either taking that group outside of vfio or you're
> re-implementing group management in /dev/ioasid.  I'd expect the
> transition point at VFIO_SET_IOMMU.

per my understanding, transiting at the VFIO_SET_IOMMU point makes more
sense as VFIO can still have the group and device logic, which is the key
concept of group granularity isolation for userspace direct access.

-- 
Regards,
Yi Liu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
