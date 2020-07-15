Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1242208DD
	for <lists.iommu@lfdr.de>; Wed, 15 Jul 2020 11:33:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1DDF88AB57;
	Wed, 15 Jul 2020 09:33:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YIJHca58ufoU; Wed, 15 Jul 2020 09:33:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 558F18AB56;
	Wed, 15 Jul 2020 09:33:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 48041C07FF;
	Wed, 15 Jul 2020 09:33:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CDF32C0733
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jul 2020 09:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B63C58AB56
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jul 2020 09:33:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Btw1WFH58EzW for <iommu@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:33:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D6BF58A9C1
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jul 2020 09:33:18 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id n24so933614otr.13
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jul 2020 02:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2zSBza/A2TbTL8HuxHQLfop5BTTpNoqMx+x88U5xSCg=;
 b=rCz7isYowa+neY14mJk8j76NLxDZlDS+DpxRNdAruaxT/tIiYunpckHB4WygsRaARv
 2tQgRToHQn28ZHYobYPzL37WfLuTTorYWyjPpdI0aRnUKdY/EEE4a4fbg6YCGZhGpSzJ
 RyHK20NolsevGrK6KSTzeo2PXD4mzFailYhpQhe5hqM18tnwuViknggL1nBmtxMs7Dum
 eA7W+Lnr5gvBixRWWy96pDs5kJAcDiYBnRbsdEhX6fbGHgtsiv9uIs9bgn9WOhsce74Y
 yG1mXcM4gn25O2c3tBjC6sXnpZ/aWJudi+KXricVDi5kg+YwjWIFYy0eV/wb+yvdtQzJ
 5Hag==
X-Gm-Message-State: AOAM5327cUIKfrl9+42H5OV1Hpl9gPu5RJl6XOPZr0lC9x+Mqr8l2Hv0
 MXF9CYDQ0S5Zb3P/hTZxK/svqDnGjseyeEQWkaE=
X-Google-Smtp-Source: ABdhPJzzj1yYj1U/ZCf95+Q2ORWnAZ+lygEjLDT7captY+3H5kw2r+KzelfwvLYQjScnf26pKt+qpkoPFsnNPuoqAI4=
X-Received: by 2002:a9d:2646:: with SMTP id a64mr7514251otb.107.1594805598066; 
 Wed, 15 Jul 2020 02:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <1594722055-9298-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594722055-9298-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594722055-9298-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2020 11:33:07 +0200
Message-ID: <CAMuHMdWOgYkWNj0UTUvqi_8O5tKf6NOc61RpEyNWoJPxeC_rqw@mail.gmail.com>
Subject: Re: [PATCH 1/2] iommu/ipmmu-vmsa: Hook up R8A774E1 DT matching code
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
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

On Tue, Jul 14, 2020 at 12:21 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Add support for RZ/G2H (R8A774E1) SoC IPMMUs.
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
