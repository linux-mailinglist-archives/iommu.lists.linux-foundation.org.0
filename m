Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B3C29D15B
	for <lists.iommu@lfdr.de>; Wed, 28 Oct 2020 18:39:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B46C886469;
	Wed, 28 Oct 2020 17:39:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NT4oOhFtbRPr; Wed, 28 Oct 2020 17:39:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 511DE86448;
	Wed, 28 Oct 2020 17:39:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 43D41C0051;
	Wed, 28 Oct 2020 17:39:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ECF56C0051
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 17:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DA08B204F1
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 17:39:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yqL-C7DJ0vFQ for <iommu@lists.linux-foundation.org>;
 Wed, 28 Oct 2020 17:39:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id 2031B20396
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 17:39:43 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2997E68C4E; Wed, 28 Oct 2020 18:39:40 +0100 (CET)
Date: Wed, 28 Oct 2020 18:39:39 +0100
From: Christoph Hellwig <hch@lst.de>
To: Oded Gabbay <oded.gabbay@gmail.com>
Subject: Re: [PATCH v1] dma-mapping: normal memory for mmap() on coherent
 architectures
Message-ID: <20201028173939.GB10317@lst.de>
References: <20190802180758.9691-1-gavinli@thegavinli.com>
 <20190803062333.GC29348@lst.de>
 <CAFCwf122xMQJgqN9qJ1SXAHkVqg4GoNDC+NvXuj=-owXB=AO0A@mail.gmail.com>
 <20201028173152.GA10224@lst.de>
 <CAFCwf10HzngDA17sLxYRY_z1QcPp6NE+HYKnAzm_fEuN6FzmGA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFCwf10HzngDA17sLxYRY_z1QcPp6NE+HYKnAzm_fEuN6FzmGA@mail.gmail.com>
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

On Wed, Oct 28, 2020 at 07:38:04PM +0200, Oded Gabbay wrote:
> > > https://lkml.org/lkml/2020/8/29/252)
> > > Since then, we are plagued by the kernel log message that gavin has
> > > mentioned, as we are mostly running in our C/I environment with 5.4.
> > > I wondered if you know if there was any fix to that in the more recent kernels ?
> > > If not, can I help to fix that ?
> >
> > What are the kernel log messages that gaving has mentioned?
> 
> This one:
> 11:22:43  [Wed Oct 28 11:22:34 2020] x86/PAT: synapse_tests:29265 map
> pfn RAM range req uncached-minus for [mem 0xe6236b000-0xe6236bfff],
> got write-back
> 
> Thousands of the same message with different addresses of course.

What kernel version is this on?  And what is the test case?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
