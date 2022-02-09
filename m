Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C874AEABD
	for <lists.iommu@lfdr.de>; Wed,  9 Feb 2022 08:07:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1CA181C0A;
	Wed,  9 Feb 2022 07:07:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id grUbPk2jbYFr; Wed,  9 Feb 2022 07:07:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0E15581396;
	Wed,  9 Feb 2022 07:07:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D0342C000B;
	Wed,  9 Feb 2022 07:07:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ABD40C000B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Feb 2022 07:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89BC340242
 for <iommu@lists.linux-foundation.org>; Wed,  9 Feb 2022 07:06:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0Bfb1uGFBxsn for <iommu@lists.linux-foundation.org>;
 Wed,  9 Feb 2022 07:06:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0FF5401C5
 for <iommu@lists.linux-foundation.org>; Wed,  9 Feb 2022 07:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+z8eCcqE9dbOC+gW13dx1B6dfCic13ISPvvQnd/UNzw=; b=hrVPnKU36nuaAo3miL0rswd0hN
 wMpyoIrMK6Wz0lWMULb+B8tvJXituESayQpYAsmshaIokMeOFi28pEFzJtO0Yf37wbaXxSn7Qaunt
 wUA9JWS+ivEAlm6OuIp+3sMtnve8AlmxHhb8cJlxlHN/nQyS/dgZs2jYa2J9vFrwU+X0vgOGXtzKj
 o+oNig+qgTYsbvij/yVdn2+6XW7BooUF8gOUA5AJt+H/mPQhHF/5lnawFFHlTunhqvJ+ZDkyCM7gr
 zwHPqlRjN55vGiDXnsMftS99hyv8MPObJ0UX4IDszzLEfGJ8CEaDeMB8zHRUVJR+xhVddO8G1KZJ7
 mBGylzFQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nHh44-00GQTd-2d; Wed, 09 Feb 2022 07:06:56 +0000
Date: Tue, 8 Feb 2022 23:06:56 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 1/1] iommu/dma: Use DMA ops setter instead of direct
 assignment
Message-ID: <YgNoENf1EIFmaeDD@infradead.org>
References: <20220207141321.8293-1-andriy.shevchenko@linux.intel.com>
 <58e77093-51e2-59a2-e413-164d83ecd9b8@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <58e77093-51e2-59a2-e413-164d83ecd9b8@arm.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: iommu@lists.linux-foundation.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 Joerg Roedel <jroedel@suse.de>
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

On Mon, Feb 07, 2022 at 03:55:32PM +0000, Robin Murphy wrote:
> On 2022-02-07 14:13, Andy Shevchenko wrote:
> > Use DMA ops setter instead of direct assignment. Even we know that
> > this module doesn't perform access to the dma_ops member of struct device,
> > it's better to use setter to avoid potential problems in the future.
> 
> What potential problems are you imagining? This whole file is a DMA ops
> implementation, not driver code (and definitely not a module); if anyone
> removes the "select DMA_OPS" from CONFIG_IOMMU_DMA they deserve whatever
> breakage they get.
> 
> I concur that there's no major harm in using the helper here, but I also see
> no point in pretending that there's any value to abstracting the operation
> in this particular context.

Yeah.  Killing off the the wrapper is actually on my todo list, mostly
because it leads to people doing completely broken things like the VDPA
private dma ops that should not exist.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
