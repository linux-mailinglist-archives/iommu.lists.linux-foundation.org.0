Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1543930B1C5
	for <lists.iommu@lfdr.de>; Mon,  1 Feb 2021 21:58:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A69982094C;
	Mon,  1 Feb 2021 20:58:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wr6cZeoxjJ68; Mon,  1 Feb 2021 20:58:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 52BBE2094E;
	Mon,  1 Feb 2021 20:58:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42F4FC0174;
	Mon,  1 Feb 2021 20:58:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5715CC013A
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 20:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 382582094D
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 20:58:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hyfeco9zE2+S for <iommu@lists.linux-foundation.org>;
 Mon,  1 Feb 2021 20:58:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 9B2CB2094C
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 20:58:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80C2564ECB;
 Mon,  1 Feb 2021 20:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612213083;
 bh=r/E49oyGnfm/yoB373RLEccYiXcRJsRAzM4O/KWNyro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MLNeG0uT1Jizxo/VSvEhaAFbENEPr3J3pVkEdTCXFnvp45+WXkRwuNYXZHiAbEQGL
 6r1vEHo72+yRV52MMdhEHETflCkFaA0zrY6YOtIl04a6LZyRIqgT+M6gFXjQhlqT0+
 iwxX1RGiP8hYyW8VCRNPNNSsxjw3AukWLTiVCLhELHR8drIrbmn0W4IznkIxMTD1Qv
 rVRNQqXpzLZJpU/B2IleHHNXcuUdZkteH6tzkEOMz21XK+6r1oGilNaArkXU7QYvFd
 8nX95YK7aByx+7b9Ch/nQO6Z17wJiZo6/g+UhrvQeL1WWPQQKtc362kVfMuZwVDoa2
 JqITgx85QiJfA==
Date: Mon, 1 Feb 2021 12:57:59 -0800
From: Keith Busch <kbusch@kernel.org>
To: Jianxiong Gao <jxgao@google.com>
Subject: Re: [PATCH V2 3/3] Adding
 device_dma_parameters->offset_preserve_mask to NVMe driver.
Message-ID: <20210201205759.GA2128135@dhcp-10-100-145-180.wdc.com>
References: <20210201183017.3339130-1-jxgao@google.com>
 <20210201183017.3339130-4-jxgao@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210201183017.3339130-4-jxgao@google.com>
Cc: heikki.krogerus@linux.intel.com, sagi@grimberg.me, saravanak@google.com,
 konrad.wilk@oracle.com, marcorr@google.com, gregkh@linuxfoundation.org,
 rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, axboe@fb.com, bgolaszewski@baylibre.com,
 iommu@lists.linux-foundation.org, jroedel@suse.de, dan.j.williams@intel.com,
 andriy.shevchenko@linux.intel.com, robin.murphy@arm.com, hch@lst.de
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

On Mon, Feb 01, 2021 at 10:30:17AM -0800, Jianxiong Gao wrote:
> @@ -868,12 +871,24 @@ static blk_status_t nvme_map_data(struct nvme_dev *dev, struct request *req,
>  	if (!iod->nents)
>  		goto out_free_sg;
>  
> +	offset_ret = dma_set_min_align_mask(dev->dev, NVME_CTRL_PAGE_SIZE - 1);
> +	if (offset_ret) {
> +		dev_warn(dev->dev, "dma_set_min_align_mask failed to set offset\n");
> +		goto out_free_sg;
> +	}
> +
>  	if (is_pci_p2pdma_page(sg_page(iod->sg)))
>  		nr_mapped = pci_p2pdma_map_sg_attrs(dev->dev, iod->sg,
>  				iod->nents, rq_dma_dir(req), DMA_ATTR_NO_WARN);
>  	else
>  		nr_mapped = dma_map_sg_attrs(dev->dev, iod->sg, iod->nents,
>  					     rq_dma_dir(req), DMA_ATTR_NO_WARN);
> +
> +	offset_ret = dma_set_min_align_mask(dev->dev, 0);
> +	if (offset_ret) {
> +		dev_warn(dev->dev, "dma_set_min_align_mask failed to reset offset\n");
> +		goto out_free_sg;
> +	}
>  	if (!nr_mapped)
>  		goto out_free_sg;

Why is this setting being done and undone on each IO? Wouldn't it be
more efficient to set it once during device initialization?

And more importantly, this isn't thread safe: one CPU may be setting the
device's dma alignment mask to 0 while another CPU is expecting it to be
NVME_CTRL_PAGE_SIZE - 1.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
