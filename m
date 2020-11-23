Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3182C0C8B
	for <lists.iommu@lfdr.de>; Mon, 23 Nov 2020 15:03:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DF43885BD0;
	Mon, 23 Nov 2020 14:03:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4TyxV6ym2Rr7; Mon, 23 Nov 2020 14:03:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3EFD585B11;
	Mon, 23 Nov 2020 14:03:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 32D0CC0052;
	Mon, 23 Nov 2020 14:03:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44832C0052
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 14:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2F7D68636A
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 14:03:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h0VEkojbuXkP for <iommu@lists.linux-foundation.org>;
 Mon, 23 Nov 2020 14:03:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 89E368569B
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 14:03:34 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 47F2B2075A;
 Mon, 23 Nov 2020 14:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606140214;
 bh=RzgILadYdEd3PlSUUMcqcJb6KA8AWxsdQs514YcE3H4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0nU0nRHlW82jyYk/FyfXA2oaAOdF/nnrr6wsnFI9AlIbSKV3bJO3J1i/AcslTpNyu
 t3BrSuwKMKpiCnY9hbm4ykngDLZc27RfVYt307hEz+mgD3+ZUwlUQ93W6Mub1DO1xw
 PsL+TbRRjwEXasXnsa6BBaA6miSA0SIo1XIPrQ7Y=
Date: Mon, 23 Nov 2020 14:03:28 +0000
From: Will Deacon <will@kernel.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v9 1/4] iommu: Move def_domain type check for untrusted
 device into core
Message-ID: <20201123140328.GA10730@willie-the-truck>
References: <20201121135620.3496419-1-baolu.lu@linux.intel.com>
 <20201121135620.3496419-2-baolu.lu@linux.intel.com>
 <20201123120449.GB10233@willie-the-truck>
 <5f6f0d5e-0cfc-2274-b186-180f50b8b1df@linux.intel.com>
 <20201123130335.GD10233@willie-the-truck>
 <c75c2981-11bd-74c0-289b-c2eb198bb5ab@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c75c2981-11bd-74c0-289b-c2eb198bb5ab@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ashok Raj <ashok.raj@intel.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
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

On Mon, Nov 23, 2020 at 09:54:49PM +0800, Lu Baolu wrote:
> Hi Will,
> 
> On 2020/11/23 21:03, Will Deacon wrote:
> > Hi Baolu,
> > 
> > On Mon, Nov 23, 2020 at 08:55:17PM +0800, Lu Baolu wrote:
> > > On 2020/11/23 20:04, Will Deacon wrote:
> > > > On Sat, Nov 21, 2020 at 09:56:17PM +0800, Lu Baolu wrote:
> > > > > @@ -1645,13 +1655,10 @@ struct __group_domain_type {
> > > > >    static int probe_get_default_domain_type(struct device *dev, void *data)
> > > > >    {
> > > > > -	const struct iommu_ops *ops = dev->bus->iommu_ops;
> > > > >    	struct __group_domain_type *gtype = data;
> > > > >    	unsigned int type = 0;
> > > > > -	if (ops->def_domain_type)
> > > > > -		type = ops->def_domain_type(dev);
> > > > > -
> > > > > +	type = iommu_get_mandatory_def_domain_type(dev);
> > > > 
> > > > afaict, this code is only called from probe_alloc_default_domain(), which
> > > > has:
> > > > 
> > > >           /* Ask for default domain requirements of all devices in the group */
> > > >           __iommu_group_for_each_dev(group, &gtype,
> > > >                                      probe_get_default_domain_type);
> > > > 
> > > >           if (!gtype.type)
> > > >                   gtype.type = iommu_def_domain_type;
> > > > 
> > > > so is there actually a need to introduce the new
> > > > iommu_get_mandatory_def_domain_type() function, given that a type of 0
> > > > always ends up resolving to the default domain type?
> > > 
> > > Another consumer of this helper is in the next patch:
> > > 
> > > +	dev_def_dom = iommu_get_mandatory_def_domain_type(dev);
> > > +
> > > +	/* Check if user requested domain is supported by the device or not */
> > > +	if (!type) {
> > > +		/*
> > > +		 * If the user hasn't requested any specific type of domain and
> > > +		 * if the device supports both the domains, then default to the
> > > +		 * domain the device was booted with
> > > +		 */
> > > +		type = iommu_get_def_domain_type(dev);
> > > +	} else if (dev_def_dom && type != dev_def_dom) {
> > > +		dev_err_ratelimited(prev_dev, "Device cannot be in %s domain\n",
> > > +				    iommu_domain_type_str(type));
> > > +		ret = -EINVAL;
> > > +		goto out;
> > > +	}
> > > 
> > > I also added the untrusted device check in
> > > iommu_get_mandatory_def_domain_type(), so that we don't need to care
> > > about this in multiple places.
> > 
> > I see, but isn't this also setting the default domain type in the case that
> > it gets back a type of 0? I think it would be nice to avoid having both
> > iommu_get_mandatory_def_domain_type() and iommu_get_def_domain_type() of we
> > can, as it's really not clear which one to use when and what is meant by
> > "mandatory" imo.
> 
> Yes, agreed. I will remove iommu_get_mandatory_def_domain_type() and
> keep iommu_get_def_domain_type() as the only helper in the next version.

Great, thanks!

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
