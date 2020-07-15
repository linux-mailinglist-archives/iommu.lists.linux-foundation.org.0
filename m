Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D7D2209D5
	for <lists.iommu@lfdr.de>; Wed, 15 Jul 2020 12:21:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6171288455;
	Wed, 15 Jul 2020 10:21:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xdKq+GedRtDA; Wed, 15 Jul 2020 10:21:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 64FA7884CF;
	Wed, 15 Jul 2020 10:21:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C912C0733;
	Wed, 15 Jul 2020 10:21:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 385ECC0733
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jul 2020 10:21:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 21C8C88126
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jul 2020 10:21:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tw3wbpgTz-pT for <iommu@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:21:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DB597879B1
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jul 2020 10:21:32 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id t198so1796908oie.7
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jul 2020 03:21:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6inM0ocEyZQ5HchWw8zVdrmAmJqjlnWoNUy7SfSkBcE=;
 b=D05KaMh6tDYZpt79p/tsE4Ed7gsVzXZSPPS8TnW6Uu2bDJ2JfehlQcF8omuOio8ic8
 rZzO7kwTMfY1IhA2e3lktEbJRWD2H57QbSPZiqc/VhLvsyhYcJEaAaRn7uJfGKK8238k
 54rQW0De2q2+EW/8N464qLCSuQFKqDR0+ilG8/kbLgK7b452CUXg1BHx1iFLHMy9oBIp
 hB8tFZn7v7J74z6ZSghgHcnqUvN+8BwFyY01hP2yglqazkOm+nQS7d+H0BpUGc8CQSbJ
 r4HIsNzv6kMTdVf1941n4S05lOVJPJHqUasH/SRNJ6Y9UjoZkyBMamTb+tOJxP3Kgv/L
 6T7Q==
X-Gm-Message-State: AOAM533hPrLH0hFrIWZPCcG1IZ585kSmtqodbwFQmn/Z2buM2lGdJA6h
 9/m1p9zpWHaYr2ecqYtSBQHkRIpNpz3KQUirzFc=
X-Google-Smtp-Source: ABdhPJxYdI5rswCbbqKyGuRp4F+uj/OCEoqH521lJ2O2n+yEpcXSA2cgisjpKCexy5j/wlDx5/JSDUabZJAJaHhTISE=
X-Received: by 2002:a05:6808:64a:: with SMTP id
 z10mr7225247oih.54.1594808492194; 
 Wed, 15 Jul 2020 03:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <1594676120-5862-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594676120-5862-8-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594676120-5862-8-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2020 12:21:21 +0200
Message-ID: <CAMuHMdV4w75-CNiamJo_nxHBA2kugQj58edPYDh_dx-PN4Vx-w@mail.gmail.com>
Subject: Re: [PATCH 7/9] arm64: dts: renesas: r8a774e1: Add GPIO device nodes
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
> Add GPIO device nodes to the DT of the r8a774e1 SoC.
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
