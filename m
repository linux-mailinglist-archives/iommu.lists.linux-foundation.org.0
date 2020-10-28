Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5C229D157
	for <lists.iommu@lfdr.de>; Wed, 28 Oct 2020 18:31:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B109586A6B;
	Wed, 28 Oct 2020 17:31:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bw5JajXMpNTC; Wed, 28 Oct 2020 17:31:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2E66386A46;
	Wed, 28 Oct 2020 17:31:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1846FC0051;
	Wed, 28 Oct 2020 17:31:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 96195C0051
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 17:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7809C20031
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 17:31:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hYOmE8rrGQdk for <iommu@lists.linux-foundation.org>;
 Wed, 28 Oct 2020 17:31:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id 8017A20004
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 17:31:55 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3A01F68C4E; Wed, 28 Oct 2020 18:31:53 +0100 (CET)
Date: Wed, 28 Oct 2020 18:31:52 +0100
From: Christoph Hellwig <hch@lst.de>
To: Oded Gabbay <oded.gabbay@gmail.com>
Subject: Re: [PATCH v1] dma-mapping: normal memory for mmap() on coherent
 architectures
Message-ID: <20201028173152.GA10224@lst.de>
References: <20190802180758.9691-1-gavinli@thegavinli.com>
 <20190803062333.GC29348@lst.de>
 <CAFCwf122xMQJgqN9qJ1SXAHkVqg4GoNDC+NvXuj=-owXB=AO0A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFCwf122xMQJgqN9qJ1SXAHkVqg4GoNDC+NvXuj=-owXB=AO0A@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Robin Murphy <robin.murphy@arm.com>, Gavin Li <git@thegavinli.com>,
 gavinli@thegavinli.com, Christoph Hellwig <hch@lst.de>,
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

On Wed, Oct 28, 2020 at 01:39:17PM +0200, Oded Gabbay wrote:
> On Sat, Aug 3, 2019 at 9:26 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > See the discussion at:
> >
> > https://lists.linuxfoundation.org/pipermail/iommu/2019-August/037716.html
> >
> > Just curious, what driver do you use that uses dma_mmap_coherent on
> > x86?
> > _______________________________________________
> > iommu mailing list
> > iommu@lists.linux-foundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/iommu
> 
> Hi Christoph,
> In the habanalabs driver we have moved to use dma_mmap_coherent (to
> match dma_alloc_coherent - see commit
> https://lkml.org/lkml/2020/8/29/252)
> Since then, we are plagued by the kernel log message that gavin has
> mentioned, as we are mostly running in our C/I environment with 5.4.
> I wondered if you know if there was any fix to that in the more recent kernels ?
> If not, can I help to fix that ?

What are the kernel log messages that gaving has mentioned?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
