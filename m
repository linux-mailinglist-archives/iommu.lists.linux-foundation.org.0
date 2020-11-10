Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 981342AD2CB
	for <lists.iommu@lfdr.de>; Tue, 10 Nov 2020 10:50:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5399E8665E;
	Tue, 10 Nov 2020 09:50:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UqB-F1-HYwAk; Tue, 10 Nov 2020 09:50:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9BBCF86644;
	Tue, 10 Nov 2020 09:50:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 890E2C016F;
	Tue, 10 Nov 2020 09:50:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9CD62C016F
 for <iommu@lists.linux-foundation.org>; Tue, 10 Nov 2020 09:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 41D1120464
 for <iommu@lists.linux-foundation.org>; Tue, 10 Nov 2020 09:50:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id muGw6EmZ01Cm for <iommu@lists.linux-foundation.org>;
 Tue, 10 Nov 2020 09:50:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by silver.osuosl.org (Postfix) with ESMTPS id F221E20413
 for <iommu@lists.linux-foundation.org>; Tue, 10 Nov 2020 09:50:46 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id i19so16597461ejx.9
 for <iommu@lists.linux-foundation.org>; Tue, 10 Nov 2020 01:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/xvo1QegjGszfBVPbZfwcJiTRf9LyLsH4tfXgS3DTXk=;
 b=XBZqy3t9IZQRFydJbi3EOQsbNKSoGIh1pco/g0+bITyoIUkri4wfPjhNf10PvUjdHM
 oiUisGj+v2Bm78WVce9YT8uqvFdrkdOzLCpu67P/MAJzNpCqHb4m8FThormd6bSjouLr
 54cSY+5h7nBsSNX31MZu8MmYatBGeKY3cH/a8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/xvo1QegjGszfBVPbZfwcJiTRf9LyLsH4tfXgS3DTXk=;
 b=N4rdztwj0I9rMSchBLMZoJUAB9tID5ZTaqu3gizmrUvwsFhEv2n3XptB2Z2FkCcuB2
 e3QBLlCVCWxVHcPfPwKgxVfzpi9tMvAUpfbve/oXz6JYbNDXKAXfDVpgFii1frhZsy2U
 Ud3RZtLcL3s+IqK676hF8nl1Zw0n7loSjYw5TK8Z4qjIeIqeS22Tghtc3F0ffPmKitZQ
 LbYauwShYYDqQf5BJG2mLJSoTdCY7lLYLs6TjPmUBYluAF2pCYuw0Phkh1+9dTTpCAwy
 Ztoz/hLK6wzLuQJ7pZ1lmfbq9FCFMrG5qSlJwyg0voeFVa6kE4mgqL/i0w5dPHsQ/F2d
 dElg==
X-Gm-Message-State: AOAM532jDWUr8r8VRWbWNcssIpRadHDgPZTr+tzZ/+Q3y0HJIoJCpEOz
 kOYPOs73nEGDaqJXBucBXzosXSt1pPJFnQ==
X-Google-Smtp-Source: ABdhPJyaFqtfPqZyHBXSUzbiCvV5X8g/tXmXQQmfaZ664rp8UUDBTleID3nJoNBmSe0Z8sfwIpWFoQ==
X-Received: by 2002:a17:906:8555:: with SMTP id
 h21mr20115196ejy.533.1605001845086; 
 Tue, 10 Nov 2020 01:50:45 -0800 (PST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42])
 by smtp.gmail.com with ESMTPSA id e13sm10089947ejh.65.2020.11.10.01.50.44
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 01:50:44 -0800 (PST)
Received: by mail-wr1-f42.google.com with SMTP id r17so8030030wrw.1
 for <iommu@lists.linux-foundation.org>; Tue, 10 Nov 2020 01:50:44 -0800 (PST)
X-Received: by 2002:adf:ed11:: with SMTP id a17mr8193482wro.197.1605001843595; 
 Tue, 10 Nov 2020 01:50:43 -0800 (PST)
MIME-Version: 1.0
References: <20200930160917.1234225-1-hch@lst.de>
 <20200930160917.1234225-9-hch@lst.de>
 <CAAFQd5CttttqMXb=iDPb+Z0WGUa2g=W6JwXJ-5HbhmrDyxP+cQ@mail.gmail.com>
 <CANiDSCtefXKw-xC3bskyggW-BzCmVPj6GGLvO=cCPZHbS1oTDA@mail.gmail.com>
 <20201110092506.GA24469@lst.de>
 <CANiDSCsBUBV1WA2To9x26Uhc5SU-4xuh3m4wUwXBcGwA6n8now@mail.gmail.com>
In-Reply-To: <CANiDSCsBUBV1WA2To9x26Uhc5SU-4xuh3m4wUwXBcGwA6n8now@mail.gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 10 Nov 2020 18:50:32 +0900
X-Gmail-Original-Message-ID: <CAAFQd5CCOrp0OA_n_SHNO5RAhV-MQ2KuQJA+oWHQ76h_So=M2Q@mail.gmail.com>
Message-ID: <CAAFQd5CCOrp0OA_n_SHNO5RAhV-MQ2KuQJA+oWHQ76h_So=M2Q@mail.gmail.com>
Subject: Re: [PATCH 8/8] WIP: add a dma_alloc_contiguous API
To: Ricardo Ribalda <ribalda@chromium.org>, Christoph Hellwig <hch@lst.de>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
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

On Tue, Nov 10, 2020 at 6:33 PM Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Christoph
>
> On Tue, Nov 10, 2020 at 10:25 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > On Mon, Nov 09, 2020 at 03:53:55PM +0100, Ricardo Ribalda wrote:
> > > Hi Christoph
> > >
> > > I have started now to give a try to your patchset. Sorry for the delay.
> > >
> > > For uvc I have prepared this patch:
> > > https://github.com/ribalda/linux/commit/9094fe223fe38f8c8ff21366d893b43cbbdf0113
> > >
> > > I have tested successfully in a x86_64 noteboot..., yes I know there
> > > is no change for that platform :).
> > > I am trying to get hold of an arm device that can run the latest
> > > kernel from upstream.
> > >
> > > On the meanwhile if you could take a look to the patch to verify that
> > > this the way that you expect the drivers to use your api I would
> > > appreciate it
> >
> > This looks pretty reaosnable.
> >
>
> Great
>

Thanks Christoph for taking a look quickly.

> Also FYI, I managed to boot an ARM device with that tree. But I could
> not test the uvc driver (it was a remote device with no usb device
> attached)
>
> Hopefully I will be able to test it for real this week.
>
> Any suggestions for how to measure performance difference?

Back in time Kieran (+CC) shared a patch to add extra statistics for
packet processing and payload assembly, with results of various
approaches summarized in a spreadsheet:
https://docs.google.com/spreadsheets/d/1uPdbdVcebO9OQ0LQ8hR2LGIEySWgSnGwwhzv7LPXAlU/edit#gid=0

That and just simple CPU usage comparison would be enough.

>
> Thanks!
>
> > Note that ifdef  CONFIG_DMA_NONCOHERENT in the old code doesn't actually
> > work, as that option is an internal thing just for mips and sh..

In what terms it doesn't actually work? Last time I checked some
platforms actually defined CONFIG_DMA_NONCOHERENT, so those would
instead use the kmalloc() + dma_map() path. I don't have any
background on why that was added and whether it needs to be preserved,
though. Kieran, Laurent, do you have any insight?

Best regards,
Tomasz
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
