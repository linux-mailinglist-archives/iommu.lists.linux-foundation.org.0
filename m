Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A09ED40D420
	for <lists.iommu@lfdr.de>; Thu, 16 Sep 2021 09:52:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E48C6077F;
	Thu, 16 Sep 2021 07:52:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vShuSQIAqZUG; Thu, 16 Sep 2021 07:52:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 0EDA6606CC;
	Thu, 16 Sep 2021 07:52:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DAE3CC001E;
	Thu, 16 Sep 2021 07:52:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 022ECC000D
 for <iommu@lists.linux-foundation.org>; Thu, 16 Sep 2021 07:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D6AE6404D0
 for <iommu@lists.linux-foundation.org>; Thu, 16 Sep 2021 07:52:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=solid-run-com.20150623.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CYniV1i4D07w for <iommu@lists.linux-foundation.org>;
 Thu, 16 Sep 2021 07:52:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D608A404C7
 for <iommu@lists.linux-foundation.org>; Thu, 16 Sep 2021 07:52:47 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id g8so13435841edt.7
 for <iommu@lists.linux-foundation.org>; Thu, 16 Sep 2021 00:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solid-run-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ODMKOAGqD4ItUpYtqxdJhUq4QAGfb72lqYAxg7uVUGE=;
 b=chtAbpIChinWBdEU1gL0ntvM9+0WUqRdjW5xXbWXxve4i322V8dGlTe9RiiuK3Ky4X
 c4akEZ5ZtlGIE4Oq5bKagynGKAzDDWLhPD16IaRA87RHwvszd2Dd9BcUfbSoGsR9eW23
 jCna1ptofFWrFzh1WoFFdzasf5ZaWs3oaf2rCLIudjsKhBAEHN4skc61+FZLbHn63DN0
 rNGf+UyI8WD/28M5HK/XKfP5ioyaoiYkqVrB9g+dtXaUnXSgWMUJPcNDt4JNfSsTxCBj
 blBr5Gzj1Bep+7R7sSd1nskzkOQz0mQNLiq9MFxbbycGsJJRkg9ZK3NBERnWlMz9RRRQ
 voAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ODMKOAGqD4ItUpYtqxdJhUq4QAGfb72lqYAxg7uVUGE=;
 b=gigf5pUhYkkdPRXPfHNzg2nS3wW//qfexFlebJuVdB3sI/r7soC8te9KNJ6468gsXY
 tKB8kPjajxgQsl76hMMlAUHLXiif/JaBGlf/recLCvGohsKSykTHA/FxU6pjatQ9Qk14
 /3v7mqzPxY9AV9/PiH0TFRfI8ID+A9DyQu/7hLhwaXSuQ94UApnMAdcwM70OUmo+5z2O
 88jl0lmLWJn4mwbQiD6s+DPaqbukagXRrjHwv9jAaP9vkKyoCb0nL+lIX+oa8wuT9E6P
 PnNlZJG+krrt4483GSJfXvxQA6p1i+++VtsbL2JHnkcd4xfhuY8qQx7Mblu5Qc5Obkwd
 WGRQ==
X-Gm-Message-State: AOAM530gxhyNnO1+pG4+LOB2HBxYT6d/P9aDqv8UuNbxxdkjp95XzWxd
 sg1nUtArImUbkuph1lj8mc6qfsLHy7FqiLm7y3ZLpA==
X-Google-Smtp-Source: ABdhPJyKDvyZKYCRYuxgjitZgDg2r13roWQBKzWOY1Mt3prlNydzDybS+gDSrHtYZ6S21wAVeWfjewN4V0nE2cFjwQw=
X-Received: by 2002:a17:906:1341:: with SMTP id
 x1mr4645297ejb.277.1631778765895; 
 Thu, 16 Sep 2021 00:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210805080724.480-1-shameerali.kolothum.thodi@huawei.com>
 <20210805080724.480-3-shameerali.kolothum.thodi@huawei.com>
 <20210805160319.GB23085@lpieralisi>
 <5d9bebdf-6eb5-49a0-2e8f-490df2d6754d@arm.com>
 <CABdtJHt-18TDHBFq1X89=qngUbopGoFnqjuXiBOPtZG58vy3sg@mail.gmail.com>
 <f3fc713365f7465e966aaed7cdd8870a@huawei.com>
In-Reply-To: <f3fc713365f7465e966aaed7cdd8870a@huawei.com>
From: Jon Nettleton <jon@solid-run.com>
Date: Thu, 16 Sep 2021 09:52:08 +0200
Message-ID: <CABdtJHuEViN0MSz-ZJhR52+b=F6yvQ5mm_edVuLy1B=nHp+ESQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/9] ACPI/IORT: Add support for RMR node parsing
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: Will Deacon <will@kernel.org>, Steven Price <steven.price@arm.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 wanghuiqiang <wanghuiqiang@huawei.com>,
 "Guohanjun \(Hanjun Guo\)" <guohanjun@huawei.com>,
 yangyicong <yangyicong@huawei.com>, Sami Mujawar <Sami.Mujawar@arm.com>,
 Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

On Thu, Sep 16, 2021 at 9:26 AM Shameerali Kolothum Thodi
<shameerali.kolothum.thodi@huawei.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Jon Nettleton [mailto:jon@solid-run.com]
> > Sent: 06 September 2021 20:51
> > To: Robin Murphy <robin.murphy@arm.com>
> > Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>; Shameerali Kolothum Thodi
> > <shameerali.kolothum.thodi@huawei.com>; Laurentiu Tudor
> > <laurentiu.tudor@nxp.com>; linux-arm-kernel
> > <linux-arm-kernel@lists.infradead.org>; ACPI Devel Maling List
> > <linux-acpi@vger.kernel.org>; Linux IOMMU
> > <iommu@lists.linux-foundation.org>; Linuxarm <linuxarm@huawei.com>;
> > Joerg Roedel <joro@8bytes.org>; Will Deacon <will@kernel.org>;
> > wanghuiqiang <wanghuiqiang@huawei.com>; Guohanjun (Hanjun Guo)
> > <guohanjun@huawei.com>; Steven Price <steven.price@arm.com>; Sami
> > Mujawar <Sami.Mujawar@arm.com>; Eric Auger <eric.auger@redhat.com>;
> > yangyicong <yangyicong@huawei.com>
> > Subject: Re: [PATCH v7 2/9] ACPI/IORT: Add support for RMR node parsing
> >
> [...]
>
> > > >
> > > > On the prot value assignment based on the remapping flag, I'd like
> > > > to hear Robin/Joerg's opinion, I'd avoid being in a situation where
> > > > "normally" this would work but then we have to quirk it.
> > > >
> > > > Is this a valid assumption _always_ ?
> > >
> > > No. Certainly applying IOMMU_CACHE without reference to the device's
> > > _CCA attribute or how CPUs may be accessing a shared buffer could lead
> > > to a loss of coherency. At worst, applying IOMMU_MMIO to a
> > > device-private buffer *could* cause the device to lose coherency with
> > > itself if the memory underlying the RMR may have allocated into system
> > > caches. Note that the expected use for non-remappable RMRs is the
> > > device holding some sort of long-lived private data in system RAM -
> > > the MSI doorbell trick is far more of a niche hack really.
> > >
> > > At the very least I think we need to refer to the device's memory
> > > access properties here.
> > >
> > > Jon, Laurentiu - how do RMRs correspond to the EFI memory map on your
> > > firmware? I'm starting to think that as long as the underlying memory
> > > is described appropriately there then we should be able to infer
> > > correct attributes from the EFI memory type and flags.
> >
> > The devices are all cache coherent and marked as _CCA, 1.  The Memory
> > regions are in the virt table as ARM_MEMORY_REGION_ATTRIBUTE_DEVICE.
> >
> > The current chicken and egg problem we have is that during the fsl-mc-bus
> > initialization we call
> >
> > error = acpi_dma_configure_id(&pdev->dev, DEV_DMA_COHERENT,
> >                                               &mc_stream_id);
> >
> > which gets deferred because the SMMU has not been initialized yet. Then we
> > initialize the RMR tables but there is no device reference there to be able to
> > query device properties, only the stream id.  After the IORT tables are parsed
> > and the SMMU is setup, on the second device probe we associate everything
> > based on the stream id and the fsl-mc-bus device is able to claim its 1-1 DMA
> > mappings.
>
> Can we solve this order problem by delaying the iommu_alloc_resv_region()
> to the iommu_dma_get_rmr_resv_regions(dev, list) ? We could invoke
> device_get_dma_attr() from there which I believe will return the _CCA attribute.
>
> Or is that still early to invoke that?

That looks like it should work. Do we then also need to parse through the
VirtualMemoryTable matching the start and end addresses to determine the
other memory attributes like MMIO?

-Jon

>
> Thanks,
> Shameer
>
> > cat /sys/kernel/iommu_groups/0/reserved_regions
> > 0x0000000001000000 0x0000000010ffffff direct-relaxable
> > 0x0000000008000000 0x00000000080fffff msi
> > 0x000000080c000000 0x000000081bffffff direct-relaxable
> > 0x0000001c00000000 0x0000001c001fffff direct-relaxable
> > 0x0000002080000000 0x000000209fffffff direct-relaxable
> >
> > -Jon
> >
> > >
> > > Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
