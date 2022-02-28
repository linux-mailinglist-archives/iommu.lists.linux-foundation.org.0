Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2324C6954
	for <lists.iommu@lfdr.de>; Mon, 28 Feb 2022 12:04:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F7EB60AB3;
	Mon, 28 Feb 2022 11:04:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x5WQ4avoA9Jg; Mon, 28 Feb 2022 11:04:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8213360B3A;
	Mon, 28 Feb 2022 11:04:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50162C007B;
	Mon, 28 Feb 2022 11:04:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67A1CC001A
 for <iommu@lists.linux-foundation.org>; Mon, 28 Feb 2022 11:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 409184028D
 for <iommu@lists.linux-foundation.org>; Mon, 28 Feb 2022 11:04:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7CEYgvnWw4yE for <iommu@lists.linux-foundation.org>;
 Mon, 28 Feb 2022 11:04:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 071A540012
 for <iommu@lists.linux-foundation.org>; Mon, 28 Feb 2022 11:04:43 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 532E968AFE; Mon, 28 Feb 2022 12:04:38 +0100 (CET)
Date: Mon, 28 Feb 2022 12:04:38 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] dma-mapping: remove CONFIG_DMA_REMAP
Message-ID: <20220228110438.GA10232@lst.de>
References: <20220227143533.357356-1-hch@lst.de>
 <4802e9fd-733f-3246-92f3-05f590e05d37@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4802e9fd-733f-3246-92f3-05f590e05d37@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, will@kernel.org,
 Christoph Hellwig <hch@lst.de>
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

On Mon, Feb 28, 2022 at 10:32:54AM +0000, Robin Murphy wrote:
> Is it even possible to hit this case now? From a quick look, all the 
> architectures defining HIGHMEM either have an explicit dependency on MMU or 
> don't allow deselecting it anyway (plus I don't see how HIGHMEM && !MMU 
> could work in general), so I'm pretty sure this whole chunk should go away 
> now.
>
> With that (or if there *is* some subtle wacky case where PageHighmem() can 
> actually return true for !MMU, a comment to remind us in future),

No, you're right - I don't think we can support highmem on !CONFIG_MMU.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
