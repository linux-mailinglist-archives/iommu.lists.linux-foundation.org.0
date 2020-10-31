Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B93322A1247
	for <lists.iommu@lfdr.de>; Sat, 31 Oct 2020 02:04:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 510C68773F;
	Sat, 31 Oct 2020 01:04:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IL5fd-BLdh4G; Sat, 31 Oct 2020 01:04:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A6F1087731;
	Sat, 31 Oct 2020 01:04:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9281FC0051;
	Sat, 31 Oct 2020 01:04:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B755C0051
 for <iommu@lists.linux-foundation.org>; Sat, 31 Oct 2020 01:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 504E287732
 for <iommu@lists.linux-foundation.org>; Sat, 31 Oct 2020 01:04:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EfOwb213P5Gc for <iommu@lists.linux-foundation.org>;
 Sat, 31 Oct 2020 01:04:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 53EDB87731
 for <iommu@lists.linux-foundation.org>; Sat, 31 Oct 2020 01:04:43 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id f97so7244669otb.7
 for <iommu@lists.linux-foundation.org>; Fri, 30 Oct 2020 18:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jmkNEXF5cOAT44oNaa0CAo3EqS9dZFXr7FPYKKXyzfA=;
 b=vkv+Mg8Nts49zK21uhvvUUe5HteZqk+9SKh6/SBdxMAor/b0L82+k4Y9K+OUag78Wv
 Jwd17Mdpa5WLYk4wh0/aopakx193gqDo+w4ydvNcXNKYsyGYp7BM8O4M1B9z4c2CGzWG
 VJBdfedgdDtyB/TImJNMC13mpL5PkjU1wyUJjFWkmpqpiPaDPQqqFOYvrCiuJOKE8HFO
 xB/KsHdv8+71SRb1uWE6yyuPcUkEZsp2pDrfsUlvzk46cgY8i4Y2yQ4GPekvuoMtZjnC
 LiRWGuARhTqeOkeJy1gj7EU8+btrs+MC4WThY59ACMLglIDfdvkZpIvX4aGAKHNPs6Qs
 3u3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jmkNEXF5cOAT44oNaa0CAo3EqS9dZFXr7FPYKKXyzfA=;
 b=i/6dxuC2pZWBYRSDyMQSf56LIw6NOTiV6MLAYKllekyKA9UZELvypZ0fXvEUpotpLC
 4DMcC7LofcmDPQvZNlQ6wraPXFiodTTvuc8oYDy5jqDHU1oijCj9c/yL1mYwk6Dkd73a
 rKsfuRTyNFU53/hOuMD+CBBGm6MtN8lTwkz1fyBRLWgypfUT+fywmUpYtRXLEQEnaeP2
 uCgtOUvVERcjx1g6Qg7JjGyJ0ENCTgBnVtaz1tVF9END5Utf8HG8o/xBPKOvWQu4Y5yz
 8FgfdZMUPWE1Ifz0PlfaiCXSkeD1Be/b+88ix7n4ef+Kdrsa5Gqp5KhI05bA0n9wG8Cu
 53cQ==
X-Gm-Message-State: AOAM53373gTUr/9rLwE/G0w/VkL7PLnef3YkOP2WCjTQeD183nzBBbwt
 a4uBuyFeox50OjXI45WCboWOOwi/+hSc+fhJXNf03j2oP51IPA==
X-Google-Smtp-Source: ABdhPJyg1P2jxuPJ3INlKNqxkesvEgxWdFy6INsw9yDE1UyPF53CbdnrlycVF/620SDHWA8iQrGcl+qCxF8X7thlHv4=
X-Received: by 2002:a4a:5182:: with SMTP id s124mr3812313ooa.88.1604103173648; 
 Fri, 30 Oct 2020 17:12:53 -0700 (PDT)
MIME-Version: 1.0
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
 <b5c5146d-4112-e0c2-d1dd-2ad0882190b3@arm.com>
In-Reply-To: <b5c5146d-4112-e0c2-d1dd-2ad0882190b3@arm.com>
From: John Stultz <john.stultz@linaro.org>
Date: Fri, 30 Oct 2020 17:12:41 -0700
Message-ID: <CALAqxLW=11O=bRQbVr_Bg6t97BhfxAqLC1OmXRATNjKkbxVUTA@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] firmware: QCOM_SCM: Allow qcom_scm driver to be
 loadable as a permenent module
To: Robin Murphy <robin.murphy@arm.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Fri, Oct 30, 2020 at 7:12 AM Robin Murphy <robin.murphy@arm.com> wrote:
> On 2020-10-30 01:02, John Stultz wrote:
> > On Wed, Oct 28, 2020 at 7:51 AM Robin Murphy <robin.murphy@arm.com> wrote:
> >> Hmm, perhaps I'm missing something here, but even if the config options
> >> *do* line up, what prevents arm-smmu probing before qcom-scm and
> >> dereferencing NULL in qcom_scm_qsmmu500_wait_safe_toggle() before __scm
> >> is initialised?
> >
> > Oh man, this spun me on a "wait, but how does it all work!" trip. :)
> >
> > So in the non-module case, the qcom_scm driver is a subsys_initcall
> > and the arm-smmu is a module_platform_driver, so the ordering works
> > out.
> >
> > In the module case, the arm-smmu code isn't loaded until the qcom_scm
> > driver finishes probing due to the symbol dependency handling.
>
> My point is that module load != driver probe. AFAICS you could disable
> drivers_autoprobe, load both modules, bind the SMMU to its driver first,
> and boom!
>
> > To double check this, I added a big msleep at the top of the
> > qcom_scm_probe to try to open the race window you described, but the
> > arm_smmu_device_probe() doesn't run until after qcom_scm_probe
> > completes.
>
> I don't think asynchronous probing is enabled by default, so indeed I
> would expect that to still happen to work ;)
>
> > So at least as a built in / built in, or a module/module case its ok.
> > And in the case where arm-smmu is a module and qcom_scm is built in
> > that's ok too.
>
> In the built-in case, I'm sure it happens to work out similarly because
> the order of nodes in the DTB tends to be the order in which devices are
> autoprobed. Again, async probe might be enough to break things; manually
> binding drivers definitely should; moving the firmware node to the end
> of the DTB probably would as well.

So, with modules, I turned on async probing for the two drivers, as
well as moved the firmware node to the end of the dtb, and couldn't
manage to trip it up even with a 6 second delay in the qcom_scm probe
function.

It was only when doing the same with everything built in that I did
manage to trigger the issue. So yes, you're right!  And it is an issue
more easily tripped with everything built in statically (and not
really connected to this patch series).

> > Its just the case my patch is trying to prevent is where arm-smmu is
> > built in, but qcom_scm is a module that it can't work (due to build
> > errors in missing symbols,  or if we tried to use function pointers to
> > plug in the qcom_scm - the lack of initialization ordering).
> >
> > Hopefully that addresses your concern? Let me know if I'm still
> > missing something.
>
> What I was dancing around is that the SCM API (and/or its users) appears
> to need a general way to tell whether SCM is ready or not, because the
> initialisation ordering problem is there anyway. Neither Kconfig nor the
> module loader can solve that.

Hrm... There is qcom_scm_is_available().  I tried adding a check for
that in qcom_smmu_impl_init() and return EPROBE_DEFER if it fails, but
I then hit a separate crash (tripping in iommu_group_remove_device on
a null dev->iommu_group value). But after adding a check for that, it
seems to be working...

I'll try to spin up a separate patch here for that in a second.

thanks
-john
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
