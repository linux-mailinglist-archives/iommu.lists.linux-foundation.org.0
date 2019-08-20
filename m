Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F95D965B8
	for <lists.iommu@lfdr.de>; Tue, 20 Aug 2019 17:58:31 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 42E5AE58;
	Tue, 20 Aug 2019 15:58:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7DA58E21
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 15:58:28 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 111BA89B
	for <iommu@lists.linux-foundation.org>;
	Tue, 20 Aug 2019 15:58:28 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C6A1022CF7;
	Tue, 20 Aug 2019 15:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566316707;
	bh=dDXHA5bU4rB/VugoM/y+S4USn6RYgLcSxFjkdH7xqZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nAlUc1GkL0o2MiZB9ygu3+rAl7z9MXqOto5rybXrVg7AXjPeph788PYAKLdjE8BCj
	OfdOMzy2XmKYQMSg5+QiFfjJgbLZxxYicfz5+YMO5ZNMS4aPGYE3Fs6ouNnlYxPJ7d
	zGmDLsy1TXr2uf4OiOpILnZ92P5x388+5f7mUDjw=
Date: Tue, 20 Aug 2019 16:58:24 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 4/4] iommu/io-pgtable-arm: Prepare for TTBR1 usage
Message-ID: <20190820155823.ptn2rfvnmkd4v632@willie-the-truck>
References: <cover.1566238530.git.robin.murphy@arm.com>
	<6596469d5fa1e918145fdd4e6b1a3ad67f7cde2e.1566238530.git.robin.murphy@arm.com>
	<20190820103048.xacfbtn5o4wermhi@willie-the-truck>
	<469dc66a-2532-5f7f-cd8d-3fe13f6c279a@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <469dc66a-2532-5f7f-cd8d-3fe13f6c279a@arm.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

On Tue, Aug 20, 2019 at 03:51:45PM +0100, Robin Murphy wrote:
> On 20/08/2019 11:30, Will Deacon wrote:
> > On Mon, Aug 19, 2019 at 07:19:31PM +0100, Robin Murphy wrote:
> > > Now that callers are free to use a given table for TTBR1 if they wish
> > > (all they need do is shift the provided attributes when constructing
> > > their final TCR value), the only remaining impediment is the address
> > > validation on map/unmap. The fact that the LPAE address space split is
> > > symmetric makes this easy to accommodate - by simplifying the current
> > > range checks into explicit tests that address bits above IAS are all
> > > zero, it then follows straightforwardly to add the inverse test to
> > > allow the all-ones case as well.
> > > 
> > > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > > ---
> > >   drivers/iommu/io-pgtable-arm.c | 7 ++++---
> > >   1 file changed, 4 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> > > index 09cb20671fbb..f39c50356351 100644
> > > --- a/drivers/iommu/io-pgtable-arm.c
> > > +++ b/drivers/iommu/io-pgtable-arm.c
> > > @@ -475,13 +475,13 @@ static int arm_lpae_map(struct io_pgtable_ops *ops, unsigned long iova,
> > >   	arm_lpae_iopte *ptep = data->pgd;
> > >   	int ret, lvl = ARM_LPAE_START_LVL(data);
> > >   	arm_lpae_iopte prot;
> > > +	long iaext = (long)iova >> data->iop.cfg.ias;
> > >   	/* If no access, then nothing to do */
> > >   	if (!(iommu_prot & (IOMMU_READ | IOMMU_WRITE)))
> > >   		return 0;
> > > -	if (WARN_ON(iova >= (1ULL << data->iop.cfg.ias) ||
> > > -		    paddr >= (1ULL << data->iop.cfg.oas)))
> > > +	if (WARN_ON((iaext && ~iaext) || paddr >> data->iop.cfg.oas))
> > 
> > I had to read that '&&' twice, but I see what you're doing now :)
> > 
> > >   		return -ERANGE;
> > 
> > This doesn't seem sufficient to prevent a mixture of TTBR1 and TTBR0
> > addresses from being mapped in the same TTBR. Perhaps we need a quirk for
> > TTBR1, which could then take care of setting EPDx appropriately?
> 
> Right, that's the one downside of going for the minimalist "io-pgtable
> doesn't even have to know" approach. On reflection, though, in that paradigm
> it should probably be the caller's responsibility to convert TTBR1 addresses
> to preserve the "as if TTBR0" illusion anyway :/

Right, and I'd rather not push stuff into the caller for the common case.
It's not exactly onerous to support this in io-pgtable. It's also why I'd
still like to keep the EPDx in there, because the callers that care can
rewrite the stuff, but at least we provided a default.

> The advantage of not having a quirk is that it allows split address spaces
> to fit more closely with the aux_domain idea, i.e. we could allocate and
> initialise a domain without having to assume, or even care, whether it will
> end up attached as a primary or aux domain. It *might* even be potentially
> useful to have a domain attached to TTBR0 of one device's context and TTBR1
> of another's at the same time, although that's pretty niche.

That sounds pretty theoretical to me at the moment.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
