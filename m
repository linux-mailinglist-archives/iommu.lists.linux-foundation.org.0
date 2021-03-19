Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FA9341DCB
	for <lists.iommu@lfdr.de>; Fri, 19 Mar 2021 14:11:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5A024ED9D;
	Fri, 19 Mar 2021 13:11:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YvlieQgmQr0f; Fri, 19 Mar 2021 13:11:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68E5A4ED4C;
	Fri, 19 Mar 2021 13:11:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43D32C0010;
	Fri, 19 Mar 2021 13:11:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D75B0C0001
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 13:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B842483AD1
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 13:11:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=chromium.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xC2s3nwbyuQC for <iommu@lists.linux-foundation.org>;
 Fri, 19 Mar 2021 13:11:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C37F383AC9
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 13:11:13 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id d10so1170387ils.5
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 06:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FomIKOx2mj7TAYUlB1ZCPvBZagtXVL3wiwg1FK3ni7o=;
 b=jkjDkZmIHc+1If7PMRab98D25OkHQM3Ug/BrFz+I/RViiODUTN9gnLIpSwOdnfEv78
 uCOHFXbSmbKxWkwbSeep6hYaHMiXSJXmwD+lYMiQyHgtFsbQimIvSCp1edMGW2ieDrmI
 XKdQN7Xooeaq77YRPyPwvoxQ4KBkmmBE/Rxug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FomIKOx2mj7TAYUlB1ZCPvBZagtXVL3wiwg1FK3ni7o=;
 b=Uik5nPe07ROhEEo2ciMpyB7qsLZeRuHZcP43GgQynR4iPGYdfiLkeRdECYoiBukHNi
 CemyRcDcvXGIA5kwUU8SFsDGyXj0YRB92KDOjwm04tAZG9g7TApRbuwCLPrS+KUVqAbA
 zMOzSPhLyaz4weNRWdvAycSGOFigTdwe6ThIxSy9bRCCQ5Rn595EnqwiNzKPDZKSmHbc
 uw7LD95zMRpGxXY4kVUJ1LdWAo8m0g+E8jOeFC8HFimghCNBpsFDBEemAmJEZc2oCge+
 0L7HvmqK6wVqwZu7t8zwzYuQ6dnQYHDGSOrUOllw/Tx/IMsnIGvg94JI6VVJjoSwminp
 HyuQ==
X-Gm-Message-State: AOAM531rrU7PAfbq42K6hBM4CVdLdimsAKdaBpFn4pyp/HUtmV7S3lrh
 vI+kDeU9PlWTdLLjbQ0hmZ+UhZXENd1VkPcY
X-Google-Smtp-Source: ABdhPJzyGdFpyV6DKIStvaqaL3fsqXKWGJ4OInT+0r6VZO2B9+hsJeHY7uQ2sQpWoyyITp2/swiX3Q==
X-Received: by 2002:a05:6e02:1094:: with SMTP id
 r20mr2641939ilj.154.1616159465413; 
 Fri, 19 Mar 2021 06:11:05 -0700 (PDT)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com.
 [209.85.166.47])
 by smtp.gmail.com with ESMTPSA id a5sm2619700ilk.14.2021.03.19.06.11.04
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 06:11:05 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id f19so6007990ion.3
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 06:11:04 -0700 (PDT)
X-Received: by 2002:a05:6602:722:: with SMTP id g2mr2702953iox.1.1616159464446; 
 Fri, 19 Mar 2021 06:11:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210312235521.1408503-1-ribalda@chromium.org>
 <CANiDSCunsYwjB=PYYJnpaEnB3pg7No40gOE1jTVwxJkJJpE2Nw@mail.gmail.com>
 <20210319131011.GA3372@lst.de>
In-Reply-To: <20210319131011.GA3372@lst.de>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Mar 2021 14:10:53 +0100
X-Gmail-Original-Message-ID: <CANiDSCsid-gcq_HWWh=M0mOT947F7bj1QYANo4i0TwUSEkkEbg@mail.gmail.com>
Message-ID: <CANiDSCsid-gcq_HWWh=M0mOT947F7bj1QYANo4i0TwUSEkkEbg@mail.gmail.com>
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

Hi Christoph

On Fri, Mar 19, 2021 at 2:10 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Fri, Mar 19, 2021 at 02:05:21PM +0100, Ricardo Ribalda wrote:
> > > +                                   uvc_urb->sgt,
> > > +                                   uvc_stream_dir(uvc_urb->stream));
> > > +       return usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
> > > +}
> >
> > We should have mem_flags instead of GFP_KERNEL here
> >
> >
> > Is it too late to fix it in your tree? Do I need to send a patch to fix it?
>
> As far as I know we don't have anything that has pulled in the tree yet,
> so I can just fold the fix in.

Ohh good :). Thanks! and sorry again.



-- 
Ricardo Ribalda
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
