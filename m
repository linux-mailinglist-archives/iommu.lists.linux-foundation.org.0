Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CB92D2026C6
	for <lists.iommu@lfdr.de>; Sat, 20 Jun 2020 23:22:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1924A241C8;
	Sat, 20 Jun 2020 21:22:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g0pemTMYbk2v; Sat, 20 Jun 2020 21:21:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C3BB5241A8;
	Sat, 20 Jun 2020 21:21:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9AF2DC016E;
	Sat, 20 Jun 2020 21:21:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1CBDC016E
 for <iommu@lists.linux-foundation.org>; Sat, 20 Jun 2020 21:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A436823C58
 for <iommu@lists.linux-foundation.org>; Sat, 20 Jun 2020 21:21:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xj4M8g3TcnpP for <iommu@lists.linux-foundation.org>;
 Sat, 20 Jun 2020 21:21:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by silver.osuosl.org (Postfix) with ESMTPS id F017023A53
 for <iommu@lists.linux-foundation.org>; Sat, 20 Jun 2020 21:21:55 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id t74so7526918lff.2
 for <iommu@lists.linux-foundation.org>; Sat, 20 Jun 2020 14:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bu69mp6xYWLDQSTwZZePNMWDQ59FaV2SiSFYy8pjBQY=;
 b=BEK7VN2OmrlKRSG/e9OsYVGM9t0SGut4yO1XoCDqBns+EyWe9Og4n1eX2t4nRltuL+
 x5wfhHR7jj3CWrLxOCc/LnjcDRGn+rRWym+xRsNFal5F7BVlIaNboF1Ff5lY7mkcVhWE
 /JEM0Eo8ek/fwjZ64aZFUCx4MEpNUiR4uNUdjQTfPproxhWLhl/CMnd6vRMJ/Vh+olps
 ESgLuxAtySplCfoo6fYq9gGdfDhkF3xosvL8nhrcKABMAJduOdka/pQcUaJgAO8l26Vm
 kbfRxelGF5uRFZcgvdniVOyCHhz8FcHM95iT57XAuctop0mBCkRlA/zLwFo1hkKAXzsg
 Ss8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bu69mp6xYWLDQSTwZZePNMWDQ59FaV2SiSFYy8pjBQY=;
 b=ePnKAlgfUUCC150xJXyH6OSOUvpUchHhA1MMNVCngADXdCcxdccSX6Sx7iRzf3YbC2
 C6Jz84x9HTjJHxzav6J/E6/xzygsUlb750ndZcUdbdlQGHii3j0y+iRoGnUrbyntLKZa
 UCfTGuEDFMA2u+l7EbYn7m2o2lF44JPClNha42nmccoSL4v0MBd48v/ajKQfJ8tF/Y6R
 oLpdql+pfMfo/g/GAcxKNHSgTNF3o21aq9uPKjHsIrP3l3H41PA04RM0IOtrLYnsoNuu
 e43yiyJ5iG8HfHzsrQGucqJQ2WhKJCpEoJP7Pk2Dv1V4gQK7LZKNTD0r+J35sqavya2F
 4aBw==
X-Gm-Message-State: AOAM532PkS8fM+PoCiALeeI6U+JOrwq4KbqijVbuGFn3gPpH3h8g/wFi
 4KR/SWYZ6lg1R6lqbwPAF8i/K5xuEKcKWspna0bZrQ==
X-Google-Smtp-Source: ABdhPJy/RkTLIDBZFRMNpiPSsRVm5Ak3I4Hbs3gJhBT50nyx7v4sALg7fToWgIJskHBwAdm4KDklfhLMkVmhKWNt8Ak=
X-Received: by 2002:a19:ccd0:: with SMTP id c199mr2956592lfg.194.1592688113991; 
 Sat, 20 Jun 2020 14:21:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200616061338.109499-1-john.stultz@linaro.org>
 <20200616061338.109499-5-john.stultz@linaro.org>
In-Reply-To: <20200616061338.109499-5-john.stultz@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 20 Jun 2020 23:21:42 +0200
Message-ID: <CACRpkda35FZC=uXr-ipxZQ2SWU2tUincOztJmDt+Sa52FKQs=w@mail.gmail.com>
Subject: Re: [RFC][PATCH 4/5] pinctrl: qcom: Allow pinctrl-msm code to be
 loadable as a module
To: John Stultz <john.stultz@linaro.org>
Cc: Jason Cooper <jason@lakedaemon.net>, Saravana Kannan <saravanak@google.com>,
 Marc Zyngier <maz@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Lina Iyer <ilina@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Andy Gross <agross@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, MSM <linux-arm-msm@vger.kernel.org>,
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

On Tue, Jun 16, 2020 at 8:13 AM John Stultz <john.stultz@linaro.org> wrote:

> Tweaks to allow pinctrl-msm code to be loadable as a module.
> This is needed in order to support having the qcom-scm driver,
> which pinctrl-msm calls into, configured as a module.
>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Lina Iyer <ilina@codeaurora.org>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Todd Kjos <tkjos@google.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>

Unless there are dependencies on the irqchip patches I can apply
this if Bjorn is OK with it.

Yours,
Linus Walleij
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
