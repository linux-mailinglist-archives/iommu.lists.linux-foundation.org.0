Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE2861DF9
	for <lists.iommu@lfdr.de>; Mon,  8 Jul 2019 13:54:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 23AFA24CE;
	Mon,  8 Jul 2019 11:53:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A3DD92468
	for <iommu@lists.linux-foundation.org>;
	Mon,  8 Jul 2019 11:46:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ua1-f66.google.com (mail-ua1-f66.google.com
	[209.85.222.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3C18A898
	for <iommu@lists.linux-foundation.org>;
	Mon,  8 Jul 2019 11:46:27 +0000 (UTC)
Received: by mail-ua1-f66.google.com with SMTP id o2so4804991uae.10
	for <iommu@lists.linux-foundation.org>;
	Mon, 08 Jul 2019 04:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=flSipI0xpnq86C8I/rrm9xZYmUfxRgobFckLUfbaRC8=;
	b=XXb+Q80fYNPiOi+n2vBpTR7ILscbEfWMSgFLUGGBp0WIXyrchBmIU+NDlQakm7jnM8
	tMOGGlXLa6lhxN8Ra5giF5vusg5FAGcyYjayn4957m4SVC5MJ6sWMYf/OxIiDdEXGjyl
	t0iUctAF15Luy9UaHIMu7DeLX/vVTxmDkPCj5Sd3ctiKIAbE6unYRJZiySlXBWUfp3Qt
	wSm5DjC32317VN9BrP1dS0bGuEjxebRetq6Ln0vcwZpEzFLSO9tqdk3raraxZko69lN0
	02Xs/0veoLx/lL8aN++HqWTdEhSnkt6acjQytnwnnYv3k8Q3yxAL+Dnno9K+Jo/jxapZ
	ShmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=flSipI0xpnq86C8I/rrm9xZYmUfxRgobFckLUfbaRC8=;
	b=grlYXSshhkU5qxPWSLLCjYPyXATybISvW148oZKYoWIeLHFEIi/xgSyrfRggPZfriG
	tp32aDOeYB+by3h1HocuDvsdvNEF7W/N4LAIPODgjw1VK9/Maku1r4x0p6S3VJJNWNg4
	3nLkW4HXXa1cZqaTcmnYFpGE+dnvqM3UbTaMwl57V3zZFypl5sbD3ms0MBTMazJVj/E2
	Sz2vhneYy9IPLA3mbggeNoKw2Dx3dDa9RRKqjtIqfg3o2eFX5YBiU6V6UOYXZCL9oEsI
	zS7ecgi8MOXbBYaKjyKyeeyy9aExS83my41NjbDas/AE8LAsm+qnD6IGkH335m6XGWLD
	z1pw==
X-Gm-Message-State: APjAAAXfzC749TjRq27fW4BctCI3enmKh7FOqJBcmhed7PNMq8bVtbs8
	dFpp9RT3WUXLHEiOpiKgkGj56jtZ92sq0hW6x5TuAw==
X-Google-Smtp-Source: APXvYqyFEUscJD5GsIV+BS++o/YX8MWQdCWyg9O7X6Nb/wsuAeld8qTTFnYvdC785Otd3OEmiYJn0ixqzjixmeBiM0Q=
X-Received: by 2002:ab0:60ad:: with SMTP id f13mr9491120uam.129.1562586386291; 
	Mon, 08 Jul 2019 04:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <1561020610-953-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<1561020610-953-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<20190624062414.GD2989@lst.de>
In-Reply-To: <20190624062414.GD2989@lst.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 8 Jul 2019 13:45:50 +0200
Message-ID: <CAPDyKFpuRzmZUK730FMnh0hf3WRFb9aA=o9ciNt2ei8n803vsQ@mail.gmail.com>
Subject: Re: [RFC PATCH v7 5/5] mmc: queue: Use bigger segments if DMA MAP
	layer can merge the segments
To: Christoph Hellwig <hch@lst.de>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jens Axboe <axboe@kernel.dk>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	linux-block <linux-block@vger.kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
	Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
	Robin Murphy <robin.murphy@arm.com>
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

On Mon, 24 Jun 2019 at 08:24, Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Jun 20, 2019 at 05:50:10PM +0900, Yoshihiro Shimoda wrote:
> > When the max_segs of a mmc host is smaller than 512, the mmc
> > subsystem tries to use 512 segments if DMA MAP layer can merge
> > the segments, and then the mmc subsystem exposes such information
> > to the block layer by using blk_queue_can_use_dma_map_merging().
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  drivers/mmc/core/queue.c | 35 ++++++++++++++++++++++++++++++++---
> >  include/linux/mmc/host.h |  1 +
> >  2 files changed, 33 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
> > index 92900a0..ab0ecc6 100644
> > --- a/drivers/mmc/core/queue.c
> > +++ b/drivers/mmc/core/queue.c
> > @@ -24,6 +24,8 @@
> >  #include "card.h"
> >  #include "host.h"
> >
> > +#define MMC_DMA_MAP_MERGE_SEGMENTS   512
> > +
> >  static inline bool mmc_cqe_dcmd_busy(struct mmc_queue *mq)
> >  {
> >       /* Allow only 1 DCMD at a time */
> > @@ -196,6 +198,12 @@ static void mmc_queue_setup_discard(struct request_queue *q,
> >               blk_queue_flag_set(QUEUE_FLAG_SECERASE, q);
> >  }
> >
> > +static unsigned int mmc_get_max_segments(struct mmc_host *host)
> > +{
> > +     return host->can_dma_map_merge ? MMC_DMA_MAP_MERGE_SEGMENTS :
> > +                                      host->max_segs;
>
> I personally don't like superflous use of ? : if an if would be more
> obvious:
>
>         if (host->can_dma_map_merge)
>                 return MMC_DMA_MAP_MERGE_SEGMENTS;
>         return host->max_segs;
>
> but that is really just a nitpick and for the mmc maintainer to decide.

I have no strong opinions, both formats are used in mmc code, so I am
fine as is.

>
> Otherwise looks good:
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
