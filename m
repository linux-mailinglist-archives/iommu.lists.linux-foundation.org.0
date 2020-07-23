Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C990322A6D3
	for <lists.iommu@lfdr.de>; Thu, 23 Jul 2020 07:15:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7433988F09;
	Thu, 23 Jul 2020 05:15:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MPf0Jh+fS77h; Thu, 23 Jul 2020 05:15:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A89AC88F0B;
	Thu, 23 Jul 2020 05:15:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8D420C004C;
	Thu, 23 Jul 2020 05:15:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14E60C004C
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 05:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F168688F0A
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 05:15:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uWoO0Dr1coOr for <iommu@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 05:15:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E067E88F09
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 05:15:35 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 184so4002092wmb.0
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 22:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bX4hF15fb4QpI7ClXOhtVIgAOWzu+DtBaB8S3WsGu9Y=;
 b=FPZoKCncFCCOJIrOpOgeYJ4kwY9n/6s988T1EfCLMfwVfkXTc1B/+umcAHDY9RbS5v
 n0yR1Psi9ZEBb94v+PLNbqE0Z/x11MuCmKkzCx04Lqx+I43COT0M9YuPsODgB1VWTUbv
 4max/Y3eQAsiiTUnHHr2ha0hg+Y15p3TrX+6OHrE4ZA2eRkdkwKO77G2fVxY/m2V6zQi
 R7ZZYOAoP2ROJd/cMz7m6/WeGFlzS9BgdTAhTL868K5xaXmzLzU1PupiMH3bSNQlb6mw
 4deqkHRoCPfmT7cY5c/ZgnJrWgqJXZu16pSRLn3Ul7kcu4TfMowa1z4aB5RIfUBsZ/QL
 IUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bX4hF15fb4QpI7ClXOhtVIgAOWzu+DtBaB8S3WsGu9Y=;
 b=j/ihRwTcJV60jwKTcTi44Qrdr2ec98C32ypH518GRJUYr6sQ16tlAYb1SPr4wWWWhL
 c8ni4IfiS/z09lVI0Uoa/G4vGHHuJ+QWefQ9TtmwDtB5QmS2g/gGVTXPh92vrJZ7H2zZ
 G771NiMw3dAbbRVfb/Ag3SjDeP1GTf2x13OBxRKs0UlYD4Xszl4wDKRB8CTqKBXmeqMr
 UOhGBupThUUSgQrnC3j6U7E7N5R2XcP6Itf8Fa19miFBMAG8QrROUTNoWmE2UcJPVK9h
 c2AmHFzoUDcNj0w6WqKOH8OZkah3a8d4U1d2teKDCos3Z5r+d4+p1s8eiohua5bUeWNa
 dpjg==
X-Gm-Message-State: AOAM531GyepVs3fd3MPSvHB98HDhYrTwXkYvy8giKHEE2fEKJwZ4PSd6
 w/flV627lqDHRJn+nKUMBIrKtKXeloqWlTdOQ/PhMQ==
X-Google-Smtp-Source: ABdhPJwQKeWViofbSLvDDVtSH5ftjWOqVCzRvEn5jLpMrBww8td7Otzpsuum4Q6T2K7Dp674XwXYZ44UkJOEB44u0CQ=
X-Received: by 2002:a05:600c:2209:: with SMTP id
 z9mr2452342wml.70.1595481334259; 
 Wed, 22 Jul 2020 22:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200708164936.9340-1-nsaenzjulienne@suse.de>
 <CAMi1Hd35tRM=cnmzwX=SDgu-OoXi1Xj+twFkoULaVZBbTpe6sw@mail.gmail.com>
 <550b30a86c0785049d24c945e2c6628d491cee3a.camel@suse.de>
 <CAMi1Hd2V2pJjP=USS4r-Z3vK-aq7_aBy-jcVNk1GvbdEQAuzWg@mail.gmail.com>
 <011994f8a717a00dcd9ed7682a1ddeb421c2c43f.camel@suse.de>
 <CAMi1Hd0=ZsGhTkSy221EP9Vb3GMOcS0UMczX2u5X9qK37_ea1A@mail.gmail.com>
 <01831596e4a2a6c9c066138b23bd30435f8e5569.camel@suse.de>
 <CAMi1Hd3C6kh5E49EgytBAQ_2AE_jvnp+eSNsxBYaux+exSvdbg@mail.gmail.com>
 <6db722947546221ed99d3f473f78e1a6de65d7d6.camel@suse.de>
In-Reply-To: <6db722947546221ed99d3f473f78e1a6de65d7d6.camel@suse.de>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Thu, 23 Jul 2020 10:44:58 +0530
Message-ID: <CAMi1Hd0Xz6kOJFpA5PEpi6RDDGOcz0RmQ7tTOkuXq4QneOO_vQ@mail.gmail.com>
Subject: Re: [PATCH] dma-pool: Do not allocate pool memory from CMA
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: lkml <linux-kernel@vger.kernel.org>, jeremy.linton@arm.com,
 Sumit Semwal <sumit.semwal@linaro.org>, iommu@lists.linux-foundation.org,
 John Stultz <john.stultz@linaro.org>, linux-rpi-kernel@lists.infradead.org,
 David Rientjes <rientjes@google.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
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

Hi Nicolas,

Sorry I got stuck on other things yesterday.

On Tue, 21 Jul 2020 at 21:57, Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> On Tue, 2020-07-21 at 20:52 +0530, Amit Pundir wrote:
>
> [...]
>
> > > > > Can you try booting *without* my patch and this in the kernel
> > > > > command
> > > > > line: "cma=16M@0x100000000-0x200000000".
> > > >
> > > > It doesn't boot with this added kernel command line.
> > >
> > > For the record, this placed the CMA in the [4GB, 8GB] address space
> > > instead of you setup's default: [3GB, 4GB]. All atomic pools fall
> > > in
> > > that memory area without my patch, which makes me think some of the
> > > devices on your board might not like higher addresses.
> > >
> >
> > Thank you Nicolas for the details. Though we don't set the CMA
> > alloc-ranges explicitly in upstream sdm845 dts, but I dug around and
> > found that CMA alloc-ranges in the downstream kernel are indeed in
> > lower address space.
> > https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/dipper-q-oss/arch/arm64/boot/dts/qcom/sdm845.dtsi#L662
> >
> > /* global autoconfigured region for contiguous allocations */
> > linux,cma {
> >         compatible = "shared-dma-pool";
> >         alloc-ranges = <0 0x00000000 0 0xffffffff>;
> >         reusable;
> >         alignment = <0 0x400000>;
> >         size = <0 0x2000000>;
> >         linux,cma-default;
> > };
>
> Pretty standard, and similar to what it's being used upstream by
> default.
>
> >
> > > What happens if you boot with my troublesome patch with this in
> > > your
> > > device tree? (insert it at the bottom of sdm845-beryllium.dts)
> > >
> > > &soc {
> > >         dma-ranges = <0 0 0 0 0x1 0>;
> > > };
> > >
> >
> > Device still doesn't boot up to adb shell.
>
> Let's get a bigger hammer, I'm just looking for clues here. Can you
> apply this and provide the dmesg output.
>
> diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
> index 6bc74a2d5127..2160676bf488 100644
> --- a/kernel/dma/pool.c
> +++ b/kernel/dma/pool.c
> @@ -268,6 +268,8 @@ void *dma_alloc_from_pool(struct device *dev, size_t size,
>                         schedule_work(&atomic_pool_work);
>         }
>
> +       dev_info(dev, "%s: size %lx, phys addr %llx, flags 0x%x\n", __func__, size, phys, flags);
> +
>         return ptr;
>  }

I never made it to dma_alloc_from_pool() call from
dma_direct_alloc_pages(), dma_should_alloc_from_pool() returns False
from gfpflags_allow_blocking() block.


Regards,
Amit Pundir

>
>
> Regards,
> Nicolas
>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
