Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BE4558342
	for <lists.iommu@lfdr.de>; Thu, 23 Jun 2022 19:27:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0582D4058D;
	Thu, 23 Jun 2022 17:27:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0582D4058D
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=JnCT42yA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aVNtHoqf0vf1; Thu, 23 Jun 2022 17:27:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CF0C340510;
	Thu, 23 Jun 2022 17:27:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF0C340510
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99C2DC007E;
	Thu, 23 Jun 2022 17:27:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1874DC002D
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jun 2022 17:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2CA042474
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jun 2022 17:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2CA042474
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20210112 header.b=JnCT42yA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WiWTou-rPc8C for <iommu@lists.linux-foundation.org>;
 Thu, 23 Jun 2022 17:27:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5E1142413
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5E1142413
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jun 2022 17:27:23 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-3176d94c236so1315197b3.3
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jun 2022 10:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EL/06AiO/r0aaZHGPm8olM4Z1g8u3q+FzLtpTcwW9+E=;
 b=JnCT42yA4RwkalddkzPrJcFW4xS8/AuSbzy9tJ3tePu5bM24Ibqr3x++pzaPDrLfSq
 kaGJTArX9fUCrT0wKKOCtTLYJfjz7rj9imdcL7Pqfb4slmHg8IMENvZlqFm4OXbLEZny
 J9YpduFdJ0C9SGIfK3lAhmOLKKSD54emhGXwyTKd4zLc6mUsVCr0UEcbk+IU96MD0I9r
 JA/jzjJFQ+fQd7mJ8EkAmfjizWANCRRDX1m02PA1R+yQuTc3BWGj/hPC7P5U7eOqhdOe
 TNE+ns8QKBZrDwGhF91i4cSeiE94OXjudpzhMpSeD6m7B9EcjFqLK1KazAZTYMoHsxV2
 /pXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EL/06AiO/r0aaZHGPm8olM4Z1g8u3q+FzLtpTcwW9+E=;
 b=BvREpt/iD5zJQ5HsU6F+3Mi5b4l4axYY2T1n030NG52pTyf7HNTLiu09nhC21hj9bH
 YWNmrphIYa29LqDjt+tjmqIobWMSAZ7F1LZ5n8+HspJ3cKgV1nerBhcv+njIRB7spWuA
 m+PS6pb/JzdIuhjh+ONQ8bX0hqDq5taRZCPrwWawgkpwoqc8+aNSJWLM6/WW0fu0r8dn
 EQflQ0gOBKiv89GeA5KM4FIsBUD6E+P0HFSscllgo4AtXj4s+doPXaDWBTNmOMedSP+B
 jDBrrelqVTHi/jOCHiE0UD9egbFYJ3COZaE9kfLbOy5HME/WzwCILoNhsLLCzwzqKm7g
 E16w==
X-Gm-Message-State: AJIora9UQKCeB4O11LPIjoo+OU+2B0gjonY3ljcIHokU8a1jCBAkAG1L
 DyI4sWGG9spXYR/e6FQw5S0W/ich0AnzBzyjfAVshg==
X-Google-Smtp-Source: AGRyM1th3RmV9czY2nAQEMvAwHPPL7mFnNzI7DxsJuq4R6Wbusl3da+wwbtdHDw4EMO4U/ky+UtTRttD4UQUKoucelI=
X-Received: by 2002:a81:a095:0:b0:317:d4ce:38b6 with SMTP id
 x143-20020a81a095000000b00317d4ce38b6mr11755149ywg.83.1656005242403; Thu, 23
 Jun 2022 10:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220623080344.783549-1-saravanak@google.com>
 <20220623080344.783549-3-saravanak@google.com>
 <20220623100421.GY1615@pengutronix.de>
In-Reply-To: <20220623100421.GY1615@pengutronix.de>
Date: Thu, 23 Jun 2022 10:26:46 -0700
Message-ID: <CAGETcx_eVkYtVX9=TOKnhpP2_ZpJwRDoBye3i7ND2u5Q-eQfPg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] of: base: Avoid console probe delay when
 fw_devlink.strict=1
To: sascha hauer <sha@pengutronix.de>
Cc: andrew lunn <andrew@lunn.ch>, peng fan <peng.fan@nxp.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 linus walleij <linus.walleij@linaro.org>, ulf hansson <ulf.hansson@linaro.org>,
 eric dumazet <edumazet@google.com>, pavel machek <pavel@ucw.cz>,
 will deacon <will@kernel.org>, kevin hilman <khilman@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, russell king <linux@armlinux.org.uk>,
 linux-acpi@vger.kernel.org, jakub kicinski <kuba@kernel.org>,
 paolo abeni <pabeni@redhat.com>, kernel-team@android.com,
 Len Brown <lenb@kernel.org>, len brown <len.brown@intel.com>,
 kernel@pengutronix.de, linux-pm@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 hideaki yoshifuji <yoshfuji@linux-ipv6.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 david ahern <dsahern@kernel.org>, linux-kernel@vger.kernel.org,
 Daniel Scally <djrscally@gmail.com>, iommu@lists.linux-foundation.org,
 Sakari Ailus <sakari.ailus@linux.intel.com>, netdev@vger.kernel.org,
 "david s. miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
 heiner kallweit <hkallweit1@gmail.com>
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

On Thu, Jun 23, 2022 at 3:05 AM sascha hauer <sha@pengutronix.de> wrote:
>
> On Thu, Jun 23, 2022 at 01:03:43AM -0700, Saravana Kannan wrote:
> > Commit 71066545b48e ("driver core: Set fw_devlink.strict=1 by default")
> > enabled iommus and dmas dependency enforcement by default. On some
> > systems, this caused the console device's probe to get delayed until the
> > deferred_probe_timeout expires.
> >
> > We need consoles to work as soon as possible, so mark the console device
> > node with FWNODE_FLAG_BEST_EFFORT so that fw_delink knows not to delay
> > the probe of the console device for suppliers without drivers. The
> > driver can then make the decision on where it can probe without those
> > suppliers or defer its probe.
> >
> > Fixes: 71066545b48e ("driver core: Set fw_devlink.strict=1 by default")
> > Reported-by: Sascha Hauer <sha@pengutronix.de>
> > Reported-by: Peng Fan <peng.fan@nxp.com>
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > Tested-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/of/base.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/of/base.c b/drivers/of/base.c
> > index d4f98c8469ed..a19cd0c73644 100644
> > --- a/drivers/of/base.c
> > +++ b/drivers/of/base.c
> > @@ -1919,6 +1919,8 @@ void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align))
> >                       of_property_read_string(of_aliases, "stdout", &name);
> >               if (name)
> >                       of_stdout = of_find_node_opts_by_path(name, &of_stdout_options);
> > +             if (of_stdout)
> > +                     of_stdout->fwnode.flags |= FWNODE_FLAG_BEST_EFFORT;
>
> The device given in the stdout-path property doesn't necessarily have to
> be consistent with the console= parameter. The former is usually
> statically set in the device trees contained in the kernel while the
> latter is dynamically set by the bootloader. So if you change the
> console uart in the bootloader then you'll still run into this trap.
>
> It's problematic to consult only the device tree for dependencies. I
> found several examples of drivers in the tree for which dma support
> is optional. They use it if they can, but continue without it when
> not available. "hwlock" is another property which consider several
> drivers as optional. Also consider SoCs in early upstreaming phases
> when the device tree is merged with "dmas" or "hwlock" properties,
> but the corresponding drivers are not yet upstreamed. It's not nice
> to defer probing of all these devices for a long time.
>
> I wonder if it wouldn't be a better approach to just probe all devices
> and record the device(node) they are waiting on. Then you know that you
> don't need to probe them again until the device they are waiting for
> is available.

That actually breaks things in a worse sense. There are cases where
the consumer driver is built in and the optional supplier driver is
loaded at boot. Without fw_devlink and the deferred probe timeout, we
end up probing the consumer with limited functionality. With the
current setup, sure we delay some probes a bit but at least everything
works with the right functionality. And you can reduce or remove the
delay if you want to optimize it.

-Saravana
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
