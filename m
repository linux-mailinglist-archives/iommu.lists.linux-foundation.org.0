Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A592AD798
	for <lists.iommu@lfdr.de>; Tue, 10 Nov 2020 14:34:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 76C9F85C7D;
	Tue, 10 Nov 2020 13:34:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GHSmWqFSdpJP; Tue, 10 Nov 2020 13:34:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DB84885A8B;
	Tue, 10 Nov 2020 13:34:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CD63DC016F;
	Tue, 10 Nov 2020 13:34:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE2D8C016F
 for <iommu@lists.linux-foundation.org>; Tue, 10 Nov 2020 13:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A1E5B228D5
 for <iommu@lists.linux-foundation.org>; Tue, 10 Nov 2020 13:34:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UjvcEijUGtlO for <iommu@lists.linux-foundation.org>;
 Tue, 10 Nov 2020 13:34:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 2CBD2228D1
 for <iommu@lists.linux-foundation.org>; Tue, 10 Nov 2020 13:34:15 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id v18so14700829ljc.3
 for <iommu@lists.linux-foundation.org>; Tue, 10 Nov 2020 05:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KGLM9fPNY7+GT4p8nJCSTip3uZZh4KalRevc6NBKqSw=;
 b=h3fs2yDbhXzIKAaNrM+h8p/XSPvr3EH34ss06aruBBygOKO9jCk2Y2fGVpLMiUHrXI
 LE6Lep9wERBSv9edvF2R2doBF6UAXzV/t6wvEqJGmP2fv/BKT/WdMvx9o3EnhCP6JLVi
 Q1xUeqe6Uu/vuhmQBEe7HAqerEUcGEq2nQwgaTgrpDmXvvfR5zTO9Gvv6n00nixmJ40E
 IwnKLpjoF9/iK0H8bBSdj24Ftf0Wj/OpGR7dBsrwYGZC2Z+nEBeRufIeob+3TLmbiUHU
 tgVSzrE7cn5YGxROsHaRqAZ4NEXXzsPQLOwEu1nPCsTN9ZyJANwF9wGuLlNEpwaEPI9O
 /iOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KGLM9fPNY7+GT4p8nJCSTip3uZZh4KalRevc6NBKqSw=;
 b=reMG/zg3JY0nmqW7e3Mmc2/KFHhCGHQnEfROZ8d+OpMeE/sFJKyjYZkAp+J/JSQBEB
 RanxuTFxTYS7ZmTg4P+3jIJ6Rj+8ALwjsgcEySRb1ySW9Qu8BReyejL+TnaKmsdevuZn
 joHGsGmEbQbMh/NUjFynWZvgtjPFMd0fO8fA29mZWBOkzk9P6MOyJebMiuIezadnqwoO
 LNc5QmoStlObpp3tT8QFnbqSld+wcImBHiKY7zKITxy3xCgjWKCh2UxORxq7bSm0RC27
 WsxGb8GjmD03c1EQGH9dQU7E0cxpzwarm5QsOjzeu/BaCVAj/CboQVhyIzEcuAMOCQuB
 Ow0Q==
X-Gm-Message-State: AOAM531hvC5ura4A0afCv9HMfXYb6CTMkV09LTHUERN+vc2VSgYaKxsg
 VIs4FuRmyakYSm4NvWpURQ8QOW6t6vZt0zd9i1gzKw==
X-Google-Smtp-Source: ABdhPJw4l95Aug60napiBX1bSOo2GaerufcLINoM+ZkU5hACFyVVdkrKEpvI/w+Qkg+bt6DgzwF/QHjFBj4ZnqZLbQo=
X-Received: by 2002:a2e:8604:: with SMTP id a4mr8277742lji.100.1605015253248; 
 Tue, 10 Nov 2020 05:34:13 -0800 (PST)
MIME-Version: 1.0
References: <20201106042710.55979-1-john.stultz@linaro.org>
 <20201106042710.55979-2-john.stultz@linaro.org>
In-Reply-To: <20201106042710.55979-2-john.stultz@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Nov 2020 14:34:02 +0100
Message-ID: <CACRpkdYf-SGfqjbE_SFfJLidH8v+Q3=_hwKkHZGfKNgD_GdLMg@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] pinctrl: qcom: Allow pinctrl-msm code to be
 loadable as a module
To: John Stultz <john.stultz@linaro.org>
Cc: Maulik Shah <mkshah@codeaurora.org>, Jason Cooper <jason@lakedaemon.net>,
 Saravana Kannan <saravanak@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, lkml <linux-kernel@vger.kernel.org>,
 Lina Iyer <ilina@codeaurora.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Marc Zyngier <maz@kernel.org>, MSM <linux-arm-msm@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Kalle Valo <kvalo@codeaurora.org>, Todd Kjos <tkjos@google.com>
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

On Fri, Nov 6, 2020 at 5:27 AM John Stultz <john.stultz@linaro.org> wrote:

> Tweaks to allow pinctrl-msm code to be loadable as a module.
>
> This is needed in order to support having the qcom-scm driver,
> which pinctrl-msm calls into, configured as a module.
>
> This requires that we tweak Kconfigs selecting PINCTRL_MSM to
> also depend on QCOM_SCM || QCOM_SCM=n so that we match the
> module setting of QCOM_SCM.
>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Kalle Valo <kvalo@codeaurora.org>
> Cc: Maulik Shah <mkshah@codeaurora.org>
> Cc: Lina Iyer <ilina@codeaurora.org>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Todd Kjos <tkjos@google.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-gpio@vger.kernel.org
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: John Stultz <john.stultz@linaro.org>

Patch applied!

Yours,
Linus Walleij
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
