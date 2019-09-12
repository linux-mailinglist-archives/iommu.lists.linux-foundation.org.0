Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DC9B1095
	for <lists.iommu@lfdr.de>; Thu, 12 Sep 2019 16:03:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2D2ECE1F;
	Thu, 12 Sep 2019 14:03:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F0BD5DDC
	for <iommu@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 14:03:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AF56782B
	for <iommu@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 14:03:03 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id BBFBA20856;
	Thu, 12 Sep 2019 14:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568296983;
	bh=W/mFNJBuhBpmbDbmK2QLeeqrvyKptqabZ5ypFqgATbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zZWoHe9qke0fWfFJOlp7u5U6VNJ/lxOM6p5vMkZZFDleEdE1MM1auzRRZd1JCYzZN
	nCbzbEtEpYAkC86lEARz1IW1i5vUYhqPWk9cRUWCg/5A3JAdcXl5MG4tPAjfsJj/+m
	puXi1FKE2G+rPXBGADanJd04R0aDp5LpwZKXyxes=
Date: Thu, 12 Sep 2019 15:02:56 +0100
From: Will Deacon <will@kernel.org>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH RFC 11/14] arm64: Move the ASID allocator code in a
	separate file
Message-ID: <20190912140256.fwbutgmadpjbjnab@willie-the-truck>
References: <20190321163623.20219-12-julien.grall@arm.com>
	<0dfe120b-066a-2ac8-13bc-3f5a29e2caa3@arm.com>
	<CAJF2gTTXHHgDboaexdHA284y6kNZVSjLis5-Q2rDnXCxr4RSmA@mail.gmail.com>
	<c871a5ae-914f-a8bb-9474-1dcfec5d45bf@arm.com>
	<20190619091219.GB7767@fuggles.cambridge.arm.com>
	<CAJF2gTTmFq3yYa9UrdZRAFwJgC=KmKTe2_NFy_UZBUQovqQJPg@mail.gmail.com>
	<20190619123939.GF7767@fuggles.cambridge.arm.com>
	<CAJF2gTSiiiewTLwVAXvPLO7rTSUw1rg8VtFLzANdP2S2EEbTjg@mail.gmail.com>
	<20190624104006.lvm32nahemaqklxc@willie-the-truck>
	<CAJF2gTSC1sGgmiTCgzKUTdPyUZ3LG4H7N8YbMyWr-E+eifGuYg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTSC1sGgmiTCgzKUTdPyUZ3LG4H7N8YbMyWr-E+eifGuYg@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: julien.thierry@arm.com, Catalin Marinas <catalin.marinas@arm.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Will Deacon <will.deacon@arm.com>, christoffer.dall@arm.com,
	Atish Patra <Atish.Patra@wdc.com>,
	Julien Grall <julien.grall@arm.com>, gary@garyguo.net,
	linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu,
	Mike Rapoport <rppt@linux.ibm.com>, aou@eecs.berkeley.edu,
	Arnd Bergmann <arnd@arndb.de>, suzuki.poulose@arm.com,
	Marc Zyngier <marc.zyngier@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-arm-kernel@lists.infradead.org, Anup Patel <anup.Patel@wdc.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	iommu@lists.linux-foundation.org, james.morse@arm.com
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

On Sun, Sep 08, 2019 at 07:52:55AM +0800, Guo Ren wrote:
> On Mon, Jun 24, 2019 at 6:40 PM Will Deacon <will@kernel.org> wrote:
> > > I'll keep my system use the same ASID for SMP + IOMMU :P
> >
> > You will want a separate allocator for that:
> >
> > https://lkml.kernel.org/r/20190610184714.6786-2-jean-philippe.brucker@arm.com
> 
> Yes, it is hard to maintain ASID between IOMMU and CPUMMU or different
> system, because it's difficult to synchronize the IO_ASID when the CPU
> ASID is rollover.
> But we could still use hardware broadcast TLB invalidation instruction
> to uniformly manage the ASID and IO_ASID, or OTHER_ASID in our IOMMU.

That's probably a bad idea, because you'll likely stall execution on the
CPU until the IOTLB has completed invalidation. In the case of ATS, I think
an endpoint ATC is permitted to take over a minute to respond. In reality, I
suspect the worst you'll ever see would be in the msec range, but that's
still an unacceptable period of time to hold a CPU.

> Welcome to join our disscusion:
> "Introduce an implementation of IOMMU in linux-riscv"
> 9 Sep 2019, 10:45 Jade-room-I&II (Corinthia Hotel Lisbon) RISC-V MC

I attended this session, but it unfortunately raised many more questions
than it answered.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
