Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 167BD2208E0
	for <lists.iommu@lfdr.de>; Wed, 15 Jul 2020 11:34:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A2C952048C;
	Wed, 15 Jul 2020 09:34:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F7D1fgIB1cW8; Wed, 15 Jul 2020 09:34:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D661C20BF9;
	Wed, 15 Jul 2020 09:34:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8028C08A9;
	Wed, 15 Jul 2020 09:34:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83887C0733
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jul 2020 09:34:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7F7D78AB5A
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jul 2020 09:34:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GdHb4meNiUbb for <iommu@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:34:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 03E6E8AB57
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jul 2020 09:34:09 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id w17so1721674oie.6
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jul 2020 02:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EvU8f9uqtqhKQi1upBV6M7odRgHTJO0NIPiNBIO/iso=;
 b=JTyFksw196OVLw7opP1BUmKw2CdPar63xwM4ZxaOfPgIzdK+HgzdvYXt3jMXMIQMc0
 IRrXt/UTDi0pACCRMjnh6fKZdHnp8RsO9FxwOZKtDKRG5pf3n623+FecKzjq5qORHXUZ
 K8tfKBLS89ebHW/Tw59Gg/miBfoq7Et68VhPBuB1ykmWpYOQqZoSBK6g8Bx62qbrgSas
 vYP5WKGr6Wph5C65j+U0C3TLL4xXOOqB/5iY5/Zji2i9Fmi1PXYBNMpTESN9McPUzpvB
 oG4Zs1R8eCz194txQq4ILEv7YoU6rfFiIqWvWkqSV+qNWV9V6EseRWOkudBqHKoX41iF
 cGpQ==
X-Gm-Message-State: AOAM532S3v8/6ufwYDQgAZ/Ul3cr9riV3+/nOFPFG0+JutfrW52Emy6N
 cjYm11UPksAE/CuCoUjUmaV4HmqC2EO8hRdX9HI=
X-Google-Smtp-Source: ABdhPJy9IvsxtdXlInbx2uqQJkVU+nPkqyYw7WEzAKfjGHtwKAFf4Tb1kkO8UbWyyEt9nm9bbZrbFwjGHDrSB0oKqCc=
X-Received: by 2002:aca:5c41:: with SMTP id q62mr6800166oib.148.1594805648341; 
 Wed, 15 Jul 2020 02:34:08 -0700 (PDT)
MIME-Version: 1.0
References: <1594722055-9298-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594722055-9298-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <1594722055-9298-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2020 11:33:57 +0200
Message-ID: <CAMuHMdXOBVn1HAxN6yB+bv+VtBPs4F4dUwvPZHkLj6Sz7KmRDQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] iommu/ipmmu-vmsa: Add an entry for r8a77961 in
 soc_rcar_gen3[]
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
> Add an entry for r8a77961 in soc_rcar_gen3[] list so that we dont
> enable iommu unconditionally.
>
> Fixes: 17fe161816398 ("iommu/renesas: Add support for r8a77961")
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
