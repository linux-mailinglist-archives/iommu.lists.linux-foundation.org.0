Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E0065555571
	for <lists.iommu@lfdr.de>; Wed, 22 Jun 2022 22:36:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C862400D8;
	Wed, 22 Jun 2022 20:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C862400D8
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=AIh/u0M6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EWNH-Sr6c9rf; Wed, 22 Jun 2022 20:36:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 66898400DA;
	Wed, 22 Jun 2022 20:36:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66898400DA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18EEEC0081;
	Wed, 22 Jun 2022 20:36:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6573C002D
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jun 2022 20:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2282400DA
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jun 2022 20:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2282400DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VGow59Bihl2C for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jun 2022 20:36:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09BEC400D8
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 09BEC400D8
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jun 2022 20:36:03 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-317741c86fdso172943437b3.2
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jun 2022 13:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k0Q20J3OyFK4BXoHp26oZBRHT0NT/TPRkGHoG9EjHBM=;
 b=AIh/u0M6R759JTz79TyCN93gK6bgpHDzPVQZ1c1GJ5mwFOuIeCYHJ4edi50jml847F
 YlyEIG6KHqq8aPkZTHE9o8riSh+o+aPdQkAJtuBIbSQJ1Qvz8SxbjAaqCBGJVWgX2P/S
 /lWL8gVqkrxuDaPOll9RogYmQJePhkDfIDDmdpqwgFqUaxnpkJlZlOJqH2LK8OYh0EHS
 NkvT2u3I65Z8qEvtK4yyQHIJoLFYRlLWUJzUrck6e096qTWwpgSy4j4OJNJBxKuqt4cm
 +0dfDWU9Ra9WoP4nC6yrNay035tCUQh6UFCC2SBvyjlcMQdeY4uW7Ka6L/TCcUlvjRXY
 RbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k0Q20J3OyFK4BXoHp26oZBRHT0NT/TPRkGHoG9EjHBM=;
 b=Zvi4I8Q9N+/mhJia9mFEn4SRNGN3WhVddEtcG6Bb77hotpjp09Vn2WN9epkkqeVLZn
 P6g2KgqqM0mhY1bUiAETPDHupQRF/n+/PkzFdHJg9Zn0TlLDS0Kn8Zl8Qcaih1HvIr9o
 YYJrseUCAWHpLyEBT99EpxDbsthrbGu8KYAJTWnYFgYI0IkrSnvLSIvEb1VuC2Il5DHk
 9UedCxE+POtZ0MQGbNXuNuvHzZp+bXWBnHcYz1xWD7FXo+b7Jiq2SkAtidlbb/gZUAaS
 7PCxbCx5Toph9nxjJODyTMw2nE5w3FzU6yL7IPIwmQmSxFEIuBS4LCaUR5zV1jRdW3QT
 1DFQ==
X-Gm-Message-State: AJIora8yg3+c/tf0REZxrEQaGUkKoD/doCxCgm4y7ONycli7mXCNW29D
 paqeXw93wOxSiOztKW1uGgSrwyM2BXOQVJMAWZDMQg==
X-Google-Smtp-Source: AGRyM1tZz2wdFHKMCQcrlrsexZuCcN2icaf5UPnPLdD9I4E6Eu6Q2ruY0h+nLZ4RTx4/aeKVzxa/AbO9gvemQvBe43c=
X-Received: by 2002:a81:a095:0:b0:317:d4ce:38b6 with SMTP id
 x143-20020a81a095000000b00317d4ce38b6mr6426893ywg.83.1655930162762; Wed, 22
 Jun 2022 13:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220601070707.3946847-1-saravanak@google.com>
 <20220601070707.3946847-8-saravanak@google.com>
 <20220622074756.GA1647@pengutronix.de>
 <CACRpkdYe=u9Ozj_dtLVr6GSau8yS5H7LnBNNrQHki1CJ1zST0A@mail.gmail.com>
 <CAGETcx_qm7DWbNVTLfF9jTgGA8uH8oAQzbPcMDh4L6+5mdRFog@mail.gmail.com>
In-Reply-To: <CAGETcx_qm7DWbNVTLfF9jTgGA8uH8oAQzbPcMDh4L6+5mdRFog@mail.gmail.com>
Date: Wed, 22 Jun 2022 13:35:26 -0700
Message-ID: <CAGETcx8i9R51T-mGuV9_LUz-GXDCncpRWQ1Rj_7i2JrvCttq3w@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] driver core: Set fw_devlink.strict=1 by default
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Pavel Machek <pavel@ucw.cz>, Will Deacon <will@kernel.org>,
 Sascha Hauer <sha@pengutronix.de>, Kevin Hilman <khilman@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, kernel-team@android.com,
 Len Brown <len.brown@intel.com>, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 David Ahern <dsahern@kernel.org>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, kernel@pengutronix.de,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
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
From: Saravana Kannan via iommu <iommu@lists.linux-foundation.org>
Reply-To: Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Wed, Jun 22, 2022 at 12:40 PM Saravana Kannan <saravanak@google.com> wrote:
>
> On Wed, Jun 22, 2022 at 1:44 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Wed, Jun 22, 2022 at 9:48 AM Sascha Hauer <sha@pengutronix.de> wrote:
> >
> > > This patch has the effect that console UART devices which have "dmas"
> > > properties specified in the device tree get deferred for 10 to 20
> > > seconds. This happens on i.MX and likely on other SoCs as well. On i.MX
> > > the dma channel is only requested at UART startup time and not at probe
> > > time. dma is not used for the console. Nevertheless with this driver probe
> > > defers until the dma engine driver is available.
>
> FYI, if most of the drivers are built in, you could set
> deferred_probe_timeout=1 to reduce the impact of this (should drop
> down to 1 to 2 seconds). Is that an option until we figure out
> something better?
>
> Actually, why isn't earlyconsole being used? That doesn't get blocked
> on anything and the main point of that is to have console working from
> really early on.
>
> > >
> > > It shouldn't go in as-is.
> >
> > This affects all machines with the PL011 UART and DMAs specified as
> > well.
> >
> > It would be best if the console subsystem could be treated special and
> > not require DMA devlink to be satisfied before probing.
>
> If we can mark the console devices somehow before their drivers probe
> them, I can make fw_devlink give them special treatment. Is there any
> way I could identify them before their drivers probe?
>
> > It seems devlink is not quite aware of the concept of resources that are
> > necessary to probe vs resources that are nice to have and might be
> > added after probe.
>
> Correct, it can't tell them apart. Which is why it tries its best to
> enforce them, get most of them ordered properly and then gives up
> enforcing the rest after deferred_probe_timeout= expires. There's a
> bit more nuance than what I explained here (explained in earlier
> commit texts, LPC talks), but that's the gist of it. That's what's
> going on in this case Sascha is pointing out.z
>
> > We need a strong devlink for the first category
> > and maybe a weak devlink for the latter category.
> >
> > I don't know if this is a generic hardware property for all operating
> > systems so it could be a DT property such as dma-weak-dependency?
> >
> > Or maybe compromize and add a linux,dma-weak-dependency;
> > property?
>
> The linux,dma-weak-dependency might be an option, but then if the
> kernel version changes and we want to enforce it because we now have a
> dma driver (not related to Shasha's example) support, then the
> fw_devlink still can't enforce it because of that property. But maybe
> that's okay? The consumer can try to use dma and defer probe if it
> fails?
>
> Another option is to mark console devices in DT with some property and
> we can give special treatment for those without waiting for
> deferred_probe_timeout= to expire.

Heh, looks like there's already a property for that: stdout-path.

Let me send a series that'll use that to give special treatment to
console devices.

-Saravana
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
