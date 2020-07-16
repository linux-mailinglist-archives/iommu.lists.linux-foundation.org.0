Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DCA22217C
	for <lists.iommu@lfdr.de>; Thu, 16 Jul 2020 13:32:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8A9818A586;
	Thu, 16 Jul 2020 11:32:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nUzpeJcPVkCW; Thu, 16 Jul 2020 11:32:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0FEEA8A598;
	Thu, 16 Jul 2020 11:32:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E780DC0733;
	Thu, 16 Jul 2020 11:32:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C8EBC0733
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jul 2020 11:32:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 07F5D8A586
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jul 2020 11:32:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qsXkvn-q5SOe for <iommu@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 11:32:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8B0918A585
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jul 2020 11:32:39 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CC3B92074B;
 Thu, 16 Jul 2020 11:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594899159;
 bh=3cOvlaZ05EcmrtKX6g8BP2m/rqNbiRqnjZrKgj08tjE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ne0dpTmDWaQ3qVkvvYEshgxF7lYWvaZkeH6xK7kTKoLW3O+pFyWi2L1A2EhHzrP39
 7O5lhBIAzAb0W62JVPPHfaaMwgIHVLghVV1DYu6+lrWZn/cMVuTJT2MQ/a3VvQ3AO9
 etxnVjWL9KQXfEWSx0NW/wq/SB+ProewtyANR1u4=
Date: Thu, 16 Jul 2020 12:32:35 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 0/4] iommu/arm-smmu-v3: Improve cmdq lock efficiency
Message-ID: <20200716113234.GA7290@willie-the-truck>
References: <1592846920-45338-1-git-send-email-john.garry@huawei.com>
 <20200716101940.GA7036@willie-the-truck>
 <20200716102233.GC7036@willie-the-truck>
 <20200716102814.GD7036@willie-the-truck>
 <bd302efa-20d8-e1b3-6a80-db65ab5ad752@huawei.com>
 <aef1e4a4-d594-f477-9029-8f4295bb9f6c@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aef1e4a4-d594-f477-9029-8f4295bb9f6c@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: trivial@kernel.org, maz@kernel.org, linux-kernel@vger.kernel.org,
 linuxarm@huawei.com, iommu@lists.linux-foundation.org,
 linux-arm-kernel@lists.infradead.org
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

On Thu, Jul 16, 2020 at 12:22:05PM +0100, Robin Murphy wrote:
> On 2020-07-16 11:56, John Garry wrote:
> > On 16/07/2020 11:28, Will Deacon wrote:
> > > On Thu, Jul 16, 2020 at 11:22:33AM +0100, Will Deacon wrote:
> > > > On Thu, Jul 16, 2020 at 11:19:41AM +0100, Will Deacon wrote:
> > > > > On Tue, Jun 23, 2020 at 01:28:36AM +0800, John Garry wrote:
> > > > > > As mentioned in [0], the CPU may consume many cycles processing
> > > > > > arm_smmu_cmdq_issue_cmdlist(). One issue we find is the
> > > > > > cmpxchg() loop to
> > > > > > get space on the queue takes approx 25% of the cycles
> > > > > > for this function.
> > > > > > 
> > > > > > This series removes that cmpxchg().
> > > > > 
> > > > > How about something much simpler like the diff below? >>
> > > > Ah, scratch that, I don't drop the lock if we fail the cas with it held.
> > > > Let me hack it some more (I have no hardware so I can only
> > > > build-test this).
> > > 
> > > Right, second attempt...
> > 
> > I can try it, but if performance if not as good, then please check mine
> > further (patch 4/4 specifically) - performance is really good, IMHO.
> 
> Perhaps a silly question (I'm too engrossed in PMU world ATM to get properly
> back up to speed on this), but couldn't this be done without cmpxchg anyway?
> Instinctively it feels like instead of maintaining a literal software copy
> of the prod value, we could resolve the "claim my slot in the queue" part
> with atomic_fetch_add on a free-running 32-bit "pseudo-prod" index, then
> whoever updates the hardware deals with the truncation and wrap bit to
> convert it to an actual register value.

Maybe, but it's easier said than done. The hard part is figuring how that
you have space and there's no way I'm touching that logic without a way to
test this.

I'm also not keen to complicate the code because of systems that don't scale
well with contended CAS [1]. If you put down loads of cores, you need an
interconnect/coherence protocol that can handle it.

Will

[1] https://lore.kernel.org/lkml/20190607072652.GA5522@hc/T/#m0d00f107c29223045933292a8b5b90d2ca9b7e5c
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
