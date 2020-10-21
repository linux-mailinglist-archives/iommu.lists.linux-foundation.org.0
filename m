Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 77383295559
	for <lists.iommu@lfdr.de>; Thu, 22 Oct 2020 01:53:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 27B0F860EA;
	Wed, 21 Oct 2020 23:53:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id De2dqZpNmhRi; Wed, 21 Oct 2020 23:53:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1A279860FB;
	Wed, 21 Oct 2020 23:53:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2922C0051;
	Wed, 21 Oct 2020 23:53:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7B95C0051
 for <iommu@lists.linux-foundation.org>; Wed, 21 Oct 2020 23:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B6819860F2
 for <iommu@lists.linux-foundation.org>; Wed, 21 Oct 2020 23:53:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N7RsTBGhpe4O for <iommu@lists.linux-foundation.org>;
 Wed, 21 Oct 2020 23:53:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A75A9860EA
 for <iommu@lists.linux-foundation.org>; Wed, 21 Oct 2020 23:53:46 +0000 (UTC)
IronPort-SDR: mnT2YH1Ji+j4yQnasEpET+Xbhmhx1Ys0oe67NQ1/eCmRoyo+VmEqqlVmWFQFLOrQvQipGXpRhw
 9kaTk3vb42xg==
X-IronPort-AV: E=McAfee;i="6000,8403,9781"; a="252147245"
X-IronPort-AV: E=Sophos;i="5.77,402,1596524400"; d="scan'208";a="252147245"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2020 16:53:38 -0700
IronPort-SDR: ObbF/eIukKYf8wd0y+n2SPil81q7XGLu+jM7yTht640fpYB3J427wVe0k0g1j0DQJJBMRVce9E
 PbPOloQyNZrw==
X-IronPort-AV: E=Sophos;i="5.77,402,1596524400"; d="scan'208";a="359060275"
Received: from otc-nc-03.jf.intel.com (HELO otc-nc-03) ([10.54.39.36])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2020 16:53:38 -0700
Date: Wed, 21 Oct 2020 16:53:36 -0700
From: "Raj, Ashok" <ashok.raj@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: (proposal) RE: [PATCH v7 00/16] vfio: expose virtual Shared
 Virtual Addressing to VMs
Message-ID: <20201021235336.GB94504@otc-nc-03>
References: <20201020195146.GA86371@otc-nc-03>
 <20201020195557.GO6219@nvidia.com>
 <20201020200844.GC86371@otc-nc-03>
 <20201020201403.GP6219@nvidia.com>
 <20201020202713.GF86371@otc-nc-03>
 <20201021114829.GR6219@nvidia.com>
 <20201021175146.GA92867@otc-nc-03>
 <20201021182442.GU6219@nvidia.com>
 <20201021200315.GA93724@otc-nc-03>
 <20201021233218.GV6219@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201021233218.GV6219@nvidia.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: "Tian, Jun J" <jun.j.tian@intel.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "stefanha@gmail.com" <stefanha@gmail.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Sun, Yi Y" <yi.y.sun@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>, "Wu, Hao" <hao.wu@intel.com>
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

On Wed, Oct 21, 2020 at 08:32:18PM -0300, Jason Gunthorpe wrote:
> On Wed, Oct 21, 2020 at 01:03:15PM -0700, Raj, Ashok wrote:
> 
> > I'm not sure why you tie in IDXD and VDPA here. How IDXD uses native
> > SVM is orthogonal to how we achieve mdev passthrough to guest and
> > vSVM.
> 
> Everyone assumes that vIOMMU and SIOV aka PASID is going to be needed
> on the VDPA side as well, I think that is why JasonW brought this up
> in the first place.

True, to that effect we are working on trying to move PASID allocation
outside of VFIO, so both agents VFIO and vDPA with PASID, when that comes
available can support one way to allocate and manage PASID's from user
space.

Since the IOASID is almost standalone, this is possible.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
