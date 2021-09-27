Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA9341A049
	for <lists.iommu@lfdr.de>; Mon, 27 Sep 2021 22:41:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AADC7404B9;
	Mon, 27 Sep 2021 20:41:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tAoBSdWqJJj8; Mon, 27 Sep 2021 20:41:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D22FA404B6;
	Mon, 27 Sep 2021 20:41:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B525AC000F;
	Mon, 27 Sep 2021 20:41:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D90B3C000F
 for <iommu@lists.linux-foundation.org>; Mon, 27 Sep 2021 20:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAE24404B6
 for <iommu@lists.linux-foundation.org>; Mon, 27 Sep 2021 20:41:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MNNLvbAtxi4m for <iommu@lists.linux-foundation.org>;
 Mon, 27 Sep 2021 20:41:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D2D8404B4
 for <iommu@lists.linux-foundation.org>; Mon, 27 Sep 2021 20:41:48 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 l7-20020a0568302b0700b0051c0181deebso26073768otv.12
 for <iommu@lists.linux-foundation.org>; Mon, 27 Sep 2021 13:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pUZgLCnNelRAaV+g7H8XGqFTT9YZLErJSXLJYla4RJo=;
 b=dCoaJUF0HSoSC1tmNX6q8Fh6kJv7c6jk49XmhH2vq1ANKmz6EeVyVtD2Pcxxxh8aXz
 /W0bzAWmoH3iHlFtKt4RHhcy9v4nMv6BEyBk34D8UUa8oCh+yyJJBwKYrK5zxFL+VJ5W
 mmk25gMJbff0s4JgjQlL73M1frtzFLhhSSeKsoMfON0N7To1FwqmZevw+vpH964FuN5+
 VDs07R1JX2daPpe7GTVjL3t8b85VIkNR+VDjVjC7aEfatwsh4ieB21gaSPHVc9FrfLe4
 JK9GpMcv5K/VRzrKmX8WZg1LZAmnWcollVG6hxmBajWBFIxazJts7JTsm6AsqVhgOO/o
 pUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pUZgLCnNelRAaV+g7H8XGqFTT9YZLErJSXLJYla4RJo=;
 b=bNkfIe3LHEJWXZaSSGkm9f+M4hyzIr5S11g5NJm5HHTxkEjgoGnZSwn4W6xoewSmC5
 EJ/kGdUBcDSKxUHP+LZ1vRdqVHu1lOZbHjpAbCsiF53Z0JFDQpSqcp62o7haf9cOzKy3
 G3B1AGeKtOzct8ZRwA8YnQ7LDmZT2+8ysysSIn5H6OMekMdDGk9KSIeoZKaHZwvKk7hP
 YdrYsT9etjhy/sZh6yqtps3H5jT6vandROdmDHuIGVlHJRjPmIU8bBvJ1GR+GWa+lcSQ
 pn/XVZJricR+zrZIKxqfjD0iPMphbmpUzZHOo/B0SwLjxP2HDPDZ6I/+3/99aJLl8zoH
 k8ew==
X-Gm-Message-State: AOAM533CJCtkxgr94lZkCt93HcYPYK6itKdm2hjz+Foku9bSvmyUTxUE
 e67F8J+imUlhQKESUHY1q9A6EQ==
X-Google-Smtp-Source: ABdhPJydeIzDJHtHzGeBz5+87mWnwkDNbaEe+ql2n9gGjNC+NklvZH2OYxM0vWlXO7E/L2MFCogIbA==
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr1832465otn.126.1632775307597; 
 Mon, 27 Sep 2021 13:41:47 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id a8sm4414108oos.46.2021.09.27.13.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 13:41:47 -0700 (PDT)
Date: Mon, 27 Sep 2021 13:42:22 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] [RFC] qcom_scm: hide Kconfig symbol
Message-ID: <YVIsrgKiOG/gFVdT@ripper>
References: <20210927152412.2900928-1-arnd@kernel.org>
 <YVIg9CxJGaJr1vpp@ripper>
 <CAK8P3a1fEuFsQVY9b1oGdTOHzr8pu9wvrSBCMn2iOvgWqtHNnA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1fEuFsQVY9b1oGdTOHzr8pu9wvrSBCMn2iOvgWqtHNnA@mail.gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 David Airlie <airlied@linux.ie>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, ath10k@lists.infradead.org,
 Will Deacon <will@kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jakub Kicinski <kuba@kernel.org>, linux-sunxi@lists.linux.dev,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 John Stultz <john.stultz@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 Kalle Valo <kvalo@codeaurora.org>, Alex Elder <elder@kernel.org>,
 Networking <netdev@vger.kernel.org>, linux-mmc <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Sudeep Holla <sudeep.holla@arm.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 "David S. Miller" <davem@davemloft.net>
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

On Mon 27 Sep 13:15 PDT 2021, Arnd Bergmann wrote:

> On Mon, Sep 27, 2021 at 9:52 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > On Mon 27 Sep 08:22 PDT 2021, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > >  - To avoid a circular dependency chain involving RESET_CONTROLLER
> > >    and PINCTRL_SUNXI, change the 'depends on RESET_CONTROLLER' in
> > >    the latter one to 'select'.
> >
> > Can you please help me understand why this is part of the same patch?
> 
> This can be done as a preparatory patch if we decide to do it this way,
> for the review it seemed better to spell out that this is required.
> 
> I still hope that we can avoid adding another 'select RESET_CONTROLLER'
> if someone can figure out what to do instead.
> 

Okay, thanks.

> The problem here is that QCOM_SCM selects RESET_CONTROLLER,
> and turning that into 'depends on' would in turn mean that any driver that
> wants to select QCOM_SCM would have to have the same RESET_CONTROLLER
> dependency.
> 

Right, and that will just be another thing we'll get wrong across the
tree.

> An easier option might be to find a way to build QCOM_SCM without
> RESET_CONTROLLER for compile testing purposes. I don't know
> what would break from that.
> 

Afaict the reset API is properly stubbed and RESET_CONTROLLER is a bool,
so I think we can simply drop the "select" and the kernel will still
compile fine in all combinations.

When it comes to runtime, we currently select RESET_CONTROLLER from the
Qualcomm common clocks. If that is dropped (why would it...) it seems
possible to build a custom kernel for msm8916 that we can boot and miss
the stubbed out "mss restart" reset line from the SCM.


So, let's just drop the select RESET_CONTROLLER from SCM for now.

Regards,
Bjorn
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
