Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E69808ED81
	for <lists.iommu@lfdr.de>; Thu, 15 Aug 2019 15:57:32 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CF7DDEEC;
	Thu, 15 Aug 2019 13:57:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 78223EE1
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 13:57:29 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 18C37711
	for <iommu@lists.linux-foundation.org>;
	Thu, 15 Aug 2019 13:57:29 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7F73E2054F;
	Thu, 15 Aug 2019 13:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565877448;
	bh=7BqHO6v16InDHXfRqQecyNXtbnqfO3YUjLOD40xpTl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0qu0vTSJN1WNXAbvj6a8lc/LN9lH6XN8S0X+M5Q9Nqz3j/69hAjzhWoLvaZcc6JG4
	FibHmf42XKRkxBbnYHxeolL9qiuLnhoiDt6LwvwRWHj6RLzJgUWFFjO8jqRQGZxJlp
	F0gLFLXFHLxxk3C/QgdPaH7EhSr1PyMpWNNQ2QRI=
Date: Thu, 15 Aug 2019 14:57:23 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 02/13] iommu/io-pgtable-arm: Remove redundant call to
	io_pgtable_tlb_sync()
Message-ID: <20190815135723.oobxfwngoq6wttlb@willie-the-truck>
References: <20190814175634.21081-1-will@kernel.org>
	<20190814175634.21081-3-will@kernel.org>
	<ec5eb9fb-4178-011f-0642-bae380086a49@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec5eb9fb-4178-011f-0642-bae380086a49@arm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Vijay Kilary <vkilari@codeaurora.org>,
	Jon Masters <jcm@redhat.com>, Jan Glauber <jglauber@marvell.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	iommu@lists.linux-foundation.org,
	Jayachandran Chandrasekharan Nair <jnair@marvell.com>,
	David Woodhouse <dwmw2@infradead.org>
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

Hi Robin,

On Thu, Aug 15, 2019 at 01:43:11PM +0100, Robin Murphy wrote:
> On 14/08/2019 18:56, Will Deacon wrote:
> > Commit b6b65ca20bc9 ("iommu/io-pgtable-arm: Add support for non-strict
> > mode") added an unconditional call to io_pgtable_tlb_sync() immediately
> > after the case where we replace a block entry with a table entry during
> > an unmap() call. This is redundant, since the IOMMU API will call
> > iommu_tlb_sync() on this path and the patch in question mentions this:
> > 
> >   | To save having to reason about it too much, make sure the invalidation
> >   | in arm_lpae_split_blk_unmap() just performs its own unconditional sync
> >   | to minimise the window in which we're technically violating the break-
> >   | before-make requirement on a live mapping. This might work out redundant
> >   | with an outer-level sync for strict unmaps, but we'll never be splitting
> >   | blocks on a DMA fastpath anyway.
> > 
> > However, this sync gets in the way of deferred TLB invalidation for leaf
> > entries and is at best a questionable, unproven hack. Remove it.
> 
> Hey, that's my questionable, unproven hack! :P

I thought you'd like to remain anonymous, but I can credit you if you like?
;)

> It's not entirely clear to me how this gets in the way though - AFAICS the
> intent of tlb_flush_leaf exactly matches the desired operation here, so
> couldn't these just wait to be converted in patch #8?

Good point. I think there are two things:

	1. Initially, I didn't plan to have tlb_flush_leaf() at all because
	   I didn't think it would be needed. Then I ran into the v7s CONT
	   stuff and ended up needing it after all (I think it's the only
	   user). So that's an oversight.

	2. If we do the tlb_flush_leaf() here, then we could potentially
	   put a hole in the ongoing gather structure, but I suppose we
	   could do both a tlb_add_page() *and* a tlb_flush_leaf() to get
	   around that.

So yes, I probably could move this back if the sync is necessary but...

> In principle the concern is that if the caller splits a block with
> iommu_unmap_fast(), there's no guarantee of seeing an iommu_tlb_sync()
> before returning to the caller, and thus there's the potential to run into a
> TLB conflict on a subsequent access even if the endpoint was "good" and
> didn't make any accesses *during* the unmap call.

... this just feels pretty theoretical to me. The fact of the matter is
that we're unable to do break before make because we can't reliably tolerate
faults. If the hardware actually requires BBM for correctness, then we
should probably explore proper solutions (e.g. quirks, avoiding block
mappings, handling faults) rather than emitting a random sync and hoping
for the best.

Did you add the sync just in case, or was it based on a real crash?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
