Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C941AEC88
	for <lists.iommu@lfdr.de>; Sat, 18 Apr 2020 14:42:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EB6EC873E3;
	Sat, 18 Apr 2020 12:42:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0PPzsEjfToPi; Sat, 18 Apr 2020 12:42:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 85E348738A;
	Sat, 18 Apr 2020 12:42:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6CA43C1D89;
	Sat, 18 Apr 2020 12:42:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0BE29C0172
 for <iommu@lists.linux-foundation.org>; Sat, 18 Apr 2020 12:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EA7BB868B6
 for <iommu@lists.linux-foundation.org>; Sat, 18 Apr 2020 12:42:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8C0w2kEN8rj5 for <iommu@lists.linux-foundation.org>;
 Sat, 18 Apr 2020 12:42:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 792D286885
 for <iommu@lists.linux-foundation.org>; Sat, 18 Apr 2020 12:42:08 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id B57C0342; Sat, 18 Apr 2020 14:42:06 +0200 (CEST)
Date: Sat, 18 Apr 2020 14:42:05 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/4] dma-mapping: add a dma_ops_bypass flag to struct
 device
Message-ID: <20200418124205.GD6113@8bytes.org>
References: <20200414122506.438134-1-hch@lst.de>
 <20200414122506.438134-4-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414122506.438134-4-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org
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

Hi Christoph,

On Tue, Apr 14, 2020 at 02:25:05PM +0200, Christoph Hellwig wrote:
> +static inline bool dma_map_direct(struct device *dev,
> +		const struct dma_map_ops *ops)
> +{
> +	if (likely(!ops))
> +		return true;
> +	if (!dev->dma_ops_bypass)
> +		return false;
> +
> +	return min_not_zero(*dev->dma_mask, dev->bus_dma_limit) >=
> +			    dma_direct_get_required_mask(dev);

Why is the dma-mask check done here? The dma-direct code handles memory
outside of the devices dma-mask with swiotlb, no?

I also don't quite get what the difference between setting the
dma_ops_bypass flag non-zero and setting ops to NULL is.


	Joerg


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
