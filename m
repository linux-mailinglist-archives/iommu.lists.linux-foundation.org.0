Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAA52C8295
	for <lists.iommu@lfdr.de>; Mon, 30 Nov 2020 11:49:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8845486C37;
	Mon, 30 Nov 2020 10:49:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m9StjZ-Fpwbb; Mon, 30 Nov 2020 10:49:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0464786AF3;
	Mon, 30 Nov 2020 10:49:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED0C2C0052;
	Mon, 30 Nov 2020 10:49:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 26C24C0052
 for <iommu@lists.linux-foundation.org>; Mon, 30 Nov 2020 10:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 21DD386B78
 for <iommu@lists.linux-foundation.org>; Mon, 30 Nov 2020 10:49:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QDTxWz4A0fs2 for <iommu@lists.linux-foundation.org>;
 Mon, 30 Nov 2020 10:49:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4A74786AF3
 for <iommu@lists.linux-foundation.org>; Mon, 30 Nov 2020 10:49:22 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id t13so10817362ilp.2
 for <iommu@lists.linux-foundation.org>; Mon, 30 Nov 2020 02:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FrBQ+cllYh0Y6esR/SPkKcDu8fDsRwcNF9P9vUYZvL4=;
 b=EqEeBGdID896KqQP2wGl3MacDZiftoQYvHOoa+q0ty3hiMysQXNvD+Cbzd5XWyH6oC
 /R/jipmJirrS7xxuCq09QfhPWJ6BcZs6J5DXml/OSDTep21CZvCNfFppev46/gu0R/Dp
 L8taqeCxff7s2jiuUfS1zwdg22lepLaEZGuQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FrBQ+cllYh0Y6esR/SPkKcDu8fDsRwcNF9P9vUYZvL4=;
 b=GmnM7dlWw8+BxrBszH99NNVsYqtvE09f0DLz4lko7qVd6ZQ2S2yJxhEV2FxN+WdycO
 guGFAvP+RUnMHCPro2TeSzIt281TNosbkdkMrO+hGLYIR3zqfRIHkYTJCsiEf3mSuS61
 D1yc014Q+c2QRMa5KQLx3O5kwg6RC7hcLIlsWC3VZWBiy/cGiXz9Ks6yy+g+8ZLqb0Rq
 OpkBNHZAz76Spphzv378M9mOj2qCKfdfXCyjXNCQnjuQbbMvFl/STFLZjNE2Bzme7Ive
 0+s0BHrK3+O3Gpev9kfD2CsTCkUR3iuSEgZmVjBBHjFmO1CaSW4jKFHdMGqpDH2+b8Am
 KdwA==
X-Gm-Message-State: AOAM531Yv1KKpri/cgfC6WxZKfDr1yCLo253Q1/Yu6EEp92TE+EMPvj+
 k4OFt3cJUIW6UiRhiokd2kA09bnY1HpsKQ==
X-Google-Smtp-Source: ABdhPJyiVQ24jpIipBIYN4gHO6yDUWKI6mHJ8LoG1R0NUdpkhgqRM0t6NwQfpImK4yK5h/y6b8cPzg==
X-Received: by 2002:a92:ba96:: with SMTP id t22mr18697261ill.262.1606733361416; 
 Mon, 30 Nov 2020 02:49:21 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com.
 [209.85.166.48])
 by smtp.gmail.com with ESMTPSA id j8sm5256266ilk.50.2020.11.30.02.49.20
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 02:49:20 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id f20so2849389ioc.12
 for <iommu@lists.linux-foundation.org>; Mon, 30 Nov 2020 02:49:20 -0800 (PST)
X-Received: by 2002:a02:c042:: with SMTP id u2mr12243455jam.32.1606733360204; 
 Mon, 30 Nov 2020 02:49:20 -0800 (PST)
MIME-Version: 1.0
References: <20201125221917.150463-1-ribalda@chromium.org>
 <20201130083410.GD32234@lst.de>
In-Reply-To: <20201130083410.GD32234@lst.de>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 30 Nov 2020 11:49:09 +0100
X-Gmail-Original-Message-ID: <CANiDSCtE3TqOK0cbw0SJ3LfqCsM3B8AFjBomfj4hcftyHXYXLg@mail.gmail.com>
Message-ID: <CANiDSCtE3TqOK0cbw0SJ3LfqCsM3B8AFjBomfj4hcftyHXYXLg@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] media: uvcvideo: Use dma_alloc_noncontiguos API
To: Christoph Hellwig <hch@lst.de>
Cc: Sergey Senozhatsky <senozhatsky@google.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
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

Hi Christoph

On Mon, Nov 30, 2020 at 9:34 AM Christoph Hellwig <hch@lst.de> wrote:
>
> > +#ifndef CONFIG_DMA_NONCOHERENT
>
> I think you need to drop this ifdef.  This code should work just fine
> on noncoherent mips and sh platforms.
>
> > +     uvc_urb->pages = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
> > +                                              &uvc_urb->dma,
> > +                                              gfp_flags | __GFP_NOWARN, 0);
> > +     if (!uvc_urb->pages)
> > +             return false;
> > +
> > +     uvc_urb->buffer = vmap(uvc_urb->pages,
> > +                            PAGE_ALIGN(stream->urb_size) >> PAGE_SHIFT,
> > +                            VM_DMA_COHERENT, PAGE_KERNEL);
> > +     if (!uvc_urb->buffer) {
> > +             dma_free_noncontiguous(dma_dev, stream->urb_size,
> > +                                    uvc_urb->pages, uvc_urb->dma);
> > +             return false;
> > +     }
> > +
> > +     if (sg_alloc_table_from_pages(&uvc_urb->sgt, uvc_urb->pages,
> > +                             PAGE_ALIGN(stream->urb_size) >> PAGE_SHIFT, 0,
> > +                             stream->urb_size, GFP_KERNEL)) {
> > +             vunmap(uvc_urb->buffer);
> > +             dma_free_noncontiguous(dma_dev, stream->urb_size,
> > +                                    uvc_urb->pages, uvc_urb->dma);
> > +             return false;
> > +     }
> > +
> > +     return true;
> > +}
>
> I wonder if we should lift this into a helper.  On the one hand I had
> proliferating struct scatterlist usage, on the other hand it is all over
> the media and drm code anyway, and duplicating this doesn't help anyone.
>
> Possibly including the fallback to the coherent allocating.

Probably Sergey has best opinion of this than mine. I only had to look
into one driver, he has been working with the vb2, which uses the API
much more.



-- 
Ricardo Ribalda
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
