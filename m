Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0700321EAD1
	for <lists.iommu@lfdr.de>; Tue, 14 Jul 2020 10:01:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B126C87F30;
	Tue, 14 Jul 2020 08:01:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Quo7bhB1akOC; Tue, 14 Jul 2020 08:01:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2AB1387431;
	Tue, 14 Jul 2020 08:01:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 123DCC0733;
	Tue, 14 Jul 2020 08:01:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 214C8C0733
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 08:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 10AFC8856E
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 08:01:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KxGn0rg8DgrP for <iommu@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 08:01:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 79B7487F30
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 08:01:44 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id w17so13246370oie.6
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 01:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gr/9MPACjcXFT200AbtYNpFbRXhHlr2mT2NBQiQX2q0=;
 b=FWpnzyQSMIdJQb1mGav09PkRi4QtkUpGGLX5yFc17VFF6FhauJ+djX8afDJQKGYfd8
 fYB9KQS40awdydvVnoN2ZUOnjzZNfiaVmKh6YQDkNOjNeJfJGuLxw/fS+ShQ+tGroUm/
 qQdJfEKoZqXYdTS+gYzZCD4KJzA4yNlWTkFfp8lVLjUxSbaC4xVm+t9Yuz4T0VP3pVcp
 hgx6BrwfF6vNLugCD4AYjoUBBwftnsvn2ys9kFo3TljBYRmsoXD5DAv9hTMCkhPVM5AE
 IPO8UmFbo0WJRMqX2kXdfqY2Ssnbc/TAvmzEHq397jyZzQnMXd2hxyBYS43d7pzDN7qE
 mXvw==
X-Gm-Message-State: AOAM532H+wsQMqPkR7uMddff1DkLr971SBCrLK1InyfpAlul5RFvBlNy
 yyidRdEwTim+WdMwv/b8HLazCxO0IgZnIkG+R+8=
X-Google-Smtp-Source: ABdhPJy7kkdABSF7lhv0xD5jUKEhCpyXc6ADui6HtYdgbv0IJdB1SlTSer1oVhB10kFqgYGdnLSY0z0w3jWdAStYu0g=
X-Received: by 2002:a05:6808:64a:: with SMTP id
 z10mr2727113oih.54.1594713703757; 
 Tue, 14 Jul 2020 01:01:43 -0700 (PDT)
MIME-Version: 1.0
References: <1594676120-5862-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594676120-5862-9-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594676120-5862-9-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Jul 2020 10:01:32 +0200
Message-ID: <CAMuHMdXV65Nmq8263LE-006gBeKErktAt0Fmrsurm+dLZxQs1Q@mail.gmail.com>
Subject: Re: [PATCH 8/9] dt-bindings: net: renesas,ravb: Add support for
 r8a774e1 SoC
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Prabhakar <prabhakar.csengg@gmail.com>,
 dmaengine <dmaengine@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Mon, Jul 13, 2020 at 11:36 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Document RZ/G2H (R8A774E1) SoC bindings.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
