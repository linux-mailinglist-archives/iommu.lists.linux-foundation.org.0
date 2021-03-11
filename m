Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3311F337A0C
	for <lists.iommu@lfdr.de>; Thu, 11 Mar 2021 17:52:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4F9142FFD;
	Thu, 11 Mar 2021 16:52:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fij_XO5pgTLU; Thu, 11 Mar 2021 16:52:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 033AF43056;
	Thu, 11 Mar 2021 16:52:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E2CF7C0012;
	Thu, 11 Mar 2021 16:52:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67B82C000A
 for <iommu@lists.linux-foundation.org>; Thu, 11 Mar 2021 16:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5695F43006
 for <iommu@lists.linux-foundation.org>; Thu, 11 Mar 2021 16:52:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nLi5OQ2xvpjk for <iommu@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 16:52:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8AED442FFD
 for <iommu@lists.linux-foundation.org>; Thu, 11 Mar 2021 16:52:53 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 01DE668B05; Thu, 11 Mar 2021 17:52:51 +0100 (CET)
Date: Thu, 11 Mar 2021 17:52:50 +0100
From: Christoph Hellwig <hch@lst.de>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Tomasz Figa <tfiga@chromium.org>, Ricardo Ribalda <ribalda@chromium.org>,
 Sergey Senozhatsky <senozhatsky@google.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 iommu@lists.linux-foundation.org
Subject: Re: add a new dma_alloc_noncontiguous API v3
Message-ID: <20210311165250.GB25023@lst.de>
References: <20210301085236.947011-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210301085236.947011-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-doc@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
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

Any comments?  Especially on the uvcvideo conversion?

On Mon, Mar 01, 2021 at 09:52:30AM +0100, Christoph Hellwig wrote:
> Hi all,
> 
> this series adds the new noncontiguous DMA allocation API requested by
> various media driver maintainers.
> 
> Changes since v2:
>  - rebased to Linux 5.12-rc1
>  - dropped one already merged patch
>  - pass an attrs argument to dma_alloc_noncontigous
>  - clarify the dma_vmap_noncontiguous documentation a bit
>  - fix double assignments in uvcvideo
> 
> Changes since v1:
>  - document that flush_kernel_vmap_range and invalidate_kernel_vmap_range
>    must be called once an allocation is mapped into KVA
>  - add dma-debug support
>  - remove the separate dma_handle argument, and instead create fully formed
>    DMA mapped scatterlists
>  - use a directional allocation in uvcvideo
>  - call invalidate_kernel_vmap_range from uvcvideo
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
---end quoted text---
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
