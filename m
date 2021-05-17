Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD3B382BFB
	for <lists.iommu@lfdr.de>; Mon, 17 May 2021 14:22:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD59C83C89;
	Mon, 17 May 2021 12:22:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N0CEoHdjVak6; Mon, 17 May 2021 12:22:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2AD483A54;
	Mon, 17 May 2021 12:22:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB4BFC0001;
	Mon, 17 May 2021 12:22:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3E42C0001
 for <iommu@lists.linux-foundation.org>; Mon, 17 May 2021 12:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9C5783C88
 for <iommu@lists.linux-foundation.org>; Mon, 17 May 2021 12:22:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mrlDdpM_pDy0 for <iommu@lists.linux-foundation.org>;
 Mon, 17 May 2021 12:22:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC02F83C89
 for <iommu@lists.linux-foundation.org>; Mon, 17 May 2021 12:22:09 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id C5EF52E7; Mon, 17 May 2021 14:22:07 +0200 (CEST)
Date: Mon, 17 May 2021 14:22:06 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 3/6] vfio: remove the unused mdev iommu hook
Message-ID: <YKJf7mphTHZoi7Qr@8bytes.org>
References: <20210510065405.2334771-1-hch@lst.de>
 <20210510065405.2334771-4-hch@lst.de>
 <20210510155454.GA1096940@ziepe.ca>
 <MWHPR11MB1886E02BF7DE371E9665AA328C519@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210513120058.GG1096940@ziepe.ca>
 <MWHPR11MB1886B92507ED9015831A0CEA8C509@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210514121925.GI1096940@ziepe.ca>
 <MWHPR11MB18866205125E566FE05867A78C509@MWHPR11MB1886.namprd11.prod.outlook.com>
 <20210514133143.GK1096940@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210514133143.GK1096940@ziepe.ca>
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

On Fri, May 14, 2021 at 10:31:43AM -0300, Jason Gunthorpe wrote:
> There is no place for "domain as a carrier of PASID"
> there. mdev_device should NOT participate in the IOMMU layer because
> it is NOT a HW device. Trying to warp mdev_device into an IOMMU
> presence is already the source of a lot of this hacky code.

Having the mdev abstraction is way better than making the IOMMU code
IOASID aware. The later requires either new parameters to existing
functions or new functions. With the mdev abstraction no new functions
are needed in the core API.

Yes, I know, We have the AUX-domain specific functions now, but I
suggested a while back to turn the mdev code into its own bus
implementation and let the IOMMU driver deal with whether it has an mdev
or a pdev. When that is done the aux-specific functions can go away.

We are not there yet, but I think this is a cleaner abstraction than
making the IOMMU-API ioasid-aware. Also because it separates the details
of device-partitioning nicely from the IOMMU core code.

> To juggle multiple IOASID per HW device the IOMMU API obviously has to
> be made IOASID aware. It can't just blindly assume that a struct
> device implies the single IOASID to use and hope for the best.

The one-device<->one address-space idea is blindly assumed. Simply
because the vast amount of devices out there work that way. When ioasids
come into the game this changes of course, but we can work that out
based on how the ioasids are used.

For device partitioning the mdev abstraction work well if it is
correctly implemented. The other use-case is device-access to user-space
memory, and that is a completely different story.

> IOASID represents the IOVA address space.

No, when it comes to the IOMMU-API, a domain represents an address
space.

> Two concepts that represent the same thing is not great :)

Agreed, so an IOASID should be an IOMMU-domain, if its not used for
passing an mm_struct to a device.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
