Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1712D2209AE
	for <lists.iommu@lfdr.de>; Wed, 15 Jul 2020 12:19:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C618C891EA;
	Wed, 15 Jul 2020 10:19:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TJUQ9ugg4sME; Wed, 15 Jul 2020 10:19:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4830B891D9;
	Wed, 15 Jul 2020 10:19:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 31F2FC0733;
	Wed, 15 Jul 2020 10:19:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AE98CC0733
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jul 2020 10:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AAD8A891D9
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jul 2020 10:19:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fweFv2_wxaEu for <iommu@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:19:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oo1-f67.google.com (mail-oo1-f67.google.com
 [209.85.161.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1033A88855
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jul 2020 10:19:10 +0000 (UTC)
Received: by mail-oo1-f67.google.com with SMTP id t6so357742ooh.4
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jul 2020 03:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NAkHhGCBdih32hqt76V0j8Veg+fQ7FChhZOK219jyyg=;
 b=MIKRbvPZV4J46raS6/fs16pafuPbg8ldhzFRa6vpCsq8u/vgs5A05CHM/OTP37MF4f
 cTIMnbMca0oUYyQ7idj7vxYF6YhCDjDbsTrafCNIGS8x5rN8raHAsbdqZypYuTYjV9fQ
 twmZBMki4qdPrbftR63meIb3IGWaE49FdseZWCzMhJ8mmQPasTBxim1jYxR3YN6iK/yQ
 ibaUFe1z8sHrEr5obkfQ/usQqUQ3D+DeUJJCKDRE+dM/HqtVuZKHFaMcmVUEzyVtjkej
 hX36x0doKJ8AjFt1qBEz1IOUpsilVNo8OAbUesHob9LvuF8xNgQuKOY1qyDIGo6nhkcW
 /Z7Q==
X-Gm-Message-State: AOAM533JAZnnQiUfRdXrJzOgLJKaJpmsAU2ZjZ2FY5UomMD8ZBLmPIto
 QuK7Qoq9BjgD11pLdWrJU7YdhBKnA43lbVzI8WM=
X-Google-Smtp-Source: ABdhPJwSAaZJfpGKxkLLTXuhq5d9bq9sTol7NAMegIgcAukEn+36YLrrN0ajD7D+Vfxo36peiJOo78hXGiX/3pGPC7k=
X-Received: by 2002:a4a:9552:: with SMTP id n18mr8646494ooi.1.1594808349233;
 Wed, 15 Jul 2020 03:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <1594676120-5862-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594676120-5862-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594676120-5862-4-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2020 12:18:58 +0200
Message-ID: <CAMuHMdUH4yVek8Fn2z1xneTS0Y_vkMv+w7VwEDJvCUXR9qVQRw@mail.gmail.com>
Subject: Re: [PATCH 3/9] arm64: dts: renesas: r8a774e1: Add IPMMU device nodes
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
> Add RZ/G2H (R8A774E1) IPMMU nodes.
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
