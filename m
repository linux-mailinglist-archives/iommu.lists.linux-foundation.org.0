Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3651A3130F3
	for <lists.iommu@lfdr.de>; Mon,  8 Feb 2021 12:34:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BE81185AD6;
	Mon,  8 Feb 2021 11:34:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B7zggVyK-FVK; Mon,  8 Feb 2021 11:34:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 661C985BC9;
	Mon,  8 Feb 2021 11:34:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59C73C013A;
	Mon,  8 Feb 2021 11:34:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79A84C013A
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 11:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5A0958707A
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 11:34:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r0Uhw53cc2tI for <iommu@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 11:34:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 56A4E87072
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 11:34:06 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id z22so17580905edb.9
 for <iommu@lists.linux-foundation.org>; Mon, 08 Feb 2021 03:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SIdoO/BXrCF5ZGx1sncTZthErRH1ESME+fQ4iZ40G4Y=;
 b=R4FfWcgnRp7kfMDn8OHGmLFT1VfRqhYLNtKbqtkWdlb75NiARoNYeuQ8plgw69PUvK
 SrMHBkIe3taDYqbOgv3c7/zQ+MxGUpsl5Jfwyzx4OaASuL8ztU0r+HTymMJR6J0YvC16
 zIfDdvWJe+eVik/zwfB7GuuftSM9ixQbVyhf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SIdoO/BXrCF5ZGx1sncTZthErRH1ESME+fQ4iZ40G4Y=;
 b=rnU9M3Qrf7qwEfNGEKQ63PkJA4AltP9P/xx6KClMS4Qdq6H35clcV/8UkjX2qIdp7j
 GlNiNx/Cc5BgPK0RnOppWA5M1jnyQOOGrAE+/7YBdN5hdiljYmAAN/3gZVLJvs6YaUlP
 YI7c7uhgAQdnWYHBaGCd1bBBRcueCo6pUB66OPKWSN2JnQBPijGjRm9MNol1zxKn+Ad2
 v1KxmdLUuAECgIbEd7Ln9cRLVeivuLWMn9H4QvNZIDNX7vGjPBhMTu4o2scOn/w74WKB
 SvBWEnMPKSxwWXnFvnzmu3fLd2hmeItfU+p25HE5/4FJOf8d+Q/3MBlqTqR3bEg3CO8m
 CHUQ==
X-Gm-Message-State: AOAM532wAB1mEY2G35BE/kN6WdPrgOB1WIhbhi72C+2zxMr/G2J/wpqj
 dFSUrDZzp7ddd85iX720pUwRUeNmm7+wMQ==
X-Google-Smtp-Source: ABdhPJzit1MX/K9z0mW9Bj2ih5S8DAp4+je5L1m24nTxq88pMnehlv9ii5sIzzfZQeIuCrnBrxp7uQ==
X-Received: by 2002:a05:6402:104b:: with SMTP id
 e11mr13798190edu.367.1612784044313; 
 Mon, 08 Feb 2021 03:34:04 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53])
 by smtp.gmail.com with ESMTPSA id n5sm9339478edw.7.2021.02.08.03.34.03
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 03:34:03 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id v14so1072778wro.7
 for <iommu@lists.linux-foundation.org>; Mon, 08 Feb 2021 03:34:03 -0800 (PST)
X-Received: by 2002:a5d:6404:: with SMTP id z4mr6111438wru.103.1612784042646; 
 Mon, 08 Feb 2021 03:34:02 -0800 (PST)
MIME-Version: 1.0
References: <20210202095110.1215346-1-hch@lst.de>
 <20210207184855.GA27553@lst.de>
In-Reply-To: <20210207184855.GA27553@lst.de>
From: Tomasz Figa <tfiga@chromium.org>
Date: Mon, 8 Feb 2021 20:33:50 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BzAvgiTLGFse+ZWUrFtZ1Ysf+p+e-4rW8gq_iP0xhWEA@mail.gmail.com>
Message-ID: <CAAFQd5BzAvgiTLGFse+ZWUrFtZ1Ysf+p+e-4rW8gq_iP0xhWEA@mail.gmail.com>
Subject: Re: add a new dma_alloc_noncontiguous API v2
To: Christoph Hellwig <hch@lst.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Sergey Senozhatsky <senozhatsky@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
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

Hi Christoph,

On Mon, Feb 8, 2021 at 3:49 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Any comments?
>

Sorry for the delay. The whole series looks very good to me. Thanks a lot.

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

> On Tue, Feb 02, 2021 at 10:51:03AM +0100, Christoph Hellwig wrote:
> > Hi all,
> >
> > this series adds the new noncontiguous DMA allocation API requested by
> > various media driver maintainers.
> >
> > Changes since v1:
> >  - document that flush_kernel_vmap_range and invalidate_kernel_vmap_range
> >    must be called once an allocation is mapped into KVA
> >  - add dma-debug support
> >  - remove the separate dma_handle argument, and instead create fully formed
> >    DMA mapped scatterlists
> >  - use a directional allocation in uvcvideo
> >  - call invalidate_kernel_vmap_range from uvcvideo
> > _______________________________________________
> > iommu mailing list
> > iommu@lists.linux-foundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/iommu
> ---end quoted text---
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
