Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A415521EAC8
	for <lists.iommu@lfdr.de>; Tue, 14 Jul 2020 10:00:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1C2C921549;
	Tue, 14 Jul 2020 08:00:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L1-P+k94v2rA; Tue, 14 Jul 2020 08:00:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 45D9526348;
	Tue, 14 Jul 2020 08:00:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 29BF2C0733;
	Tue, 14 Jul 2020 08:00:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 502D5C0891
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 08:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4B19E8AC90
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 08:00:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KuFHYzMcF6ys for <iommu@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 08:00:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CA1928AC93
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 08:00:16 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id y22so13224190oie.8
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 01:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QnTe4sZ/BVwx3aWuIY96pK3amPI3OQSt3QidovW9MDg=;
 b=DSQyFWr0sLMEqX8Xhdwy/DKf29VDSQ+crIELRN3h0euiQL99L1A6yZBwGoE65xrTEA
 5LyvkonTLkWeiIUOtaghczoGyuNXvoHXfFe17/aVCxNQHV0FPAiVB1Y8nYOqIzsdle9E
 CQrVM6NgrYu0g/FWlM1knOTT2a2WJAN16nxt3bqdY0Q35m0HT7FwRalXD9CCyaA77RVN
 S6r8UrPlK2nQDTtn2cuEBKGwqZCeK/iHJnsyM84Cz0Z8RW1f5NzqDPIstBAidYQqr6aq
 zg6MzKVw2CUZqv062+1P2ZtFImBhxYOdWN+ZBN2/wstW3USOfflFogk7YFdYRVvaWkdM
 I+iw==
X-Gm-Message-State: AOAM531cRECLzlnjoQWuhcVlfYFZNI8EmkorKA9HCwxyjnH8ttoaK987
 qPZKhzplaL7EoAkZSKQI6HaSRhh6mRKK9IJJqhQ=
X-Google-Smtp-Source: ABdhPJyzIvtstGtIjvnC0xOdHX2BDAwrtjW5pB4zYT3uHZkIF8+JNHYsqpLcM1Tt8jiPySfbt+KukaiWmW7ArIQFH7w=
X-Received: by 2002:a05:6808:64a:: with SMTP id
 z10mr2722714oih.54.1594713616158; 
 Tue, 14 Jul 2020 01:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <1594676120-5862-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594676120-5862-7-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594676120-5862-7-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Jul 2020 10:00:05 +0200
Message-ID: <CAMuHMdUZx56wWTMdpmXhbvJV6_M=jDhQUVvD6b0-5xU-jrGsAA@mail.gmail.com>
Subject: Re: [PATCH 6/9] dt-bindings: gpio: renesas,
 rcar-gpio: Add r8a774e1 support
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
> Document Renesas RZ/G2H (R8A774E1) GPIO blocks compatibility within the
> relevant dt-bindings.
>
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
