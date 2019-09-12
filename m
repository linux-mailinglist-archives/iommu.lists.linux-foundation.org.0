Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA00B119E
	for <lists.iommu@lfdr.de>; Thu, 12 Sep 2019 17:00:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5157EE1B;
	Thu, 12 Sep 2019 14:59:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CF9BBC96
	for <iommu@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 14:59:57 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 789DC7D2
	for <iommu@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 14:59:57 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 03750214D8
	for <iommu@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 14:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568300397;
	bh=RK47i9JzV2o8zYa+doB7UiayI/FwXMaWv5Ml8LccsgY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Mp8tMCnHBMtri7nKuvpjSoNW3SBhD9Q2PQQus+HoDhqqsO2hfh5+kB+09qrWUHo06
	Xg50YZM1a8zDvFIJJv0CI/EvakHiQne0lhgmu9mtHuf7+l8qkR8L3fuEBxSzlzY4/S
	/qPsvdajQdsWoOvQTd8Ut5MEZxBU2HYNYlaTeYNs=
Received: by mail-wr1-f46.google.com with SMTP id q14so28795764wrm.9
	for <iommu@lists.linux-foundation.org>;
	Thu, 12 Sep 2019 07:59:56 -0700 (PDT)
X-Gm-Message-State: APjAAAUsFzIMM30pCoPHpAaROKly0G2O8uh+eygiAcNO6i9+zpDY7Ww2
	hclvEbHVm2/49IwsWya/vsuGlOtMZngjZaL5WaY=
X-Google-Smtp-Source: APXvYqyWrVR+NI16eudQNtduL1OAxnO0WQ4SkOLjY2AVyz5N6syNQZ1qE/5QhN1PWc17kzrEkpHSXdkh4aFf0C6oOhM=
X-Received: by 2002:a5d:6b49:: with SMTP id x9mr12703438wrw.80.1568300395358; 
	Thu, 12 Sep 2019 07:59:55 -0700 (PDT)
MIME-Version: 1.0
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
	<20190912140256.fwbutgmadpjbjnab@willie-the-truck>
In-Reply-To: <20190912140256.fwbutgmadpjbjnab@willie-the-truck>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 12 Sep 2019 15:59:43 +0100
X-Gmail-Original-Message-ID: <CAJF2gTT2c45HRfATF+=zs-HNToFAKgq1inKRmJMV3uPYBo4iVg@mail.gmail.com>
Message-ID: <CAJF2gTT2c45HRfATF+=zs-HNToFAKgq1inKRmJMV3uPYBo4iVg@mail.gmail.com>
Subject: Re: [PATCH RFC 11/14] arm64: Move the ASID allocator code in a
	separate file
To: Will Deacon <will@kernel.org>
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

Thx Will for reply.

On Thu, Sep 12, 2019 at 3:03 PM Will Deacon <will@kernel.org> wrote:
>
> On Sun, Sep 08, 2019 at 07:52:55AM +0800, Guo Ren wrote:
> > On Mon, Jun 24, 2019 at 6:40 PM Will Deacon <will@kernel.org> wrote:
> > > > I'll keep my system use the same ASID for SMP + IOMMU :P
> > >
> > > You will want a separate allocator for that:
> > >
> > > https://lkml.kernel.org/r/20190610184714.6786-2-jean-philippe.brucker@arm.com
> >
> > Yes, it is hard to maintain ASID between IOMMU and CPUMMU or different
> > system, because it's difficult to synchronize the IO_ASID when the CPU
> > ASID is rollover.
> > But we could still use hardware broadcast TLB invalidation instruction
> > to uniformly manage the ASID and IO_ASID, or OTHER_ASID in our IOMMU.
>
> That's probably a bad idea, because you'll likely stall execution on the
> CPU until the IOTLB has completed invalidation. In the case of ATS, I think
> an endpoint ATC is permitted to take over a minute to respond. In reality, I
> suspect the worst you'll ever see would be in the msec range, but that's
> still an unacceptable period of time to hold a CPU.
Just as I've said in the session that IOTLB invalidate delay is
another topic, My main proposal is to introduce stage1.pgd and
stage2.pgd as address space identifiers between different TLB systems
based on vmid, asid. My last part of sildes will show you how to
translate stage1/2.pgd to as/vmid in PCI ATS system and the method
could work with SMMU-v3 and intel Vt-d. (It's regret for me there is
no time to show you the whole slides.)

In our light IOMMU implementation, there's no IOTLB invalidate delay
problem. Becasue IOMMU is very close to CPU MMU and interconnect's
delay is the same with SMP CPUs MMU (no PCI, VM supported).

To solve the problem, we could define a async mode in sfence.vma.b to
slove the problem and finished with per_cpu_irq/exception.

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
