Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5103852392
	for <lists.iommu@lfdr.de>; Tue, 25 Jun 2019 08:33:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CE451A70;
	Tue, 25 Jun 2019 06:33:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DD5158E2
	for <iommu@lists.linux-foundation.org>;
	Tue, 25 Jun 2019 06:33:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 71C70710
	for <iommu@lists.linux-foundation.org>;
	Tue, 25 Jun 2019 06:33:00 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id B569268B02; Tue, 25 Jun 2019 08:32:28 +0200 (CEST)
Date: Tue, 25 Jun 2019 08:32:28 +0200
From: Christoph Hellwig <hch@lst.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC] switch m68k to use the generic remapping DMA allocator
Message-ID: <20190625063228.GA29561@lst.de>
References: <20190614102126.8402-1-hch@lst.de>
	<CAMuHMdVPU5RQyX4FnHFEhxXZeG3v0uh_-t2FB=vAzQ8_3u-gSw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVPU5RQyX4FnHFEhxXZeG3v0uh_-t2FB=vAzQ8_3u-gSw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-m68k <linux-m68k@lists.linux-m68k.org>,
	Christoph Hellwig <hch@lst.de>,
	Linux IOMMU <iommu@lists.linux-foundation.org>,
	Greg Ungerer <gerg@linux-m68k.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Mon, Jun 17, 2019 at 08:53:55PM +0200, Geert Uytterhoeven wrote:
> Hi Christoph,
> 
> On Fri, Jun 14, 2019 at 12:21 PM Christoph Hellwig <hch@lst.de> wrote:
> > can you take a look at the (untested) patches below?  They convert m68k
> > to use the generic remapping DMA allocator, which is also used by
> > arm64 and csky.
> 
> Thanks. But what does this buy us?

A common dma mapping code base with everyone, including supporting
DMA allocations from atomic context, which the documentation and
API assume are there, but which don't work on m68k.

> bloat-o-meter says:
> 
> add/remove: 75/0 grow/shrink: 11/6 up/down: 4122/-82 (4040)

What do these values stand for?  The code should grow a little as
we now need to include the the pool allocator for the above API
fix.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
