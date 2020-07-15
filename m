Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D01C52209CD
	for <lists.iommu@lfdr.de>; Wed, 15 Jul 2020 12:20:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8F88A891F0;
	Wed, 15 Jul 2020 10:20:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rxJodm601Ptm; Wed, 15 Jul 2020 10:20:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 254A4891E6;
	Wed, 15 Jul 2020 10:20:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E2E4C0733;
	Wed, 15 Jul 2020 10:20:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4213C0733
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jul 2020 10:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A279A891EE
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jul 2020 10:20:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rBitgEIG0rse for <iommu@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:20:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oo1-f65.google.com (mail-oo1-f65.google.com
 [209.85.161.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0751E891E6
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jul 2020 10:20:56 +0000 (UTC)
Received: by mail-oo1-f65.google.com with SMTP id z23so355558ood.8
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jul 2020 03:20:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bQ8og4Y29TXoYrT84mpNUb21SIh4pzwr3Vk3bzaUpgw=;
 b=iIsHX7DW/pPADEyeHkP5uH0JyLrBCfI6aV8IcDaQGAHJ+aYYzywMzeYu0pGj+qUQhC
 /6dmESnS2SbMj3gzhXYx1UUX3DRl0eq5Qgmy49/4DeLQWUVlD18N/5HQcWmp3dgF7aJz
 /Y0hT9fj0XJ+pkbpOaRrEH4/0jrVIm7+rXJpVVft2LwSwrBP2aCuNC+35b7RRv/YUMfh
 CCRiOu2mBt9tKBz01LLS1qXUP2YOVo1Va5xQg2m9wbBnqqsEBw7WNzj6oXtKaz5C+5T/
 QU1e81wnKPDZB4P2sSiVZ+BL6T03TPdfqqAekpRkoCT4ZWbYqIMjD1GitZoiptcf+wzG
 7Qmg==
X-Gm-Message-State: AOAM531Hbt17SiQFlGdYqmXJUje5AM5LOpQTqlO0On44vPzVhO/a130a
 FkWpyrKZKnY825T88IFAyjDmff7C9inavkDdLBE=
X-Google-Smtp-Source: ABdhPJyb4SMwBgCFiNmagYeq0Muv3wO8z33UP0pKZzErUJ07FKnvbqzYlypWRcKQX2l2bgobbQLJvYCZywzLmfV6Mbk=
X-Received: by 2002:a4a:5209:: with SMTP id d9mr8763133oob.40.1594808455307;
 Wed, 15 Jul 2020 03:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <1594676120-5862-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594676120-5862-6-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594676120-5862-6-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2020 12:20:44 +0200
Message-ID: <CAMuHMdVsYmi1ixBrk=gfgnsfC=MHDagXJKUTyGr14xxhHh-Jkg@mail.gmail.com>
Subject: Re: [PATCH 5/9] arm64: dts: renesas: r8a774e1: Add SYS-DMAC device
 nodes
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

On Mon, Jul 13, 2020 at 11:35 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Add sys-dmac[0-2] device nodes for RZ/G2H (R8A774E1) SoC.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.9.

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
