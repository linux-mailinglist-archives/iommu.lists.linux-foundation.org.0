Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EADEADAB0
	for <lists.iommu@lfdr.de>; Mon,  9 Sep 2019 16:04:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 87002D8D;
	Mon,  9 Sep 2019 14:04:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 39EDACD1
	for <iommu@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 14:04:22 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 392D37DB
	for <iommu@lists.linux-foundation.org>;
	Mon,  9 Sep 2019 14:04:21 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7BA0121924;
	Mon,  9 Sep 2019 14:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568037861;
	bh=BceXqHBVAXO0SzdF8rTWqk9w5ctjbmxf4pw3jTBHQxw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=y6wNq/EwRmggE4exMTqn9Sn14AIYiMuQxdJQ+5B6cgNVIHbomUOBQUwlo4hA6w6P5
	0uWyZboY2zCJ2Wq9XFAJLtSe2oyqHuAlwOLNa0ijdygIdPHq61SI0fHQ+bfttjJbIt
	f/neASzyNQKDqnEkxbmK8L67avoAN5oqG+YLMUeY=
Date: Mon, 9 Sep 2019 15:04:16 +0100
From: Will Deacon <will@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/2] iommu: Implement of_iommu_get_resv_regions()
Message-ID: <20190909140415.axszldhakgqifibg@willie-the-truck>
References: <20190829111407.17191-1-thierry.reding@gmail.com>
	<20190829111407.17191-2-thierry.reding@gmail.com>
	<0b7e050a-cec6-6ce7-9ed6-2146eabb2fe8@arm.com>
	<20190902150056.GD1445@ulmo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190902150056.GD1445@ulmo>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: devicetree@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Mon, Sep 02, 2019 at 05:00:56PM +0200, Thierry Reding wrote:
> On Mon, Sep 02, 2019 at 02:54:23PM +0100, Robin Murphy wrote:
> > On 29/08/2019 12:14, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > > 
> > > This is an implementation that IOMMU drivers can use to obtain reserved
> > > memory regions from a device tree node. It uses the reserved-memory DT
> > > bindings to find the regions associated with a given device. These
> > > regions will be used to create 1:1 mappings in the IOMMU domain that
> > > the devices will be attached to.
> > > 
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: Frank Rowand <frowand.list@gmail.com>
> > > Cc: devicetree@vger.kernel.org
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > >   drivers/iommu/of_iommu.c | 39 +++++++++++++++++++++++++++++++++++++++
> > >   include/linux/of_iommu.h |  8 ++++++++
> > >   2 files changed, 47 insertions(+)
> > > 
> > > diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> > > index 614a93aa5305..0d47f626b854 100644
> > > --- a/drivers/iommu/of_iommu.c
> > > +++ b/drivers/iommu/of_iommu.c
> > > @@ -9,6 +9,7 @@
> > >   #include <linux/iommu.h>
> > >   #include <linux/limits.h>
> > >   #include <linux/of.h>
> > > +#include <linux/of_address.h>
> > >   #include <linux/of_iommu.h>
> > >   #include <linux/of_pci.h>
> > >   #include <linux/slab.h>
> > > @@ -225,3 +226,41 @@ const struct iommu_ops *of_iommu_configure(struct device *dev,
> > >   	return ops;
> > >   }
> > > +
> > > +/**
> > > + * of_iommu_get_resv_regions - reserved region driver helper for device tree
> > > + * @dev: device for which to get reserved regions
> > > + * @list: reserved region list
> > > + *
> > > + * IOMMU drivers can use this to implement their .get_resv_regions() callback
> > > + * for memory regions attached to a device tree node. See the reserved-memory
> > > + * device tree bindings on how to use these:
> > > + *
> > > + *   Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > > + */
> > > +void of_iommu_get_resv_regions(struct device *dev, struct list_head *list)
> > > +{
> > > +	struct of_phandle_iterator it;
> > > +	int err;
> > > +
> > > +	of_for_each_phandle(&it, err, dev->of_node, "memory-region", NULL, 0) {
> > > +		struct iommu_resv_region *region;
> > > +		struct resource res;
> > > +
> > > +		err = of_address_to_resource(it.node, 0, &res);
> > > +		if (err < 0) {
> > > +			dev_err(dev, "failed to parse memory region %pOF: %d\n",
> > > +				it.node, err);
> > > +			continue;
> > > +		}
> > 
> > What if the device node has memory regions for other purposes, like private
> > CMA carveouts? We wouldn't want to force mappings of those (and in the very
> > worst case doing so could even render them unusable).
> 
> I suppose we could come up with additional properties to mark such
> memory regions and skip them here.

I think we need /something/ like that, both so that we can identify these
memory regions as requiring an identity mapping in the SMMU but also so
that we can place additional requirements on them, such as being 64k-aligned
and mandating properties of the mapping, such as cacheability based on the
device coherency.

I defer to the devicetree folks as to whether this should be an additional
property, or a phandle or whatever.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
