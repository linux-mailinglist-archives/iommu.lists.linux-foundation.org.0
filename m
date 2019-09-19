Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FADB7A1A
	for <lists.iommu@lfdr.de>; Thu, 19 Sep 2019 15:07:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8C1F5CD3;
	Thu, 19 Sep 2019 13:07:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 51BBEC84
	for <iommu@lists.linux-foundation.org>;
	Thu, 19 Sep 2019 13:07:29 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DEA17711
	for <iommu@lists.linux-foundation.org>;
	Thu, 19 Sep 2019 13:07:28 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 76A6421D7F
	for <iommu@lists.linux-foundation.org>;
	Thu, 19 Sep 2019 13:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1568898448;
	bh=xDlkbYtekNq2g+j/zLZRiaXJuHeVfYxFX/p6ICWFSTw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BCHVqSuL/6xTcR4UIQNbftn+i7ALTmzjbkxcwXg9kdHIXUeW5wKOJj0jG8SGA29kT
	rlFF6uog75GxK0bdFaRZNI0ABOEfr0Om7lb2CRZPfxIDL3GXQYc0LdqrbSwCsSMul1
	OvFGEKKeZ74rerDPYJ6ZKN6QBZCubXMaIdO0VgrU=
Received: by mail-wr1-f46.google.com with SMTP id o18so2983072wrv.13
	for <iommu@lists.linux-foundation.org>;
	Thu, 19 Sep 2019 06:07:28 -0700 (PDT)
X-Gm-Message-State: APjAAAVyraFmBrpBfgyltr1W89MHUDVxWumzKugy6e03jk/ccTWky404
	x+WLKNHyqKdHb9sQIIOfSYmbykGhf+ePcbh0G94=
X-Google-Smtp-Source: APXvYqyNvo9nMD/j9PGGbZY5fbWhu9DS32hN7clZh4PtaLsYsLNB9DQGeR8UyO6Q34SnbEzf8UHVp/ztmfjTiqTh1Ok=
X-Received: by 2002:a5d:66d2:: with SMTP id k18mr7066721wrw.7.1568898446854;
	Thu, 19 Sep 2019 06:07:26 -0700 (PDT)
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
	<CAJF2gTT2c45HRfATF+=zs-HNToFAKgq1inKRmJMV3uPYBo4iVg@mail.gmail.com>
	<CAJF2gTTsHCsSpf1ncVb=ZJS2d=r+AdDi2=5z-REVS=uUg9138A@mail.gmail.com>
	<057a0af3-93f7-271c-170e-4b31e6894c3c@linaro.org>
In-Reply-To: <057a0af3-93f7-271c-170e-4b31e6894c3c@linaro.org>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 19 Sep 2019 21:07:15 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRbyfrUqAULPqJTXdxx8YOscPqAEuMsoJ+dTNobNrUV1g@mail.gmail.com>
Message-ID: <CAJF2gTRbyfrUqAULPqJTXdxx8YOscPqAEuMsoJ+dTNobNrUV1g@mail.gmail.com>
Subject: Re: [PATCH RFC 11/14] arm64: Move the ASID allocator code in a
	separate file
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: aou@eecs.berkeley.edu,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, suzuki.poulose@arm.com,
	Marc Zyngier <marc.zyngier@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Palmer Dabbelt <palmer@sifive.com>, christoffer.dall@arm.com,
	iommu@lists.linux-foundation.org, Mike Rapoport <rppt@linux.ibm.com>,
	Anup Patel <anup.Patel@wdc.com>, Atish Patra <Atish.Patra@wdc.com>,
	Julien Grall <julien.grall@arm.com>, james.morse@arm.com,
	gary@garyguo.net, Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
	kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
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

Hi,

On Mon, Sep 16, 2019 at 8:57 PM Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
> On 13/09/2019 09:13, Guo Ren wrote:
> > Another idea is seperate remote TLB invalidate into two instructions:
> >
> >  - sfence.vma.b.asyc
> >  - sfence.vma.b.barrier // wait all async TLB invalidate operations
> > finished for all harts.
>
> It's not clear to me how this helps, but I probably don't have the whole
> picture. If you have a place where it is safe to wait for the barrier to
> complete, why not do the whole invalidate there?
>
> > (I remember who mentioned me separate them into two instructions after
> > session. Anup? Is the idea right ?)
Forget it, I still use irq signal in my formal proposal [1]. I also
couldn't image the whole picture :P


> >     To solve the problem, we could define a async mode in sfence.vma.b to
> >     slove the problem and finished with per_cpu_irq/exception.
>
> The solution I had to this problem is pinning the ASID [1] used by the
> IOMMU, to prevent the CPU from recycling the ASID on rollover. This way
> the CPU doesn't have to wait for IOMMU invalidations to complete, when
> scheduling a task that might not even have anything to do with the IOMMU.
>

> In the Arm SMMU, ASID and IOASID (PASID) are separate identifiers. IOASID
> indexes an entry in the context descriptor table, which contains the ASID.
> So with unpinned shared ASID you don't need to invalidate the ATC on
> rollover, since the IOASID doesn't change, but you do need to modify the
> context descriptor and invalidate cached versions of it.
The terminology confused me a lot. I perfer use PASID for IOMMU and
ASID is for CPU.
Arm's entry of the context descriptor table contains a "IOASID"

IOASID != ASID for CPU_TLB and IOMMU_TLB.

When you say "since the IOASID doesn't change",Is it PASID or my IOASID ? -_*!
PASID in PCI-sig was used to determine transfer address space.
For intel, the entry which is indexed by PASID also contain S1/S2.PGD
and DID(VMID).
For arm, the entry which is indexed by PASID only contain S1.PGD and
IOASID. Compare to Intel Vt-d Scalable mode, arm's design can't
support PCI Virtual Function.

>
> Once you have pinned ASIDs, you could also declare that IOASID = ASID. I
> don't remember finding an argument to strictly forbid it, even though ASID
> and IOASID have different sizes on Arm (respectively 8/16 and 20 bits).
ASID and IOASID are hard to keep the same between CPU system and IOMMU
system. So I introduce S1/S2.PGD.PPN as a bridge between CPUs and
IOMMUs.
See my proposal [1]

1: https://lore.kernel.org/linux-csky/1568896556-28769-1-git-send-email-guoren@kernel.org/T/#u
-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
