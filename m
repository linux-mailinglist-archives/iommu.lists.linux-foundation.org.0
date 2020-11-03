Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3872A4C0F
	for <lists.iommu@lfdr.de>; Tue,  3 Nov 2020 17:55:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A27CF80AC8;
	Tue,  3 Nov 2020 16:55:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SEYrZFyqPPOf; Tue,  3 Nov 2020 16:55:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3873F85533;
	Tue,  3 Nov 2020 16:55:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17A1AC0051;
	Tue,  3 Nov 2020 16:55:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9315AC0051
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 16:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 80D2785533
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 16:55:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oQEGiH_v_j7P for <iommu@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 16:55:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A612185535
 for <iommu@lists.linux-foundation.org>; Tue,  3 Nov 2020 16:55:44 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 871D45EA; Tue,  3 Nov 2020 17:55:41 +0100 (CET)
Date: Tue, 3 Nov 2020 17:55:40 +0100
From: "joro@8bytes.org" <joro@8bytes.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: (proposal) RE: [PATCH v7 00/16] vfio: expose virtual Shared
 Virtual Addressing to VMs
Message-ID: <20201103165539.GN22888@8bytes.org>
References: <MWHPR11MB1645CFB0C594933E92A844AC8C070@MWHPR11MB1645.namprd11.prod.outlook.com>
 <20201103095208.GA22888@8bytes.org>
 <20201103125643.GN2620339@nvidia.com>
 <20201103131852.GE22888@8bytes.org>
 <20201103132335.GO2620339@nvidia.com>
 <20201103140318.GL22888@8bytes.org>
 <20201103140642.GQ2620339@nvidia.com>
 <20201103143532.GM22888@8bytes.org>
 <20201103152223.GR2620339@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103152223.GR2620339@nvidia.com>
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

On Tue, Nov 03, 2020 at 11:22:23AM -0400, Jason Gunthorpe wrote:
> This whole thread was brought up by IDXD which has a SVA driver and
> now wants to add a vfio-mdev driver too. SVA devices that want to be
> plugged into VMs are going to be common - this architecture that a SVA
> driver cannot cover the kvm case seems problematic.

Isn't that the same pattern as having separate drivers for VFs and the
parent device in SR-IOV?

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
