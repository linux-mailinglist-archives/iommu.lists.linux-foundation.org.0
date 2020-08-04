Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F1D23B4CC
	for <lists.iommu@lfdr.de>; Tue,  4 Aug 2020 08:06:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E0EED2156F;
	Tue,  4 Aug 2020 06:06:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZEpUnQvNGD5E; Tue,  4 Aug 2020 06:06:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 176BA2156E;
	Tue,  4 Aug 2020 06:06:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0427BC004C;
	Tue,  4 Aug 2020 06:06:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A93FC004C
 for <iommu@lists.linux-foundation.org>; Tue,  4 Aug 2020 06:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2E42585E93
 for <iommu@lists.linux-foundation.org>; Tue,  4 Aug 2020 06:06:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jsAAGT29uFK2 for <iommu@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 06:06:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C246B85DB5
 for <iommu@lists.linux-foundation.org>; Tue,  4 Aug 2020 06:06:37 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 852C86736F; Tue,  4 Aug 2020 08:06:33 +0200 (CEST)
Date: Tue, 4 Aug 2020 08:06:33 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH v2 2/2] dma-pool: Only allocate from CMA when in same
 memory zone
Message-ID: <20200804060633.GA7368@lst.de>
References: <20200803160956.19235-1-nsaenzjulienne@suse.de>
 <20200803160956.19235-3-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200803160956.19235-3-nsaenzjulienne@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: amit.pundir@linaro.org, linux-kernel@vger.kernel.org, jeremy.linton@arm.com,
 iommu@lists.linux-foundation.org, linux-rpi-kernel@lists.infradead.org,
 rientjes@google.com, Robin Murphy <robin.murphy@arm.com>, hch@lst.de
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

On Mon, Aug 03, 2020 at 06:09:56PM +0200, Nicolas Saenz Julienne wrote:
> +	if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp & GFP_DMA))
> +		return end <= DMA_BIT_MASK(zone_dma_bits);
> +	if (IS_ENABLED(CONFIG_ZONE_DMA32) && (gfp & GFP_DMA32))
> +		return end <= DMA_BIT_MASK(32);
> +	if (gfp & GFP_KERNEL)
> +		return end > DMA_BIT_MASK(32);

So the GFP_KERNEL one here looks weird.  For one I don't think the if
line is needed at all, and it just confuses things.  Second I don't
see the need (and actually some harm) in preventing GFP_KERNEL
allocations from dipping into lower CMA areas - something that we did
support before 5.8 with the single pool.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
