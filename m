Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3D62943D7
	for <lists.iommu@lfdr.de>; Tue, 20 Oct 2020 22:27:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9D1D8873A7;
	Tue, 20 Oct 2020 20:27:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Y9IT-DA+-qk; Tue, 20 Oct 2020 20:27:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3F9C7873A2;
	Tue, 20 Oct 2020 20:27:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F488C1AD4;
	Tue, 20 Oct 2020 20:27:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 432DAC0052
 for <iommu@lists.linux-foundation.org>; Tue, 20 Oct 2020 20:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2D95A86B0E
 for <iommu@lists.linux-foundation.org>; Tue, 20 Oct 2020 20:27:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2dzZLIFQlF37 for <iommu@lists.linux-foundation.org>;
 Tue, 20 Oct 2020 20:27:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5E31186AD8
 for <iommu@lists.linux-foundation.org>; Tue, 20 Oct 2020 20:27:15 +0000 (UTC)
IronPort-SDR: 9dCZ6NgO30P5mlPcPNt6yvsZHUqvH3eK3AjwchyPxLZAo+XpgXmsXK5h8cUvbJxAsU+EdJLFTP
 NRY+Q4kSV3Aw==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="251971395"
X-IronPort-AV: E=Sophos;i="5.77,398,1596524400"; d="scan'208";a="251971395"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 13:27:14 -0700
IronPort-SDR: RlAQXE97+ZvriQnDGm42vH0j7gGQn/9XUpFWtTdpJXo+QSN51NPbauR/ZNq9CGcJT0B9UISF7s
 mgNrwzUIQLHQ==
X-IronPort-AV: E=Sophos;i="5.77,398,1596524400"; d="scan'208";a="533211399"
Received: from otc-nc-03.jf.intel.com (HELO otc-nc-03) ([10.54.39.36])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 13:27:14 -0700
Date: Tue, 20 Oct 2020 13:27:13 -0700
From: "Raj, Ashok" <ashok.raj@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: (proposal) RE: [PATCH v7 00/16] vfio: expose virtual Shared
 Virtual Addressing to VMs
Message-ID: <20201020202713.GF86371@otc-nc-03>
References: <DM5PR11MB1435A3AEC0637C4531F2FE92C31E0@DM5PR11MB1435.namprd11.prod.outlook.com>
 <20201019142526.GJ6219@nvidia.com>
 <DM5PR11MB14354A8A126E686A5F20FEC2C31F0@DM5PR11MB1435.namprd11.prod.outlook.com>
 <20201020140217.GI6219@nvidia.com>
 <20201020162430.GA85321@otc-nc-03>
 <20201020170336.GK6219@nvidia.com>
 <20201020195146.GA86371@otc-nc-03>
 <20201020195557.GO6219@nvidia.com>
 <20201020200844.GC86371@otc-nc-03>
 <20201020201403.GP6219@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201020201403.GP6219@nvidia.com>
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

On Tue, Oct 20, 2020 at 05:14:03PM -0300, Jason Gunthorpe wrote:
> On Tue, Oct 20, 2020 at 01:08:44PM -0700, Raj, Ashok wrote:
> > On Tue, Oct 20, 2020 at 04:55:57PM -0300, Jason Gunthorpe wrote:
> > > On Tue, Oct 20, 2020 at 12:51:46PM -0700, Raj, Ashok wrote:
> > > > I think we agreed (or agree to disagree and commit) for device types that 
> > > > we have for SIOV, VFIO based approach works well without having to re-invent 
> > > > another way to do the same things. Not looking for a shortcut by any means, 
> > > > but we need to plan around existing hardware though. Looks like vDPA took 
> > > > some shortcuts then to not abstract iommu uAPI instead :-)? When all
> > > > necessary hardware was available.. This would be a solved puzzle. 
> > > 
> > > I think it is the opposite, vIOMMU and related has outgrown VFIO as
> > > the "home" and needs to stand alone.
> > > 
> > > Apparently the HW that will need PASID for vDPA is Intel HW, so if
> > 
> > So just to make this clear, I did check internally if there are any plans
> > for vDPA + SVM. There are none at the moment. 
> 
> Not SVM, SIOV.

... And that included.. I should have said vDPA + PASID, No current plans. 
I have no idea who set expectations with you. Can you please put me in touch 
with that person, privately is fine.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
