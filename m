Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEAB21C840
	for <lists.iommu@lfdr.de>; Sun, 12 Jul 2020 11:27:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6541F86C94;
	Sun, 12 Jul 2020 09:27:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KFPT3L5b-UJK; Sun, 12 Jul 2020 09:27:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D884986BA4;
	Sun, 12 Jul 2020 09:27:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C4B19C0733;
	Sun, 12 Jul 2020 09:27:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14658C0733
 for <iommu@lists.linux-foundation.org>; Sun, 12 Jul 2020 09:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 017AA86C43
 for <iommu@lists.linux-foundation.org>; Sun, 12 Jul 2020 09:27:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xzNm6xEqTUXj for <iommu@lists.linux-foundation.org>;
 Sun, 12 Jul 2020 09:27:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D2BBB86BA4
 for <iommu@lists.linux-foundation.org>; Sun, 12 Jul 2020 09:27:23 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7996820720;
 Sun, 12 Jul 2020 09:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594546043;
 bh=NQq5tQ5Tv0Dy7nOdr7LyJUeJ2lgk7kTvmCLrlv5YKvU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FnfqlTIPhPUHeKn4C1xmFFqoiFgmT/grB5qd0iMAkgEhLzQI9urPVYpWXMq9YJ+hY
 IsCLJfe/GTbPVCbQFl/zawg1qBZtCR8MabVM/z+jEyQ/Q2gmD1TruIbd9u+9Wf+G/X
 VR30NAj/p7Jcqqkh9ovjdwfX4x6Vfk/gTJarQn0M=
Received: from host109-149-250-171.range109-149.btcentralplus.com
 ([109.149.250.171] helo=wait-a-minute.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1juYGX-00B6VP-Mg; Sun, 12 Jul 2020 10:27:21 +0100
Date: Sun, 12 Jul 2020 10:27:20 +0100
Message-ID: <87r1thxevb.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v2 3/5] irqchip: Allow QCOM_PDC to be loadable as a
 permanent module
In-Reply-To: <159442366514.1987609.434612639050774557@swboyd.mtv.corp.google.com>
References: <20200625001039.56174-1-john.stultz@linaro.org>
 <20200625001039.56174-4-john.stultz@linaro.org>
 <159315737502.62212.16093934831673347066@swboyd.mtv.corp.google.com>
 <CALAqxLVNGar8g+FvHaVHN_e-MOZZ+=ZPmDt_GKKSC8AS-wLFGg@mail.gmail.com>
 <87wo3setn8.wl-maz@kernel.org>
 <159436097057.1987609.13993891118929459851@swboyd.mtv.corp.google.com>
 <CALAqxLW14f4Gn6Q3b89X10y7=Zct2NJSgjagUqxez_bObcp42w@mail.gmail.com>
 <159442366514.1987609.434612639050774557@swboyd.mtv.corp.google.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL/10.8 EasyPG/1.0.0 Emacs/26.3
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
X-SA-Exim-Connect-IP: 109.149.250.171
X-SA-Exim-Rcpt-To: swboyd@chromium.org, john.stultz@linaro.org,
 linux-kernel@vger.kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
 joro@8bytes.org, tglx@linutronix.de, jason@lakedaemon.net,
 linus.walleij@linaro.org, mkshah@codeaurora.org, ilina@codeaurora.org,
 saravanak@google.com, tkjos@google.com, gregkh@linuxfoundation.org,
 linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-gpio@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Cc: Maulik Shah <mkshah@codeaurora.org>, Jason Cooper <jason@lakedaemon.net>,
 Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 lkml <linux-kernel@vger.kernel.org>, Lina Iyer <ilina@codeaurora.org>,
 linux-gpio@vger.kernel.org, iommu@lists.linux-foundation.org,
 Andy Gross <agross@kernel.org>, John Stultz <john.stultz@linaro.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
 Todd Kjos <tkjos@google.com>
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

On Sat, 11 Jul 2020 00:27:45 +0100,
Stephen Boyd <swboyd@chromium.org> wrote:
> 
> Quoting John Stultz (2020-07-10 15:44:18)
> > On Thu, Jul 9, 2020 at 11:02 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > > Does it work? I haven't looked in detail but I worry that the child
> > > irqdomain (i.e. pinctrl-msm) would need to delay probing until this
> > > parent irqdomain is registered. Or has the hierarchical irqdomain code
> > > been updated to handle the parent child relationship and wait for things
> > > to probe or be loaded?
> > 
> > So I can't say I know the underlying hardware particularly well, but
> > I've been using this successfully on the Dragonboard 845c with both
> > static builds as well as module enabled builds.
> > And the same patch has been in the android-mainline and android-5.4
> > kernels for a while without objections from QCOM.
> > 
> > As to the probe ordering question, Saravana can maybe speak in more
> > detail if it's involved in this case but the fw_devlink code has
> > addressed many of these sorts of ordering issues.
> > However, I'm not sure if I'm lucking into the right probe order, as we
> > have been able to boot android-mainline w/ both fw_devlink=on and
> > fw_devlink=off (though in the =off case, we need
> > deferred_probe_timeout=30 to give us a bit more time for modules to
> > load after init starts).
> > 
> 
> Ok I looked at the code (sorry for not checking earlier) and I see this in
> msm_gpio_init()
> 
>         np = of_parse_phandle(pctrl->dev->of_node, "wakeup-parent", 0);
>         if (np) {
>                 chip->irq.parent_domain = irq_find_matching_host(np,
>                                                  DOMAIN_BUS_WAKEUP);
>                 of_node_put(np);
>                 if (!chip->irq.parent_domain)
>                         return -EPROBE_DEFER;
> 
> so it looks like we'll probe defer the pinctrl driver until the pdc module
> loads. Meaning it should work to have pinctrl builtin and pdc as a module.

What I hope is that eventually fw_devlink will become the norm (on by
default), and that probe deferral will become a thing of the past.

	M.

-- 
Without deviation from the norm, progress is not possible.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
