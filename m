Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1FF21EAB5
	for <lists.iommu@lfdr.de>; Tue, 14 Jul 2020 09:56:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1D7708954B;
	Tue, 14 Jul 2020 07:56:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OP2fMpxGiPZa; Tue, 14 Jul 2020 07:56:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9311989551;
	Tue, 14 Jul 2020 07:56:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A22EC0733;
	Tue, 14 Jul 2020 07:56:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C55DCC0733
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 07:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3E8A2885C8
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 07:56:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oRThjKqImC6z for <iommu@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 07:56:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 96F8A88560
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 07:56:09 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B46E72145D;
 Tue, 14 Jul 2020 07:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594713369;
 bh=qeHxoelopC8fC8i1MYKZLmE+ijVyBr7FSm/jfPrNJf8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fkeT9Yj3tp1TDlDqeq3AhcpLjrOBqs5FOt7gsO1aA2J+sG41iTneHzbLldMqyksjg
 KtKaUN+u+m6bmGA/fqs07uM46fY8E4Y1giEhRtzqRd0CljhONMXkPmnA/s7Xmvboeh
 N+obl3zoeIZ1hKl8vv3F9U81LTbfJmMMMUJArlM0=
Date: Tue, 14 Jul 2020 08:56:03 +0100
From: Will Deacon <will@kernel.org>
To: John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH v2 5/5] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
Message-ID: <20200714075603.GE4277@willie-the-truck>
References: <20200625001039.56174-1-john.stultz@linaro.org>
 <20200625001039.56174-6-john.stultz@linaro.org>
 <20200702141825.GA16941@willie-the-truck>
 <CALAqxLVZ2EhutYjOt7Be1RgnYwHT6-4m6DxA-t1wuxuSy=6yDQ@mail.gmail.com>
 <20200710075411.GA30011@willie-the-truck>
 <CALAqxLWadLrxckRHRAR0Q417RnFKquQJbRfO_DLEVH56cykRow@mail.gmail.com>
 <20200713204133.GA3731@willie-the-truck>
 <CALAqxLXDVRzWDfuAS78EFwyYs3yr3QrPF3Tze0KAW1fo9c7M2A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALAqxLXDVRzWDfuAS78EFwyYs3yr3QrPF3Tze0KAW1fo9c7M2A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Maulik Shah <mkshah@codeaurora.org>, Jason Cooper <jason@lakedaemon.net>,
 Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, Lina Iyer <ilina@codeaurora.org>,
 linux-gpio@vger.kernel.org, iommu@lists.linux-foundation.org,
 Andy Gross <agross@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Todd Kjos <tkjos@google.com>
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

On Mon, Jul 13, 2020 at 01:48:29PM -0700, John Stultz wrote:
> On Mon, Jul 13, 2020 at 1:41 PM Will Deacon <will@kernel.org> wrote:
> > On Fri, Jul 10, 2020 at 03:21:53PM -0700, John Stultz wrote:
> > > On Fri, Jul 10, 2020 at 12:54 AM Will Deacon <will@kernel.org> wrote:
> > > > On Thu, Jul 09, 2020 at 08:28:45PM -0700, John Stultz wrote:
> > > > > On Thu, Jul 2, 2020 at 7:18 AM Will Deacon <will@kernel.org> wrote:
> > > > > > On Thu, Jun 25, 2020 at 12:10:39AM +0000, John Stultz wrote:
> > > > > > > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > > > > > > index b510f67dfa49..714893535dd2 100644
> > > > > > > --- a/drivers/iommu/Kconfig
> > > > > > > +++ b/drivers/iommu/Kconfig
> > > > > > > @@ -381,6 +381,7 @@ config SPAPR_TCE_IOMMU
> > > > > > >  config ARM_SMMU
> > > > > > >       tristate "ARM Ltd. System MMU (SMMU) Support"
> > > > > > >       depends on (ARM64 || ARM || (COMPILE_TEST && !GENERIC_ATOMIC64)) && MMU
> > > > > > > +     depends on QCOM_SCM || !QCOM_SCM #if QCOM_SCM=m this can't be =y
> > > > > > >       select IOMMU_API
> > > > > > >       select IOMMU_IO_PGTABLE_LPAE
> > > > > > >       select ARM_DMA_USE_IOMMU if ARM
> > > > > >
> > > > > > This looks like a giant hack. Is there another way to handle this?
> > > > >
> > > > > Sorry for the slow response here.
> > > > >
> > > > > So, I agree the syntax looks strange (requiring a comment obviously
> > > > > isn't a good sign), but it's a fairly common way to ensure drivers
> > > > > don't get built in if they optionally depend on another driver that
> > > > > can be built as a module.
> > > > >   See "RFKILL || !RFKILL", "EXTCON || !EXTCON", or "USB_GADGET ||
> > > > > !USB_GADGET" in various Kconfig files.
> > > > >
> > > > > I'm open to using a different method, and in a different thread you
> > > > > suggested using something like symbol_get(). I need to look into it
> > > > > more, but that approach looks even more messy and prone to runtime
> > > > > failures. Blocking the unwanted case at build time seems a bit cleaner
> > > > > to me, even if the syntax is odd.
> > > >
> > > > Maybe just split it out then, so that the ARM_SMMU entry doesn't have this,
> > > > as that driver _really_ doesn't care about SoC details like this. In other
> > > > words, add a new entry along the lines of:
> > > >
> > > >         config ARM_SMMU_QCOM_IMPL
> > > >         default y
> > > >         #if QCOM_SCM=m this can't be =y
> > > >         depends on ARM_SMMU & (QCOM_SCM || !QCOM_SCM)
> > > >
> > > > and then have arm-smmu.h provide a static inline qcom_smmu_impl_init()
> > > > which returns -ENODEV if CONFIG_ARM_SMMU_QCOM_IMPL=n and hack the Makefile
> > > > so that we don't bother to compile arm-smmu-qcom.o in that case.
> > > >
> > > > Would that work?
> > >
> > > I think this proposal still has problems with the directionality of the call.
> > >
> > > The arm-smmu-impl.o calls to arm-smmu-qcom.o which calls qcom_scm.o
> > > So if qcom_scm.o is part of a module, the calling code in
> > > arm-smmu-qcom.o also needs to be a module, which means CONFIG_ARM_SMMU
> > > needs to be a module.
> > >
> > > I know you said the arm-smmu driver doesn't care about SoC details,
> > > but the trouble is that currently the arm-smmu driver does directly
> > > call the qcom-scm code. So it is a real dependency. However, if
> > > QCOM_SCM is not configured, it calls stubs and that's ok.  In that
> > > way, the "depends on QCOM_SCM || !QCOM_SCM" line actually makes sense.
> > > It looks terrible because we're used to boolean logic, but it's
> > > ternary.
> >
> > Yes, it looks ugly, but the part I really have issues with is that building
> > QCOM_SCM=m and ARM_SMMU=y is perfectly fine if you don't run on an SoC
> > with the qcom implementation. I don't see why we need to enforce things
> > here beyond making sure that all selectable permutations _build_ and
> > fail gracefully at runtime on the qcom SoC if SCM isn't available.
> 
> Ok. Thanks, that context/rationale makes sense to me now!  I'll dig in
> and see if I can figure out the runtime get_symbol handling you
> suggested for the scm callout.

Cheers, but in the interest of not being a massive pain in the bum, please
yell if it ends up being tonnes of work and I'll close my eyes while
applying your original patch.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
