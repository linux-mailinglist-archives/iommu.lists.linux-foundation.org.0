Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id F149E3BDBE7
	for <lists.iommu@lfdr.de>; Tue,  6 Jul 2021 19:07:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FFA183408;
	Tue,  6 Jul 2021 17:07:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 79y_9t91F7pd; Tue,  6 Jul 2021 17:07:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A123483A4B;
	Tue,  6 Jul 2021 17:07:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 77FB9C001F;
	Tue,  6 Jul 2021 17:07:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D9754C000E
 for <iommu@lists.linux-foundation.org>; Tue,  6 Jul 2021 17:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C60C083408
 for <iommu@lists.linux-foundation.org>; Tue,  6 Jul 2021 17:07:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e60x5Mm2I6mh for <iommu@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 17:07:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4FDC783419
 for <iommu@lists.linux-foundation.org>; Tue,  6 Jul 2021 17:07:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D8BEB61C3B;
 Tue,  6 Jul 2021 17:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625591229;
 bh=VhhzIH6gzRT8gtRsisto5IDFaHK+/13p4/dNI43mqXQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hl0xCyjFbo3wnMVlDA8LcQL8eHToHXmUMr23zuNOTdipVfwNhivzNpi8rpTly6eYi
 yPd2oC5omfpzshqqnFMLEQGIyy9TAQeSgCgSvFYmHpKLsM30eMNC98TPrdW8hja8Kb
 4m1fjoFjCWorTG/lEoPVyDyK3SJHLMjyzybho2CdMauS/azg7sMbNbYLaDlqMOER13
 ALFzRBBx8Uq7Drdf4gPPQLMEsDVKJLDGxMmwxLH7I7ZcRSFV8ffeda6f2WQMZefhG6
 DGh52bATmGicYuUcNyMSkAeHgzE8e4+s/u25yglW+hkrikwQu6kPAYHnUHYwEX7ru4
 L8ww7+blLmJBA==
Date: Tue, 6 Jul 2021 18:06:58 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v15 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
Message-ID: <20210706170657.GD20750@willie-the-truck>
References: <ea28db1f-846e-4f0a-4f13-beb67e66bbca@kernel.org>
 <20210702135856.GB11132@willie-the-truck>
 <0f7bd903-e309-94a0-21d7-f0e8e9546018@arm.com>
 <YN/7xcxt/XGAKceZ@Ryzen-9-3900X.localdomain>
 <20210705190352.GA19461@willie-the-truck>
 <20210706044848.GA13640@lst.de>
 <20210706132422.GA20327@willie-the-truck>
 <a59f771f-3289-62f0-ca50-8f3675d9b166@arm.com>
 <20210706140513.GA26498@lst.de>
 <bb32d5a6-2b34-4524-e171-3e9f5f4d3a94@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bb32d5a6-2b34-4524-e171-3e9f5f4d3a94@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jim Quinlan <james.quinlan@broadcom.com>, heikki.krogerus@linux.intel.com,
 linux-devicetree <devicetree@vger.kernel.org>, peterz@infradead.org,
 benh@kernel.crashing.org, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, Frank Rowand <frowand.list@gmail.com>,
 mingo@kernel.org, Jianxiong Gao <jxgao@google.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>, mpe@ellerman.id.au,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, matthew.auld@intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, thomas.hellstrom@linux.intel.com,
 jgross@suse.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 intel-gfx@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 jani.nikula@linux.intel.com, Nathan Chancellor <nathan@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, Claire Chang <tientzu@chromium.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 boris.ostrovsky@oracle.com, airlied@linux.ie,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Qian Cai <quic_qiancai@quicinc.com>, lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, xypron.glpk@gmx.de,
 Tom Lendacky <thomas.lendacky@amd.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
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

On Tue, Jul 06, 2021 at 04:39:11PM +0100, Robin Murphy wrote:
> On 2021-07-06 15:05, Christoph Hellwig wrote:
> > On Tue, Jul 06, 2021 at 03:01:04PM +0100, Robin Murphy wrote:
> > > FWIW I was pondering the question of whether to do something along those
> > > lines or just scrap the default assignment entirely, so since I hadn't got
> > > round to saying that I've gone ahead and hacked up the alternative
> > > (similarly untested) for comparison :)
> > > 
> > > TBH I'm still not sure which one I prefer...
> > 
> > Claire did implement something like your suggestion originally, but
> > I don't really like it as it doesn't scale for adding multiple global
> > pools, e.g. for the 64-bit addressable one for the various encrypted
> > secure guest schemes.
> 
> Ah yes, that had slipped my mind, and it's a fair point indeed. Since we're
> not concerned with a minimal fix for backports anyway I'm more than happy to
> focus on Will's approach. Another thing is that that looks to take us a
> quiet step closer to the possibility of dynamically resizing a SWIOTLB pool,
> which is something that some of the hypervisor protection schemes looking to
> build on top of this series may want to explore at some point.

Ok, I'll split that nasty diff I posted up into a reviewable series and we
can take it from there.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
