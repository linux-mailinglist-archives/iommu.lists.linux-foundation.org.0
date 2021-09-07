Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BE940402377
	for <lists.iommu@lfdr.de>; Tue,  7 Sep 2021 08:34:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2D7BE404C4;
	Tue,  7 Sep 2021 06:34:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TqFX1vmbIrUQ; Tue,  7 Sep 2021 06:34:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1D167404BF;
	Tue,  7 Sep 2021 06:34:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB534C001D;
	Tue,  7 Sep 2021 06:34:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F43DC000D
 for <iommu@lists.linux-foundation.org>; Tue,  7 Sep 2021 06:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89A2F606F3
 for <iommu@lists.linux-foundation.org>; Tue,  7 Sep 2021 06:34:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id upN4qmykoGBn for <iommu@lists.linux-foundation.org>;
 Tue,  7 Sep 2021 06:34:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com
 [209.85.217.52])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50B6860B90
 for <iommu@lists.linux-foundation.org>; Tue,  7 Sep 2021 06:34:03 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id n63so7367219vsc.11
 for <iommu@lists.linux-foundation.org>; Mon, 06 Sep 2021 23:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lAwq8Kz5BJXWbXAWWXg3GICCVqYgfs6fTC+WHIAPs0s=;
 b=uFuGNmvFJb6liXEcfG5UBzM9J3dkRn9+PAwzyEmzaQzdXOh/eYRkyVLPRiAqI0eKRR
 +egI+IeCFXTO1j4oBa0D3EG49orVuFk0n/bj0dFPRvj581rfFDTiqX6rljZQblbCg3/n
 RjpcE7hpW/8sY4QKOsE+Ypk3TI2P8ukSVXFEfBPRJsuGfhfYChp7XidUz2oZ7b9kFiUT
 uRHgta/GmTL5xehps1GYrCUmNPSS34BxRJsHskoH7lSqEwtoxENbLLDAP0nnH6qEDZCO
 QYEs9xMt9dDLSG+WDD9m1XFE/axAdWdUfKCsOX6lvbVldyLBXM1OQWEJCSuIw9ZTHuhp
 kAUA==
X-Gm-Message-State: AOAM530136zVCPyEXNev4U4v1sGiqPk+xzvyhJ2ZDVSLSraKpCnFN9gG
 J/SO39apSNvM2/6Y8oJmxpFFK6Qe7NjOYua0OzM=
X-Google-Smtp-Source: ABdhPJyhRtaiWCrjRuNpcglvcFY1ZGVwAt5Lheu+GacCJU9O2eHayMbrzMBfznNEFWckfOmf2dCY6YCuoJZHhFeHsWU=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr8064800vsl.9.1630996442148;
 Mon, 06 Sep 2021 23:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210901102705.556093-1-yoshihiro.shimoda.uh@renesas.com>
 <20210901102705.556093-3-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdXwf0_+VKfuiFQf6roZErz-JAm06P5RBzD-Jwm1uk=p9A@mail.gmail.com>
 <TY2PR01MB36928CB43B188D4082829A1FD8D39@TY2PR01MB3692.jpnprd01.prod.outlook.com>
In-Reply-To: <TY2PR01MB36928CB43B188D4082829A1FD8D39@TY2PR01MB3692.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Sep 2021 08:33:50 +0200
Message-ID: <CAMuHMdVmkJqiK3XB3s_ibnqy9SUSUFW6mny+kefOYaWi9Ce-4g@mail.gmail.com>
Subject: Re: [PATCH 2/2] iommu/ipmmu-vmsa: Add support for r8a779a0
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>
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

Hi Shimoda-san,

On Tue, Sep 7, 2021 at 2:02 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Tuesday, September 7, 2021 12:34 AM
> > On Wed, Sep 1, 2021 at 12:27 PM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > Add support for r8a779a0 (R-Car V3U). The IPMMU hardware design
> > > of this SoC differs than others. So, add a new ipmmu_features for it.
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> >
> > > --- a/drivers/iommu/ipmmu-vmsa.c
> > > +++ b/drivers/iommu/ipmmu-vmsa.c
> >
> > > @@ -922,6 +922,20 @@ static const struct ipmmu_features ipmmu_features_rcar_gen3 = {
> > >         .utlb_offset_base = 0,
> > >  };
> > >
> > > +static const struct ipmmu_features ipmmu_features_r8a779a0 = {
> > > +       .use_ns_alias_offset = false,
> > > +       .has_cache_leaf_nodes = true,
> > > +       .number_of_contexts = 8,
> >
> > Shouldn't this be 16?
> > Or do you plan to add support for more than 8 contexts later, as that
> > would require increasing IPMMU_CTX_MAX, and updating ipmmu_ctx_reg()
> > to handle the second bank of 8 contexts?
>
> I would like to add support for more than 8 contexts later because
> I realized that ctx_offset_{base,stride} are not suitable for the second bank
> of 8 contexts...

Wouldn't something like below be sufficient?

 static unsigned int ipmmu_ctx_reg(struct ipmmu_vmsa_device *mmu,
                                  unsigned int context_id, unsigned int reg)
 {
-       return mmu->features->ctx_offset_base +
-              context_id * mmu->features->ctx_offset_stride + reg;
+       unsigned int base = mmu->features->ctx_offset_base;
+
+       if (context_id > 7)
+               base += 0x800 - 8 * 0x1040;
+
+       return base + context_id * mmu->features->ctx_offset_stride + reg;
 }

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
