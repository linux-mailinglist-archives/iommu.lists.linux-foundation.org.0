Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 403D93A1A31
	for <lists.iommu@lfdr.de>; Wed,  9 Jun 2021 17:51:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D50BD60839;
	Wed,  9 Jun 2021 15:51:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OAGlXbY5_0ZR; Wed,  9 Jun 2021 15:51:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id EFDAE607E4;
	Wed,  9 Jun 2021 15:51:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B96BCC0024;
	Wed,  9 Jun 2021 15:51:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC2A8C000B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 15:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8B2440292
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 15:51:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3RwBG1Cowjp1 for <iommu@lists.linux-foundation.org>;
 Wed,  9 Jun 2021 15:51:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5623F4055A
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 15:51:30 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 9B3CD434; Wed,  9 Jun 2021 17:51:27 +0200 (CEST)
Date: Wed, 9 Jun 2021 17:51:26 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: Plan for /dev/ioasid RFC v2
Message-ID: <YMDjfmJKUDSrbZbo@8bytes.org>
References: <MWHPR11MB188699D0B9C10EB51686C4138C389@MWHPR11MB1886.namprd11.prod.outlook.com>
 <YMCy48Xnt/aphfh3@8bytes.org> <20210609123919.GA1002214@nvidia.com>
 <YMDC8tOMvw4FtSek@8bytes.org> <20210609150009.GE1002214@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210609150009.GE1002214@nvidia.com>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Jason Wang <jasowang@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, "Jiang,
 Dave" <dave.jiang@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, "Tian, Kevin" <kevin.tian@intel.com>,
 "parav@mellanox.com" <parav@mellanox.com>,
 "Alex Williamson \(alex.williamson@redhat.com\)" <alex.williamson@redhat.com>,
 "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
 David Gibson <david@gibson.dropbear.id.au>,
 Robin Murphy <robin.murphy@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 Shenming Lu <lushenming@huawei.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw2@infradead.org>
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

On Wed, Jun 09, 2021 at 12:00:09PM -0300, Jason Gunthorpe wrote:
> Only *drivers* know what the actual device is going to do, devices do
> not. Since the group doesn't have drivers it is the wrong layer to be
> making choices about how to configure the IOMMU.

Groups don't carry how to configure IOMMUs, that information is
mostly in the IOMMU domains. And those (or an abstraction of them) is
configured through /dev/ioasid. So not sure what you wanted to say with
the above.

All a group carries is information about which devices are not
sufficiently isolated from each other and thus need to always be in the
same domain.

> The device centric approach is my attempt at this, and it is pretty
> clean, I think.

Clean, but still insecure.

> All ACS does is prevent P2P operations, if you assign all the group
> devices into the same /dev/iommu then you may not care about that
> security isolation property. At the very least it is policy for user
> to decide, not kernel.

It is a kernel decision, because a fundamental task of the kernel is to
ensure isolation between user-space tasks as good as it can. And if a
device assigned to one task can interfer with a device of another task
(e.g. by sending P2P messages), then the promise of isolation is broken.

> Groups should be primarily about isolation security, not about IOASID
> matching.

That doesn't make any sense, what do you mean by 'IOASID matching'?

> Blocking this forever in the new uAPI just because group = IOASID is
> some historical convenience makes no sense to me.

I think it is safe to assume that devices supporting PASID will most
often be the only ones in their group. But for the non-PASID IOASID
use-cases like plain old device assignment to a VM it needs to be
group-centric.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
