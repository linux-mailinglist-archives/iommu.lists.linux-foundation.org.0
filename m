Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A27D280835
	for <lists.iommu@lfdr.de>; Thu,  1 Oct 2020 22:02:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C541E87388;
	Thu,  1 Oct 2020 20:02:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NAzJ5RACTFtZ; Thu,  1 Oct 2020 20:02:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 24D4F8735C;
	Thu,  1 Oct 2020 20:02:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C727C0051;
	Thu,  1 Oct 2020 20:02:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C5C6C0051
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 20:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9819B8734B
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 20:02:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1q8t91f7w54F for <iommu@lists.linux-foundation.org>;
 Thu,  1 Oct 2020 20:02:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CAD03872F7
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 20:02:17 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 38B2120848
 for <iommu@lists.linux-foundation.org>; Thu,  1 Oct 2020 20:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601582537;
 bh=X4GALR0/qFK5SmDexVvDnxfl0R4yatvYbaVfr1S5mhE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fv2G+gwnjbVlRGYvDBilOq2DE7yzKzzO8czOj6nHOIlOG/mHWnM7eMS0UnhsKFGj6
 5AGtaofc2zEU0GXPaYgpbm0rXI6BhjbEqKIFlupL502zynstjccnTSOGevRhvnrbja
 rxmA+KojicON0YDUGZ3jAjfkhYmrmY3culfbV5qQ=
Received: by mail-ot1-f54.google.com with SMTP id a13so3964904otl.13
 for <iommu@lists.linux-foundation.org>; Thu, 01 Oct 2020 13:02:17 -0700 (PDT)
X-Gm-Message-State: AOAM533MTtEnMkTY9nkjxALBlaSY+NCiBsjEXjquLPUuVuJnFjRLDCmX
 mMlH9DvKtTIJeq4BxwMfhzs1UA9FdCg993V7MQ==
X-Google-Smtp-Source: ABdhPJxiEDxZ0FgXOi5cEGTxp8JWRcCOqobBw1qQ2DkZLAGugxsEI/6ZnBC1AlXUEf9at/4YzkBjFq5m7bNvdiq3ow4=
X-Received: by 2002:a05:6830:1008:: with SMTP id
 a8mr5715034otp.107.1601582536474; 
 Thu, 01 Oct 2020 13:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201001161740.29064-1-nsaenzjulienne@suse.de>
 <20201001161740.29064-2-nsaenzjulienne@suse.de> <20201001171500.GN21544@gaia>
 <20201001172320.GQ21544@gaia>
 <b47232e2173e9e5ddf8f5be4c7b5a2f897f34eb7.camel@suse.de>
In-Reply-To: <b47232e2173e9e5ddf8f5be4c7b5a2f897f34eb7.camel@suse.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 1 Oct 2020 15:02:05 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKS8-QTDEMmAahbOG6hay5kAYAUwhH04-U2hycxhFc6yw@mail.gmail.com>
Message-ID: <CAL_JsqKS8-QTDEMmAahbOG6hay5kAYAUwhH04-U2hycxhFc6yw@mail.gmail.com>
Subject: Re: [PATCH 1/4] of/fdt: Update zone_dma_bits when running in bcm2711
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, Linux IOMMU <iommu@lists.linux-foundation.org>,
 "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>
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

On Thu, Oct 1, 2020 at 12:31 PM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> On Thu, 2020-10-01 at 18:23 +0100, Catalin Marinas wrote:
> > On Thu, Oct 01, 2020 at 06:15:01PM +0100, Catalin Marinas wrote:
> > > Hi Nicolas,
> > >
> > > Thanks for putting this together.
> > >
> > > On Thu, Oct 01, 2020 at 06:17:37PM +0200, Nicolas Saenz Julienne wrote:
> > > > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > > > index 4602e467ca8b..cd0d115ef329 100644
> > > > --- a/drivers/of/fdt.c
> > > > +++ b/drivers/of/fdt.c
> > > > @@ -25,6 +25,7 @@
> > > >  #include <linux/serial_core.h>
> > > >  #include <linux/sysfs.h>
> > > >  #include <linux/random.h>
> > > > +#include <linux/dma-direct.h>    /* for zone_dma_bits */
> > > >
> > > >  #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
> > > >  #include <asm/page.h>
> > > > @@ -1198,6 +1199,14 @@ void __init early_init_dt_scan_nodes(void)
> > > >   of_scan_flat_dt(early_init_dt_scan_memory, NULL);
> > > >  }
> > > >
> > > > +void __init early_init_dt_update_zone_dma_bits(void)
> > > > +{
> > > > + unsigned long dt_root = of_get_flat_dt_root();
> > > > +
> > > > + if (of_flat_dt_is_compatible(dt_root, "brcm,bcm2711"))
> > > > +         zone_dma_bits = 30;
> > > > +}
> > >
> > > I think we could keep this entirely in the arm64 setup_machine_fdt() and
> > > not pollute the core code with RPi4-specific code.
> >
> > Actually, even better, could we not move the check to
> > arm64_memblock_init() when we initialise zone_dma_bits?
>
> I did it this way as I vaguely remembered Rob saying he wanted to centralise
> all early boot fdt code in one place. But I'll be happy to move it there.

Right, unless zone_dma_bits is only an arm64 thing, then this doesn't
really have anything arch specific.

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
