Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E74285385
	for <lists.iommu@lfdr.de>; Tue,  6 Oct 2020 22:56:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 22B1C21526;
	Tue,  6 Oct 2020 20:56:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6gVXIWY9mHyP; Tue,  6 Oct 2020 20:56:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7A82D2094E;
	Tue,  6 Oct 2020 20:56:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A98DC0051;
	Tue,  6 Oct 2020 20:56:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B875CC0051
 for <iommu@lists.linux-foundation.org>; Tue,  6 Oct 2020 20:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 271FF21503
 for <iommu@lists.linux-foundation.org>; Tue,  6 Oct 2020 20:56:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yvdAttfzmlcY for <iommu@lists.linux-foundation.org>;
 Tue,  6 Oct 2020 20:56:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 41F8D2094E
 for <iommu@lists.linux-foundation.org>; Tue,  6 Oct 2020 20:56:20 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id x1so1425378eds.1
 for <iommu@lists.linux-foundation.org>; Tue, 06 Oct 2020 13:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kZ33m0een3FmBO5zM6YS30Fhun5lzxt8LRsuBmJ9np8=;
 b=Qfg5p3wmaIK8FSiIu4IdCn4X7nejDPhFFZhUVBVUejoaklw0Xl8abJMx/NPlE+GAYD
 GFFRBTXhLKiSTLhMEWACUyrBty03El/kGu4Ye5XJJWvvK/JT9MZ2EHl/BwOPsWpbvWqd
 6hSErfchiydyFBZt3FeeoxPWw3eNiC6MJ1Mv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kZ33m0een3FmBO5zM6YS30Fhun5lzxt8LRsuBmJ9np8=;
 b=qj3Qre39e7BxmYoYCsK8Q+ROB80Sm6HMv+ACMXN6H9Re7fJAPL/nO1X3dhuRuUG2tf
 dekLUq8pc0ZkridNuA3YOaVRP7SYEdy3YQf49/qOqSvBEBRszfV2RW/8zeb4mVFi5o2n
 b/VB4DfrC/bFfTgT5CTB8ibXpLZpQDDguu6+Pe+bKr6+e7Yp6Rp0O6X7VvHyPqakCzl2
 uCSZbyeTCl6dRx6l+B9feWWshs1RQrWQJlCNTt6QPjzWryYn9cNlpIw1l6EKXf9pWPjx
 Ru7+kj/VIgTUMUthMnLvUXxMnODaI/8BZRXwiRjQNOaWsRwIdLqwoFMaNRQzMpRL7gGU
 TM1g==
X-Gm-Message-State: AOAM533DGc0AF+wEV/dQYVf66ppbEGiievP/105CuLkgTxcOXegSVV1w
 F/TVKV6sgzE4lx9M1oX1kdmrW5bkQedyVA==
X-Google-Smtp-Source: ABdhPJwqb4MgzIA4nH/fG90bFKKKcVdmTdlaNuAHEAMZXdBaCL0z51nrJNMNo0PthKl0MNnlTdWvdQ==
X-Received: by 2002:a05:6402:21c5:: with SMTP id
 bi5mr7812622edb.380.1602017778206; 
 Tue, 06 Oct 2020 13:56:18 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com.
 [209.85.221.50])
 by smtp.gmail.com with ESMTPSA id rs18sm2945158ejb.69.2020.10.06.13.56.16
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2020 13:56:16 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id g12so9548706wrp.10
 for <iommu@lists.linux-foundation.org>; Tue, 06 Oct 2020 13:56:16 -0700 (PDT)
X-Received: by 2002:adf:df8e:: with SMTP id z14mr6756108wrl.32.1602017775603; 
 Tue, 06 Oct 2020 13:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200930160917.1234225-1-hch@lst.de>
 <20200930160917.1234225-9-hch@lst.de>
 <20201002175040.GA1131147@chromium.org> <20201005082629.GA13850@lst.de>
In-Reply-To: <20201005082629.GA13850@lst.de>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 6 Oct 2020 22:56:04 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DcFjTUpOYkaz4nGxozgOc9oGf9QngjbpXWdcwXTT=kmw@mail.gmail.com>
Message-ID: <CAAFQd5DcFjTUpOYkaz4nGxozgOc9oGf9QngjbpXWdcwXTT=kmw@mail.gmail.com>
Subject: Re: [PATCH 8/8] WIP: add a dma_alloc_contiguous API
To: Christoph Hellwig <hch@lst.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
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

On Mon, Oct 5, 2020 at 10:26 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Fri, Oct 02, 2020 at 05:50:40PM +0000, Tomasz Figa wrote:
> > Hi Christoph,
> >
> > On Wed, Sep 30, 2020 at 06:09:17PM +0200, Christoph Hellwig wrote:
> > > Add a new API that returns a virtually non-contigous array of pages
> > > and dma address.  This API is only implemented for dma-iommu and will
> > > not be implemented for non-iommu DMA API instances that have to allocate
> > > contiguous memory.  It is up to the caller to check if the API is
> > > available.
> >
> > Would you mind scheding some more light on what made the previous attempt
> > not work well? I liked the previous API because it was more consistent with
> > the regular dma_alloc_coherent().
>
> The problem is that with a dma_alloc_noncoherent that can return pages
> not in the kernel mapping we can't just use virt_to_page to fill in
> scatterlists or mmap the buffer to userspace, but would need new helpers
> and another two methods.
>
> > >  - no kernel mapping or only temporary kernel mappings are required.
> > >    That is as a better replacement for DMA_ATTR_NO_KERNEL_MAPPING
> > >  - a kernel mapping is required for cached and DMA mapped pages, but
> > >    the driver also needs the pages to e.g. map them to userspace.
> > >    In that sense it is a replacement for some aspects of the recently
> > >    removed and never fully implemented DMA_ATTR_NON_CONSISTENT
> >
> > What's the expected allocation and mapping flow with the latter? Would that be
> >
> > pages = dma_alloc_noncoherent(...)
> > vaddr = vmap(pages, ...);
> >
> > ?
>
> Yes.  Witht the vmap step optional for replacements of
> DMA_ATTR_NO_KERNEL_MAPPING, which is another nightmare to deal with.
>
> > Would one just use the usual dma_sync_for_{cpu,device}() for cache
> > invallidate/clean, while keeping the mapping in place?
>
> Yes.  And make sure the API isn't implemented when VIVT caches are
> used, but that isn't really different from the current interface.

Okay, thanks. Let's see if we can make necessary changes to the videobuf2.

+Sergey Senozhatsky for awareness too.

Best regrards,
Tomasz
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
