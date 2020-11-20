Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C98A2BA7DF
	for <lists.iommu@lfdr.de>; Fri, 20 Nov 2020 12:04:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 28CED86DAF;
	Fri, 20 Nov 2020 11:04:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AMs-zsEEuWgo; Fri, 20 Nov 2020 11:04:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A9EAF86DE7;
	Fri, 20 Nov 2020 11:04:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C6A8C0891;
	Fri, 20 Nov 2020 11:04:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30F9DC0891
 for <iommu@lists.linux-foundation.org>; Fri, 20 Nov 2020 11:04:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1CF9886DC2
 for <iommu@lists.linux-foundation.org>; Fri, 20 Nov 2020 11:04:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NtogPGzdtHO3 for <iommu@lists.linux-foundation.org>;
 Fri, 20 Nov 2020 11:04:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 950CA86DAF
 for <iommu@lists.linux-foundation.org>; Fri, 20 Nov 2020 11:04:01 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C1C3422255;
 Fri, 20 Nov 2020 11:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605870241;
 bh=mX/p1HAFLIFTQg9G08w9hM65P8tSBhCpzNO+qokhof8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rXo0btu+7YkF0HfhHhr9fCe0rvUbz1OzazP7il7YfgjZzs5kJLVRrJ4JFG8g1lOFS
 Iy1YuX71Hx5/Ifp0hXjR2x2rZtrqfX5+fJ5yxza2kKhSq99Ej//3hSDe/lQliIoqIo
 naTlp+uDe0OmsgL15I7b68KRL5kMzW/LBqHN5yiM=
Date: Fri, 20 Nov 2020 11:03:55 +0000
From: Will Deacon <will@kernel.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [Patch V8 1/3] iommu: Add support to change default domain of an
 iommu group
Message-ID: <20201120110355.GA6151@willie-the-truck>
References: <20200925190620.18732-1-ashok.raj@intel.com>
 <20200925190620.18732-2-ashok.raj@intel.com>
 <20201118135153.GB2177@willie-the-truck>
 <568d4dee-ad10-ca4f-d51a-8909afb6b782@linux.intel.com>
 <20201119085303.GA3599@willie-the-truck>
 <ee19b2ff-1cb6-7db1-9fc9-9e7fb8df5de6@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ee19b2ff-1cb6-7db1-9fc9-9e7fb8df5de6@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Will Deacon <will.deacon@arm.com>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, Ashok Raj <ashok.raj@intel.com>,
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

On Fri, Nov 20, 2020 at 10:11:58AM +0800, Lu Baolu wrote:
> On 11/19/20 4:53 PM, Will Deacon wrote:
> > On Thu, Nov 19, 2020 at 10:18:05AM +0800, Lu Baolu wrote:
> > > On 11/18/20 9:51 PM, Will Deacon wrote:
> > > > On Fri, Sep 25, 2020 at 12:06:18PM -0700, Ashok Raj wrote:
> > > > > From: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
> > 
> > [...]
> > 
> > > > > +free_new_domain:
> > > > > +	iommu_domain_free(group->default_domain);
> > > > > +	group->default_domain = prev_dom;
> > > > > +	group->domain = prev_dom;i
> > > > 
> > > > Hmm. This seems to rely on all users of group->default_domain holding the
> > > > group->mutex. Have you confirmed that this is the case? There's a funny
> > > > use of iommu_group_get() in the exynos IOMMU driver at least.
> > > 
> > > Emm. This change happens within the area with group->mutex held. Or I
> > > am not getting your point?
> > 
> > Yeah, sorry, I wasn't very clear. This code holds the group->mutex, and it
> > relies on _anybody_ else who wants to inspect group->default_domain also
> > holding that mutex, otherwise they could observe a transient domain pointer
> > which we free on the failure path here.
> 
> Clear to me now. Thanks for explanation. :-)
> 
> Changing default domain through sysfs requires the users to ubind any
> driver from the devices in the group. There's a check code and return
> failure if this requirement doesn't meet.
> 
> So we only need to consider the device release path. device_lock(dev) is
> used in this patch to guarantee that no device release happens at the
> same time.

Aha, thanks. Please can you add a comment for future reference?

> 
> > 
> > My question is whether or not there is code that inspects
> > group->default_domain without group->mutex held? The exynos case doesn't
> > obviously hold it, and I'd like to make sure that there aren't others that
> > we need to worry about.
> 
> I searched the code. The exynos is the only case that inspects
> group->default_domain without holding the mutex during run time. It's in
> the device release path, so I think it's safe.

Great, thanks for looking.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
