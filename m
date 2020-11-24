Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB0A2C27F0
	for <lists.iommu@lfdr.de>; Tue, 24 Nov 2020 14:33:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E16B0204E9;
	Tue, 24 Nov 2020 13:33:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jWBWHbKhvEft; Tue, 24 Nov 2020 13:33:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0B4D0203F4;
	Tue, 24 Nov 2020 13:33:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E58A9C1836;
	Tue, 24 Nov 2020 13:33:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 89968C0052
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 13:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7571D86151
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 13:33:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z3Fi+ub+eeXF for <iommu@lists.linux-foundation.org>;
 Tue, 24 Nov 2020 13:33:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8776B85C45
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 13:33:19 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4C5866736F; Tue, 24 Nov 2020 14:33:15 +0100 (CET)
Date: Tue, 24 Nov 2020 14:33:15 +0100
From: Christoph Hellwig <hch@lst.de>
To: Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH] WIP! media: uvcvideo: Use dma_alloc_noncontiguos API
Message-ID: <20201124133315.GA30214@lst.de>
References: <20200930160917.1234225-9-hch@lst.de>
 <20201118142546.170621-1-ribalda@chromium.org>
 <20201124113512.GA21974@lst.de>
 <CANiDSCtLrqWBOmC9X91V8P-aahQr2=L-GQNjHM6YauT69_QcEg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANiDSCtLrqWBOmC9X91V8P-aahQr2=L-GQNjHM6YauT69_QcEg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Sergey Senozhatsky <senozhatsky@google.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

On Tue, Nov 24, 2020 at 01:01:33PM +0100, Ricardo Ribalda wrote:
> I was hoping that you could answer that question :).
> 
> Do you have other use-cases than linux-media in mind?
> 
> I think Sergey wants to experiment also with vb2, to figure out how
> much it affects it.
> His change will be much more complicated than mine thought, there are
> more cornercases there.

I don't have anything urgend lined up, although I think there are plenty
other potential use cases.

> > Can you respost a combined series to get started?
> 
> Sure. Shall I also include the profiling patch?

That is in the media code, right?  I don't really care too much.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
