Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F33542D90
	for <lists.iommu@lfdr.de>; Wed,  8 Jun 2022 12:26:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 272EA424E6;
	Wed,  8 Jun 2022 10:26:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tLTwEa78IFlC; Wed,  8 Jun 2022 10:26:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1A727424E1;
	Wed,  8 Jun 2022 10:26:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2565C0081;
	Wed,  8 Jun 2022 10:26:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A315BC002D
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jun 2022 10:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84054424E1
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jun 2022 10:26:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e1s6Vf4miVrR for <iommu@lists.linux-foundation.org>;
 Wed,  8 Jun 2022 10:26:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 69F02424B5
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jun 2022 10:26:11 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id x18so11683746qtj.3
 for <iommu@lists.linux-foundation.org>; Wed, 08 Jun 2022 03:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cEas+zwEgAdjhfUZrQf9/8dG3N0NptTs40YY+lUfgeE=;
 b=5ny+ulIHRZXBaVASPaguldge9mW7HT6FKan0wxKrd0ohku51gV9k19O/XFLW75RinV
 GrTmw+3ZuKiiCeBTCTPvKjkOARxjxNBsnuzhmduK13g2gBaZFhyY5TpqzTizYz2anX4m
 DtbfmhGPIoH96f7v0LozdFmWAoxKlr+SbHGNli447uwPLsLf8CbYxy/S7EOwbVOeR8+M
 M0BASFwvnArF2dLbUcMbxRbCGpYfRnvP4vdq0DVelShJAd0aAAHAK1m66s/aLcfbRj54
 yRzSjwh6eS4ClCVylEKGd3Qk6JjiE0p7XFNF58wdAaafo/eE83bfUvEg9eiQ8sxBAIiM
 XSHA==
X-Gm-Message-State: AOAM532SXoYe+pPjTbDfYGfp2XgaMo1qxTD9xBuQvEt7TRlSxVzEwWcU
 awQdtvdN/erbwDSUfu4Sv/9chkuTj8pF/A==
X-Google-Smtp-Source: ABdhPJwfs5Y3qYQnJbg4TMd9kicULjJc3yDy6HEuVwS5eU0GcoLNXKs/YGpv2Ju3253puPwS1Di9iw==
X-Received: by 2002:a05:622a:355:b0:305:2f9:9ce8 with SMTP id
 r21-20020a05622a035500b0030502f99ce8mr961820qtw.297.1654683970004; 
 Wed, 08 Jun 2022 03:26:10 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 c3-20020a05620a268300b006a6be577535sm7177281qkp.85.2022.06.08.03.26.08
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 03:26:08 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-30c143c41e5so204025317b3.3
 for <iommu@lists.linux-foundation.org>; Wed, 08 Jun 2022 03:26:08 -0700 (PDT)
X-Received: by 2002:a81:9b0c:0:b0:2f4:c522:7d3c with SMTP id
 s12-20020a819b0c000000b002f4c5227d3cmr36567427ywg.316.1654683968219; Wed, 08
 Jun 2022 03:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220601070707.3946847-1-saravanak@google.com>
 <CAMuHMdXkX-SXtBuTRGJOUnpw9goSP6RFr_PTt_3w_yWgBpWsqg@mail.gmail.com>
 <CAGETcx9f0UBhpp6dM+KJwtYpLx19wwsq6_ygi3En7FrXobOSpA@mail.gmail.com>
 <CAGETcx8VM+xOCe7HEx9FUU-1B9nrX8Q=tE=NjTyb9uX2_8RXLQ@mail.gmail.com>
In-Reply-To: <CAGETcx8VM+xOCe7HEx9FUU-1B9nrX8Q=tE=NjTyb9uX2_8RXLQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jun 2022 12:25:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXzu8Vp=a7fyjOB=xt04aee=vWXV=TcRZeeKUGYFFZ1CA@mail.gmail.com>
Message-ID: <CAMuHMdXzu8Vp=a7fyjOB=xt04aee=vWXV=TcRZeeKUGYFFZ1CA@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] deferred_probe_timeout logic clean up
To: Saravana Kannan <saravanak@google.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Eric Dumazet <edumazet@google.com>,
 Pavel Machek <pavel@ucw.cz>, Will Deacon <will@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kevin Hilman <khilman@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Android Kernel Team <kernel-team@android.com>, Len Brown <len.brown@intel.com>,
 Linux PM list <linux-pm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Ahern <dsahern@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 netdev <netdev@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
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

Hi Saravana,

On Wed, Jun 8, 2022 at 6:17 AM Saravana Kannan <saravanak@google.com> wrote:
> On Tue, Jun 7, 2022 at 5:55 PM Saravana Kannan <saravanak@google.com> wrote:
> > On Tue, Jun 7, 2022 at 11:13 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Wed, Jun 1, 2022 at 12:46 PM Saravana Kannan <saravanak@google.com> wrote:
> > > > This series is based on linux-next + these 2 small patches applies on top:
> > > > https://lore.kernel.org/lkml/20220526034609.480766-1-saravanak@google.com/
> > > >
> > > > A lot of the deferred_probe_timeout logic is redundant with
> > > > fw_devlink=on.  Also, enabling deferred_probe_timeout by default breaks
> > > > a few cases.
> > > >
> > > > This series tries to delete the redundant logic, simplify the frameworks
> > > > that use driver_deferred_probe_check_state(), enable
> > > > deferred_probe_timeout=10 by default, and fixes the nfsroot failure
> > > > case.
> > > >
> > > > The overall idea of this series is to replace the global behavior of
> > > > driver_deferred_probe_check_state() where all devices give up waiting on
> > > > supplier at the same time with a more granular behavior:
> > > >
> > > > 1. Devices with all their suppliers successfully probed by late_initcall
> > > >    probe as usual and avoid unnecessary deferred probe attempts.
> > > >
> > > > 2. At or after late_initcall, in cases where boot would break because of
> > > >    fw_devlink=on being strict about the ordering, we
> > > >
> > > >    a. Temporarily relax the enforcement to probe any unprobed devices
> > > >       that can probe successfully in the current state of the system.
> > > >       For example, when we boot with a NFS rootfs and no network device
> > > >       has probed.
> > > >    b. Go back to enforcing the ordering for any devices that haven't
> > > >       probed.
> > > >
> > > > 3. After deferred probe timeout expires, we permanently give up waiting
> > > >    on supplier devices without drivers. At this point, whatever devices
> > > >    can probe without some of their optional suppliers end up probing.
> > > >
> > > > In the case where module support is disabled, it's fairly
> > > > straightforward and all device probes are completed before the initcalls
> > > > are done.
> > > >
> > > > Patches 1 to 3 are fairly straightforward and can probably be applied
> > > > right away.
> > > >
> > > > Patches 4 to 6 are for fixing the NFS rootfs issue and setting the
> > > > default deferred_probe_timeout back to 10 seconds when modules are
> > > > enabled.
> > > >
> > > > Patches 7 to 9 are further clean up of the deferred_probe_timeout logic
> > > > so that no framework has to know/care about deferred_probe_timeout.
> > > >
> > > > Yoshihiro/Geert,
> > > >
> > > > If you can test this patch series and confirm that the NFS root case
> > > > works, I'd really appreciate that.
> > >
> > > Thanks, I gave this a try on various boards I have access to.
> > > The results were quite positive. E.g. the compile error I saw on v1
> > > (implicit declation of fw_devlink_unblock_may_probe(), which is no longer
> > >  used in v2) is gone.
> >
> > Thanks a lot for testing these.
> >
> > > However, I'm seeing a weird error when userspace (Debian9 nfsroot) is
> > > starting:
> > >
> > >     [  OK  ] Started D-Bus System Message Bus.
> > >     Unable to handle kernel NULL pointer dereference at virtual
> > > address 0000000000000000
> > >     Unable to handle kernel NULL pointer dereference at virtual
> > > address 0000000000000000
> > >     Mem abort info:
> > >       ESR = 0x0000000096000004
> > >     Mem abort info:
> > >       ESR = 0x0000000096000004
> > >       EC = 0x25: DABT (current EL), IL = 32 bits
> > >       SET = 0, FnV = 0
> > >       EC = 0x25: DABT (current EL), IL = 32 bits
> > >       EA = 0, S1PTW = 0
> > >       FSC = 0x04: level 0 translation fault
> > >       SET = 0, FnV = 0
> > >     Data abort info:
> > >       ISV = 0, ISS = 0x00000004
> > >       EA = 0, S1PTW = 0
> > >       FSC = 0x04: level 0 translation fault
> > >       CM = 0, WnR = 0
> > >     user pgtable: 4k pages, 48-bit VAs, pgdp=000000004ec45000
> > >     [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
> > >     Data abort info:
> > >     Internal error: Oops: 96000004 [#1] PREEMPT SMP
> > >     CPU: 0 PID: 374 Comm: v4l_id Tainted: G        W
> > > 5.19.0-rc1-arm64-renesas-00799-gc13c3e49e8bd #1660
> > >       ISV = 0, ISS = 0x00000004
> > >     Hardware name: Renesas Ebisu-4D board based on r8a77990 (DT)
> > >     pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > >       CM = 0, WnR = 0
> > >     pc : subdev_open+0x8c/0x128
> > >     lr : subdev_open+0x78/0x128
> > >     sp : ffff80000aadba60
> > >     x29: ffff80000aadba60 x28: 0000000000000000 x27: ffff80000aadbc58
> > >     x26: 0000000000020000 x25: ffff00000b3aaf00 x24: 0000000000000000
> > >     x23: ffff00000c331c00 x22: ffff000009aa61b8 x21: ffff000009aa6000
> > >     x20: ffff000008bae3e8 x19: ffff00000c3fe200 x18: 0000000000000000
> > >     x17: ffff800076945000 x16: ffff800008004000 x15: 00008cc6bf550c7c
> > >     x14: 000000000000038f x13: 000000000000001a x12: ffff00007fba8618
> > >     x11: 0000000000000001 x10: 0000000000000000 x9 : ffff800009253954
> > >     x8 : ffff00000b3aaf00 x7 : 0000000000000004 x6 : 000000000000001a
> > >     x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000001
> > >     x2 : 0000000100000001 x1 : 0000000000000000 x0 : 0000000000000000
> > >     Call trace:
> > >      subdev_open+0x8c/0x128
>
> After disassembling the code on my end (with slightly different
> config) and looking at 0x8c from the start of the function, I'm pretty
> sure the NULL deref is happening here inside subdev_open()
>
>         if (sd->v4l2_dev->mdev && sd->entity.graph_obj.mdev->dev) {
>
> sd->entity.graph_obj.mdev == NULL.
>
> And going by the field names, I'm guessing these are suppliers pointed
> to by "remote-endpoint". Sadly fw_devlink can't extract any dependency
> info from remote-endpoint because the devices generally point to each
> other so a cycle is detected and the probe ordering isn't enforced
> between the endpoints. We still need to parse remote-endpoint to
> detect cycles created by a combination of endpoints/other properties
> (there's a real world case in upstream).
>
> > >      v4l2_open+0xa4/0x120
> > >      chrdev_open+0x78/0x178
> > >      do_dentry_open+0xfc/0x398
> > >      vfs_open+0x28/0x30
> > >      path_openat+0x584/0x9c8
> > >      do_filp_open+0x80/0x108
> > >      do_sys_openat2+0x20c/0x2d8
> > >     user pgtable: 4k pages, 48-bit VAs, pgdp=000000004ec53000
> > >      do_sys_open+0x54/0xa0
> > >      __arm64_sys_openat+0x20/0x28
> > >      invoke_syscall+0x40/0xf8
> > >      el0_svc_common.constprop.0+0xf0/0x110
> > >      do_el0_svc+0x20/0x78
> > >      el0_svc+0x48/0xd0
> > >      el0t_64_sync_handler+0xb0/0xb8
> > >      el0t_64_sync+0x148/0x14c
> > >     Code: f9405280 f9400400 b40000e0 f9400280 (f9400000)
> > >     ---[ end trace 0000000000000000 ]---
> > >
> > > This only happens on the Ebisu-4D board (r8a77990-ebisu.dts).
> > > I do not see this on the Salvator-X(S) boards.
> >
> > Ok. I don't know much about either of these boards. Are they supposed
> > to be very similar?
> >
> > > Bisection shows this starts to happen with "[PATCH v2 7/9] driver core:
> > > Set fw_devlink.strict=1 by default".
> >
> > So in the series, by this point, the previous patches would have
> > deferred probe timeout set to 10s (it can get extended on new driver
> > additions of course) and once the timer expires suppliers without
> > drivers will no longer block any consumers. The only difference
> > fw_devlink.strict=1 should cause is iommus and dmas dependency being
> > treated as mandatory till the timeout expires.
> >
> > In this instance, do you have iommu drivers and dma drivers compiled
> > in or loaded as modules or not available at all? In all these case,
> > the list of devices that would end up probing eventually should be the
> > same with or without fw_devlink.strict=1. The only difference would be
> > some reordering of probes.
> >
> > So this looks to me like improper error handling/assumption in the
> > driver for this subdev device. I'm guessing one of the suppliers to
> > this subdev has a direct/indirect dependency on iommus and this subdev
> > driver is assuming that the supplier would have probed by the time
> > it's probed.
> >
> > >
> > > Adding more debug info:
> > >
> > >     subdev_open:54: file v4l-subdev1
> > >     Unable to handle kernel NULL pointer dereference at virtual
> > > address 0000000000000000
> > >     subdev_open:54: file v4l-subdev2
> > >     Unable to handle kernel NULL pointer dereference at virtual
> > > address 0000000000000000
>
> How did you get these two "subdev_open" strings? And how/why the NULL
> deref there?

I added a debug print at the top of subdev_open():

    pr_info("%s:%u: file %pD\n", __func__, __LINE__, file);

The NULL deref is the actual issue.

> > > Matching the subdev using sysfs gives:
> > >
> > >     /sys/devices/platform/soc/e6500000.i2c/i2c-0/0-0070/video4linux/v4l-subdev1
> > >     /sys/devices/platform/soc/e6500000.i2c/i2c-0/0-0070/video4linux/v4l-subdev2
> > >
> > > The i2c device is the adi,adv7482 at address 0x70.
> >
> > I'm guessing the fix would be somewhere in this driver, but I haven't
> > dug into it. Any guesses on which of its suppliers might have a
> > direct/indirect dependency on an iommu/dma? You could also enable the
> > debug log in fw_devlink_relax_link() and see if it relaxes any link
> > where the supplier is an iommu/dma device. That might give us some
> > hints.
>
> After spending way too much time on this looking at
> drivers/media/v4l2-core, drivers/media/mc and
> drivers/media/i2c/adv748x/ code, I'm guessing the ordering issue is
> probably between "csi40:" device and the video-receiver@70 (the
> "adi,adv7482") device.
>
> Based on your points about the sysfs, I was initially digging into
> drivers/media/i2c/adv748x/adv748x-core.c. But then the parent of
> video-receiver@70 is an i2c0 that has dmas dependencies. The csi40:
> (referred to from video-controller) doesn't seem to have any iommu or
> dmas dependency. So my guess is the csi40 gets probed first and then
> assumes the video-controller is already available.
>
> Can you use this info to take a stab at debugging this further?

Thanks for looking into this, there is indeed a cyclic dependency:

    i2c 0-0070: Fixing up cyclic dependency with feaa0000.csi2
    i2c 0-0070: Fixing up cyclic dependency with hdmi-in
    i2c 0-0070: Fixing up cyclic dependency with cvbs-in

> TL;DR is that I think this is some driver issue where it's not
> checking for one of its suppliers to be ready yet.

Setting fw_devlink_strict to true vs. false seems to influence which of
two different failures will happen:
  - rcar-csi2: probe of feaa0000.csi2 failed with error -22
  - rcar-vin: probe of e6ef5000.video failed with error -22
The former causes the NULL pointer dereference later.
The latter existed before, but I hadn't noticed it, and bisection
led to the real culprit (commit 3e52419ec04f9769 ("media: rcar-{csi2,vin}:
Move to full Virtual Channel routing per CSI-2 IP").

I am bringing it up with the multi-media guys in
https://lore.kernel.org/all/20220124124858.571363-4-niklas.soderlund+renesas@ragnatech.se...

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
