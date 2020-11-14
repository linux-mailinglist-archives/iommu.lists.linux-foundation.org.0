Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B32532B2E66
	for <lists.iommu@lfdr.de>; Sat, 14 Nov 2020 17:21:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DF531203FF;
	Sat, 14 Nov 2020 16:21:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xro4rM6MRFxM; Sat, 14 Nov 2020 16:21:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0080F20365;
	Sat, 14 Nov 2020 16:21:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D46ADC0800;
	Sat, 14 Nov 2020 16:21:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51979C0800
 for <iommu@lists.linux-foundation.org>; Sat, 14 Nov 2020 16:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 405EF869D8
 for <iommu@lists.linux-foundation.org>; Sat, 14 Nov 2020 16:21:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ndr8l5prmaXg for <iommu@lists.linux-foundation.org>;
 Sat, 14 Nov 2020 16:21:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AEFC9869C3
 for <iommu@lists.linux-foundation.org>; Sat, 14 Nov 2020 16:21:14 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5B36B67373; Sat, 14 Nov 2020 17:21:10 +0100 (CET)
Date: Sat, 14 Nov 2020 17:21:09 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [RESEND PATCH v2 2/5] dma-direct: add dma_direct_bypass() to
 force direct ops
Message-ID: <20201114162109.GA24411@lst.de>
References: <20201114151717.5369-1-jonathan@marek.ca>
 <20201114151717.5369-3-jonathan@marek.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201114151717.5369-3-jonathan@marek.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, hch@lst.de
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

On Sat, Nov 14, 2020 at 10:17:10AM -0500, Jonathan Marek wrote:
> Add a function to force direct ops and disable swiotlb for a deivce.

s/deivce/device/

> +#if IS_ENABLED(CONFIG_DMA_OPS_BYPASS) && !IS_ENABLED(CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED)

overly long line.

> +#if IS_ENABLED(CONFIG_DMA_OPS_BYPASS) && !IS_ENABLED(CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED)

Again.

> +int dma_direct_bypass(struct device *dev)
> +{
> +	int ret;
> +
> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
> +	if (ret)
> +		return ret;
> +
> +	dev->bus_dma_limit = DMA_BIT_MASK(64);
> +	dev->dma_ops_bypass = true;
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(dma_direct_bypass);

But more importantly ARCH_HAS_FORCE_DMA_UNENCRYPTED is just a compile
time flag.  With this you disable the functionality for all the usual
x86, s390 and powerpc configs, while only a tiny number of systems
for bounce buffering.  But I think you can just trivialy check
force_dma_unencrypted instead.  We do not need an extra Kconfig symbol
symbol for this trivial helper.

Also the helper is misnamed and misplaced.  The semantics have nothing
to do with dma-direct, the fact that is uses the ops bypass is an
implementation detail.   It really fits into the iommu code, as it
allows the driver to use the IOMMU API for IOVA management, while using
the DMA API for cache management.  So it should be named to reflect
that, and also grow a kerneldoc comment explaining how it will be used.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
