Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BB22FEF60
	for <lists.iommu@lfdr.de>; Thu, 21 Jan 2021 16:48:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1A2EB86C1A;
	Thu, 21 Jan 2021 15:48:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UBtERqM0HyYO; Thu, 21 Jan 2021 15:48:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C50B386C03;
	Thu, 21 Jan 2021 15:48:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3948C013A;
	Thu, 21 Jan 2021 15:48:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CE021C013A
 for <iommu@lists.linux-foundation.org>; Thu, 21 Jan 2021 15:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AD83E20394
 for <iommu@lists.linux-foundation.org>; Thu, 21 Jan 2021 15:48:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9BdcwemUGeDt for <iommu@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 15:48:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 7FAE42036B
 for <iommu@lists.linux-foundation.org>; Thu, 21 Jan 2021 15:48:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B86523A04
 for <iommu@lists.linux-foundation.org>; Thu, 21 Jan 2021 15:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611244098;
 bh=ESCY3rt1UpVAToMmeAThDINvSacKiOsK2nc/NRoNF9g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LCFe42rTpo0PlaukO40aoasQL5/Qys43MShy5ZOg+JcG27AZaNRJ4cHu3ZE/cf8rR
 HIq5i0dftrTxshUnv+icHC5DHyTHfgXx2miR6yKQvenRHR5EcVuOpasmEc7yPQPVKD
 cwEyOANH8KznmYsj7P/LmxN8ew+znCkYwD6N0a4Tn3GZxCRNczrWFg3Bw2fLc+J8b0
 mk+EobIZoCcxbqX8JNLKcWwjnfwQR3O98R8GTEtgLU8u20ZLIEKiWn8pxnDTKeDO9I
 oRgIbCp6Cch6hzf1mS9uVrtxlnUuCLlYvc71A4V2HcSXBy2GIVc5mXErflL3r+khjI
 CV+PqF7WZ5l5A==
Received: by mail-lf1-f42.google.com with SMTP id b26so3136350lff.9
 for <iommu@lists.linux-foundation.org>; Thu, 21 Jan 2021 07:48:17 -0800 (PST)
X-Gm-Message-State: AOAM530+MK2gErUvy9dylo4MMUgkWxS0Rigz60zewBA9JML28kSTWqVi
 x3zHEMcaAQ6jkaDb9Omn35S+qKF6BU9vjwSt3Q==
X-Google-Smtp-Source: ABdhPJxClIBHDNh0ezMtBn3tEIUpA6A69KltrTNKbOdslOUCg3ST6RYu/puKZCvzOeFiwKhVG1uu2/TgGhoFpNLSPDU=
X-Received: by 2002:a17:906:958f:: with SMTP id
 r15mr70711ejx.360.1611244095545; 
 Thu, 21 Jan 2021 07:48:15 -0800 (PST)
MIME-Version: 1.0
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-6-tientzu@chromium.org>
 <20210120165348.GA220770@robh.at.kernel.org>
 <313f8052-a591-75de-c4c2-ee9ea8f02e7f@arm.com>
 <CAL_JsqKjTqcCbCLksRbCh7=f-A3Y09A3jNqtUApaA+p=RKd_Eg@mail.gmail.com>
 <c0d631de-8840-4f6e-aebf-41bb8449f78c@arm.com>
In-Reply-To: <c0d631de-8840-4f6e-aebf-41bb8449f78c@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 21 Jan 2021 09:48:03 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLv-FaiY_k+wS=iXG5AtccsXSBtvTfEGHvsN-VNqXdwpA@mail.gmail.com>
Message-ID: <CAL_JsqLv-FaiY_k+wS=iXG5AtccsXSBtvTfEGHvsN-VNqXdwpA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 5/6] dt-bindings: of: Add restricted DMA pool
To: Robin Murphy <robin.murphy@arm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Grant Likely <grant.likely@arm.com>, Paul Mackerras <paulus@samba.org>,
 Frank Rowand <frowand.list@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, "Wysocki,
 Rafael J" <rafael.j.wysocki@intel.com>, Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>,
 devicetree@vger.kernel.org, Will Deacon <will@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Claire Chang <tientzu@chromium.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Juergen Gross <jgross@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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

On Wed, Jan 20, 2021 at 7:10 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2021-01-20 21:31, Rob Herring wrote:
> > On Wed, Jan 20, 2021 at 11:30 AM Robin Murphy <robin.murphy@arm.com> wrote:
> >>
> >> On 2021-01-20 16:53, Rob Herring wrote:
> >>> On Wed, Jan 06, 2021 at 11:41:23AM +0800, Claire Chang wrote:
> >>>> Introduce the new compatible string, restricted-dma-pool, for restricted
> >>>> DMA. One can specify the address and length of the restricted DMA memory
> >>>> region by restricted-dma-pool in the device tree.
> >>>
> >>> If this goes into DT, I think we should be able to use dma-ranges for
> >>> this purpose instead. Normally, 'dma-ranges' is for physical bus
> >>> restrictions, but there's no reason it can't be used for policy or to
> >>> express restrictions the firmware has enabled.
> >>
> >> There would still need to be some way to tell SWIOTLB to pick up the
> >> corresponding chunk of memory and to prevent the kernel from using it
> >> for anything else, though.
> >
> > Don't we already have that problem if dma-ranges had a very small
> > range? We just get lucky because the restriction is generally much
> > more RAM than needed.
>
> Not really - if a device has a naturally tiny addressing capability that
> doesn't even cover ZONE_DMA32 where the regular SWIOTLB buffer will be
> allocated then it's unlikely to work well, but that's just crap system
> design. Yes, memory pressure in ZONE_DMA{32} is particularly problematic
> for such limited devices, but it's irrelevant to the issue at hand here.

Yesterday's crap system design is today's security feature. Couldn't
this feature make crap system design work better?

> What we have here is a device that's not allowed to see *kernel* memory
> at all. It's been artificially constrained to a particular region by a
> TZASC or similar, and the only data which should ever be placed in that

May have been constrained, but that's entirely optional.

In the optional case where the setup is entirely up to the OS, I don't
think this belongs in the DT at all. Perhaps that should be solved
first.

> region is data intended for that device to see. That way if it tries to
> go rogue it physically can't start slurping data intended for other
> devices or not mapped for DMA at all. The bouncing is an important part
> of this - I forget the title off-hand but there was an interesting paper
> a few years ago which demonstrated that even with an IOMMU, streaming
> DMA of in-place buffers could reveal enough adjacent data from the same
> page to mount an attack on the system. Memory pressure should be
> immaterial since the size of each bounce pool carveout will presumably
> be tuned for the needs of the given device.
>
> > In any case, wouldn't finding all the dma-ranges do this? We're
> > already walking the tree to find the max DMA address now.
>
> If all you can see are two "dma-ranges" properties, how do you propose
> to tell that one means "this is the extent of what I can address, please
> set my masks and dma-range-map accordingly and try to allocate things
> where I can reach them" while the other means "take this output range
> away from the page allocator and hook it up as my dedicated bounce pool,
> because it is Serious Security Time"? Especially since getting that
> choice wrong either way would be a Bad Thing.

Either we have some heuristic based on the size or we add some hint.
The point is let's build on what we already have for defining DMA
accessible memory in DT rather than some parallel mechanism.

Rob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
