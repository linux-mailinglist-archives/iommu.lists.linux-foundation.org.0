Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E7725BEBD
	for <lists.iommu@lfdr.de>; Thu,  3 Sep 2020 12:00:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 82E8C86C43;
	Thu,  3 Sep 2020 10:00:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6bUpSo59544R; Thu,  3 Sep 2020 10:00:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 17D9C86C40;
	Thu,  3 Sep 2020 10:00:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 01FB4C0051;
	Thu,  3 Sep 2020 10:00:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA161C0051
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 10:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BEC6622794
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 10:00:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T9fj7jZgnTrg for <iommu@lists.linux-foundation.org>;
 Thu,  3 Sep 2020 10:00:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by silver.osuosl.org (Postfix) with ESMTPS id C2FB120384
 for <iommu@lists.linux-foundation.org>; Thu,  3 Sep 2020 10:00:29 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id y6so2524505oie.5
 for <iommu@lists.linux-foundation.org>; Thu, 03 Sep 2020 03:00:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mgYaYGC3ojTelgFnOtK4v8Dyf8XahmWDS67jYiDWXRA=;
 b=An/3oUhm2gGQZ1fP6ffyoplE9XJ5GIx4XKFD9aKTT8bU8PM6jwSKw9SRcQtUgE0Y63
 qSYtIpkv3Jm5gWpSMpifmqwEmuIuXRRs9pTOhqQGdkRadbxXN2eWeUE9gdXUSkNLpln6
 7+KAc+Wodv4AsCtz7DmGpYFLYHx5KK9hj7uvmQxc0jrxgaknHp4tIOdc1cooyPDcUScg
 pTkQseMuA/pPBdNkAZi+ZoUYuUzdRLxb6uKyz/pLn80YT/EAkXPMhCMwO0KYNha/QH3T
 xzKOciFEpvUaoYvPsfsP+ppFbVcbSRSIrpq8g19sHny8qo2BWGgMwJh1VlRQ0GQfWQ2K
 F9zw==
X-Gm-Message-State: AOAM5326Hd9SE329vD9l62CCG1gbtmOBgceHAfY+xxdhg1eve8aQKGJM
 TWyazeyBo1hU9BjxS7UQ84GvzMDIgBGyIajVlmY=
X-Google-Smtp-Source: ABdhPJwmLdHx01AD755Jgre3UgFbpmDx/mSdwFp5oQt7G1+aRwIESCE9jmJ23xCxXt4Oet3E+o9KRL44uk3r0mmoGF0=
X-Received: by 2002:aca:3402:: with SMTP id b2mr1420509oia.153.1599127229093; 
 Thu, 03 Sep 2020 03:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200825141805.27105-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200825141805.27105-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200825141805.27105-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2020 12:00:18 +0200
Message-ID: <CAMuHMdWGGZvefDMTE86Ererkxu25JkpnKTpLj53pRYfbMTU2+Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: r8a7742: Add IPMMU DT nodes
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
> Add the five IPMMU instances found in the r8a7742 to DT with a disabled
> status.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.10.

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
