Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8564ECA75
	for <lists.iommu@lfdr.de>; Wed, 30 Mar 2022 19:19:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EB0460AB2;
	Wed, 30 Mar 2022 17:19:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YHVx57jgRAoN; Wed, 30 Mar 2022 17:19:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9988861272;
	Wed, 30 Mar 2022 17:19:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7DB24C0082;
	Wed, 30 Mar 2022 17:19:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 31528C0012
 for <iommu@lists.linux-foundation.org>; Wed, 30 Mar 2022 17:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 103EA61272
 for <iommu@lists.linux-foundation.org>; Wed, 30 Mar 2022 17:19:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9hrdic84Am2Y for <iommu@lists.linux-foundation.org>;
 Wed, 30 Mar 2022 17:19:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from muru.com (muru.com [72.249.23.125])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E16460AB2
 for <iommu@lists.linux-foundation.org>; Wed, 30 Mar 2022 17:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 7C50780FA;
 Wed, 30 Mar 2022 17:17:31 +0000 (UTC)
Date: Wed, 30 Mar 2022 20:19:37 +0300
From: Tony Lindgren <tony@atomide.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v4 8/9] iommu: Remove unused argument in is_attach_deferred
Message-ID: <YkSRKZcJO0q3v5WL@atomide.com>
References: <20220216025249.3459465-1-baolu.lu@linux.intel.com>
 <20220216025249.3459465-9-baolu.lu@linux.intel.com>
 <YkRiawC2T9g+CHSJ@atomide.com>
 <20220330142340.GA2111031@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220330142340.GA2111031@nvidia.com>
Cc: regressions@lists.linux.dev, David Airlie <airlied@linux.ie>,
 Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, Ashok Raj <ashok.raj@intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Christoph Hellwig <hch@infradead.org>,
 Ben Skeggs <bskeggs@redhat.com>, Kevin Tian <kevin.tian@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Jacob jun Pan <jacob.jun.pan@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Robin Murphy <robin.murphy@arm.com>
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

* Jason Gunthorpe <jgg@nvidia.com> [220330 14:21]:
> On Wed, Mar 30, 2022 at 05:00:39PM +0300, Tony Lindgren wrote:
> > Hi,
> > 
> > * Lu Baolu <baolu.lu@linux.intel.com> [700101 02:00]:
> > > The is_attach_deferred iommu_ops callback is a device op. The domain
> > > argument is unnecessary and never used. Remove it to make code clean.
> > 
> > Looks like this causes a regression for at least drivers/iommu/omap-iommu.c.
> > 
> > To me it seems the issue is there is no is_attach_deferred implemented, so
> > we get a NULL pointer dereference at virtual address 00000008:
> > 
> > __iommu_probe_device from probe_iommu_group+0x2c/0x38
> > probe_iommu_group from bus_for_each_dev+0x74/0xbc
> > bus_for_each_dev from bus_iommu_probe+0x34/0x2e8
> > bus_iommu_probe from bus_set_iommu+0x80/0xc8
> > bus_set_iommu from omap_iommu_init+0x88/0xcc
> > omap_iommu_init from do_one_initcall+0x44/0x24c
> > 
> > Any ideas for a fix?
> > 
> > It would be good to fix this quickly so we don't end up with a broken
> > v5.18-rc1..
> > 
> > For reference, this is mainline commit 41bb23e70b50 ("iommu: Remove unused
> > argument in is_attach_deferred").
> 
> Are you confident in the bisection? I don't see how that commit could
> NULL deref..

Oops sorry you're right, the breaking commit is a different patch, it's
3f6634d997db ("iommu: Use right way to retrieve iommu_ops") instead. I must
have picked the wrong commit while testing.

> Can you find the code that is the NULL deref?

I can debug a bit more tomorrow.

Regards,

Tony
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
