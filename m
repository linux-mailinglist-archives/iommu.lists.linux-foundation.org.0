Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F34201E85C9
	for <lists.iommu@lfdr.de>; Fri, 29 May 2020 19:51:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8D94725F8B;
	Fri, 29 May 2020 17:51:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SsCpW4a773N9; Fri, 29 May 2020 17:51:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 54C9322699;
	Fri, 29 May 2020 17:51:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21A3EC016F;
	Fri, 29 May 2020 17:51:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A3B8EC016F
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 17:51:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 756DC22264
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 17:51:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mphI-idQ+IXd for <iommu@lists.linux-foundation.org>;
 Fri, 29 May 2020 17:51:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 5A4532034C
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 17:51:33 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id l11so4802093wru.0
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 10:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x7+kp26v03K8JoMEQ/WwyjM8KWS07AyG9uk4mKD875Y=;
 b=JAjFOaLgdWIHtR7M+bEQy37Bma9p8ICIbbwAMrC9Z2DM5QKq6OujyCH5iiGerJ1mkx
 A3vnMoiIflpy9/HLR9lWFLsuYE4Rz3idRo4CU5HoI1sQxc4JNeHzUdkSXd2DFO7RCk+c
 KtaDpPiTk6UsxrmM2BXrbqP5/rQTZcuzAUr0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x7+kp26v03K8JoMEQ/WwyjM8KWS07AyG9uk4mKD875Y=;
 b=opGY4NYvByZ39LUXyb8MRgEUPFCahbb2VqLN2lUdIt2hYtCrpErG8CFCizxC3LyQkT
 wYrfMzlqdhZizqg5PcSIL000msdYwarLjOY4u/aJWk70MqGx5jIgyOgvelFFz68lLFFa
 tAru5QhujtxUwoQ4HuSMAI8H8e3K5je8spG5+DMcoKjVqf6mfzQFLTo3DQeT403RUI2E
 SqUCp04xDJLk2t/b5wiLbA2n/SZah1519ASXdjydCxVem9MrpeK509EXEwQFjGFdlOWL
 LabXCW/4CWVXWGiCTALDaMbOAmDltvKnCHvchqcjsjlaniwVLCIpkyDlYVM2BmUoYrtL
 jurg==
X-Gm-Message-State: AOAM531MPrDZ5Qc43y/UNnqLFoJbFq6EOMZNG8WHbnNDrSRpGBhh+nc3
 hAV0NCzNSl59nrRK+Grxdu8XbjgE47kJnOZy4y3KCw==
X-Google-Smtp-Source: ABdhPJzcuAyXyV9Kv024sxV7/Yvl/hv9vDTiOpv3gCDVMqELz0Zp0vuHqDN10USnTMku2E214cOmwcBzpTe6Gh+xoTc=
X-Received: by 2002:adf:ec03:: with SMTP id x3mr9724830wrn.297.1590774691425; 
 Fri, 29 May 2020 10:51:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200526191303.1492-1-james.quinlan@broadcom.com>
 <20200526191303.1492-10-james.quinlan@broadcom.com>
 <59a0b4e1454a8ef4d3e4ebaf55dcbf3dcd2d73a2.camel@suse.de>
 <CA+-6iNyOKvY-xNfXqDRa5_nJVJuqGKA-oe-ejNuJHUBt6ORu0A@mail.gmail.com>
 <CAL_JsqJsxxC6msUXBCa9naitMLfOcVZauk44gPJNGGe3iXRzsA@mail.gmail.com>
In-Reply-To: <CAL_JsqJsxxC6msUXBCa9naitMLfOcVZauk44gPJNGGe3iXRzsA@mail.gmail.com>
Date: Fri, 29 May 2020 13:51:19 -0400
Message-ID: <CA+-6iNy-H=TGuvu4ybODP3PaMtzSMtPdm3WMiPM69fou1qLLcg@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] device core: Add ability to handle multiple dma
 offsets
To: Rob Herring <robh+dt@kernel.org>
Cc: "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 "open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS"
 <linux-pci@vger.kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Corey Minyard <minyard@acm.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Oliver Neukum <oneukum@suse.com>, open list <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
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
From: Jim Quinlan via iommu <iommu@lists.linux-foundation.org>
Reply-To: Jim Quinlan <james.quinlan@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Fri, May 29, 2020 at 1:35 PM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Wed, May 27, 2020 at 9:43 AM Jim Quinlan <james.quinlan@broadcom.com> wrote:
> >
> > Hi Nicolas,
> >
> > On Wed, May 27, 2020 at 11:00 AM Nicolas Saenz Julienne
> > <nsaenzjulienne@suse.de> wrote:
> > >
> > > Hi Jim,
> > > one thing comes to mind, there is a small test suite in drivers/of/unittest.c
> > > (specifically of_unittest_pci_dma_ranges()) you could extend it to include your
> > > use cases.
> > Sure, will check out.
> > >
> > > On Tue, 2020-05-26 at 15:12 -0400, Jim Quinlan wrote:
> > > > The new field in struct device 'dma_pfn_offset_map' is used to facilitate
> > > > the use of multiple pfn offsets between cpu addrs and dma addrs.  It is
> > > > similar to 'dma_pfn_offset' except that the offset chosen depends on the
> > > > cpu or dma address involved.
> > > >
> > > > Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
> > > > ---
> > > >  drivers/of/address.c        | 65 +++++++++++++++++++++++++++++++++++--
> > > >  drivers/usb/core/message.c  |  3 ++
> > > >  drivers/usb/core/usb.c      |  3 ++
> > > >  include/linux/device.h      | 10 +++++-
> > > >  include/linux/dma-direct.h  | 10 ++++--
> > > >  include/linux/dma-mapping.h | 46 ++++++++++++++++++++++++++
> > > >  kernel/dma/Kconfig          | 13 ++++++++
> > > >  7 files changed, 144 insertions(+), 6 deletions(-)
> > > >
> > >
> > > [...]
> > >
> > > > @@ -977,10 +1020,19 @@ int of_dma_get_range(struct device *dev, struct
> > > > device_node *np, u64 *dma_addr,
> > > >               pr_debug("dma_addr(%llx) cpu_addr(%llx) size(%llx)\n",
> > > >                        range.bus_addr, range.cpu_addr, range.size);
> > > >
> > > > +             num_ranges++;
> > > >               if (dma_offset && range.cpu_addr - range.bus_addr != dma_offset)
> > > > {
> > > > -                     pr_warn("Can't handle multiple dma-ranges with different
> > > > offsets on node(%pOF)\n", node);
> > > > -                     /* Don't error out as we'd break some existing DTs */
> > > > -                     continue;
> > > > +                     if (!IS_ENABLED(CONFIG_DMA_PFN_OFFSET_MAP)) {
> > > > +                             pr_warn("Can't handle multiple dma-ranges with
> > > > different offsets on node(%pOF)\n", node);
> > > > +                             pr_warn("Perhaps set DMA_PFN_OFFSET_MAP=y?\n");
> > > > +                             /*
> > > > +                              * Don't error out as we'd break some existing
> > > > +                              * DTs that are using configs w/o
> > > > +                              * CONFIG_DMA_PFN_OFFSET_MAP set.
> > > > +                              */
> > > > +                             continue;
> > >
> > > dev->bus_dma_limit is set in of_dma_configure(), this function's caller, based
> > > on dma_start's value (set after this continue). So you'd be effectively setting
> > > the dev->bus_dma_limit to whatever we get from the first dma-range.
> > I'm not seeing that at all.  On the  evaluation of each dma-range,
> > dma_start and dma_end are re-evaluated to be the lowest and highest
> > bus values of the  dma-ranges seen so far.  After all dma-ranges are
> > examined,  dev->bus_dma_limit being set to the highest.  In fact, the
> > current code -- ie before my commits -- already does this for multiple
> > dma-ranges as long as the cpu-bus offset is the same in the
> > dma-ranges.
> > >
> > > This can be troublesome depending on how the dma-ranges are setup, for example
> > > if the first dma-range doesn't include the CMA area, in arm64 generally set as
> > > high as possible in ZONE_DMA32, that would render it useless for
> > > dma/{direct/swiotlb}. Again depending on the bus_dma_limit value, if smaller
> > > than ZONE_DMA you'd be unable to allocate any DMA memory.
> > >
> > > IMO, a solution to this calls for a revamp of dma-direct's dma_capable(): match
> > > the target DMA memory area with each dma-range we have to see if it fits.
> > >
> > > > +                     }
> > > > +                     dma_multi_pfn_offset = true;
> > > >               }
> > > >               dma_offset = range.cpu_addr - range.bus_addr;
> > > >
> > > > @@ -991,6 +1043,13 @@ int of_dma_get_range(struct device *dev, struct
> > > > device_node *np, u64 *dma_addr,
> > > >                       dma_end = range.bus_addr + range.size;
> > > >       }
> > > >
> > > > +     if (dma_multi_pfn_offset) {
> > > > +             dma_offset = 0;
> > > > +             ret = attach_dma_pfn_offset_map(dev, node, num_ranges);
> > > > +             if (ret)
> > > > +                     return ret;
> > > > +     }
> > > > +
> > > >       if (dma_start >= dma_end) {
> > > >               ret = -EINVAL;
> > > >               pr_debug("Invalid DMA ranges configuration on node(%pOF)\n",
> > > > diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> > > > index 6197938dcc2d..aaa3e58f5eb4 100644
> > > > --- a/drivers/usb/core/message.c
> > > > +++ b/drivers/usb/core/message.c
> > > > @@ -1960,6 +1960,9 @@ int usb_set_configuration(struct usb_device *dev, int
> > > > configuration)
> > > >                */
> > > >               intf->dev.dma_mask = dev->dev.dma_mask;
> > > >               intf->dev.dma_pfn_offset = dev->dev.dma_pfn_offset;
> > > > +#ifdef CONFIG_DMA_PFN_OFFSET_MAP
> > > > +             intf->dev.dma_pfn_offset_map = dev->dev.dma_pfn_offset_map;
> > > > +#endif
> > >
> > > Thanks for looking at this, that said, I see more instances of drivers changing
> > > dma_pfn_offset outside of the core code. Why not doing this there too?
> > >
> > > Also, are we 100% sure that dev->dev.dma_pfn_offset isn't going to be freed
> > > before we're done using intf->dev? Maybe it's safer to copy the ranges?
> > >
> > > >               INIT_WORK(&intf->reset_ws, __usb_queue_reset_device);
> > > >               intf->minor = -1;
> > > >               device_initialize(&intf->dev);
> > > > diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
> > > > index f16c26dc079d..d2ed4d90e56e 100644
> > > > --- a/drivers/usb/core/usb.c
> > > > +++ b/drivers/usb/core/usb.c
> > > > @@ -612,6 +612,9 @@ struct usb_device *usb_alloc_dev(struct usb_device
> > > > *parent,
> > > >        */
> > > >       dev->dev.dma_mask = bus->sysdev->dma_mask;
> > > >       dev->dev.dma_pfn_offset = bus->sysdev->dma_pfn_offset;
> > > > +#ifdef CONFIG_DMA_PFN_OFFSET_MAP
> > > > +     dev->dev.dma_pfn_offset_map = bus->sysdev->dma_pfn_offset_map;
> > > > +#endif
> > > >       set_dev_node(&dev->dev, dev_to_node(bus->sysdev));
> > > >       dev->state = USB_STATE_ATTACHED;
> > > >       dev->lpm_disable_count = 1;
> > > > diff --git a/include/linux/device.h b/include/linux/device.h
> > > > index ac8e37cd716a..67a240ad4fc5 100644
> > > > --- a/include/linux/device.h
> > > > +++ b/include/linux/device.h
> > > > @@ -493,6 +493,8 @@ struct dev_links_info {
> > > >   * @bus_dma_limit: Limit of an upstream bridge or bus which imposes a smaller
> > > >   *           DMA limit than the device itself supports.
> > > >   * @dma_pfn_offset: offset of DMA memory range relatively of RAM
> > > > + * @dma_pfn_offset_map:      Like dma_pfn_offset but used when there are
> > > > multiple
> > > > + *           pfn offsets for multiple dma-ranges.
> > > >   * @dma_parms:       A low level driver may set these to teach IOMMU code
> > > > about
> > > >   *           segment limitations.
> > > >   * @dma_pools:       Dma pools (if dma'ble device).
> > > > @@ -578,7 +580,13 @@ struct device {
> > > >                                            allocations such descriptors. */
> > > >       u64             bus_dma_limit;  /* upstream dma constraint */
> > > >       unsigned long   dma_pfn_offset;
> > > > -
> > > > +#ifdef CONFIG_DMA_PFN_OFFSET_MAP
> > > > +     const struct dma_pfn_offset_region *dma_pfn_offset_map;
> > > > +                                     /* Like dma_pfn_offset, but for
> > > > +                                      * the unlikely case of multiple
> > > > +                                      * offsets. If non-null, dma_pfn_offset
> > > > +                                      * will be set to 0. */
> > > > +#endif
> > >
> > > I'm still sad this doesn't fully replace dma_pfn_offset & bus_dma_limit. I feel
> > > the extra logic involved in incorporating this as default isn't going to be
> > > noticeable as far as performance is concerned to single dma-range users, and
> > > it'd make for a nicer DMA code. Also you'd force everyone to test their changes
> > > on the multi dma-ranges code path, as opposed to having this disabled 99.9% of
> > > the time (hence broken every so often).
> > Good point.
>
> +1
>
> > > Note that I sympathize with the amount of work involved on improving that, so
> > > better wait to hear what more knowledgeable people have to say about this :)
> > Yes, I agree.  I want to avoid coding and testing one solution only to
> > have a different reviewer NAK it.
>
> It's a pretty safe bet that everyone will prefer one code path over 2.
>
> Rob
Thanks for  the input.  Will do, and send out v3 ASAP.
Thanks, Jim
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
