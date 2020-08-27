Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EE90225503E
	for <lists.iommu@lfdr.de>; Thu, 27 Aug 2020 22:55:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9B92A86490;
	Thu, 27 Aug 2020 20:55:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Fu0MedKD6au; Thu, 27 Aug 2020 20:55:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 79C8F863AE;
	Thu, 27 Aug 2020 20:55:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56FB2C0891;
	Thu, 27 Aug 2020 20:55:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BBE46C0051
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 19:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A445687E60
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 19:55:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4pbmfN3BgkwF for <iommu@lists.linux-foundation.org>;
 Thu, 27 Aug 2020 19:55:40 +0000 (UTC)
X-Greylist: delayed 00:25:16 by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DA30E87D9C
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 19:55:39 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id q21so4797591edv.1
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 12:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V0nv7wQoHFBDfCKea743Tg8u0187UBuuLmeycLCt9IE=;
 b=FrpUZP/youjPCtKM9LqQKI6rWq/hmeX+PYpwaZCE58MOs9aULbEOUD4Iz6rJOV9v86
 kzMmDQCn52Ev45YGSetnAY0Zm7bYPpoVb1ZDDxrGQ7IVOnwAt/v/76ct3LJCAOm0LjYs
 t+lHPbwV5vlIeg3D3P29PjAeS807e1JZrOYtTkXUIScqDeAk1oZKWXnMuL9lQYTsQRg7
 Qs17+Og1AY2RfXqoDXhpDyjUr+UD5+p4KKOtLn3B9ZubRDpXluQW5i2GTfFHaCUFIV6T
 Plx3KsGr4Ctbdrr2snVE0YWdOkp0m/vKoxw1hDKbo4gpWES/+w0F4NRMcoYvSSomc6ny
 X83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V0nv7wQoHFBDfCKea743Tg8u0187UBuuLmeycLCt9IE=;
 b=cLfoZ7gAi9CVfx9gx9qgq7d4GPYYsyRSSHptiqCNE0oboDV5cSNtnQzLZV2Csv4WcN
 d3SoPph65teE7idZymia4HBo2sxZMkOXYY7FfwZ0jRgHtsJwEIkRhQrnkZ63QWgQpA4u
 BofVSBePy1O+MhcZfdABczaSJ10s1uJ5ae7Y8c49eRf6YRSud6dBonjLop9Xcv51f9yp
 sHqBhb98sjfiBKbGZcfcJQ+Q3QIts5iWPaECi/NZvL6E7gYbLfi1qgcPVZo7dFn4abAX
 g9OPqapjulQWJp/+t2gcihKSqEGHd5xN06bNp3jBeVchfq/T68342nsmaXC4mrszNh5a
 atkg==
X-Gm-Message-State: AOAM530GJzgcPaXej6tQtFR9Ezvtp2nV7cXksgBlH70bMiTdrMWCLvRd
 mnH+joZajtFfvs9hk+BxfrB8u1EkSMESIbQ8QE6RFOVfnIc=
X-Google-Smtp-Source: ABdhPJxrUFTaTtdB3uET/8l/a6XdYU2SNVMC86F8LwhWn6NZzuQLhDwt1HrAbXd+AGqTmGHN1IUW2aCKfRrjVA8PDWU=
X-Received: by 2002:a50:d809:: with SMTP id o9mr20639212edj.12.1598556621415; 
 Thu, 27 Aug 2020 12:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <1594676120-5862-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594676120-5862-7-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8tZAp_oTpG2MsdC47TtGP7=oM6CubCnjBoR6UhV4=opNg@mail.gmail.com>
In-Reply-To: <CA+V-a8tZAp_oTpG2MsdC47TtGP7=oM6CubCnjBoR6UhV4=opNg@mail.gmail.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Thu, 27 Aug 2020 21:30:10 +0200
Message-ID: <CAMpxmJWv=hTgbMLSVFm=C_5qSpo=BvOByW=B+BEEzTPswXfZzQ@mail.gmail.com>
Subject: Re: [PATCH 6/9] dt-bindings: gpio: renesas,
 rcar-gpio: Add r8a774e1 support
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
X-Mailman-Approved-At: Thu, 27 Aug 2020 20:55:07 +0000
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 netdev <netdev@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 dmaengine <dmaengine@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 LKML <linux-kernel@vger.kernel.org>
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

On Thu, Aug 27, 2020 at 6:40 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Linus and Bartosz,
>
> On Mon, Jul 13, 2020 at 10:35 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> >
> > Document Renesas RZ/G2H (R8A774E1) GPIO blocks compatibility within the
> > relevant dt-bindings.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> Gentle ping.
>
> Cheers,
> Prabhakar

This doesn't apply on top of v5.9-rc1.

Bart
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
