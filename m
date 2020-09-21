Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id F0191272B16
	for <lists.iommu@lfdr.de>; Mon, 21 Sep 2020 18:09:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 830EC8602E;
	Mon, 21 Sep 2020 16:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5LWYggGu7gvt; Mon, 21 Sep 2020 16:09:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0BBB6864D2;
	Mon, 21 Sep 2020 16:09:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E54F3C0859;
	Mon, 21 Sep 2020 16:09:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC0E5C0890
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 16:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DA9C6864FB
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 16:09:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qJ9aJUy5xtBV for <iommu@lists.linux-foundation.org>;
 Mon, 21 Sep 2020 16:09:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EFFC1864D2
 for <iommu@lists.linux-foundation.org>; Mon, 21 Sep 2020 16:09:41 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 52F5168B02; Mon, 21 Sep 2020 18:09:38 +0200 (CEST)
Date: Mon, 21 Sep 2020 18:09:38 +0200
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/io-pgtable-arm: Clean up faulty sanity check
Message-ID: <20200921160938.GB23870@lst.de>
References: <daedc9364a19dc07487e4d07b8768b1e5934abd4.1600700881.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <daedc9364a19dc07487e4d07b8768b1e5934abd4.1600700881.git.robin.murphy@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: iommu@lists.linux-foundation.org, james.quinlan@broadcom.com,
 Naresh Kamboju <naresh.kamboju@linaro.org>, will@kernel.org, hch@lst.de,
 linux-arm-kernel@lists.infradead.org
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

On Mon, Sep 21, 2020 at 04:08:01PM +0100, Robin Murphy wrote:
> Checking for a nonzero dma_pfn_offset was a quick shortcut to validate
> whether the DMA == phys assumption could hold at all. Checking for a
> non-NULL dma_range_map is not quite equivalent, since a map may be
> present to describe a limited DMA window even without an offset, and
> thus this check can now yield false positives.
> 
> However, it only ever served to short-circuit going all the way through
> to __arm_lpae_alloc_pages(), failing the canonical test there, and
> having a bit more to clean up. As such, we can simply remove it without
> loss of correctness.
> 
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Thanks,

applied to the dma-mapping for-next tree.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
