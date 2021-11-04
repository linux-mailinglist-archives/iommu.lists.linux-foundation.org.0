Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 58ADA4450A3
	for <lists.iommu@lfdr.de>; Thu,  4 Nov 2021 09:54:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E723240199;
	Thu,  4 Nov 2021 08:54:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kl70fvMTejOP; Thu,  4 Nov 2021 08:54:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CE036400D4;
	Thu,  4 Nov 2021 08:54:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8092C0036;
	Thu,  4 Nov 2021 08:54:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9FC55C0012
 for <iommu@lists.linux-foundation.org>; Thu,  4 Nov 2021 08:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8F0D8403C5
 for <iommu@lists.linux-foundation.org>; Thu,  4 Nov 2021 08:54:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NL5VvNCMX4_E for <iommu@lists.linux-foundation.org>;
 Thu,  4 Nov 2021 08:54:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BBAAD4022B
 for <iommu@lists.linux-foundation.org>; Thu,  4 Nov 2021 08:54:36 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id DE1FA68AA6; Thu,  4 Nov 2021 09:54:33 +0100 (CET)
Date: Thu, 4 Nov 2021 09:54:33 +0100
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: Re: dma-direct fixes and cleanups v2
Message-ID: <20211104085433.GA24759@lst.de>
References: <20211021090611.488281-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211021090611.488281-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Robin Murphy <robin.murphy@arm.com>, David Rientjes <rientjes@google.com>
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

Any comments?

On Thu, Oct 21, 2021 at 11:06:01AM +0200, Christoph Hellwig wrote:
> Hi all,
> 
> Linus complained about the complex flow in dma_direct_alloc, so this
> tries to simplify it a bit, and while I was at it I also made sure that
> unencrypted pages never leak back into the page allocator.
> 
> Changes since v1:
>  - fix a missing return
>  - add a new patch to fix a pre-existing missing unmap
>  - various additional cleanups
>  
> Diffstat:
>  direct.c |  234 +++++++++++++++++++++++++++++++++++++--------------------------
>  1 file changed, 138 insertions(+), 96 deletions(-)
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
---end quoted text---
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
