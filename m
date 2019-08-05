Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AA56082584
	for <lists.iommu@lfdr.de>; Mon,  5 Aug 2019 21:23:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8CE93E7A;
	Mon,  5 Aug 2019 19:23:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BFFFDE2E
	for <iommu@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 19:23:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4BDEA5E4
	for <iommu@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 19:23:18 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
	[209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E871C214C6
	for <iommu@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 19:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565032998;
	bh=d6p6NWXIzAr/w+L57W8Oyrx5VdZnumUCXtu9FxtaNsc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=R/AKCL41e439d3YyW9Frd8+LqZmY/L/BTeDfKJwCw0IYn+fId94XDv2wn7Pml91f9
	dnKXgXpHTXeFphyc7/df75+ieHN1KnS+kSCTZqgR9c8Gkj9yb5S930ddLj/+yapLMz
	2x3mqfxdOrcNQAQnSXJqYUrWF68Oxa6/5KI536WM=
Received: by mail-qk1-f173.google.com with SMTP id w190so60987489qkc.6
	for <iommu@lists.linux-foundation.org>;
	Mon, 05 Aug 2019 12:23:17 -0700 (PDT)
X-Gm-Message-State: APjAAAVOP62c5NDda4rvhJnlBRRVNNnf27v0YbN55rjcKQ7PVxkbidIE
	TarRVZHYVJO/4TF1VcI+YWfr1OrNt4ZbiTBMOQ==
X-Google-Smtp-Source: APXvYqzJ3385dVDr7a416MCnVTqPVutjB6pJSnn10jB+T3hVVAIomIypEjVR/sntYZAAkaMyD0seP3rNxE7IslWzcJM=
X-Received: by 2002:a37:6944:: with SMTP id e65mr95063738qkc.119.1565032997083;
	Mon, 05 Aug 2019 12:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190731154752.16557-1-nsaenzjulienne@suse.de>
	<20190731154752.16557-4-nsaenzjulienne@suse.de>
	<CAL_JsqKF5nh3hcdLTG5+6RU3_TnFrNX08vD6qZ8wawoA3WSRpA@mail.gmail.com>
	<2050374ac07e0330e505c4a1637256428adb10c4.camel@suse.de>
In-Reply-To: <2050374ac07e0330e505c4a1637256428adb10c4.camel@suse.de>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 5 Aug 2019 13:23:05 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+LjsRmFg-xaLgpVx3miXN3hid3aD+mgTW__j0SbEFYjQ@mail.gmail.com>
Message-ID: <CAL_Jsq+LjsRmFg-xaLgpVx3miXN3hid3aD+mgTW__j0SbEFYjQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] of/fdt: add function to get the SoC wide DMA
	addressable memory size
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: phill@raspberryi.org, devicetree@vger.kernel.org,
	"moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
	<linux-rpi-kernel@lists.infradead.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Will Deacon <will@kernel.org>, Eric Anholt <eric@anholt.net>,
	Marc Zyngier <marc.zyngier@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Frank Rowand <frowand.list@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-mm@kvack.org, Linux IOMMU <iommu@lists.linux-foundation.org>,
	Matthias Brugger <mbrugger@suse.com>, wahrenst@gmx.net,
	Andrew Morton <akpm@linux-foundation.org>,
	Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Mon, Aug 5, 2019 at 10:03 AM Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> Hi Rob,
> Thanks for the review!
>
> On Fri, 2019-08-02 at 11:17 -0600, Rob Herring wrote:
> > On Wed, Jul 31, 2019 at 9:48 AM Nicolas Saenz Julienne
> > <nsaenzjulienne@suse.de> wrote:
> > > Some SoCs might have multiple interconnects each with their own DMA
> > > addressing limitations. This function parses the 'dma-ranges' on each of
> > > them and tries to guess the maximum SoC wide DMA addressable memory
> > > size.
> > >
> > > This is specially useful for arch code in order to properly setup CMA
> > > and memory zones.
> >
> > We already have a way to setup CMA in reserved-memory, so why is this
> > needed for that?
>
> Correct me if I'm wrong but I got the feeling you got the point of the patch
> later on.

No, for CMA I don't. Can't we already pass a size and location for CMA
region under /reserved-memory. The only advantage here is perhaps the
CMA range could be anywhere in the DMA zone vs. a fixed location.

> > > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> > > ---
> > >
> > >  drivers/of/fdt.c       | 72 ++++++++++++++++++++++++++++++++++++++++++
> > >  include/linux/of_fdt.h |  2 ++
> > >  2 files changed, 74 insertions(+)
> > >
> > > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > > index 9cdf14b9aaab..f2444c61a136 100644
> > > --- a/drivers/of/fdt.c
> > > +++ b/drivers/of/fdt.c
> > > @@ -953,6 +953,78 @@ int __init early_init_dt_scan_chosen_stdout(void)
> > >  }
> > >  #endif
> > >
> > > +/**
> > > + * early_init_dt_dma_zone_size - Look at all 'dma-ranges' and provide the
> > > + * maximum common dmable memory size.
> > > + *
> > > + * Some devices might have multiple interconnects each with their own DMA
> > > + * addressing limitations. For example the Raspberry Pi 4 has the
> > > following:
> > > + *
> > > + * soc {
> > > + *     dma-ranges = <0xc0000000  0x0 0x00000000  0x3c000000>;
> > > + *     [...]
> > > + * }
> > > + *
> > > + * v3dbus {
> > > + *     dma-ranges = <0x00000000  0x0 0x00000000  0x3c000000>;
> > > + *     [...]
> > > + * }
> > > + *
> > > + * scb {
> > > + *     dma-ranges = <0x0 0x00000000  0x0 0x00000000  0xfc000000>;
> > > + *     [...]
> > > + * }
> > > + *
> > > + * Here the area addressable by all devices is [0x00000000-0x3bffffff].
> > > Hence
> > > + * the function will write in 'data' a size of 0x3c000000.
> > > + *
> > > + * Note that the implementation assumes all interconnects have the same
> > > physical
> > > + * memory view and that the mapping always start at the beginning of RAM.
> >
> > Not really a valid assumption for general code.
>
> Fair enough. On my defence I settled on that assumption after grepping all dts
> and being unable to find a board that behaved otherwise.
>
> [...]
>
> > It's possible to have multiple levels of nodes and dma-ranges. You need to
> > handle that case too. Doing that and handling differing address translations
> > will be complicated.
>
> Understood.
>
> > IMO, I'd just do:
> >
> > if (of_fdt_machine_is_compatible(blob, "brcm,bcm2711"))
> >     dma_zone_size = XX;
> >
> > 2 lines of code is much easier to maintain than 10s of incomplete code
> > and is clearer who needs this. Maybe if we have dozens of SoCs with
> > this problem we should start parsing dma-ranges.
>
> FYI that's what arm32 is doing at the moment and was my first instinct. But it
> seems that arm64 has been able to survive so far without any machine specific
> code and I have the feeling Catalin and Will will not be happy about this
> solution. Am I wrong?

No doubt. I'm fine if the 2 lines live in drivers/of/.

Note that I'm trying to reduce the number of early_init_dt_scan_*
calls from arch code into the DT code so there's more commonality
across architectures in the early DT scans. So ideally, this can all
be handled under early_init_dt_scan() call.

Rob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
