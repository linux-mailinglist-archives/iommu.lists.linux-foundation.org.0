Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3C8363E33
	for <lists.iommu@lfdr.de>; Mon, 19 Apr 2021 11:03:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B346C8364B;
	Mon, 19 Apr 2021 09:03:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KRkpjuOHh5sc; Mon, 19 Apr 2021 09:03:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 057B38364F;
	Mon, 19 Apr 2021 09:03:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F023C001B;
	Mon, 19 Apr 2021 09:03:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98AAEC000B
 for <iommu@lists.linux-foundation.org>; Mon, 19 Apr 2021 09:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7005040306
 for <iommu@lists.linux-foundation.org>; Mon, 19 Apr 2021 09:03:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EsX03mpfyobg for <iommu@lists.linux-foundation.org>;
 Mon, 19 Apr 2021 09:03:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A379240348
 for <iommu@lists.linux-foundation.org>; Mon, 19 Apr 2021 09:03:37 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id t23so861422vso.11
 for <iommu@lists.linux-foundation.org>; Mon, 19 Apr 2021 02:03:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YToQwZXN38nw8LU8icFLB58IB4Z2bfPdJB1gmWWtNj8=;
 b=TNN04BKWm5Gd3GlAJd6riQAK1MnqdVs4gdKA3mbTOslYShISI7dq8UN2iReT/zshfK
 YZTmnzxd/7g/E5GgGl0sF8aqYKQne2Tfcy42MWWaS/cYXtVko6FVpjfrmOQ8PMFY8q5U
 004YhjUzZlr0h30sG5NYyE/jCh1ovAW+zGlTwAYshHIqt3pbNoGjQ7VV1cZ9ageIIbZK
 BtFiAruewJq4ggVvi5F7c37bMaVE/UGoYAspyYCTOEh4qdDRZv6CUDl7R4e/rwqfJjg5
 uYd7+iuoJLp+QYnRlCqks3BX7+0ZK7xsDJQUxGzlFCBI2IVk50E69l5Owhm45kFvtZh1
 AmyQ==
X-Gm-Message-State: AOAM532jZnu0LfNv/yWpet9ARo31wY/c5SHDZt7rvlQ/mt42rZrKUpYV
 ygyit5MYYo71gLy8aN4MWQ+oJZfqRcv32TcqXCQ=
X-Google-Smtp-Source: ABdhPJxHtnj/DXie9H0wxpzVZlSTyniokdUb/gsNNsMkANVtAtzr2mFBhczBYEoBurfSWsjRkBkPBhRAOOMrjVGBWsw=
X-Received: by 2002:a67:7c8c:: with SMTP id x134mr13821818vsc.40.1618823016409; 
 Mon, 19 Apr 2021 02:03:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210419042722.27554-1-alice.guo@oss.nxp.com>
 <20210419042722.27554-4-alice.guo@oss.nxp.com>
 <YH0O907dfGY9jQRZ@atmark-techno.com>
In-Reply-To: <YH0O907dfGY9jQRZ@atmark-techno.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Apr 2021 11:03:24 +0200
Message-ID: <CAMuHMdVY1SLZ0K30T2pimyrR6Mm=VoSTO=L-xxCy2Bj7_kostw@mail.gmail.com>
Subject: Re: [RFC v1 PATCH 3/3] driver: update all the code that use
 soc_device_match
To: Dominique MARTINET <dominique.martinet@atmark-techno.com>
Cc: ulf.hansson@linaro.org, aymen.sghaier@nxp.com, geert+renesas@glider.be,
 rafael@kernel.org, airlied@linux.ie, mturquette@baylibre.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 a.hajda@samsung.com, netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 peter.ujfalusi@gmail.com, linux-clk@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, wim@linux-watchdog.org,
 herbert@gondor.apana.org.au, horia.geanta@nxp.com, khilman@baylibre.com,
 narmstrong@baylibre.com, linux-staging@lists.linux.dev,
 iommu@lists.linux-foundation.org, kishon@ti.com, tony@atomide.com,
 linux-omap@vger.kernel.org, stern@rowland.harvard.edu, kuba@kernel.org,
 linus.walleij@linaro.org, linux@roeck-us.net, linux-media@vger.kernel.org,
 linux-watchdog@vger.kernel.org, will@kernel.org, linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, edubezval@gmail.com, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, ssantosh@kernel.org,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 "Alice Guo \(OSS\)" <alice.guo@oss.nxp.com>, balbi@kernel.org,
 tomba@kernel.org, sboyd@kernel.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-mmc@vger.kernel.org, adrian.hunter@intel.com,
 robert.foss@linaro.org, leoyang.li@nxp.com, linux@prisktech.co.nz,
 vkoul@kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-crypto@vger.kernel.org,
 daniel@ffwll.ch, j-keerthy@ti.com, dmaengine@vger.kernel.org,
 Roy.Pledge@nxp.com, jyri.sarha@iki.fi, davem@davemloft.net
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

Hi Dominique,

CC Arnd (soc_device_match() author)

On Mon, Apr 19, 2021 at 7:03 AM Dominique MARTINET
<dominique.martinet@atmark-techno.com> wrote:
> Alice Guo (OSS) wrote on Mon, Apr 19, 2021 at 12:27:22PM +0800:
> > From: Alice Guo <alice.guo@nxp.com>
> > Update all the code that use soc_device_match
>
> A single patch might be difficult to accept for all components, a each
> maintainer will probably want to have a say on their subsystem?
>
> I would suggest to split these for a non-RFC version; a this will really
> need to be case-by-case handling.
>
> > because add support for soc_device_match returning -EPROBE_DEFER.
>
> (English does not parse here for me)
>
> I've only commented a couple of places in the code itself, but this
> doesn't seem to add much support for errors, just sweep the problem
> under the rug.
>
> > Signed-off-by: Alice Guo <alice.guo@nxp.com>
> > ---
> >
> > diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
> > index 5fae60f8c135..00c59aa217c1 100644
> > --- a/drivers/bus/ti-sysc.c
> > +++ b/drivers/bus/ti-sysc.c
> > @@ -2909,7 +2909,7 @@ static int sysc_init_soc(struct sysc *ddata)
> >       }
> >
> >       match = soc_device_match(sysc_soc_feat_match);
> > -     if (!match)
> > +     if (!match || IS_ERR(match))
> >               return 0;
>
> This function handles errors, I would recommend returning the error as
> is if soc_device_match returned one so the probe can be retried later.

Depends...

> > --- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
> > +++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
> > @@ -439,6 +439,7 @@ static const unsigned int r8a7795es2_mod_nullify[] __initconst = {
> >
> >  static int __init r8a7795_cpg_mssr_init(struct device *dev)
> >  {
> > +     const struct soc_device_attribute *match;
> >       const struct rcar_gen3_cpg_pll_config *cpg_pll_config;
> >       u32 cpg_mode;
> >       int error;
> > @@ -453,7 +454,8 @@ static int __init r8a7795_cpg_mssr_init(struct device *dev)
> >               return -EINVAL;
> >       }
> >
> > -     if (soc_device_match(r8a7795es1)) {
> > +     match = soc_device_match(r8a7795es1);
> > +     if (!IS_ERR(match) && match) {
>
> Same, return the error.
> Assuming an error means no match will just lead to hard to debug
> problems because the driver potentially assumed the wrong device when
> it's just not ready yet.

When running on R-Car H3, there will always be a match device, as
the SoC device is registered early.

>
> >               cpg_core_nullify_range(r8a7795_core_clks,
> >                                      ARRAY_SIZE(r8a7795_core_clks),
> >                                      R8A7795_CLK_S0D2, R8A7795_CLK_S0D12);
> > [...]
> > diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> > index eaaec0a55cc6..13a06b613379 100644
> > --- a/drivers/iommu/ipmmu-vmsa.c
> > +++ b/drivers/iommu/ipmmu-vmsa.c
> > @@ -757,17 +757,20 @@ static const char * const devices_allowlist[] = {
> >
> >  static bool ipmmu_device_is_allowed(struct device *dev)
> >  {
> > +     const struct soc_device_attribute *match1, *match2;
> >       unsigned int i;
> >
> >       /*
> >        * R-Car Gen3 and RZ/G2 use the allow list to opt-in devices.
> >        * For Other SoCs, this returns true anyway.
> >        */
> > -     if (!soc_device_match(soc_needs_opt_in))
> > +     match1 = soc_device_match(soc_needs_opt_in);
> > +     if (!IS_ERR(match1) && !match1)
>
> I'm not sure what you intended to do, but !match1 already means there is
> no error so the original code is identical.
>
> In this case ipmmu_device_is_allowed does not allow errors so this is
> one of the "difficult" drivers that require slightly more thinking.
> It is only called in ipmmu_of_xlate which does return errors properly,
> so in this case the most straightforward approach would be to make
> ipmmu_device_is_allowed return an int and forward errors as well.
>
> ...
> This is going to need quite some more work to be acceptable, in my
> opinion, but I think it should be possible.

In general, this is very hard to do, IMHO. Some drivers may be used on
multiple platforms, some of them registering an SoC device, some of
them not registering an SoC device.  So there is no way to know the
difference between "SoC device not registered, intentionally", and
"SoC device not yet registered".

soc_device_match() should only be used as a last resort, to identify
systems that cannot be identified otherwise.  Typically this is used for
quirks, which should only be enabled on a very specific subset of
systems.  IMHO such systems should make sure soc_device_match()
is available early, by registering their SoC device early.

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
