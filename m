Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 084D13E89FB
	for <lists.iommu@lfdr.de>; Wed, 11 Aug 2021 08:02:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A03140281;
	Wed, 11 Aug 2021 06:02:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LUwp_YfnnHCw; Wed, 11 Aug 2021 06:02:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 466E54014C;
	Wed, 11 Aug 2021 06:02:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1CC67C000E;
	Wed, 11 Aug 2021 06:02:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 69060C000E
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 06:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51DD260672
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 06:02:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4YoewoMXo-9D for <iommu@lists.linux-foundation.org>;
 Wed, 11 Aug 2021 06:02:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46CCF6065D
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 06:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=l2WBiCb5duYJRA9nKpihqrJOH1Qjg6utSrFiu8qAdtc=; b=JgUqUwUQ1hasPhftYsiPUKHkCk
 ZSYe5c8lPl3tZ0Lox7CXTMlKmuas85oVO72k788D3nWKOPjsV39thqarACHLf3C7DRlknpw2QIMVa
 s375o9WQDtfKEgIoMNMzov0RJm11DJNhj9yBYkx2k9t97dDUtKC6xp0ZqdLfvdo90HVGCuVaEx1OI
 LKBk9c9M8T+W4w5meJqcxiO0czMdDyHMc8exIvgukclxG6QKToPOd7CGw0HyRi+hY9fBoP8wKLLAQ
 vuCm5OPDsDMyXoid09utkkAx+Ets6URYnW/tfsMU6w207qM7yNT9OCzBQD6X+jPBUCx7d26R3jL4E
 LhfgEEpA==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mDhJ4-00D2gf-6P; Wed, 11 Aug 2021 06:01:49 +0000
Date: Wed, 11 Aug 2021 07:01:38 +0100
From: Christoph Hellwig <hch@infradead.org>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v3 2/5] dma-iommu: fix arch_sync_dma for map
Message-ID: <YRNnwn71E+v6kXYq@infradead.org>
References: <20210811024247.1144246-1-stevensd@google.com>
 <20210811024247.1144246-3-stevensd@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210811024247.1144246-3-stevensd@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Tom Murphy <murphyt7@tcd.ie>
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

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
