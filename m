Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A5D3E4AA0
	for <lists.iommu@lfdr.de>; Mon,  9 Aug 2021 19:14:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89BDD8289B;
	Mon,  9 Aug 2021 17:14:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id loz8fRGSXtS3; Mon,  9 Aug 2021 17:14:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8510D82871;
	Mon,  9 Aug 2021 17:14:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 578D2C000E;
	Mon,  9 Aug 2021 17:14:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA6A3C000E
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 17:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E051560685
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 17:14:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pED0OOkRhty1 for <iommu@lists.linux-foundation.org>;
 Mon,  9 Aug 2021 17:14:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F265B60671
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 17:14:07 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 k38-20020a05600c1ca6b029025af5e0f38bso15235714wms.5
 for <iommu@lists.linux-foundation.org>; Mon, 09 Aug 2021 10:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OYBhnOmTd7LND1yY/zv5ucewtbUAfml9H7e83nBYGaU=;
 b=iV/CrzxPf5LK9wpOJ4gIsz00vkbrDVCaMRV0siwGLmCot6OV/PuwxeA3aH8WpT2tUk
 JPCW2Bg7t+Ak07vobtTF8WukfTCipoxZRVvtn+LZ3b6c2m7fvFTpCpAY9w2H5E6thGF7
 e6FPlI538zmMzus1bkfH6iCZG3tXHDmED3hC2oHkHYLs75brD0iuAOWt4TB4wDj+pnmZ
 p528D7p2/nQUaGjNXhlozch0Cm4sUd6uzgX6bFrG5kNzYqnry2tlef742gidzk3sWqyr
 X9Xu3fmuMEepCmxevReyNJ8aVo8Gf10WVtQIuk5gNQnkHTY0wT7XWHNvspguI7rgzhvt
 UpvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OYBhnOmTd7LND1yY/zv5ucewtbUAfml9H7e83nBYGaU=;
 b=WygtyLFVz9LpdKbm8LruMibTJbRuKIo6kyJtB25pT7hNsadpktxNBgFGIPXn50WOYM
 MBRqb2PwwnXGMZaWlZ7uR5xR/cyARymfnWZzkxra4jPDgAfdHlerdL0LyZfxNuNJ7MU4
 Ml2s/Xg8wjtZgdEvs41TdTchAn4SBtja7fBa9r9MuWAmg8B2W+72Fd6j0FogXAwa73rJ
 pMGJWoWVGlUF1FcuNAcMUClnijE38hnMV6fF9GxJTQnEysL6v1+OVEy+x74H0hZv/mAI
 4Q/GEi0JDdhAkBiRmKFpb516Es/gRv8I4Nz1u16kYfUKV3AOyY+3F5PexfkwWlytVtKi
 bWPQ==
X-Gm-Message-State: AOAM530wseo2th/w4m2313cP+krx68Imwsxtm52cyUinneI9fp4zxrWB
 3WXnue7Adklod5upq5VKCfRGnrZutva5MoDudtI=
X-Google-Smtp-Source: ABdhPJwxbNcSIwX1UvQlFgc6jaQF022CNM5CpPLnowyIJkQeARUVpaWilm/NcmlhZvtsDnq6R/nB7hevA0KRmy5vjQI=
X-Received: by 2002:a1c:4b18:: with SMTP id y24mr161960wma.49.1628529246173;
 Mon, 09 Aug 2021 10:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <20210728140052.GB22887@mms-0441>
 <8b2742c8891abe4fec3664730717a089@codeaurora.org>
 <20210802105544.GA27657@willie-the-truck>
 <CAF6AEGvtpFu8st=ZFNoKjP9YsAenciLxL1zMFi_iqMCvdby73w@mail.gmail.com>
 <20210802151409.GE28735@willie-the-truck>
 <CAF6AEGtzvyEUm0Fc8QT5t9KNK7i0FbFyi7zDM2_PMCzZBp7qbw@mail.gmail.com>
 <20210809145651.GC1458@willie-the-truck>
 <CAF6AEGsSUojA=V0n2iRWTCn++buqN=Eoxo0r3=+=PBu1O=H-AQ@mail.gmail.com>
 <20210809170508.GB1589@willie-the-truck>
In-Reply-To: <20210809170508.GB1589@willie-the-truck>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 9 Aug 2021 10:18:21 -0700
Message-ID: <CAF6AEGtmZ3LzAJdtnKDQDbEN-a6_JgdN-fZ96pkU3dZqkiW91g@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 0/3] iommu/drm/msm: Allow non-coherent masters
 to use system cache
To: Will Deacon <will@kernel.org>
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Kristian H Kristensen <hoegsberg@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>
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

On Mon, Aug 9, 2021 at 10:05 AM Will Deacon <will@kernel.org> wrote:
>
> On Mon, Aug 09, 2021 at 09:57:08AM -0700, Rob Clark wrote:
> > On Mon, Aug 9, 2021 at 7:56 AM Will Deacon <will@kernel.org> wrote:
> > > On Mon, Aug 02, 2021 at 06:36:04PM -0700, Rob Clark wrote:
> > > > On Mon, Aug 2, 2021 at 8:14 AM Will Deacon <will@kernel.org> wrote:
> > > > > On Mon, Aug 02, 2021 at 08:08:07AM -0700, Rob Clark wrote:
> > > > > > On Mon, Aug 2, 2021 at 3:55 AM Will Deacon <will@kernel.org> wrote:
> > > > > > > On Thu, Jul 29, 2021 at 10:08:22AM +0530, Sai Prakash Ranjan wrote:
> > > > > > > > On 2021-07-28 19:30, Georgi Djakov wrote:
> > > > > > > > > On Mon, Jan 11, 2021 at 07:45:02PM +0530, Sai Prakash Ranjan wrote:
> > > > > > > > > > commit ecd7274fb4cd ("iommu: Remove unused IOMMU_SYS_CACHE_ONLY flag")
> > > > > > > > > > removed unused IOMMU_SYS_CACHE_ONLY prot flag and along with it went
> > > > > > > > > > the memory type setting required for the non-coherent masters to use
> > > > > > > > > > system cache. Now that system cache support for GPU is added, we will
> > > > > > > > > > need to set the right PTE attribute for GPU buffers to be sys cached.
> > > > > > > > > > Without this, the system cache lines are not allocated for GPU.
> > > > > > > > > >
> > > > > > > > > > So the patches in this series introduces a new prot flag IOMMU_LLC,
> > > > > > > > > > renames IO_PGTABLE_QUIRK_ARM_OUTER_WBWA to IO_PGTABLE_QUIRK_PTW_LLC
> > > > > > > > > > and makes GPU the user of this protection flag.
> > > > > > > > >
> > > > > > > > > Thank you for the patchset! Are you planning to refresh it, as it does
> > > > > > > > > not apply anymore?
> > > > > > > > >
> > > > > > > >
> > > > > > > > I was waiting on Will's reply [1]. If there are no changes needed, then
> > > > > > > > I can repost the patch.
> > > > > > >
> > > > > > > I still think you need to handle the mismatched alias, no? You're adding
> > > > > > > a new memory type to the SMMU which doesn't exist on the CPU side. That
> > > > > > > can't be right.
> > > > > > >
> > > > > >
> > > > > > Just curious, and maybe this is a dumb question, but what is your
> > > > > > concern about mismatched aliases?  I mean the cache hierarchy on the
> > > > > > GPU device side (anything beyond the LLC) is pretty different and
> > > > > > doesn't really care about the smmu pgtable attributes..
> > > > >
> > > > > If the CPU accesses a shared buffer with different attributes to those which
> > > > > the device is using then you fall into the "mismatched memory attributes"
> > > > > part of the Arm architecture. It's reasonably unforgiving (you should go and
> > > > > read it) and in some cases can apply to speculative accesses as well, but
> > > > > the end result is typically loss of coherency.
> > > >
> > > > Ok, I might have a few other sections to read first to decipher the
> > > > terminology..
> > > >
> > > > But my understanding of LLC is that it looks just like system memory
> > > > to the CPU and GPU (I think that would make it "the point of
> > > > coherence" between the GPU and CPU?)  If that is true, shouldn't it be
> > > > invisible from the point of view of different CPU mapping options?
> > >
> > > You could certainly build a system where mismatched attributes don't cause
> > > loss of coherence, but as it's not guaranteed by the architecture and the
> > > changes proposed here affect APIs which are exposed across SoCs, then I
> > > don't think it helps much.
> > >
> >
> > Hmm, the description of the new mapping flag is that it applies only
> > to transparent outer level cache:
> >
> > +/*
> > + * Non-coherent masters can use this page protection flag to set cacheable
> > + * memory attributes for only a transparent outer level of cache, also known as
> > + * the last-level or system cache.
> > + */
> > +#define IOMMU_LLC      (1 << 6)
> >
> > But I suppose we could call it instead IOMMU_QCOM_LLC or something
> > like that to make it more clear that it is not necessarily something
> > that would work with a different outer level cache implementation?
>
> ... or we could just deal with the problem so that other people can reuse
> the code. I haven't really understood the reluctance to solve this properly.
>
> Am I missing some reason this isn't solvable?
>

Oh, was there another way to solve it (other than foregoing setting
INC_OCACHE in the pgtables)?  Maybe I misunderstood, is there a
corresponding setting on the MMU pgtables side of things?

BR,
-R
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
