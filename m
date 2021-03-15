Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC9E33AC57
	for <lists.iommu@lfdr.de>; Mon, 15 Mar 2021 08:35:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2E608348C;
	Mon, 15 Mar 2021 07:35:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pjektqKUGH78; Mon, 15 Mar 2021 07:35:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id D29E3825C7;
	Mon, 15 Mar 2021 07:35:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ADDF3C0001;
	Mon, 15 Mar 2021 07:35:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C3B3C0001
 for <iommu@lists.linux-foundation.org>; Mon, 15 Mar 2021 07:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A46F48CA9
 for <iommu@lists.linux-foundation.org>; Mon, 15 Mar 2021 07:35:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=chromium.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bapADnrEgfNM for <iommu@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 07:35:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B6F0483DE
 for <iommu@lists.linux-foundation.org>; Mon, 15 Mar 2021 07:35:45 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id i18so8400255ilq.13
 for <iommu@lists.linux-foundation.org>; Mon, 15 Mar 2021 00:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qvhzd78JFcrVgfmlvFEjQlY3MhKPukXzd21KEKGnhww=;
 b=WPXVk3F7SA4y4Nef8rJie6Wi/p9PQeGdCHaSp5I1F/sH2CtRCHSyg3Mniin5qndmyx
 owDJSvOtd/CYMCnwsSQPLt3OyDJqXeoxmitkYCAq1yTLfQ/SztFPc9kk5eZat5r143GM
 gjjURblzzz8moUhqvmiT6jt7NRQO/ocAOGPEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qvhzd78JFcrVgfmlvFEjQlY3MhKPukXzd21KEKGnhww=;
 b=l2Ythpc22FZNBKpSU/cV7wDN2cwvumULvR08G0NIA0w3OPqiPVIwPQ56X6o04318EK
 75EzuXaT1Cpmx9UJynwwEtl4BgWkB9R28/WxOyimZiUQQnS+xQ71WdptB/5TqWvNw5gY
 jbgvq+UX2HykI5VHhsgmtldmnSGXisUS0VzA0RVXMHIXR500IIhM1OYBajJWt8lfac1M
 KiU5fERNFqorzXY4r2uiB+iUEZNUWElrene2FJpqnvBoLHXmdH7I+qARvk37uf3HheMp
 InmcZ8OOnVxPMhc4R9s+keLKDuaoNARLLru0p9va4YQBO8v0uVAdpIIxrxexuwlPuZb9
 8kaA==
X-Gm-Message-State: AOAM531NmlxufVNR31GM82P25jl3w1cpWlvUBNSDcfC/79HmEXOfJGJH
 20KXIU9qLdEbhWAob7FZKm16HcBf25NMoA==
X-Google-Smtp-Source: ABdhPJwQ5VB0KgrhR2kzRjm4wIcuHDzUdCrLhNHHfzAS7/0/j3YD903m3WXsiIagnrNIaaYgLr3+2g==
X-Received: by 2002:a05:6e02:f90:: with SMTP id
 v16mr10452196ilo.294.1615793744446; 
 Mon, 15 Mar 2021 00:35:44 -0700 (PDT)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com.
 [209.85.166.43])
 by smtp.gmail.com with ESMTPSA id h6sm6406679ild.79.2021.03.15.00.35.43
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 00:35:44 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id o11so32392782iob.1
 for <iommu@lists.linux-foundation.org>; Mon, 15 Mar 2021 00:35:43 -0700 (PDT)
X-Received: by 2002:a05:6602:722:: with SMTP id g2mr6345139iox.1.1615793743446; 
 Mon, 15 Mar 2021 00:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210312235521.1408503-1-ribalda@chromium.org>
 <CANiDSCvK8AD7RUYGN-7e1zH9cMGTqGnwn4fJ+ZfKtktuJC14Nw@mail.gmail.com>
 <20210315073416.GA25860@lst.de>
In-Reply-To: <20210315073416.GA25860@lst.de>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Mar 2021 08:35:36 +0100
X-Gmail-Original-Message-ID: <CANiDSCtAXmGjjN3OZVOdtquAnOW7emk_HYvQqJQtnvVAcsmRHQ@mail.gmail.com>
Message-ID: <CANiDSCtAXmGjjN3OZVOdtquAnOW7emk_HYvQqJQtnvVAcsmRHQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] media: uvcvideo: Use dma_alloc_noncontiguous API
To: Christoph Hellwig <hch@lst.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sergey Senozhatsky <senozhatsky@google.com>,
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

On Mon, Mar 15, 2021 at 8:34 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Mar 15, 2021 at 08:30:57AM +0100, Ricardo Ribalda wrote:
> > Hi Christoph
> >
> > I guess you can merge this patch from your tree. I hope it is not too
> > late in this release cycle.
>
> The timing is perfectly fine, I haven't even started the dma-mapping tree
> for v5.13 yet.

Awesome!

Thanks Laurent for the review!


-- 
Ricardo Ribalda
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
