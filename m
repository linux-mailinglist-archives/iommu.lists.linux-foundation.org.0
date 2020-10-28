Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D7F29D158
	for <lists.iommu@lfdr.de>; Wed, 28 Oct 2020 18:38:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9D736874B1;
	Wed, 28 Oct 2020 17:38:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XBYdbtqWlaFr; Wed, 28 Oct 2020 17:38:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 142CE874AA;
	Wed, 28 Oct 2020 17:38:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EA31CC0051;
	Wed, 28 Oct 2020 17:38:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E43BAC0051
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 17:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D8280204F1
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 17:38:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8FUvJrJ7GKQ0 for <iommu@lists.linux-foundation.org>;
 Wed, 28 Oct 2020 17:38:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 5E29120396
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 17:38:33 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id k27so357665oij.11
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 10:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fqbPBbAu80DOS7NEwVJeiR8mc+u/TY7x2y8Bdf6D7y8=;
 b=WwKwVrqGNUwd6qNWm7CHGEDyI1fAnKRN9fx+ncVqIlraJP9cAo/IpGhgul89zdUhBC
 alC3W2u4js7w/sl/Zci9HCztWqfNRtH9Is2T7eRsq6qQliU/T7Ch9J81ynL0ZVix3R7P
 in/+ddsnRmUJiY2d8OFGf1UnjII0w0CKDzpAYMHJ+G2V8Wqe4FJCIh4mSAbrOZcNG4ZP
 iWrhDR5Fsby4GzjkTVby6ORx4n9TuE/uWlwlA22RgbXtmmnIn7tzLLtD1ZCt1sC9IJau
 F3vc4Lo0VEmWToErSasphXrLTq397HCED1L1dKkAqA4Sa9zKPiCgkiZoxb4dvqBFjN+8
 owAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fqbPBbAu80DOS7NEwVJeiR8mc+u/TY7x2y8Bdf6D7y8=;
 b=hdFjNp4S8uMdfJ80o6ylDUtujYBH+T0SKoAVhKQfo84dYFI/604vquStnUYB6TuBi3
 aaVMNTRJ4bbd/Y7fVVzQ6HKeIiQFeBWqbYSM1o0enulKlL2hGoOxwbQSJ5In5b4LPuVa
 ay+86+6lgqmhITdtd9VbCqCVlaleJh318D/XmC97BI/zskCjV3tHHW9MAW88z5zJdOq2
 as6N0hBeb6jdNaHRGsHbs1OGkDUe25RvmbGz7hfgX6X7NcR+Xei7r/6gD8qcN7bXKCsC
 ZniwiJU8w/UDt7koeKkFEtUXKcr5K/N3J3+UfILLb412FDzCrzpiVo3LKqXUPVdcS9EQ
 p/fQ==
X-Gm-Message-State: AOAM532kQpxjn0BQCiUMujRJh7J4uZL95LWVXz0W/GpSTxE7pSVijWD2
 pNhikAwFEr6NKKY/CUax1PH4nqF//8TZ4t8aRME=
X-Google-Smtp-Source: ABdhPJxso2L2p/apSohrbS6QPMdTbCBYEKz2ClMfyl412qTd5wlGYYkyqwMPhM2b5rJtpMvZrvBxAtn5rg8SEN2I7fU=
X-Received: by 2002:aca:5487:: with SMTP id i129mr73043oib.154.1603906712561; 
 Wed, 28 Oct 2020 10:38:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190802180758.9691-1-gavinli@thegavinli.com>
 <20190803062333.GC29348@lst.de>
 <CAFCwf122xMQJgqN9qJ1SXAHkVqg4GoNDC+NvXuj=-owXB=AO0A@mail.gmail.com>
 <20201028173152.GA10224@lst.de>
In-Reply-To: <20201028173152.GA10224@lst.de>
From: Oded Gabbay <oded.gabbay@gmail.com>
Date: Wed, 28 Oct 2020 19:38:04 +0200
Message-ID: <CAFCwf10HzngDA17sLxYRY_z1QcPp6NE+HYKnAzm_fEuN6FzmGA@mail.gmail.com>
Subject: Re: [PATCH v1] dma-mapping: normal memory for mmap() on coherent
 architectures
To: Christoph Hellwig <hch@lst.de>
Cc: Robin Murphy <robin.murphy@arm.com>, Gavin Li <git@thegavinli.com>,
 gavinli@thegavinli.com,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>
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

On Wed, Oct 28, 2020 at 7:31 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Oct 28, 2020 at 01:39:17PM +0200, Oded Gabbay wrote:
> > On Sat, Aug 3, 2019 at 9:26 AM Christoph Hellwig <hch@lst.de> wrote:
> > >
> > > See the discussion at:
> > >
> > > https://lists.linuxfoundation.org/pipermail/iommu/2019-August/037716.html
> > >
> > > Just curious, what driver do you use that uses dma_mmap_coherent on
> > > x86?
> > > _______________________________________________
> > > iommu mailing list
> > > iommu@lists.linux-foundation.org
> > > https://lists.linuxfoundation.org/mailman/listinfo/iommu
> >
> > Hi Christoph,
> > In the habanalabs driver we have moved to use dma_mmap_coherent (to
> > match dma_alloc_coherent - see commit
> > https://lkml.org/lkml/2020/8/29/252)
> > Since then, we are plagued by the kernel log message that gavin has
> > mentioned, as we are mostly running in our C/I environment with 5.4.
> > I wondered if you know if there was any fix to that in the more recent kernels ?
> > If not, can I help to fix that ?
>
> What are the kernel log messages that gaving has mentioned?

This one:
11:22:43  [Wed Oct 28 11:22:34 2020] x86/PAT: synapse_tests:29265 map
pfn RAM range req uncached-minus for [mem 0xe6236b000-0xe6236bfff],
got write-back

Thousands of the same message with different addresses of course.

Thanks,
Oded
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
