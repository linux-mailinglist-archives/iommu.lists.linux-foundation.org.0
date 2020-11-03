Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2072A472C
	for <lists.iommu@lfdr.de>; Tue,  3 Nov 2020 15:03:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4E755873AB;
	Tue,  3 Nov 2020 14:03:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QQWvtNs2dV7K; Tue,  3 Nov 2020 14:03:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 042008737A;
	Tue,  3 Nov 2020 14:03:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB079C1AD5;
	Tue,  3 Nov 2020 14:03:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7C13C0051
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 14:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9CB8386C5A
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 14:03:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iumNDGX24vWz for <iommu@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 14:03:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1134986C4D
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 14:03:21 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id A00FD433; Tue,  3 Nov 2020 15:03:19 +0100 (CET)
Date: Tue, 3 Nov 2020 15:03:18 +0100
From: "joro@8bytes.org" <joro@8bytes.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: (proposal) RE: [PATCH v7 00/16] vfio: expose virtual Shared
 Virtual Addressing to VMs
Message-ID: <20201103140318.GL22888@8bytes.org>
References: <MWHPR11MB1645CFB0C594933E92A844AC8C070@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20201103095208.GA22888@8bytes.org>
 <20201103125643.GN2620339@nvidia.com>
 <20201103131852.GE22888@8bytes.org>
 <20201103132335.GO2620339@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103132335.GO2620339@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "jean-philippe@linaro.org" <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "stefanha@gmail.com" <stefanha@gmail.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Sun, Yi Y" <yi.y.sun@intel.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>, "Wu,
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

On Tue, Nov 03, 2020 at 09:23:35AM -0400, Jason Gunthorpe wrote:
> Userspace needs fine grained control over the composition of the page
> table behind the PASID, 1:1 with the mm_struct is only one use case.

VFIO already offers an interface for that. It shouldn't be too
complicated to expand that for PASID-bound page-tables.

> Userspace needs to be able to handle IOMMU faults, apparently

Could be implemented by a fault-fd handed out by VFIO.

> The Intel guys had a bunch of other stuff too, looking through the new
> API they are proposing for vfio gives some flavour what they think is
> needed..

I really don't think that user-space should have to deal with details
like PASIDs or other IOMMU internals, unless absolutly necessary. This
is an OS we work on, and the idea behind an OS is to abstract the
hardware away.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
