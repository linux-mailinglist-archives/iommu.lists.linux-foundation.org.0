Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D32C825BEB2
	for <lists.iommu@lfdr.de>; Thu,  3 Sep 2020 11:55:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 78F8520372;
	Thu,  3 Sep 2020 09:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jm-HK4YqnS31; Thu,  3 Sep 2020 09:55:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5472F20365;
	Thu,  3 Sep 2020 09:55:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33E56C0051;
	Thu,  3 Sep 2020 09:55:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1BFEC0051
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 09:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9D9688737A
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 09:55:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LVNlL-R1-Xbp for <iommu@lists.linux-foundation.org>;
 Thu,  3 Sep 2020 09:55:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AF86687364
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 09:55:23 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id g10so2127178otq.9
 for <iommu@lists.linux-foundation.org>; Thu, 03 Sep 2020 02:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mxd/4nV94gENPbWr5vineBXcIlKgMjAz5Ru6u3+1SJw=;
 b=kLMLQ0A8GgLL043015HB9at8gjNhSoq3jW4yMxPwTd7OSGl/AqvOlyk8K/V+yP49dg
 l8FRwlQyzvQv0HrOU3cfiuIyH8GphVQeJn8IuN0KChgSbX0UXv+fnmsfmQdBFv1Wi4mF
 I0LjkMDG/lEIZEhNv9RErqZg/AAVjSeqg7v7FySpNSu/nDQsGNeUtS6KvMsE5Aq6deib
 04BeVA7ijNP5hxAo5mNni4qyogUx4b5g0w6ycbrptNKjXMMPJDHUuI+ETtcnBKySTrZT
 wSxJTahtpY4N1kK6qqNV6KioW2zvVcAJjoZWkbP2AMr6UlI+R5cV/Q8oAmCxJZPNXTTs
 NxFQ==
X-Gm-Message-State: AOAM530VxlH3mCF+d7vQxpE6fNV1cDbEiv7t1fQZ5+yM1QZi0whylYQw
 82o0hfVfINRXUg+jUPhPLh6JZnPwE1L0zl5koXI=
X-Google-Smtp-Source: ABdhPJyeSRbUKtD7sMTdA7aGWTBEJsisVjdfNr+DMP4gt47zwDTvJkxLTdEJb/z3SByYoU7/hwDepBj6YbI2sQOaBTw=
X-Received: by 2002:a9d:1b62:: with SMTP id l89mr948617otl.145.1599126923013; 
 Thu, 03 Sep 2020 02:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200825141805.27105-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200825141805.27105-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200825141805.27105-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2020 11:55:11 +0200
Message-ID: <CAMuHMdVgO+nkudF_W9oUfqD=Z5dWX2HME5jcTQqA1DsGm3+nrQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: iommu: renesas,
 ipmmu-vmsa: Add r8a7742 support
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>, Prabhakar <prabhakar.csengg@gmail.com>
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

On Tue, Aug 25, 2020 at 4:19 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Document RZ/G1H (R8A7742) SoC bindings.
>
> No driver change is needed due to the fallback compatible value
> "renesas,ipmmu-vmsa".
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

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
