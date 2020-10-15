Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D3728ED49
	for <lists.iommu@lfdr.de>; Thu, 15 Oct 2020 08:57:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A779488790;
	Thu, 15 Oct 2020 06:56:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MoVo2kMlewqG; Thu, 15 Oct 2020 06:56:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 62DC88858F;
	Thu, 15 Oct 2020 06:56:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F342C0051;
	Thu, 15 Oct 2020 06:56:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6FC46C0051
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 06:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5AFAF2E603
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 06:56:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5b7N7dGhnTYZ for <iommu@lists.linux-foundation.org>;
 Thu, 15 Oct 2020 06:56:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 6A70F2E515
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 06:56:53 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CED1122210
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 06:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602745012;
 bh=/YKH5meqhXiqGDEIZGNk409R+bLKhqPfgct/XJl5aDM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=wGU+BOoEdbTHXxgpwqwqxM0UWmmFERna3W34CT4PnyVYRuo9ovV/aHiXSY/H9hlF5
 lOZYFzidCNP2hCoYx10HVWO3EuAxTF6xNab4uu4md5uyVYzXyVkvnXfIRGeHy5PfgE
 8QJf8kutl1NqiKseS6h8oSp0HNcNIPC617T8Zg/E=
Received: by mail-ot1-f52.google.com with SMTP id t15so2027697otk.0
 for <iommu@lists.linux-foundation.org>; Wed, 14 Oct 2020 23:56:52 -0700 (PDT)
X-Gm-Message-State: AOAM532ROPOC43lRnTbU9JUUL5Qn/7xtogWX8lqfMu+hJxfRo7zvRj0p
 X38xxQ3lBxJJiKKezqLjn7X6VXsxebgNfFd+So4=
X-Google-Smtp-Source: ABdhPJybOoY+mO/nEnFh3limcLTJvKxYdzD3nOrYwJKYP1LxI1gvd68IyrTKREOBe2vGTnarzIy1mGtBNPNgzjzm/u4=
X-Received: by 2002:a05:6830:4028:: with SMTP id
 i8mr1614345ots.90.1602745011933; 
 Wed, 14 Oct 2020 23:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <20201014191211.27029-1-nsaenzjulienne@suse.de>
 <20201014191211.27029-4-nsaenzjulienne@suse.de>
 <CAL_JsqKMGSCTmKF2Lt8GQFx0DVFFH1bLVBw=bRDM7upahGvKDQ@mail.gmail.com>
In-Reply-To: <CAL_JsqKMGSCTmKF2Lt8GQFx0DVFFH1bLVBw=bRDM7upahGvKDQ@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 15 Oct 2020 08:56:40 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFnLEpNTZVq16YgBomkZwwdGsH89OSELsYeiee4P+GLPg@mail.gmail.com>
Message-ID: <CAMj1kXFnLEpNTZVq16YgBomkZwwdGsH89OSELsYeiee4P+GLPg@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] of/address: Introduce of_dma_get_max_cpu_address()
To: Rob Herring <robh+dt@kernel.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jeremy Linton <jeremy.linton@arm.com>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>
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

On Thu, 15 Oct 2020 at 00:03, Rob Herring <robh+dt@kernel.org> wrote:
>
> On Wed, Oct 14, 2020 at 2:12 PM Nicolas Saenz Julienne
> <nsaenzjulienne@suse.de> wrote:
> >
> > Introduce of_dma_get_max_cpu_address(), which provides the highest CPU
> > physical address addressable by all DMA masters in the system. It's
> > specially useful for setting memory zones sizes at early boot time.
> >
> > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> >
> > ---
> >
> > Changes since v2:
> >  - Use PHYS_ADDR_MAX
> >  - return phys_dma_t
> >  - Rename function
> >  - Correct subject
> >  - Add support to start parsing from an arbitrary device node in order
> >    for the function to work with unit tests
> >
> >  drivers/of/address.c | 42 ++++++++++++++++++++++++++++++++++++++++++
> >  include/linux/of.h   |  7 +++++++
> >  2 files changed, 49 insertions(+)
> >
> > diff --git a/drivers/of/address.c b/drivers/of/address.c
> > index eb9ab4f1e80b..b5a9695aaf82 100644
> > --- a/drivers/of/address.c
> > +++ b/drivers/of/address.c
> > @@ -1024,6 +1024,48 @@ int of_dma_get_range(struct device_node *np, const struct bus_dma_region **map)
> >  }
> >  #endif /* CONFIG_HAS_DMA */
> >
> > +/**
> > + * of_dma_get_max_cpu_address - Gets highest CPU address suitable for DMA
> > + * @np: The node to start searching from or NULL to start from the root
> > + *
> > + * Gets the highest CPU physical address that is addressable by all DMA masters
> > + * in the system (or subtree when np is non-NULL). If no DMA constrained device
> > + * is found, it returns PHYS_ADDR_MAX.
> > + */
> > +phys_addr_t __init of_dma_get_max_cpu_address(struct device_node *np)
> > +{
> > +       phys_addr_t max_cpu_addr = PHYS_ADDR_MAX;
>
> One issue with using phys_addr_t is it may be 32-bit even though the
> DT is 64-bit addresses. LPAE capable system with LPAE disabled. Maybe
> the truncation is fine here? Maybe not.
>

PHYS_ADDR_MAX is the max addressable CPU address on the system, and so
it makes sense to use it for the return type, and for the preliminary
return value: this is actually what /prevents/ truncation, because we
will only overwrite max_cpu_addr if the new u64 value is lower.


> > +       struct of_range_parser parser;
> > +       phys_addr_t subtree_max_addr;
> > +       struct device_node *child;
> > +       phys_addr_t cpu_end = 0;
> > +       struct of_range range;
> > +       const __be32 *ranges;
> > +       int len;
> > +
> > +       if (!np)
> > +               np = of_root;
> > +
> > +       ranges = of_get_property(np, "dma-ranges", &len);
>
> I'm not really following why you changed the algorithm here. You're
> skipping disabled nodes which is good. Was there some other reason?
>
> > +       if (ranges && len) {
> > +               of_dma_range_parser_init(&parser, np);
> > +               for_each_of_range(&parser, &range)
> > +                       if (range.cpu_addr + range.size > cpu_end)
> > +                               cpu_end = range.cpu_addr + range.size;
> > +
> > +               if (max_cpu_addr > cpu_end)
> > +                       max_cpu_addr = cpu_end;
> > +       }
> > +
> > +       for_each_available_child_of_node(np, child) {
> > +               subtree_max_addr = of_dma_get_max_cpu_address(child);
> > +               if (max_cpu_addr > subtree_max_addr)
> > +                       max_cpu_addr = subtree_max_addr;
> > +       }
> > +
> > +       return max_cpu_addr;
> > +}
> > +
> >  /**
> >   * of_dma_is_coherent - Check if device is coherent
> >   * @np:        device node
> > diff --git a/include/linux/of.h b/include/linux/of.h
> > index 481ec0467285..db8db8f2c967 100644
> > --- a/include/linux/of.h
> > +++ b/include/linux/of.h
> > @@ -558,6 +558,8 @@ int of_map_id(struct device_node *np, u32 id,
> >                const char *map_name, const char *map_mask_name,
> >                struct device_node **target, u32 *id_out);
> >
> > +phys_addr_t of_dma_get_max_cpu_address(struct device_node *np);
> > +
> >  #else /* CONFIG_OF */
> >
> >  static inline void of_core_init(void)
> > @@ -995,6 +997,11 @@ static inline int of_map_id(struct device_node *np, u32 id,
> >         return -EINVAL;
> >  }
> >
> > +static inline phys_addr_t of_dma_get_max_cpu_address(struct device_node *np)
> > +{
> > +       return PHYS_ADDR_MAX;
> > +}
> > +
> >  #define of_match_ptr(_ptr)     NULL
> >  #define of_match_node(_matches, _node) NULL
> >  #endif /* CONFIG_OF */
> > --
> > 2.28.0
> >
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
