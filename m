Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CAB30DD72
	for <lists.iommu@lfdr.de>; Wed,  3 Feb 2021 16:03:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7007487141;
	Wed,  3 Feb 2021 15:03:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S6J0on4Ttsut; Wed,  3 Feb 2021 15:03:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4A403870EF;
	Wed,  3 Feb 2021 15:03:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 288D7C0FA7;
	Wed,  3 Feb 2021 15:03:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C0048C013A
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 10:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B3D0F8653F
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 10:13:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yRsVxVsyoqjv for <iommu@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 10:12:59 +0000 (UTC)
X-Greylist: delayed 00:25:02 by SQLgrey-1.7.6
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1D9B98618C
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 10:12:58 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id z22so17157045qto.7
 for <iommu@lists.linux-foundation.org>; Wed, 03 Feb 2021 02:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zk8/vp8JgNY876P4l17ZIlAqzB9Wo0hE+dFWOx8FtrM=;
 b=SY8KB6ZL7hu4tsDAT4WtjBrjedqhdXnJ0WfEvfJfTY4yh0iSUYYRhinj5pTMbKBDV1
 aUGstOUKrtsV6s3+W+PrL5fuzfzO0w1ItRwwVf+Gj24JPi7XOxzASbip5S8aN+T6CEwU
 +NX0nAvHbl0Z+rP1h+42oA2pbBBS/9Oc57Pzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zk8/vp8JgNY876P4l17ZIlAqzB9Wo0hE+dFWOx8FtrM=;
 b=lMhDANsrYneiWZ8EqmIumBp8yGvWBo8ppQErgjbfowxUrY2LaHDermO3Py7zdWT2Wp
 nIOC2vYSRIiX33ORj5JcMxKLQuS/KSd9uYJ0jDYBMiXm/wPe4OSVz2DqVx8Xx2nqFQYc
 94Z+0YzizuSdZLbTp18VnRUVCKbxM3yhGoOdCx2ZqHZeXa2v+Je3ObZoF/S60KsNX84p
 R+nyxhyrNwh8AxtVq/SF8kSTrk3rtMeHRRltrmeF4JSc9CydlcAVMHShatMZkz9pmY6z
 0TDgCSZMb7C2c5/2hmLNdBfW0spdLNgAxdeNN48pP/3p4BjekGLiUTWQ/JGEMj4qBNzY
 hSAg==
X-Gm-Message-State: AOAM530FaerhEC/qZyWi9yC+qg1ogaD1Z2Nk7OZeonHGIIDM2vxcbedx
 uGo1BUZ4/oLsgu2tzPssvoE7sGJY3LUvF2IG2VIt+mV9/mgm4g9T
X-Google-Smtp-Source: ABdhPJybIlxUI+vQirOWdUqx6AbdqbGySWHXWBWrXBPSLHmsuhjkp60HqhVWg2mWEWZVLnKYEXPVHI64xIy6+ueWcow=
X-Received: by 2002:ac8:5dc8:: with SMTP id e8mr1685704qtx.249.1612345676494; 
 Wed, 03 Feb 2021 01:47:56 -0800 (PST)
MIME-Version: 1.0
References: <20210202205544.24812-1-robh@kernel.org>
In-Reply-To: <20210202205544.24812-1-robh@kernel.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 3 Feb 2021 18:48:59 +0900
Message-ID: <CAFr9PX=NmCev3c1jQ3VA89rwcTr3jpRQB-NKf+j+LOeOMHy1Og@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: Fix undocumented compatible strings in
 examples
To: Rob Herring <robh@kernel.org>
X-Mailman-Approved-At: Wed, 03 Feb 2021 15:03:11 +0000
Cc: Tomer Maimon <tmaimon77@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Vincent Cheng <vincent.cheng.xh@renesas.com>,
 Tali Perry <tali.perry1@gmail.com>, Daniel Palmer <daniel@thingy.jp>,
 linux-i2c@vger.kernel.org, Will Deacon <will@kernel.org>,
 linux-clk@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Joel Stanley <joel@jms.id.au>, Guenter Roeck <linux@roeck-us.net>,
 DTML <devicetree@vger.kernel.org>, linux-watchdog@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Avi Fishman <avifishman70@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, iommu@lists.linux-foundation.org,
 linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
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

Hi Rob,

On Wed, 3 Feb 2021 at 05:55, Rob Herring <robh@kernel.org> wrote:
> diff --git a/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml b/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
> index 1f2ef408bb43..fe1e1c63ffe3 100644
> --- a/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/mstar,msc313-gpio.yaml
> @@ -46,7 +46,7 @@ examples:
>      #include <dt-bindings/gpio/msc313-gpio.h>
>
>      gpio: gpio@207800 {
> -      compatible = "mstar,msc313e-gpio";
> +      compatible = "mstar,msc313-gpio";
>        #gpio-cells = <2>;
>        reg = <0x207800 0x200>;
>        gpio-controller;

This is correct. The compatible string dropped the e at some point and
I must have missed the example.
Thanks for the fix.

Reviewed-by: Daniel Palmer <daniel@thingy.jp>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
