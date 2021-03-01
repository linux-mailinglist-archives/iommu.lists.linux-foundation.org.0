Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 511303278F2
	for <lists.iommu@lfdr.de>; Mon,  1 Mar 2021 09:12:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECB324DD86;
	Mon,  1 Mar 2021 08:11:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pVSd1-_xPanI; Mon,  1 Mar 2021 08:11:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id E64594C642;
	Mon,  1 Mar 2021 08:11:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B93F4C000F;
	Mon,  1 Mar 2021 08:11:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71C47C0001
 for <iommu@lists.linux-foundation.org>; Mon,  1 Mar 2021 08:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 605B04DD86
 for <iommu@lists.linux-foundation.org>; Mon,  1 Mar 2021 08:11:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2jOy06qlE-4k for <iommu@lists.linux-foundation.org>;
 Mon,  1 Mar 2021 08:11:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC3DE4C642
 for <iommu@lists.linux-foundation.org>; Mon,  1 Mar 2021 08:11:55 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2F71068BEB; Mon,  1 Mar 2021 09:11:52 +0100 (CET)
Date: Mon, 1 Mar 2021 09:11:51 +0100
From: Christoph Hellwig <hch@lst.de>
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: [PATCH 6/7] dma-iommu: implement ->alloc_noncontiguous
Message-ID: <20210301081151.GA28023@lst.de>
References: <20210202095110.1215346-1-hch@lst.de>
 <20210202095110.1215346-7-hch@lst.de>
 <CAAFQd5BXAWeB2h4RvqsF1q8ip-Rhew80c7y1_og22-x3rS8KOQ@mail.gmail.com>
 <20210216084947.GA23897@lst.de> <YDyVFi26RPz5RrJB@google.com>
 <20210301072128.GA27039@lst.de> <YDyfo9OKkRHxd89O@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YDyfo9OKkRHxd89O@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Sergey Senozhatsky <senozhatsky@google.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Ricardo Ribalda <ribalda@chromium.org>,
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

On Mon, Mar 01, 2021 at 05:02:43PM +0900, Sergey Senozhatsky wrote:
> > I plan to resend the whole series with the comments very soon.
> 
> Oh, OK.
> 
> I thought the series was in linux-next already so a single patch
> would do.

It was, with an emphasys on was.  I hadn't realized I need an ack
from Laurent for uvcvideo, and he didn't have time to review it by the
time we noticed.  So I'll repost it with him in the receipients list and
the small fixups accumulated now that -rc1 is out.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
