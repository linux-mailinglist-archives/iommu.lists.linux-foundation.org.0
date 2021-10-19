Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 442A4433D00
	for <lists.iommu@lfdr.de>; Tue, 19 Oct 2021 19:08:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3DB783B86;
	Tue, 19 Oct 2021 17:08:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B95PlK__Huo4; Tue, 19 Oct 2021 17:08:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id F18D583B55;
	Tue, 19 Oct 2021 17:08:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3D72C0022;
	Tue, 19 Oct 2021 17:08:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C723CC000D
 for <iommu@lists.linux-foundation.org>; Tue, 19 Oct 2021 17:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1B1A6080E
 for <iommu@lists.linux-foundation.org>; Tue, 19 Oct 2021 17:08:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RGF9UV_1ZXmk for <iommu@lists.linux-foundation.org>;
 Tue, 19 Oct 2021 17:08:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 216BE60745
 for <iommu@lists.linux-foundation.org>; Tue, 19 Oct 2021 17:08:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="228528431"
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; d="scan'208";a="228528431"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 10:07:47 -0700
X-IronPort-AV: E=Sophos;i="5.87,164,1631602800"; d="scan'208";a="574261206"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2021 10:07:43 -0700
Date: Tue, 19 Oct 2021 10:11:34 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC 01/20] iommu/iommufd: Add /dev/iommu core
Message-ID: <20211019101134.00ee12ac@jacob-builder>
In-Reply-To: <20211019165747.GU2744544@nvidia.com>
References: <20210919063848.1476776-1-yi.l.liu@intel.com>
 <20210919063848.1476776-2-yi.l.liu@intel.com>
 <20210921154138.GM327412@nvidia.com>
 <PH0PR11MB56583356619B3ECC23AB1BA8C3B99@PH0PR11MB5658.namprd11.prod.outlook.com>
 <20211015111807.GD2744544@nvidia.com>
 <20211019095734.2a3fb785@jacob-builder>
 <20211019165747.GU2744544@nvidia.com>
Organization: OTC
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>, "hch@lst.de" <hch@lst.de>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>, "Jiang,
 Dave" <dave.jiang@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>, "Tian, Kevin" <kevin.tian@intel.com>,
 "parav@mellanox.com" <parav@mellanox.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "lkml@metux.net" <lkml@metux.net>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "Tian,
 Jun J" <jun.j.tian@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lushenming@huawei.com" <lushenming@huawei.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
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

Hi Jason,

On Tue, 19 Oct 2021 13:57:47 -0300, Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Tue, Oct 19, 2021 at 09:57:34AM -0700, Jacob Pan wrote:
> > Hi Jason,
> > 
> > On Fri, 15 Oct 2021 08:18:07 -0300, Jason Gunthorpe <jgg@nvidia.com>
> > wrote: 
> > > On Fri, Oct 15, 2021 at 09:18:06AM +0000, Liu, Yi L wrote:
> > >   
> > > > >   Acquire from the xarray is
> > > > >    rcu_lock()
> > > > >    ioas = xa_load()
> > > > >    if (ioas)
> > > > >       if (down_read_trylock(&ioas->destroying_lock))    
> > > > 
> > > > all good suggestions, will refine accordingly. Here destroying_lock
> > > > is a rw_semaphore. right? Since down_read_trylock() accepts a
> > > > rwsem.    
> > > 
> > > Yes, you probably need a sleeping lock
> > >   
> > I am not following why we want a sleeping lock inside RCU protected
> > section?  
> 
> trylock is not sleeping
Of course, thanks for clarifying.

> > For ioas, do we really care about the stale data to choose rw_lock vs
> > RCU? Destroying can be kfree_rcu?  
> 
> It needs a hard fence so things don't continue to use the IOS once it
> is destroyed.
I guess RCU can do that also perhaps can scale better?

> Jason


Thanks,

Jacob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
