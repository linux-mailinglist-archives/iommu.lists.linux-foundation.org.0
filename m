Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6573ED3AF
	for <lists.iommu@lfdr.de>; Mon, 16 Aug 2021 14:07:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D34FE40426;
	Mon, 16 Aug 2021 12:07:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UZ9XMdtLnnXM; Mon, 16 Aug 2021 12:07:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D3C6040428;
	Mon, 16 Aug 2021 12:07:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B18F0C0022;
	Mon, 16 Aug 2021 12:07:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05780C000E
 for <iommu@lists.linux-foundation.org>; Mon, 16 Aug 2021 12:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA9B4834DE
 for <iommu@lists.linux-foundation.org>; Mon, 16 Aug 2021 12:07:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LWUFl1mwHID8 for <iommu@lists.linux-foundation.org>;
 Mon, 16 Aug 2021 12:07:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C07FB834F5
 for <iommu@lists.linux-foundation.org>; Mon, 16 Aug 2021 12:07:16 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5E8D66736F; Mon, 16 Aug 2021 14:07:14 +0200 (CEST)
Date: Mon, 16 Aug 2021 14:07:14 +0200
From: Christoph Hellwig <hch@lst.de>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v5 4/7] dma-iommu: fold _swiotlb helpers into callers
Message-ID: <20210816120714.GC15860@lst.de>
References: <20210816025755.2906695-1-stevensd@google.com>
 <20210816025755.2906695-5-stevensd@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210816025755.2906695-5-stevensd@google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Tom Murphy <murphyt7@tcd.ie>, iommu@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>
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

> +		if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
> +		    (dir == DMA_TO_DEVICE ||
> +		     dir == DMA_BIDIRECTIONAL)) {

Nit: the two dire checks easily fit onto a single line and are easier to
follow that way.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
