Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 24499227FBB
	for <lists.iommu@lfdr.de>; Tue, 21 Jul 2020 14:15:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 22FE58838B;
	Tue, 21 Jul 2020 12:15:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rn9GI6YvZl+L; Tue, 21 Jul 2020 12:15:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7EFF488399;
	Tue, 21 Jul 2020 12:15:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 569A5C016F;
	Tue, 21 Jul 2020 12:15:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1250AC016F
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 12:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EED2C88710
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 12:15:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 85IZF+qCOgkR for <iommu@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 12:15:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D481988703
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 12:15:40 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id f18so21026412wrs.0
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jul 2020 05:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cA94sOb8FIWUebxDf9ORKnnfau0NCB40GlOe2QaQBCg=;
 b=CgIwfOLZksxv01U3Ox2GEGHdpWnCJf2DcA0Z30hMqfNdGZGPQqnOTXWRFSEa2cDN59
 Ed7YOlHnYg2vT9nCzGgVDPoHfnIeTnQchaAyDU2lpXTJ2g2knxzsZQCWeU3sF7kCcG0z
 ESICCvgchuKCulzBv9d+6QazxM0cFhDfSTzLetZmj+RcUnNOVUjewbAQOhMQD3DZUSXn
 mtpPRD2pZEHua4CnfLCIOmZkh9a++EJnqBI0deaYFBVGM7vTJj7X+h7kc0CBMoCqHld3
 0S7ZTwemnITiJIPRzuWgA/frR3/wFYPJHP2D2LH9i72VZxj4wQbfAy4F5ANTOLknIZrl
 w8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cA94sOb8FIWUebxDf9ORKnnfau0NCB40GlOe2QaQBCg=;
 b=Ie2kDYPQ6+2RODjDHyuhWOWTuA0PUwmJH4+HDK+cInUmHhgiWlF9iIgT6bwQ842non
 37sH32ll2iBtEIhyyV/qru+zwLtz6RN0/buUWFrFyGvpy6g1HjT4GPghpTh8H6lJ2AOX
 0F9LUM9NGWmXXlTUBpm28DeIDDLJr0mSUngyCPl5cFT3F56sNdMbmYMfcfkz9XlNj1qa
 7HFTMIDlrEQViyA7p5bF6riTHoAqHymguCU2HGf7bj/f4kJWy6carU5Tt0Rs9uoKU/Cb
 fXkjH7/R6fzgXaH7nZ2odhB9oopNKSc+64EtnR+sbsWGG56XYV4Ee7JxV/GMJa7nKV1h
 Eq8Q==
X-Gm-Message-State: AOAM533cQ2n2z4oZi3y47oskIMOQIezOtpSGRxV4D9eEzH92qF3mZ+Fw
 KovLsNLEfBEPuh2pl42pycXOZ3y3PX/d45CRKFfxSg==
X-Google-Smtp-Source: ABdhPJwW0WH69zD26zuxdyq5u22D6RndDM2fZyyK4TA+BkoXC0YCwHYj75KOg4xS6IYhZgmv0Dl7nJVqj7f2gXXm0Sg=
X-Received: by 2002:adf:fc06:: with SMTP id i6mr8168305wrr.79.1595333739178;
 Tue, 21 Jul 2020 05:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200708164936.9340-1-nsaenzjulienne@suse.de>
 <CAMi1Hd35tRM=cnmzwX=SDgu-OoXi1Xj+twFkoULaVZBbTpe6sw@mail.gmail.com>
 <550b30a86c0785049d24c945e2c6628d491cee3a.camel@suse.de>
 <CAMi1Hd2V2pJjP=USS4r-Z3vK-aq7_aBy-jcVNk1GvbdEQAuzWg@mail.gmail.com>
 <011994f8a717a00dcd9ed7682a1ddeb421c2c43f.camel@suse.de>
In-Reply-To: <011994f8a717a00dcd9ed7682a1ddeb421c2c43f.camel@suse.de>
From: Amit Pundir <amit.pundir@linaro.org>
Date: Tue, 21 Jul 2020 17:45:02 +0530
Message-ID: <CAMi1Hd0=ZsGhTkSy221EP9Vb3GMOcS0UMczX2u5X9qK37_ea1A@mail.gmail.com>
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

On Tue, 21 Jul 2020 at 16:45, Nicolas Saenz Julienne
<nsaenzjulienne@suse.de> wrote:
>
> On Tue, 2020-07-21 at 14:24 +0530, Amit Pundir wrote:
> > On Tue, 21 Jul 2020 at 14:09, Nicolas Saenz Julienne
> > <nsaenzjulienne@suse.de> wrote:
> > > Hi Amit,
> > > > Hi Nicolas,
> > > >
> > > > I see a boot regression with this commit d9765e41d8e9 "dma-pool:
> > > > Do not allocate pool memory from CMA" on my Xiaomi Poco F1
> > > > (Qcom sdm845) phone running v5.8-rc6. I can't boot past the
> > > > bootloader splash screen with this patch.
> > > >
> > > > Phone boots fine if I revert this patch. I carry only one out of
> > > > tree
> > > > dts patch https://lkml.org/lkml/2020/6/25/52. And since this is a
> > > > stock
> > > > phone, I don't have access to serial/dmesg logs until I boot to
> > > > AOSP
> > > > (adb) shell.
> > > >
> > > > Any thoughts as to what might be going wrong here? I'd be happy
> > > > to
> > > > help debug things. For what it's worth, I don't see this
> > > > regression
> > > > on
> > > > other two sdm845 devices (db845c and Pixel 3) I tested on.
> > >
> > > Can you provide a boot log (even if without my patch) and the
> > > device-
> > > tree files? It'd help a lot figuring things out.
> >
> > Thank you for the prompt reply Nicolas.
> >
> > Here is the boot log with the reverted patch
> > https://pastebin.ubuntu.com/p/BrhPf83nKF/
> >
> > Here is my phone's dts
> > https://github.com/pundiramit/linux/commit/2a394c199deeaf4c91e0e008e8fba2a72f494d8c
>
> I'm at loss at what could be failing here. Your device should be able
> to address the whole 8GB memory space, which AFAIK is the max available
> on that smartphone family. But maybe the device-tree is lying, who
> knows...

If it helps, my phone has 6GB memory space.

>
> Can you try booting *without* my patch and this in the kernel command
> line: "cma=16M@0x100000000-0x200000000".

It doesn't boot with this added kernel command line.

Regards,
Amit Pundir

>
> Regards,
> Nicolas
>
> And here is my kernel tree just in case
> > https://github.com/pundiramit/linux/commits/beryllium-mainline
> >
> > Regards,
> > Amit Pundir
> >
> >
> > > Regards,
> > > Nicolas
> > >
> > > > Regards,
> > > > Amit Pundir
> > > >
> > > > > Reported-by: Jeremy Linton <jeremy.linton@arm.com>
> > > > > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> > > > > ---
> > > > >
> > > > > An more costly alternative would be adding an option to
> > > > > dma_alloc_from_contiguous() so it fails when the allocation
> > > > > doesn't
> > > > > fall
> > > > > in a specific zone.
> > > > >
> > > > >  kernel/dma/pool.c | 11 ++---------
>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
