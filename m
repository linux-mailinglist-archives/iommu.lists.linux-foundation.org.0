Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BAF4FEE63
	for <lists.iommu@lfdr.de>; Wed, 13 Apr 2022 07:00:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D3B35405C1;
	Wed, 13 Apr 2022 05:00:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 62UoDaLofGr8; Wed, 13 Apr 2022 05:00:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 06D2B404A8;
	Wed, 13 Apr 2022 05:00:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3CECC0088;
	Wed, 13 Apr 2022 05:00:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB8DBC002C
 for <iommu@lists.linux-foundation.org>; Wed, 13 Apr 2022 05:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0CE240169
 for <iommu@lists.linux-foundation.org>; Wed, 13 Apr 2022 05:00:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZZh3e82eb0y1 for <iommu@lists.linux-foundation.org>;
 Wed, 13 Apr 2022 05:00:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BBDAE40105
 for <iommu@lists.linux-foundation.org>; Wed, 13 Apr 2022 05:00:03 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6C12F68B05; Wed, 13 Apr 2022 06:59:58 +0200 (CEST)
Date: Wed, 13 Apr 2022 06:59:58 +0200
From: Christoph Hellwig <hch@lst.de>
To: Chao Gao <chao.gao@intel.com>
Subject: Re: [PATCH] dma-direct: avoid redundant memory sync for swiotlb
Message-ID: <20220413045958.GA31209@lst.de>
References: <20220412113805.3210-1-chao.gao@intel.com>
 <e25fbb7e-a67e-5421-b7be-700fd0209b0d@arm.com>
 <20220413010157.GA10502@gao-cwp>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220413010157.GA10502@gao-cwp>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Kevin Tian <kevin.tian@intel.com>,
 Wang Zhaoyang1 <zhaoyang1.wang@intel.com>, linux-kernel@vger.kernel.org,
 Gao Liang <liang.gao@intel.com>, iommu@lists.linux-foundation.org,
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

On Wed, Apr 13, 2022 at 09:02:02AM +0800, Chao Gao wrote:
> dma_direct_sync_single_for_cpu() also calls arch_sync_dma_for_cpu_all()
> and arch_dma_mark_clean() in some cases. if SWIOTLB does sync internally,
> should these two functions be called by SWIOTLB?
> 
> Personally, it might be better if swiotlb can just focus on bounce buffer
> alloc/free. Adding more DMA coherence logic into swiotlb will make it
> a little complicated.
> 
> How about an open-coded version of dma_direct_sync_single_for_cpu
> in dma_direct_unmap_page with swiotlb_sync_single_for_cpu replaced by
> swiotlb_tbl_unmap_single?

I don't think the swiotlb and non-coherent case ever fully worked.
Before the merge of swiotlb into dma-direct they obviously were
mutally exclusive, and even now all the cache maintainance is done
on the physical address of the original data, not the swiotlb buffer.

If we want to fix that properly all the arch dma calls will need to
move into swiotlb, but that is a much bigger patch.

So for now I'd be happy with the one liner presented here, but
eventually the whole area could use an overhaul.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
