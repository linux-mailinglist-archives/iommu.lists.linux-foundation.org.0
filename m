Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 327AA294385
	for <lists.iommu@lfdr.de>; Tue, 20 Oct 2020 21:51:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3631786DF8;
	Tue, 20 Oct 2020 19:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1vUo1xIiKOlp; Tue, 20 Oct 2020 19:51:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D0E3B86C9A;
	Tue, 20 Oct 2020 19:51:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3381C1AD4;
	Tue, 20 Oct 2020 19:51:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01C46C0051
 for <iommu@lists.linux-foundation.org>; Tue, 20 Oct 2020 19:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DF96C873E3
 for <iommu@lists.linux-foundation.org>; Tue, 20 Oct 2020 19:51:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ILGW1tUQXhZk for <iommu@lists.linux-foundation.org>;
 Tue, 20 Oct 2020 19:51:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 94A96873DD
 for <iommu@lists.linux-foundation.org>; Tue, 20 Oct 2020 19:51:49 +0000 (UTC)
IronPort-SDR: UT8Fho0CsEjTAcBgC7G0UBYv26Ic7/xX5mx2hB9lLivyfmIbfx31D8idKGuHgSbsiMPAN3YwLF
 iBHThM6s/fWQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="155054806"
X-IronPort-AV: E=Sophos;i="5.77,398,1596524400"; d="scan'208";a="155054806"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 12:51:48 -0700
IronPort-SDR: rZDY0IN9ovE2Ab1ttsBodJwgE364D8JmLSzO0sh20GRDcYFK5kUQwGdkN5n38jQDszZKB9iQbz
 Om3YjKwe2diA==
X-IronPort-AV: E=Sophos;i="5.77,398,1596524400"; d="scan'208";a="301798816"
Received: from otc-nc-03.jf.intel.com (HELO otc-nc-03) ([10.54.39.36])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2020 12:51:47 -0700
Date: Tue, 20 Oct 2020 12:51:46 -0700
From: "Raj, Ashok" <ashok.raj@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: (proposal) RE: [PATCH v7 00/16] vfio: expose virtual Shared
 Virtual Addressing to VMs
Message-ID: <20201020195146.GA86371@otc-nc-03>
References: <MWHPR11MB1645CFB0C594933E92A844AC8C070@MWHPR11MB1645.namprd11.prod.outlook.com>
 <MWHPR11MB1645AE971BD8DAF72CE3E1198C050@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20201016153632.GM6219@nvidia.com>
 <DM5PR11MB1435A3AEC0637C4531F2FE92C31E0@DM5PR11MB1435.namprd11.prod.outlook.com>
 <20201019142526.GJ6219@nvidia.com>
 <DM5PR11MB14354A8A126E686A5F20FEC2C31F0@DM5PR11MB1435.namprd11.prod.outlook.com>
 <20201020140217.GI6219@nvidia.com>
 <20201020162430.GA85321@otc-nc-03>
 <20201020170336.GK6219@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201020170336.GK6219@nvidia.com>
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

On Tue, Oct 20, 2020 at 02:03:36PM -0300, Jason Gunthorpe wrote:
> On Tue, Oct 20, 2020 at 09:24:30AM -0700, Raj, Ashok wrote:
> > Hi Jason,
> > 
> > 
> > On Tue, Oct 20, 2020 at 11:02:17AM -0300, Jason Gunthorpe wrote:
> > > On Tue, Oct 20, 2020 at 10:21:41AM +0000, Liu, Yi L wrote:
> > > 
> > > > > I'm sure there will be some
> > > > > weird overlaps because we can't delete any of the existing VFIO APIs, but
> > > > > that
> > > > > should not be a blocker.
> > > > 
> > > > but the weird thing is what we should consider. And it perhaps not just
> > > > overlap, it may be a re-definition of VFIO container. As I mentioned, VFIO
> > > > container is IOMMU context from the day it was defined. It could be the
> > > > blocker. :-(
> > > 
> > > So maybe you have to broaden the VFIO container to be usable by other
> > > subsystems. The discussion here is about what the uAPI should look
> > > like in a fairly abstract way. When we say 'dev/sva' it just some
> > > placeholder for a shared cdev that provides the necessary
> > > dis-aggregated functionality 
> > > 
> > > It could be an existing cdev with broader functionaltiy, it could
> > > really be /dev/iommu, etc. This is up to the folks building it to
> > > decide.
> > > 
> > > > I'm not expert on vDPA for now, but I saw you three open source
> > > > veterans have a similar idea for a place to cover IOMMU handling,
> > > > I think it may be a valuable thing to do. I said "may be" as I'm not
> > > > sure about Alex's opinion on such idea. But the sure thing is this
> > > > idea may introduce weird overlap even re-definition of existing
> > > > thing as I replied above. We need to evaluate the impact and mature
> > > > the idea step by step. 
> > > 
> > > This has happened before, uAPIs do get obsoleted and replaced with
> > > more general/better versions. It is often too hard to create a uAPI
> > > that lasts for decades when the HW landscape is constantly changing
> > > and sometime a reset is needed. 
> > 
> > I'm throwing this out with a lot of hesitation, but I'm going to :-)
> > 
> > So we have been disussing this for months now, with some high level vision
> > trying to get the uAPI's solidified with a vDPA hardware that might
> > potentially have SIOV/SVM like extensions in hardware which actualy doesn't
> > exist today. Understood people have plans. 
> 
> > Given that vDPA today has diverged already with duplicating use of IOMMU
> > api's without making an effort to gravitate to /dev/iommu as how you are
> > proposing.
> 
> I see it more like, given that we already know we have multiple users
> of IOMMU, adding new IOMMU focused features has to gravitate toward
> some kind of convergance.
> 
> Currently things are not so bad, VDPA is just getting started and the
> current IOMMU feature set is not so big.
> 
> PASID/vIOMMU/etc/et are all stressing this more, I think the
> responsibility falls to the people proposing these features to do the
> architecture work.
> 
> > The question is should we hold hostage the current vSVM/vIOMMU efforts
> > without even having made an effort for current vDPA/VFIO convergence. 
> 
> I don't think it is "held hostage" it is a "no shortcuts" approach,
> there was always a recognition that future VDPA drivers will need some
> work to integrated with vIOMMU realted stuff.

I think we agreed (or agree to disagree and commit) for device types that 
we have for SIOV, VFIO based approach works well without having to re-invent 
another way to do the same things. Not looking for a shortcut by any means, 
but we need to plan around existing hardware though. Looks like vDPA took 
some shortcuts then to not abstract iommu uAPI instead :-)? When all
necessary hardware was available.. This would be a solved puzzle. 


> 
> This is no different than the IMS discussion. The first proposed patch
> was really simple, but a layering violation.
> 
> The correct solution was some wild 20 patch series modernizing how x86

That was more like 48 patches, not 20 :-). But we had a real device with
IMS to model and create these new abstractions and test them against. 

For vDPA+SVM we have non-intersecting conversations at the moment with no
real hardware to model our discussion around. 

> interrupts works because it had outgrown itself. This general approach
> to use the shared MSI infrastructure was pointed out at the very
> beginning of IMS, BTW.

Agreed, and thankfully Thomas worked hard and made it a lot easier :-). 
Today IMS only deals with on device store. Although IMS could mean 
just simply having system memory to hold the interrupt attributes. 
This is how some of the graphics devices would be with context 
holding interrupt attributes. 

But certainly not rushing this since we need a REAL user to be there before we
support DEV_MSI that uses msg_addr/msg_data held in system memory. 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
