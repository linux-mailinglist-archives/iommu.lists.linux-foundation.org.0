Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C832A0791
	for <lists.iommu@lfdr.de>; Fri, 30 Oct 2020 15:12:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 13A87874BE;
	Fri, 30 Oct 2020 14:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PbKSAqsx7YFk; Fri, 30 Oct 2020 14:12:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7E718874A3;
	Fri, 30 Oct 2020 14:12:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E7E8C0051;
	Fri, 30 Oct 2020 14:12:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8FDE6C0051
 for <iommu@lists.linux-foundation.org>; Fri, 30 Oct 2020 14:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 75FDB874B5
 for <iommu@lists.linux-foundation.org>; Fri, 30 Oct 2020 14:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oG8Ak88fC5dQ for <iommu@lists.linux-foundation.org>;
 Fri, 30 Oct 2020 14:12:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id 64371874A3
 for <iommu@lists.linux-foundation.org>; Fri, 30 Oct 2020 14:12:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D098139F;
 Fri, 30 Oct 2020 07:12:19 -0700 (PDT)
Received: from [10.57.54.223] (unknown [10.57.54.223])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C06B13F68F;
 Fri, 30 Oct 2020 07:12:16 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
To: John Stultz <john.stultz@linaro.org>
References: <20200625001039.56174-1-john.stultz@linaro.org>
 <20200625001039.56174-6-john.stultz@linaro.org>
 <20200702141825.GA16941@willie-the-truck>
 <CALAqxLVZ2EhutYjOt7Be1RgnYwHT6-4m6DxA-t1wuxuSy=6yDQ@mail.gmail.com>
 <20200710075411.GA30011@willie-the-truck>
 <CALAqxLWadLrxckRHRAR0Q417RnFKquQJbRfO_DLEVH56cykRow@mail.gmail.com>
 <20200713204133.GA3731@willie-the-truck>
 <CALAqxLUDVEq4ds2Wbic6uaK3=dELKKO4eGQxjHFFz19GeUFd_w@mail.gmail.com>
 <20201028135118.GA28554@willie-the-truck>
 <ae6ba27a-d3c8-8b98-c263-ec779ef35738@arm.com>
 <CALAqxLW13=cvTX3ghskb9uG_YoVh7kvp8UQGUB8mVDGYXHWpVQ@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <b5c5146d-4112-e0c2-d1dd-2ad0882190b3@arm.com>
Date: Fri, 30 Oct 2020 14:12:15 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CALAqxLW13=cvTX3ghskb9uG_YoVh7kvp8UQGUB8mVDGYXHWpVQ@mail.gmail.com>
Content-Language: en-GB
Cc: Maulik Shah <mkshah@codeaurora.org>, Jason Cooper <jason@lakedaemon.net>,
 Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, lkml <linux-kernel@vger.kernel.org>,
 Lina Iyer <ilina@codeaurora.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Andy Gross <agross@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2020-10-30 01:02, John Stultz wrote:
> On Wed, Oct 28, 2020 at 7:51 AM Robin Murphy <robin.murphy@arm.com> wrote:
>> Hmm, perhaps I'm missing something here, but even if the config options
>> *do* line up, what prevents arm-smmu probing before qcom-scm and
>> dereferencing NULL in qcom_scm_qsmmu500_wait_safe_toggle() before __scm
>> is initialised?
> 
> Oh man, this spun me on a "wait, but how does it all work!" trip. :)
> 
> So in the non-module case, the qcom_scm driver is a subsys_initcall
> and the arm-smmu is a module_platform_driver, so the ordering works
> out.
> 
> In the module case, the arm-smmu code isn't loaded until the qcom_scm
> driver finishes probing due to the symbol dependency handling.

My point is that module load != driver probe. AFAICS you could disable 
drivers_autoprobe, load both modules, bind the SMMU to its driver first, 
and boom!

> To double check this, I added a big msleep at the top of the
> qcom_scm_probe to try to open the race window you described, but the
> arm_smmu_device_probe() doesn't run until after qcom_scm_probe
> completes.

I don't think asynchronous probing is enabled by default, so indeed I 
would expect that to still happen to work ;)

> So at least as a built in / built in, or a module/module case its ok.
> And in the case where arm-smmu is a module and qcom_scm is built in
> that's ok too.

In the built-in case, I'm sure it happens to work out similarly because 
the order of nodes in the DTB tends to be the order in which devices are 
autoprobed. Again, async probe might be enough to break things; manually 
binding drivers definitely should; moving the firmware node to the end 
of the DTB probably would as well.

> Its just the case my patch is trying to prevent is where arm-smmu is
> built in, but qcom_scm is a module that it can't work (due to build
> errors in missing symbols,  or if we tried to use function pointers to
> plug in the qcom_scm - the lack of initialization ordering).
> 
> Hopefully that addresses your concern? Let me know if I'm still
> missing something.

What I was dancing around is that the SCM API (and/or its users) appears 
to need a general way to tell whether SCM is ready or not, because the 
initialisation ordering problem is there anyway. Neither Kconfig nor the 
module loader can solve that.

One possible self-contained workaround would be to see if an SCM DT node 
exists, see if a corresponding device exists, and see if that device has 
a driver bound. It's a little ugly, and strictly it still doesn't tell 
you that the _right_ driver is bound, but at least it's a lot more 
robust than implicitly relying on DT order, default probing behaviours, 
and hope.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
