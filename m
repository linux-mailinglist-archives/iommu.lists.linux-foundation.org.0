Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BF22D40CA
	for <lists.iommu@lfdr.de>; Wed,  9 Dec 2020 12:16:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CAB2220526;
	Wed,  9 Dec 2020 11:16:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q57rZOT+f-rS; Wed,  9 Dec 2020 11:16:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 86EA227400;
	Wed,  9 Dec 2020 11:16:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5743EC013B;
	Wed,  9 Dec 2020 11:16:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73DC8C013B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 11:16:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5CAA120778
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 11:16:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 47xVL76DIV1l for <iommu@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 11:16:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id 1608920526
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 11:16:44 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B68FB68AFE; Wed,  9 Dec 2020 12:16:39 +0100 (CET)
Date: Wed, 9 Dec 2020 12:16:39 +0100
From: ". Christoph Hellwig" <hch@lst.de>
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: [PATCH v3 5/6] media: uvcvideo: Use dma_alloc_noncontiguos API
Message-ID: <20201209111639.GB22806@lst.de>
References: <20201125221917.150463-1-ribalda@chromium.org>
 <20201130083410.GD32234@lst.de> <20201201033658.GE3723071@google.com>
 <20201201144916.GA14682@lst.de>
 <CAAFQd5BBEbmENrrZ-vMK9cKOap19XWmfcxwrxKfjWx-wEew8rg@mail.gmail.com>
 <20201208071320.GA1667627@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201208071320.GA1667627@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Sergey Senozhatsky <senozhatsky@google.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, ". Christoph Hellwig" <hch@lst.de>
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

On Tue, Dec 08, 2020 at 04:13:20PM +0900, Sergey Senozhatsky wrote:
> On (20/12/08 13:54), Tomasz Figa wrote:
> > 
> > In any case, Sergey is going to share a preliminary patch on how the
> > current API would be used in the V4L2 videobuf2 framework. That should
> > give us more input on how such a helper could look.
> 
> HUGE apologies for the previous screw up! I replied in the
> gmail web-interface and that did not work out as expected
> (at all, big times).

Actually the previous mail was a mime multipart one, and the plain text
version displayed just fine here.  My the gmail engineers finally learned
something after all.

> Another thing to notice is that the new API requires us to have two execution branches
> in allocators - one for the current API; and one for the new API (if it's supported and
> if user-space requested non-coherent allocation).

So I think we do want these branches for coherent vs non-coherent as they
have very different semantics and I do not think that hiding them under
the same API helps people to understand those vastly different semantics.

OTOH we should look into a fallback for DMA API instances that do not
support the discontigous allocations.

I think between your comments and those from Ricardo I have a good idea
for a somewhat updated API.  I'll try to post something in the next days.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
