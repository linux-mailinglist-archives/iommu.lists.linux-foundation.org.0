Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B7F25519E
	for <lists.iommu@lfdr.de>; Fri, 28 Aug 2020 01:34:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 732F48837F;
	Thu, 27 Aug 2020 23:34:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bF2W2EYMaXNG; Thu, 27 Aug 2020 23:34:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D91CE882FB;
	Thu, 27 Aug 2020 23:34:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A471BC0891;
	Thu, 27 Aug 2020 23:34:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84392C0051
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 23:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 772D986AC8
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 23:34:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6yvienDHi1-q for <iommu@lists.linux-foundation.org>;
 Thu, 27 Aug 2020 23:34:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 309D486AAB
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 23:34:53 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id c6so6362535ilo.13
 for <iommu@lists.linux-foundation.org>; Thu, 27 Aug 2020 16:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tcd-ie.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WedloSq7WEmmdLIoMis0OnTbQ3vwipQyHuMeYXqSrtc=;
 b=z5afeT1uAO8r4nUnyvdyA9XOFk/fx4rNEV7OzYIxSzIyRPXSSuP0kLR0uFLb5b32/u
 2F9MWfvV9WNZ+AXIi+QLZ8p0NAvNTBNro8XHBAkvaJyY3ufO9Q62GJ4oCd3Mw0z1agKr
 qFAx/HdJ+EmG1djyMZ9CSGcKQmWFu/zVKz5vJDxg6Nx++SMMng1dGMX9Fmd/wZDTKzHU
 hK7p1r057Z3QOjx4Tgjjmk5k/beu18E/9gkjDnfpmsN6+7UO8xqzHsjZBJhd37zZ1RdM
 prBipf1AI2muUbFcyfU3La5FJDcrT8wuyB+danzKbVnftQC2AzrWmBaIjshroZB9Cb96
 Llhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WedloSq7WEmmdLIoMis0OnTbQ3vwipQyHuMeYXqSrtc=;
 b=TI48tctGfn/BqZhiC1SJe6FyRXe0mFYCUoEM13Z18NuCKzyb/qVWBuVJayzeYUmT9X
 IKnPtZXbE7NkE/nzYgVoix3GtLnjjvZF+QH4cEZfhs410257lr4SHT90b0wul2CgSZJt
 HUtUbulIqi2xuapUvW/0Gz4MUowZoVA8XqD5aZOl/alS9pUOTCJB2/XK9gaLvoaW8QYJ
 tyhBn/tZawDWe4F6oo8hOiHwgb2u8MgARgzWNpoaWQydzcMttGYaV+DYZSM3Rq1qKmqt
 ZtPO+GBpTqq3eUBmothrjflk4XWFVvUX3xUR2za1vI1CWdbWfAqMkdflGUyq33AnE5jr
 8O4w==
X-Gm-Message-State: AOAM533hQA+GgI4SNmqtaD6Coq3CGH4kAap62yFYdNG2uQzhaLUtGHDo
 ynuPjxpJI7dti1gpr2mbMuYk2XrgeOj96q6Z9hq/vQ==
X-Google-Smtp-Source: ABdhPJw0W2KNMSiVDCp6qP+D3bxqQi5szrf3hiteZz0kvkkYuvF0+Qn7lDLtjb0Ko+kJMcKtvMnZ3YU+iAfoJmlGVTk=
X-Received: by 2002:a92:4f:: with SMTP id 76mr18588367ila.11.1598571293162;
 Thu, 27 Aug 2020 16:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20191221150402.13868-1-murphyt7@tcd.ie>
 <465815ae-9292-f37a-59b9-03949cb68460@deltatee.com>
 <20200529124523.GA11817@infradead.org>
 <CGME20200529190523eucas1p2c086133e707257c0cdc002f502d4f51d@eucas1p2.samsung.com>
 <33137cfb-603c-86e8-1091-f36117ecfaf3@deltatee.com>
 <ef2150d5-7b6a-df25-c10d-e43316fe7812@samsung.com>
 <b9140772-0370-a858-578c-af503a06d8e9@deltatee.com>
 <CALQxJuutRaeX89k2o4ffTKYRMizmMu0XbRnzpFuSSrkQR02jKg@mail.gmail.com>
 <766525c3-4da9-6db7-cd90-fb4b82cd8083@deltatee.com>
In-Reply-To: <766525c3-4da9-6db7-cd90-fb4b82cd8083@deltatee.com>
From: Tom Murphy <murphyt7@tcd.ie>
Date: Fri, 28 Aug 2020 00:34:41 +0100
Message-ID: <CALQxJuuS8KKUX_eWWSE81gsq5ePAETB-FoqRUSWFfqgr+B13gg@mail.gmail.com>
Subject: Re: [PATCH 0/8] Convert the intel iommu driver to the dma-iommu api
To: Logan Gunthorpe <logang@deltatee.com>
Cc: kvm@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Julien Grall <julien.grall@arm.com>, Thierry Reding <thierry.reding@gmail.com>,
 Will Deacon <will@kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Christoph Hellwig <hch@infradead.org>, linux-rockchip@lists.infradead.org,
 Andy Gross <agross@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 linux-mediatek@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>, Cornelia Huck <cohuck@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Kukjin Kim <kgene@kernel.org>,
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

On Thu, 27 Aug 2020 at 22:36, Logan Gunthorpe <logang@deltatee.com> wrote:
>
>
>
> On 2020-08-23 6:04 p.m., Tom Murphy wrote:
> > I have added a check for the sg_dma_len == 0 :
> > """
> >  } __sgt_iter(struct scatterlist *sgl, bool dma) {
> >         struct sgt_iter s = { .sgp = sgl };
> >
> > +       if (sgl && sg_dma_len(sgl) == 0)
> > +           s.sgp = NULL;
> >
> >         if (s.sgp) {
> >             .....
> > """
> > at location [1].
> > but it doens't fix the problem.
>
> Based on my read of the code, it looks like we also need to change usage
> of sgl->length... Something like the rough patch below, maybe?
>
> Also, Tom, do you have an updated version of the patchset to convert the
> Intel IOMMU to dma-iommu available? The last one I've found doesn't
> apply cleanly (I'm assuming parts of it have been merged in slightly
> modified forms).
>

I'll try and post one in the next 24hours

> Thanks,
>
> Logan
>
> --
>
> diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h
> b/drivers/gpu/drm/i915/i915
> index b7b59328cb76..9367ac801f0c 100644
> --- a/drivers/gpu/drm/i915/i915_scatterlist.h
> +++ b/drivers/gpu/drm/i915/i915_scatterlist.h
> @@ -27,13 +27,19 @@ static __always_inline struct sgt_iter {
>  } __sgt_iter(struct scatterlist *sgl, bool dma) {
>         struct sgt_iter s = { .sgp = sgl };
>
> +       if (sgl && !sg_dma_len(s.sgp))
> +               s.sgp = NULL;
> +
>         if (s.sgp) {
>                 s.max = s.curr = s.sgp->offset;
> -               s.max += s.sgp->length;
> -               if (dma)
> +
> +               if (dma) {
> +                       s.max += sg_dma_len(s.sgp);
>                         s.dma = sg_dma_address(s.sgp);
> -               else
> +               } else {
> +                       s.max += s.sgp->length;
>                         s.pfn = page_to_pfn(sg_page(s.sgp));
> +               }
>         }
>
>         return s;
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
