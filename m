Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3CD363C1C
	for <lists.iommu@lfdr.de>; Mon, 19 Apr 2021 09:07:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7485083684;
	Mon, 19 Apr 2021 07:07:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DRak7sJKyic9; Mon, 19 Apr 2021 07:07:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D0C483653;
	Mon, 19 Apr 2021 07:07:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08D0AC000B;
	Mon, 19 Apr 2021 07:07:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8842C000B
 for <iommu@lists.linux-foundation.org>; Mon, 19 Apr 2021 04:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CCDC4036A
 for <iommu@lists.linux-foundation.org>; Mon, 19 Apr 2021 04:58:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tvJR1SbvIhNZ for <iommu@lists.linux-foundation.org>;
 Mon, 19 Apr 2021 04:58:28 +0000 (UTC)
X-Greylist: delayed 00:08:53 by SQLgrey-1.8.0
Received: from gw.atmark-techno.com (gw.atmark-techno.com [13.115.124.170])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B6F140368
 for <iommu@lists.linux-foundation.org>; Mon, 19 Apr 2021 04:58:28 +0000 (UTC)
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71])
 by gw.atmark-techno.com (Postfix) with ESMTPS id 372E680532
 for <iommu@lists.linux-foundation.org>; Mon, 19 Apr 2021 13:49:33 +0900 (JST)
Received: by mail-ot1-f71.google.com with SMTP id
 f89-20020a9d2c620000b0290280d753a255so9238975otb.2
 for <iommu@lists.linux-foundation.org>; Sun, 18 Apr 2021 21:49:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nwmKkdj5vxFBpFK3bj8w7Gz2YNFOXfPhegLyPurLzW0=;
 b=lqQpp6OZgCYlphwq+spPNKi1Vr5EETUE8ODqtNvyD+vIVJ5wE+sK8dvJ3vYGReMIyn
 jrKOUvm+XycCCksLzMNzzzOywM8JxePl2K4NF1ezeGcHaEcBEds2o2bq+AvO67MMBDn4
 aMtreZjQMjR9wxPqGmEc4exYDi2ZWWLQWM63ubKe1lPqt23l4ZK6SM/vJvhD7kLtHr3m
 AZVNQ10bgReKf97VLxynIBDzjCWhvGLgKpKw7PiE/8aImMX38pvULBg7YwOKPb+WrXMo
 Ihm8W3P0RTUeaN8oTERqUt2cWiu+JcBw5ITbC6/AtcaJnG2Sy71mAHUY9cvGh1baENGO
 WJ9w==
X-Gm-Message-State: AOAM53227LWI6PL+gxI5ET79NRtWH18/HY08ohaxLvN6z3bglD3fc3vd
 Iz3jr979fn2qppizkOcTqZBrHzJA3FNWhNPi7qfNfTku2VZbYIBnTjCat/HSaUNPr9gdkHfjjG8
 Ec4IYKVd9H8wTCyvD0UVIffbkcGk+9h0A9Q==
X-Received: by 2002:a17:90a:430e:: with SMTP id
 q14mr10145501pjg.189.1618807761153; 
 Sun, 18 Apr 2021 21:49:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxUh9TJ2x/K//IB2lTaeXhs2rGXIpLK5cuzzNIi1YdNWpQlLZsRv610IvzYjHsCM08ZYf1MA==
X-Received: by 2002:a17:90a:430e:: with SMTP id
 q14mr10145444pjg.189.1618807760853; 
 Sun, 18 Apr 2021 21:49:20 -0700 (PDT)
Received: from pc-0115 (117.209.187.35.bc.googleusercontent.com.
 [35.187.209.117])
 by smtp.gmail.com with ESMTPSA id l22sm13247239pjc.13.2021.04.18.21.49.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 18 Apr 2021 21:49:20 -0700 (PDT)
Received: from martinet by pc-0115 with local (Exim 4.94)
 (envelope-from <martinet@pc-0115>)
 id 1lYLqX-0016Kg-U8; Mon, 19 Apr 2021 13:49:17 +0900
Date: Mon, 19 Apr 2021 13:49:07 +0900
From: Dominique MARTINET <dominique.martinet@atmark-techno.com>
To: "Alice Guo (OSS)" <alice.guo@oss.nxp.com>
Subject: Re: [RFC v1 PATCH 1/3] drivers: soc: add support for
 soc_device_match returning -EPROBE_DEFER
Message-ID: <YH0Lwy2AYpXaJIex@atmark-techno.com>
References: <20210419042722.27554-1-alice.guo@oss.nxp.com>
 <20210419042722.27554-2-alice.guo@oss.nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210419042722.27554-2-alice.guo@oss.nxp.com>
X-Mailman-Approved-At: Mon, 19 Apr 2021 07:07:20 +0000
Cc: ulf.hansson@linaro.org, aymen.sghaier@nxp.com, geert+renesas@glider.be,
 rafael@kernel.org, airlied@linux.ie, mturquette@baylibre.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 a.hajda@samsung.com, netdev@vger.kernel.org, linux-phy@lists.infradead.org,
 will@kernel.org, linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 wim@linux-watchdog.org, herbert@gondor.apana.org.au, horia.geanta@nxp.com,
 khilman@baylibre.com, narmstrong@baylibre.com, linux-staging@lists.linux.dev,
 iommu@lists.linux-foundation.org, peter.ujfalusi@gmail.com, kishon@ti.com,
 tony@atomide.com, linux-omap@vger.kernel.org, stern@rowland.harvard.edu,
 kuba@kernel.org, linus.walleij@linaro.org, linux@roeck-us.net,
 linux-media@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Roy.Pledge@nxp.com, linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 edubezval@gmail.com, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, ssantosh@kernel.org,
 matthias.bgg@gmail.com, linux-amlogic@lists.infradead.org, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, balbi@kernel.org, tomba@kernel.org,
 sboyd@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, adrian.hunter@intel.com, robert.foss@linaro.org,
 leoyang.li@nxp.com, linux@prisktech.co.nz, vkoul@kernel.org,
 linux-crypto@vger.kernel.org, daniel@ffwll.ch, j-keerthy@ti.com,
 dmaengine@vger.kernel.org, jyri.sarha@iki.fi, davem@davemloft.net
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

First comment overall for the whole serie:
Since it is the solution I had suggested when I reported the problem[1]
I have no qualm on the approach, comments for individual patches
follow.

[1] http://lore.kernel.org/r/YGGZJjAxA1IO+/VU@atmark-techno.com


Alice Guo (OSS) wrote on Mon, Apr 19, 2021 at 12:27:20PM +0800:
> From: Alice Guo <alice.guo@nxp.com>
> 
> In i.MX8M boards, the registration of SoC device is later than caam
> driver which needs it. Caam driver needs soc_device_match to provide
> -EPROBE_DEFER when no SoC device is registered and no
> early_soc_dev_attr.

This patch should be last in the set: you can't have soc_device_match
return an error before its callers handle it.

> Signed-off-by: Alice Guo <alice.guo@nxp.com>

As the one who reported the problem I would have been appreciated being
at least added to Ccs... I only happened to notice you posted this by
chance.

There is also not a single Fixes tag -- I believe this commit should
have Fixes: 7d981405d0fd ("soc: imx8m: change to use platform driver")
but I'm not sure how such tags should be handled in case of multiple
patches fixing something.

-- 
Dominique
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
