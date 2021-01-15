Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A525B2F7BF1
	for <lists.iommu@lfdr.de>; Fri, 15 Jan 2021 14:08:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 32DA487387;
	Fri, 15 Jan 2021 13:08:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F5i1TYeMnAUo; Fri, 15 Jan 2021 13:08:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9B89687385;
	Fri, 15 Jan 2021 13:08:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7296DC013A;
	Fri, 15 Jan 2021 13:08:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 97409C013A
 for <iommu@lists.linux-foundation.org>; Fri, 15 Jan 2021 13:08:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 850FA8737C
 for <iommu@lists.linux-foundation.org>; Fri, 15 Jan 2021 13:08:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CdG30S9nVmQC for <iommu@lists.linux-foundation.org>;
 Fri, 15 Jan 2021 13:08:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B2AD18737B
 for <iommu@lists.linux-foundation.org>; Fri, 15 Jan 2021 13:08:27 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id y19so17982081iov.2
 for <iommu@lists.linux-foundation.org>; Fri, 15 Jan 2021 05:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RTaj+kQTI0f7LZEXnhvKOz2cpPUJhSCbtgTVKj7/e7M=;
 b=EH9Lf/Qh5uutAxEfsjPu9Tu0c9s5EADzA4pymQanveSRfO8osic1lzoqlLFpKqmKgM
 ePUT9SwlH1pgv9q9fuQy6uxulz1L+MdF/UTIPxzPc9vEm7feTrhKPS0IT9sN69GG/h/D
 8x/BZqmWKrCkVwyxr6q7Or83KJQbyw2b5IrvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RTaj+kQTI0f7LZEXnhvKOz2cpPUJhSCbtgTVKj7/e7M=;
 b=q6ogSvYhgVJRYInysEVlPzD5qwMRGMUQ9K1WiO/jMqkBP0Ln7BJzhNT+NQyhSCfaRm
 /LSDwdDAtioSMth2W3UxujzraDngHH19HfYfYTDB3xIFe8ABh4Ecd/VgCNJCRQeTxvaF
 gM/CYdQ5EcaKdzjT5FCQQUIqlITxJ3oz2iE6/GvTM+WYZzSGgN7XXFrvADRXxZwfW+Sy
 PRRgvZBhhvOYLH7UN49XdneYgstNIU7WxCj/wpX1OKRLixaNtXwfu4O1PD7jPgP8HYfN
 AxbDnHydQn9a6yTgX1wHLfOIhSQOAKy2/7Wz6f9nKwrT+UMfYjT314Hxub6ywpph7YDu
 +UiQ==
X-Gm-Message-State: AOAM530ZrxVDG6JJUD0x39uhlHvQFI2P4xFZIYWAo1p5eQr2JcplcBgK
 Zh92Df11oWCZFzISRYLBl6GEsZkdJefsyg==
X-Google-Smtp-Source: ABdhPJztQfbyOvv6I4ftj3a2tTH9b4KPWynyoYqPi0MwCXnF169XqTHAOMiel8+kblwisg6ft7EjmA==
X-Received: by 2002:a05:6e02:50e:: with SMTP id
 d14mr10727436ils.248.1610716106704; 
 Fri, 15 Jan 2021 05:08:26 -0800 (PST)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com.
 [209.85.166.51])
 by smtp.gmail.com with ESMTPSA id b22sm3946922ioa.10.2021.01.15.05.08.25
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 05:08:26 -0800 (PST)
Received: by mail-io1-f51.google.com with SMTP id q2so16279853iow.13
 for <iommu@lists.linux-foundation.org>; Fri, 15 Jan 2021 05:08:25 -0800 (PST)
X-Received: by 2002:a05:6e02:cc7:: with SMTP id
 c7mr10850857ilj.218.1610716105308; 
 Fri, 15 Jan 2021 05:08:25 -0800 (PST)
MIME-Version: 1.0
References: <20201125221917.150463-1-ribalda@chromium.org>
 <20201130083410.GD32234@lst.de>
 <20201201033658.GE3723071@google.com> <20201201144916.GA14682@lst.de>
 <CAAFQd5BBEbmENrrZ-vMK9cKOap19XWmfcxwrxKfjWx-wEew8rg@mail.gmail.com>
 <20201208071320.GA1667627@google.com> <20201209111639.GB22806@lst.de>
 <CANiDSCtsOdJUK3r_t8UNKhh7Px0ANNFJkuwM1fBgZ7wnVh0JFA@mail.gmail.com>
 <20210111083614.GA27589@lst.de>
In-Reply-To: <20210111083614.GA27589@lst.de>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 15 Jan 2021 14:08:14 +0100
X-Gmail-Original-Message-ID: <CANiDSCvuvj47=nhoWhvzc5raMxM60w+JYRWjd0YepcbcbkrUjA@mail.gmail.com>
Message-ID: <CANiDSCvuvj47=nhoWhvzc5raMxM60w+JYRWjd0YepcbcbkrUjA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] media: uvcvideo: Use dma_alloc_noncontiguos API
To: ". Christoph Hellwig" <hch@lst.de>
Cc: Sergey Senozhatsky <senozhatsky@google.com>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
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

On Mon, Jan 11, 2021 at 9:36 AM . Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Jan 07, 2021 at 03:14:08PM +0100, Ricardo Ribalda wrote:
> > > So I think we do want these branches for coherent vs non-coherent as they
> > > have very different semantics and I do not think that hiding them under
> > > the same API helps people to understand those vastly different semantics.
> > >
> > > OTOH we should look into a fallback for DMA API instances that do not
> > > support the discontigous allocations.
> > >
> > > I think between your comments and those from Ricardo I have a good idea
> > > for a somewhat updated API.  I'll try to post something in the next days.
> >
> > Did you have time to look into this?
> >
> > No hurry, I just want to make sure that I didn't miss anything ;)
>
> Haven't managed to get to it, sorry.

No worries!, is there something we can do to help you with this?

>
> >
> > Best regards!
> >
> >
> >
> > --
> > Ricardo Ribalda
> ---end quoted text---



-- 
Ricardo Ribalda
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
