Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C18513CEB36
	for <lists.iommu@lfdr.de>; Mon, 19 Jul 2021 21:00:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C86F83279;
	Mon, 19 Jul 2021 19:00:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BGKLGmNUavxT; Mon, 19 Jul 2021 19:00:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7026183794;
	Mon, 19 Jul 2021 19:00:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49F8BC000E;
	Mon, 19 Jul 2021 19:00:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1F6B0C000E
 for <iommu@lists.linux-foundation.org>; Mon, 19 Jul 2021 19:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F38224040E
 for <iommu@lists.linux-foundation.org>; Mon, 19 Jul 2021 19:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Clmya2EWkUKY for <iommu@lists.linux-foundation.org>;
 Mon, 19 Jul 2021 19:00:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D0EE40404
 for <iommu@lists.linux-foundation.org>; Mon, 19 Jul 2021 19:00:18 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id m16so190014lfg.13
 for <iommu@lists.linux-foundation.org>; Mon, 19 Jul 2021 12:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+jdLZvJN21CTu/nU9p3zM/7iZ/xDd3v4ptR1eHb187U=;
 b=GAA2TFcqcWKOiNo7WTflTgsUtZoVN+Sr0pFrALy8uy/woqt17QIoJqfYp3Tuf8NwtD
 jMiXlHSGBKJkq9CnBheHrhObo675Jc2Ua5Rd03WylMJj4URR+qAs5aEfbtR8twNDiUCq
 nxPCeUDKG8iUp9iK9SKc40K8Mljh6vKLRfOR0sz1fFweRa3X30nbCQJcwNA4f7pXWhs3
 B4R4+85bflBh80tdunaKPpbFV7h39mGQfhA94+U/bsyVicM5BZgtkOUpbNc1KIRbqTvS
 sF6tcpFTV1R0Pu4eIYZdf5XHr88AeJWG3VEIbp0uj1SDhe3DRa2rxXZPJfECGCM2yVaL
 rQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+jdLZvJN21CTu/nU9p3zM/7iZ/xDd3v4ptR1eHb187U=;
 b=pjnqjCnKEkPwkjAC6ugz9GliHEMsNk+2/6h8SsE7WOsB3nEJGx8OSYxJpUt+btYlx+
 Pmh/g9yCE/JJV2cOs8VTa5kTtI7JxC1XQmnGb37ilh7NyZ+VL7FoEqcAlg2/HhiWQgiA
 JNQmgoM/HiuUg7eE6IRwPqeaUgp0FJKTFs6w44zlIGa62F1AEqpTnOHjxyKmije8HUxT
 if/xCPmfaK7Jv4IAkesu0C7rlrHLzOEgJxD/pdM1EgA9NED4m3vuTVPCTzN8ZeS7+QFZ
 oV6xB0OXRw+OX8h1WMXlhbYX2fFA7Q3DRe4vETfBI0BAJXs3EwYWITfW5Rq593DpzWxM
 TGBg==
X-Gm-Message-State: AOAM53180Mrgxq3IsWpm9sPEiKNmW3fNClwYWKCV4a3ik8HkP8+TLS4I
 Bq4DBypYhiVHEaxfv11PEN1wlzAIblyGo/0wuL0ArA==
X-Google-Smtp-Source: ABdhPJzfaiUMhEtqkQ8scwUqGoeeaz2XvfjZbPLzAoB9375A2Qo9QDi+PUY9EVT8e3XQhXZTEWfjw+m4kUjCVu+SYWs=
X-Received: by 2002:a19:7408:: with SMTP id v8mr19183878lfe.508.1626721216181; 
 Mon, 19 Jul 2021 12:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210707045320.529186-1-john.stultz@linaro.org>
 <YPJkF21ItYlKODyq@yoga>
In-Reply-To: <YPJkF21ItYlKODyq@yoga>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 19 Jul 2021 12:00:05 -0700
Message-ID: <CALAqxLUzTNiA7u=4_y9pkrh=Q_+vpPgFrhf_6F8-U0XPQU9crQ@mail.gmail.com>
Subject: Re: [PATCH] firmware: QCOM_SCM: Allow qcom_scm driver to be loadable
 as a permenent module
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Maulik Shah <mkshah@codeaurora.org>, Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
 Marc Zyngier <maz@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Kalle Valo <kvalo@codeaurora.org>,
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

On Fri, Jul 16, 2021 at 10:01 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> On Tue 06 Jul 23:53 CDT 2021, John Stultz wrote:
> > Allow the qcom_scm driver to be loadable as a permenent module.
> >
> > This still uses the "depends on QCOM_SCM || !QCOM_SCM" bit to
> > ensure that drivers that call into the qcom_scm driver are
> > also built as modules. While not ideal in some cases its the
> > only safe way I can find to avoid build errors without having
> > those drivers select QCOM_SCM and have to force it on (as
> > QCOM_SCM=n can be valid for those drivers).
> >
> > Reviving this now that Saravana's fw_devlink defaults to on,
> > which should avoid loading troubles seen before.
> >
>
> Are you (in this last paragraph) saying that all those who have been
> burnt by fw_devlink during the last months and therefor run with it
> disabled will have a less fun experience once this is merged?
>

I guess potentially. So way back when this was originally submitted,
some folks had trouble booting if it was set as a module due to it
loading due to the deferred_probe_timeout expiring.
My attempts to change the default timeout value to be larger ran into
trouble, but Saravana's fw_devlink does manage to resolve things
properly for this case.

But if folks are having issues w/ fw_devlink, and have it disabled,
and set QCOM_SCM=m they could still trip over the issue with the
timeout firing before it is loaded (especially if they are loading
modules from late mounted storage rather than ramdisk).

> (I'm picking this up, but I don't fancy the idea that some people are
> turning the boot process into a lottery)

Me neither, and I definitely think the deferred_probe_timeout logic is
way too fragile, which is why I'm eager for fw_devlink as it's a much
less racy approach to handling module loading dependencies.  So if you
want to hold on this, while any remaining fw_devlink issues get
sorted, that's fine.  But I'd also not cast too much ire at
fw_devlink, as the global probe timeout approach for handling optional
links isn't great, and we need a better solution.

thanks
-john
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
