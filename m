Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F064229995
	for <lists.iommu@lfdr.de>; Wed, 22 Jul 2020 15:52:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BA75C878CE;
	Wed, 22 Jul 2020 13:52:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eQsfi7MiaM7O; Wed, 22 Jul 2020 13:52:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3C42287820;
	Wed, 22 Jul 2020 13:52:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A997C004C;
	Wed, 22 Jul 2020 13:52:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A0A60C004C
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 13:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9D404878A4
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 13:52:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3NvE-bjVzDiS for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 13:52:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1488987820
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 13:52:48 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 207A62C8; Wed, 22 Jul 2020 15:52:45 +0200 (CEST)
Date: Wed, 22 Jul 2020 15:52:44 +0200
From: Joerg Roedel <joro@8bytes.org>
To: "Prakhya, Sai Praneeth" <sai.praneeth.prakhya@intel.com>
Subject: Re: [PATCH V4 1/3] iommu: Add support to change default domain of an
 iommu group
Message-ID: <20200722135244.GH27672@8bytes.org>
References: <cover.1591290586.git.sai.praneeth.prakhya@intel.com>
 <3d7f5cf067437593e681751108860ea692bb10b1.1591290586.git.sai.praneeth.prakhya@intel.com>
 <20200630091601.GB28824@8bytes.org>
 <FFF73D592F13FD46B8700F0A279B802F573D8042@ORSMSX114.amr.corp.intel.com>
 <FFF73D592F13FD46B8700F0A279B802F573DB164@ORSMSX114.amr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <FFF73D592F13FD46B8700F0A279B802F573DB164@ORSMSX114.amr.corp.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Robin Murphy <robin.murphy@arm.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Will Deacon <will.deacon@arm.com>, "Raj, Ashok" <ashok.raj@intel.com>,
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

On Tue, Jul 14, 2020 at 06:23:54PM +0000, Prakhya, Sai Praneeth wrote:
> Q1:
> > Presently, iommu_change_dev_def_domain() checks if the iommu group still has
> > only one device or not. Hence, checking if iommu group has one device or not is
> > done twice, once before taking device_lock() and the other, after taking
> > device_lock().
> > 
> > I agree that the code isn't checking if the iommu group still has the _same_
> > device or not.
> > One way, I could think of doing it is by storing "dev" temporarily and checking
> > for it.
> > Do you think that's ok? Or would you rather suggest something else?

That sounds reasonable, get the device from the group, lock it, take
group->mutex, and check whether the same device is still alone in the
group.


> Q2:
> > The reason for taking iommu_group->mutex in the beginning of
> > iommu_change_dev_def_domain() is that the function
> > 
> > 1. Checks if the group is being directly used by user level drivers (i.e. if (group-
> > >default_domain != group->domain))
> > 
> > 2. Uses iommu_ops
> > (prev_dom = group->default_domain;
> > if (!prev_dom || !prev_dom->ops || !prev_dom->ops->def_domain_type))
> > 
> > 3. Sets iomu_group->domain to iommu_group->default_domain
> > 
> > I wanted to make sure that iommu_group->domain and iommu_group-
> > >default_domain aren't changed by some other thread while this thread is
> > working on it. So, please let me know if I misunderstood something.

This looks correct as well.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
