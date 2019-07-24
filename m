Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7531572ED7
	for <lists.iommu@lfdr.de>; Wed, 24 Jul 2019 14:28:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 492C6E4D;
	Wed, 24 Jul 2019 12:28:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 500C3D56
	for <iommu@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 12:28:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EE857FE
	for <iommu@lists.linux-foundation.org>;
	Wed, 24 Jul 2019 12:28:51 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2983221BF6;
	Wed, 24 Jul 2019 12:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563971331;
	bh=upEYkhnwePTSx1iWqXBTxA1naAhaVRCl26Y3GCufzRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YZo8/yDo74N6v7UNWdGB3e6Re9WGLBI5vscvlQlx2+YxtLjFZGPg5RToSTaL0RugG
	4q81mxbUy4EBa6d6gUs/uRnOclIS0Rdobz8iScJD0t2aWU7cLf5DkjIWj9ZRJ7pXw4
	M6JlXRVp92/Dsc29est4NhN9pve0hK03Ohutqhxw=
Date: Wed, 24 Jul 2019 13:28:47 +0100
From: Will Deacon <will@kernel.org>
To: Ganapatrao Kulkarni <gklkml16@gmail.com>
Subject: Re: [RFC PATCH v2 00/19] Try to reduce lock contention on the SMMUv3
	command queue
Message-ID: <20190724122846.5mynuxkm3rgipxhp@willie-the-truck>
References: <20190711171927.28803-1-will@kernel.org>
	<CAKTKpr58zHi0Nw=Fb8d4xHUenW1d76V2pkQ_0+BqWQ0OfBmtCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKTKpr58zHi0Nw=Fb8d4xHUenW1d76V2pkQ_0+BqWQ0OfBmtCQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vijay Kilary <vkilari@codeaurora.org>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Jon Masters <jcm@redhat.com>, Jan Glauber <jglauber@marvell.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	iommu@lists.linux-foundation.org,
	Jayachandran Chandrasekharan Nair <jnair@marvell.com>,
	Robin Murphy <robin.murphy@arm.com>
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

On Fri, Jul 19, 2019 at 09:55:39AM +0530, Ganapatrao Kulkarni wrote:
> On Thu, Jul 11, 2019 at 10:58 PM Will Deacon <will@kernel.org> wrote:
> > This is a significant rework of the RFC I previously posted here:
> >
> >   https://lkml.kernel.org/r/20190611134603.4253-1-will.deacon@arm.com
> >
> > But this time, it looks like it might actually be worthwhile according
> > to my perf profiles, where __iommu_unmap() falls a long way down the
> > profile for a multi-threaded netperf run. I'm still relying on others to
> > confirm this is useful, however.
> >
> > Some of the changes since last time are:
> >
> >   * Support for constructing and submitting a list of commands in the
> >     driver
> >
> >   * Numerous changes to the IOMMU and io-pgtable APIs so that we can
> >     submit commands in batches
> >
> >   * Removal of cmpxchg() from cmdq_shared_lock() fast-path
> >
> >   * Code restructuring and cleanups
> >
> > This current applies against my iommu/devel branch that Joerg has pulled
> > for 5.3. If you want to test it out, I've put everything here:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=iommu/cmdq
> >
> > Feedback welcome. I appreciate that we're in the merge window, but I
> > wanted to get this on the list for people to look at as an RFC.
> 
> I have tried branch iommu/cmdq on ThunderX2. I do see there is drastic
> reduction in CPU bandwidth consumption(from 15 to 20% to 1 to 2% in
> perf top) from SMMU CMDQ helper functions, when I run iperf with more
> than 64 clients(-P 64). However I have not noticed any measurable
> performance improvement in iperf results. IMO, this might/should help
> in performance improvement of IO intensive workloads.
> 
> FWIW, you can add,
> Tested-by: Ganapatrao Kulkarni  <gkulkarni@marvell.com>

Brilliant, thanks. Your measurements reflect mine in that I can saturate
the NICs I have access to regardless of these changes, but the CPU time
is drastically reduced.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
