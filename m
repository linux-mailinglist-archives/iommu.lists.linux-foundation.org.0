Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B9DCAB7D
	for <lists.iommu@lfdr.de>; Thu,  3 Oct 2019 19:34:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 99B77D95;
	Thu,  3 Oct 2019 17:33:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 072ECD7A
	for <iommu@lists.linux-foundation.org>;
	Thu,  3 Oct 2019 17:33:58 +0000 (UTC)
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7B25689D
	for <iommu@lists.linux-foundation.org>;
	Thu,  3 Oct 2019 17:33:57 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id AA09661AF9; Thu,  3 Oct 2019 17:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1570124037;
	bh=AYmi/neband1M0/iZPZrayWLoJ7jz85EmogdgImxAa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gm73AANZiAYiVo6mgQLs6K5mfhpjbGHIrXQ9HC6KrZe4znzgoPT7XHSlTeeBxGmoK
	1L8UCaV25T94wsI3gbipklTHUmoOJnj5Nrg9fmHMvJHBT2DtkEIzH4O1nyn0W3fa9H
	MD9uwZ20f2Ah4HR0u0zh3fE8y+NXl5bvkZ94pn8A=
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
	[199.106.103.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: jcrouse@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id AD3736192E;
	Thu,  3 Oct 2019 17:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1570124035;
	bh=AYmi/neband1M0/iZPZrayWLoJ7jz85EmogdgImxAa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R87vj5qKCQ8JWx9FOUsu32uvZ+fhtw4BenQk7pstf47aX4pHC0G6hnhxMZddXwVp2
	QNVEa9j9eHbrWo30aNbcHAX4Eomt3kGQBjStgfxJjwawjVQN8XNxVzmdJxHhAEBlvR
	ZO7uyuDDZc+/luet8gTEWRQk+uRsbjH5ts07t7ik=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AD3736192E
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Thu, 3 Oct 2019 11:33:52 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 3/4] iommu/io-pgtable-arm: Rationalise TCR handling
Message-ID: <20191003173352.GA13386@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>, joro@8bytes.org,
	iommu@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org, robdclark@gmail.com
References: <cover.1566238530.git.robin.murphy@arm.com>
	<78df4f8e2510e88f3ded59eb385f79b4442ed4f2.1566238530.git.robin.murphy@arm.com>
	<20190820103115.o7neehdethf7sbqi@willie-the-truck>
	<48ca6945-de73-116a-3230-84862ca9e60b@arm.com>
	<20190820160700.6ircxomwuo5bksqz@willie-the-truck>
	<8cc47f43-ad74-b4e2-e977-6c78780abc91@arm.com>
	<20190821121120.34wqo7vj56pqk57c@willie-the-truck>
	<cdceec32-8dae-2c9e-8f66-0cd86288529f@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cdceec32-8dae-2c9e-8f66-0cd86288529f@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org
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

On Wed, Aug 21, 2019 at 01:56:20PM +0100, Robin Murphy wrote:
> On 21/08/2019 13:11, Will Deacon wrote:
> >On Tue, Aug 20, 2019 at 07:41:52PM +0100, Robin Murphy wrote:
> >>On 20/08/2019 17:07, Will Deacon wrote:
> >>>On Tue, Aug 20, 2019 at 04:25:56PM +0100, Robin Murphy wrote:
> >>>>On 20/08/2019 11:31, Will Deacon wrote:
> >>>>>On Mon, Aug 19, 2019 at 07:19:30PM +0100, Robin Murphy wrote:
> >>>>>>Although it's conceptually nice for the io_pgtable_cfg to provide a
> >>>>>>standard VMSA TCR value, the reality is that no VMSA-compliant IOMMU
> >>>>>>looks exactly like an Arm CPU, and they all have various other TCR
> >>>>>>controls which io-pgtable can't be expected to understand. Thus since
> >>>>>>there is an expectation that drivers will have to add to the given TCR
> >>>>>>value anyway, let's strip it down to just the essentials that are
> >>>>>>directly relevant to io-pgatble's inner workings - namely the address
> >>>>>>sizes, walk attributes, and where appropriate, format selection.
> >>>>>>
> >>>>>>Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> >>>>>>---
> >>>>>>    drivers/iommu/arm-smmu-v3.c        | 7 +------
> >>>>>>    drivers/iommu/arm-smmu.c           | 1 +
> >>>>>>    drivers/iommu/arm-smmu.h           | 2 ++
> >>>>>>    drivers/iommu/io-pgtable-arm-v7s.c | 6 ++----
> >>>>>>    drivers/iommu/io-pgtable-arm.c     | 4 ----
> >>>>>>    drivers/iommu/qcom_iommu.c         | 2 +-
> >>>>>>    6 files changed, 7 insertions(+), 15 deletions(-)
> >>>>>
> >>>>>Hmm, so I'm a bit nervous about this one since I think we really should
> >>>>>be providing a TCR with EPD1 set if we're only giving you TTBR0. Relying
> >>>>>on the driver to do this worries me. See my comments on the next patch.
> >>>>
> >>>>The whole idea is that we already know we can't provide a *complete* TCR
> >>>>value (not least because anything above bit 31 is the wild west), thus
> >>>>there's really no point in io-pgtable trying to provide anything other than
> >>>>the parts it definitely controls. It makes sense to provide this partial TCR
> >>>>value "as if" for TTBR0, since that's the most common case, but ultimately
> >>>>io-pgatble doesn't know (or need to) which TTBR the caller intends to
> >>>>actually use for this table. Even if the caller *is* allocating it for
> >>>>TTBR0, io-pgtable doesn't know that they haven't got something live in TTBR1
> >>>>already, so it still wouldn't be in a position to make the EPD1 call either
> >>>>way.
> >>>
> >>>Ok, but the driver can happily rewrite/ignore what it gets back. I suppose
> >>>an alternative would be scrapped the 'u64 tcr' and instead having a bunch
> >>>of named bitfields for the stuff we're actually providing, although I'd
> >>>still like EPDx to be in there.
> >>
> >>I like the bitfield idea; it would certainly emphasise the "you have to do
> >>something more with this" angle that I'm pushing towards here, but still
> >>leave things framed in TCR terms without having to go to some more general
> >>abstraction. It really doesn't play into your EPD argument though - such a
> >>config would be providing TxSZ/TGx/IRGNx/ORGNx/SHx, but EPDy, for y = !x.
> >>For a driver to understand that and do the right thing with it is even more
> >>involved than for the driver to just set EPD1 by itself anyway.
> >
> >Having considered the bitfield idea some more, I'm less attached to EPDx
> >because we simply wouldn't be making a statement about them, rather than a
> >(dangerous) zero value and expecting it to be ignored. So I think we're in
> >agreement on that.
> 
> Cool, I'll give bitfields a go for v2.
> 
> >The only part I'm still stuck to is that I think io-pgtable should know
> >whether it's targetting TTBR0 or TTBR1 so that it can sanitise input
> >addresses correctly. Doing this in the driver code is possible, but I'd
> >rather not start from that position, particularly as it would require things
> >like sign-extension in the TLBI callbacks.

Bumping this as is our tradition in the -rc1 time frame before we get all
distracted with other stuff. It sounds like the last agreement was for a
TTBR1 hint for the EDP and the sign extension in the functions.

Let me know if you need any help. I've got a little time and more than a little
motivation to keep slogging ahead toward a glorious arm-smmu-v2
per-context pagetable future.

Jordan

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
