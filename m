Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A85260F04
	for <lists.iommu@lfdr.de>; Tue,  8 Sep 2020 11:49:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9AB9C20352;
	Tue,  8 Sep 2020 09:49:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rzoIFKhVndIa; Tue,  8 Sep 2020 09:49:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5448023355;
	Tue,  8 Sep 2020 09:49:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 36551C0051;
	Tue,  8 Sep 2020 09:49:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B779C0051
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 09:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EE8BE20433
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 09:49:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V86KGCRsjA1E for <iommu@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 09:49:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 8209F20352
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 09:49:27 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id d190so16426483iof.3
 for <iommu@lists.linux-foundation.org>; Tue, 08 Sep 2020 02:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gAXgXLHr4sZUGmR5wWRvQIZcW8h+Tv26UAX12qfpm58=;
 b=Zz9Xr5hidITx4JOxvC6dEk1TLY5MJQa1WczmuIckQJWDwNyn9CCC5UcO34yEAC2CMZ
 CsROkGHodev4SuThtZ4ypLG/0HCKWWCPgpRiWkTTCORBmyh5C7LtbeBOVt+Bns+rjt0R
 Hgbd1S9JxaIw67qRt0A7Q5rIqtgR0RyNI6Zdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gAXgXLHr4sZUGmR5wWRvQIZcW8h+Tv26UAX12qfpm58=;
 b=m+qnFUEGYWXFyXhWKVf5b3Lf4ooZBvrqbCjxypKfW+CuGKdghA1h2FxfU6wMA9ZbnZ
 jGxrMOKVHcWBNjg9iz3Q+l6tlneHNF8b3fnux1nDwY+y1qL0H7mcyzqz3DL8shd5qqT2
 sitlYoDHzYQdEJ8kx3BWeshjQhQNoBU0VVXhwpK1vXSB8fPFPLiEKaGLVhSHO7IWuHye
 vArtxoPbcWYYNqCM/m9vi1HSFVBQPJla+ckPcBMCBm9p2rEkTd/2+Jueh70RBqT0kf5T
 FDxD0fvWTm0UpCJployODXbKvfZ4SMx4LuBNs7zLegfKu+QpE1Rtg8KrUzhxVBoM2VNr
 Y1Jg==
X-Gm-Message-State: AOAM533piZbFkoNEfxVZCoW8ysOlFSmx1lSssO1/3hA1mV+9AVuf5ryy
 6o3XekM+01aEsOY1lvFshtd+fLOKq2e5yg==
X-Google-Smtp-Source: ABdhPJwVhOc76rwbJkd5OHtBglnnvpvkX7U3Rtfz/l6RNGhVd1u3Zeb/krhr6nKWU19rQgd2Ez1mQA==
X-Received: by 2002:a6b:bf44:: with SMTP id p65mr4126417iof.126.1599558566879; 
 Tue, 08 Sep 2020 02:49:26 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com.
 [209.85.166.172])
 by smtp.gmail.com with ESMTPSA id w22sm2768936iob.32.2020.09.08.02.49.26
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 02:49:26 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id t16so14731378ilf.13
 for <iommu@lists.linux-foundation.org>; Tue, 08 Sep 2020 02:49:26 -0700 (PDT)
X-Received: by 2002:a92:6f0a:: with SMTP id k10mr20571863ilc.5.1599558565722; 
 Tue, 08 Sep 2020 02:49:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200728050140.996974-1-tientzu@chromium.org>
 <20200728050140.996974-5-tientzu@chromium.org>
 <20200731205804.GB756942@bogus>
 <CALiNf2-BGQ+8Lm6A61oM6v+6N1zRTJYvod7LQLsCmK-ADsrMaw@mail.gmail.com>
 <CAAFQd5Cm+ZGx9ia2sAdvHQC6zC1U=+9AWs7iW7o-qE4g7wZgsw@mail.gmail.com>
 <CAAFQd5AfbN0V3sGCs8vhmeD-MNn3bTvfWBCaT-OY3hgjBUs-LQ@mail.gmail.com>
 <CAAFQd5B_LAb0uU3J9umGWBhaVSKT3N9SynnvTxw_PVEwHu4Cww@mail.gmail.com>
In-Reply-To: <CAAFQd5B_LAb0uU3J9umGWBhaVSKT3N9SynnvTxw_PVEwHu4Cww@mail.gmail.com>
From: Claire Chang <tientzu@chromium.org>
Date: Tue, 8 Sep 2020 17:49:14 +0800
X-Gmail-Original-Message-ID: <CALiNf28w-NZhkeAEeUGJEbzsGzQKeA=O3FR3nG+SEk+CiDhzKg@mail.gmail.com>
Message-ID: <CALiNf28w-NZhkeAEeUGJEbzsGzQKeA=O3FR3nG+SEk+CiDhzKg@mail.gmail.com>
Subject: Re: [RFC v2 4/5] dt-bindings: of: Add plumbing for restricted DMA pool
To: Tomasz Figa <tfiga@chromium.org>
Cc: Rob Herring <robh@kernel.org>, heikki.krogerus@linux.intel.com,
 Saravana Kannan <saravanak@google.com>, suzuki.poulose@arm.com,
 Frank Rowand <frowand.list@gmail.com>, lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 dan.j.williams@intel.com, Thierry Reding <treding@nvidia.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

On Tue, Aug 25, 2020 at 1:30 AM Tomasz Figa <tfiga@chromium.org> wrote:
>
> On Tue, Aug 11, 2020 at 11:15 AM Tomasz Figa <tfiga@chromium.org> wrote:
> >
> > On Mon, Aug 3, 2020 at 5:15 PM Tomasz Figa <tfiga@chromium.org> wrote:
> > >
> > > Hi Claire and Rob,
> > >
> > > On Mon, Aug 3, 2020 at 4:26 PM Claire Chang <tientzu@chromium.org> wrote:
> > > >
> > > > On Sat, Aug 1, 2020 at 4:58 AM Rob Herring <robh@kernel.org> wrote:
> > > > >
> > > > > On Tue, Jul 28, 2020 at 01:01:39PM +0800, Claire Chang wrote:
> > > > > > Introduce the new compatible string, device-swiotlb-pool, for restricted
> > > > > > DMA. One can specify the address and length of the device swiotlb memory
> > > > > > region by device-swiotlb-pool in the device tree.
> > > > > >
> > > > > > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > > > > > ---
> > > > > >  .../reserved-memory/reserved-memory.txt       | 35 +++++++++++++++++++
> > > > > >  1 file changed, 35 insertions(+)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > > > > > index 4dd20de6977f..78850896e1d0 100644
> > > > > > --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > > > > > +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
> > > > > > @@ -51,6 +51,24 @@ compatible (optional) - standard definition
> > > > > >            used as a shared pool of DMA buffers for a set of devices. It can
> > > > > >            be used by an operating system to instantiate the necessary pool
> > > > > >            management subsystem if necessary.
> > > > > > +        - device-swiotlb-pool: This indicates a region of memory meant to be
> > > > >
> > > > > swiotlb is a Linux thing. The binding should be independent.
> > > > Got it. Thanks for pointing this out.
> > > >
> > > > >
> > > > > > +          used as a pool of device swiotlb buffers for a given device. When
> > > > > > +          using this, the no-map and reusable properties must not be set, so the
> > > > > > +          operating system can create a virtual mapping that will be used for
> > > > > > +          synchronization. Also, there must be a restricted-dma property in the
> > > > > > +          device node to specify the indexes of reserved-memory nodes. One can
> > > > > > +          specify two reserved-memory nodes in the device tree. One with
> > > > > > +          shared-dma-pool to handle the coherent DMA buffer allocation, and
> > > > > > +          another one with device-swiotlb-pool for regular DMA to/from system
> > > > > > +          memory, which would be subject to bouncing. The main purpose for
> > > > > > +          restricted DMA is to mitigate the lack of DMA access control on
> > > > > > +          systems without an IOMMU, which could result in the DMA accessing the
> > > > > > +          system memory at unexpected times and/or unexpected addresses,
> > > > > > +          possibly leading to data leakage or corruption. The feature on its own
> > > > > > +          provides a basic level of protection against the DMA overwriting buffer
> > > > > > +          contents at unexpected times. However, to protect against general data
> > > > > > +          leakage and system memory corruption, the system needs to provide a
> > > > > > +          way to restrict the DMA to a predefined memory region.
> > > > >
> > > > > I'm pretty sure we already support per device carveouts and I don't
> > > > > understand how this is different.
> > > > We use this to bounce streaming DMA in and out of a specially allocated region.
> > > > I'll try to merge this with the existing one (i.e., shared-dma-pool)
> > > > to see if that
> > > > makes things clearer.
> > > >
> > >
> > > Indeed, from the firmware point of view, this is just a carveout, for
> > > which we have the "shared-dma-pool" compatible string defined already.
> > >
> > > However, depending on the device and firmware setup, the way the
> > > carevout is used may change. I can see the following scenarios:
> > >
> > > 1) coherent DMA (dma_alloc_*) within a reserved pool and no
> > > non-coherent DMA (dma_map_*).
> > >
> > > This is how the "memory-region" property is handled today in Linux for
> > > devices which can only DMA from/to the given memory region. However,
> > > I'm not sure if no non-coherent DMA is actually enforced in any way by
> > > the DMA subsystem.
> > >
> > > 2) coherent DMA from a reserved pool and non-coherent DMA from system memory
> > >
> > > This is the case for the systems which have some dedicated part of
> > > memory which is guaranteed to be coherent with the DMA, but still can
> > > do non-coherent DMA to any part of the system memory. Linux handles it
> > > the same way as 1), which is what made me believe that 1) might not
> > > actually be handled correctly.
> > >
> > > 3) coherent DMA and bounced non-coherent DMA within a reserved pool
> > > 4) coherent DMA within one pool and bounced non-coherent within another pool
> > >
> > > These are the two cases we're interested in. Basically they make it
> > > possible for non-coherent DMA from arbitrary system memory to be
> > > bounced through a reserved pool, which the device has access to. The
> > > current series implements 4), but I'd argue that it:
> > >
> > > - is problematic from the firmware point of view, because on most of
> > > the systems, both pools would be just some carveouts and the fact that
> > > Linux would use one for coherent and the other for non-coherent DMA
> > > would be an OS implementation detail,
> > > - suffers from the static memory split between coherent and
> > > non-coherent DMA, which could either result in some wasted memory or
> > > the DMA stopped working after a kernel update if the driver changes
> > > its allocation pattern,
> > >
> > > and so we should rather go with 3).
> > >
> > > Now, from the firmware point of view, it doesn't matter how the OS
> > > uses the carveout, but I think it's still necessary to tell the OS
> > > about the device DMA capability. Right now we use "memory-region" for
> > > any kind of reserved memory, but looking at the above scenarios, there
> > > are 2 cases:
> > >
> > > a) the memory region is preferred for the device, e.g. it enables
> > > coherency, but the device can still DMA across the rest of the system
> > > memory. This is the case in scenario 2) and is kind of assumed in the
> > > Linux DMA subsystem, although it's certainly not the case for a lot of
> > > hardware, even if they use the "memory-region" binding.
> > >
> > > b) the memory region is the only region that the device can access.
> > > This is the case in scenarios 1), 3) and 4).
> > >
> > > For this, I'd like to propose a "restricted-dma-region" (feel free to
> > > suggest a better name) binding, which is explicitly specified to be
> > > the only DMA-able memory for this device and make Linux use the given
> > > pool for coherent DMA allocations and bouncing non-coherent DMA.
> > >
> > > What do you think?
> >
> > Rob, Robin, we'd appreciate your feedback on this when you have a
> > chance to take a look again. Thanks!
>
> Gentle ping.

The "restricted-dma-region" idea sounds good to me and I'm happy to
submit a new version implementing it.
Rob, Robin, please kindly let us know if you have any concerns about
it. Thanks!

Best regards,
Claire

>
> >
> > Best regards,
> > Tomasz
> >
> > >
> > > Best regards,
> > > Tomasz
> > >
> > > > >
> > > > > What is the last sentence supposed to imply? You need an IOMMU?
> > > > The main purpose is to mitigate the lack of DMA access control on
> > > > systems without an IOMMU.
> > > > For example, we plan to use this plus a MPU for our PCIe WiFi which is
> > > > not behind an IOMMU.
> > > >
> > > > >
> > > > > >          - vendor specific string in the form <vendor>,[<device>-]<usage>
> > > > > >  no-map (optional) - empty property
> > > > > >      - Indicates the operating system must not create a virtual mapping
> > > > > > @@ -117,6 +135,16 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
> > > > > >                       compatible = "acme,multimedia-memory";
> > > > > >                       reg = <0x77000000 0x4000000>;
> > > > > >               };
> > > > > > +
> > > > > > +             wifi_coherent_mem_region: wifi_coherent_mem_region {
> > > > > > +                     compatible = "shared-dma-pool";
> > > > > > +                     reg = <0x50000000 0x400000>;
> > > > > > +             };
> > > > > > +
> > > > > > +             wifi_device_swiotlb_region: wifi_device_swiotlb_region {
> > > > > > +                     compatible = "device-swiotlb-pool";
> > > > > > +                     reg = <0x50400000 0x4000000>;
> > > > > > +             };
> > > > > >       };
> > > > > >
> > > > > >       /* ... */
> > > > > > @@ -135,4 +163,11 @@ one for multimedia processing (named multimedia-memory@77000000, 64MiB).
> > > > > >               memory-region = <&multimedia_reserved>;
> > > > > >               /* ... */
> > > > > >       };
> > > > > > +
> > > > > > +     pcie_wifi: pcie_wifi@0,0 {
> > > > > > +             memory-region = <&wifi_coherent_mem_region>,
> > > > > > +                      <&wifi_device_swiotlb_region>;
> > > > > > +             restricted-dma = <0>, <1>;
> > > > > > +             /* ... */
> > > > > > +     };
> > > > > >  };
> > > > > > --
> > > > > > 2.28.0.rc0.142.g3c755180ce-goog
> > > > > >
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
