Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D843ED3B1
	for <lists.iommu@lfdr.de>; Mon, 16 Aug 2021 14:08:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 351D9834E1;
	Mon, 16 Aug 2021 12:08:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n5rAs8ruJlSO; Mon, 16 Aug 2021 12:08:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3C8C3834DE;
	Mon, 16 Aug 2021 12:08:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18A51C000E;
	Mon, 16 Aug 2021 12:08:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4CD8CC000E
 for <iommu@lists.linux-foundation.org>; Mon, 16 Aug 2021 12:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FE22834DE
 for <iommu@lists.linux-foundation.org>; Mon, 16 Aug 2021 12:08:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q_OkFvjrb1uO for <iommu@lists.linux-foundation.org>;
 Mon, 16 Aug 2021 12:08:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9500880D96
 for <iommu@lists.linux-foundation.org>; Mon, 16 Aug 2021 12:08:39 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 979966736F; Mon, 16 Aug 2021 14:08:36 +0200 (CEST)
Date: Mon, 16 Aug 2021 14:08:36 +0200
From: Christoph Hellwig <hch@lst.de>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v5 5/7] dma-iommu: Check CONFIG_SWIOTLB more broadly
Message-ID: <20210816120836.GD15860@lst.de>
References: <20210816025755.2906695-1-stevensd@google.com>
 <20210816025755.2906695-6-stevensd@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210816025755.2906695-6-stevensd@google.com>
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

> -	if (IS_ENABLED(CONFIG_SWIOTLB) && dev_is_untrusted(dev) &&
> +	if (IS_ENABLED(CONFIG_SWIOTLB) && dev_use_swiotlb(dev) &&
>  	    iova_offset(iovad, phys | size)) {

This can drop the explicit CONFIG_SWIOTLB check now (and make the remaining
conditional fit onto a single line).
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
