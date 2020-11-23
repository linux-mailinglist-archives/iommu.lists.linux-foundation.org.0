Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DA52C02F7
	for <lists.iommu@lfdr.de>; Mon, 23 Nov 2020 11:08:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0CB4120483;
	Mon, 23 Nov 2020 10:08:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EN7Qru96Ybuu; Mon, 23 Nov 2020 10:08:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 711A82047E;
	Mon, 23 Nov 2020 10:08:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53D0BC0052;
	Mon, 23 Nov 2020 10:08:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7415CC0052
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 10:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5AC05870C8
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 10:08:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HyT7FQFuwRqB for <iommu@lists.linux-foundation.org>;
 Mon, 23 Nov 2020 10:08:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5029D870C4
 for <iommu@lists.linux-foundation.org>; Mon, 23 Nov 2020 10:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=GMC0zoD4ESumTpUR0l7CFso7jCjRLzfG8oaHAbiw8Nw=; b=cUJ1n0nj5UYC6H8uzqFXNKi1sj
 VJVEgsND3cpDxCRsPqQ5bBuGflv1l5bMovoQ2AU/2kJHb6TKWvpEMLuEyC72YYc6TtxcIyT8suqEf
 4hLFc9qxeFlZVYf+TGJ2rJ9KKmUQSFyzC2oLgvfvqy4pdlLpIShVXCfo/bZhxzBvX+J6Vv7WNg2my
 F6gpVj9v06mb46gfYvD82o+K6mq48jXWrAL8bPpTT2ZiWpmJXMPBN3BvCwfLogoc/HIq/OcwMqifE
 slkh8yn9PgWFg8wu/TPKBu70jzqfjf/qE/Uu+l2tnemGHNvM0Xl1AMIi9vZ6ICa1J2Z73y6VowtlK
 Z/IeNhqg==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kh8lc-0006wE-Sr; Mon, 23 Nov 2020 10:08:16 +0000
Date: Mon, 23 Nov 2020 10:08:16 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v5 3/7] iommu: Allow the dma-iommu api to use bounce
 buffers
Message-ID: <20201123100816.GA26619@infradead.org>
References: <20201120101719.3172693-1-baolu.lu@linux.intel.com>
 <20201120101719.3172693-4-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120101719.3172693-4-baolu.lu@linux.intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Logan Gunthorpe <logang@deltatee.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>
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

> +	/*
> +	 * If both the physical buffer start address and size are
> +	 * page aligned, we don't need to use a bounce page.
> +	 */
> +	if (IS_ENABLED(CONFIG_SWIOTLB) && dev_is_untrusted(dev) &&
> +	    iova_offset(iovad, phys | org_size)) {
> +		aligned_size = iova_align(iovad, org_size);
> +		phys = swiotlb_tbl_map_single(dev,
> +				phys_to_dma(dev, io_tlb_start),
> +				phys, org_size, aligned_size, dir, attrs);

swiotlb_tbl_map_single takes one less argument in 5.10-rc now.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
