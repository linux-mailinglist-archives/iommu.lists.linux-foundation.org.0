Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9890537929C
	for <lists.iommu@lfdr.de>; Mon, 10 May 2021 17:25:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FBFF40E53;
	Mon, 10 May 2021 15:25:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NT3urG14v09c; Mon, 10 May 2021 15:25:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EE7240E6D;
	Mon, 10 May 2021 15:25:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0CDFAC0024;
	Mon, 10 May 2021 15:25:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9ACACC0001
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 15:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8966E40547
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 15:25:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k0ylC0AHT8kR for <iommu@lists.linux-foundation.org>;
 Mon, 10 May 2021 15:25:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EBE02401CC
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 15:25:28 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E63D667373; Mon, 10 May 2021 17:25:25 +0200 (CEST)
Date: Mon, 10 May 2021 17:25:25 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: i915 and swiotlb_max_segment
Message-ID: <20210510152525.GA30093@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: intel-gfx@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
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

Hi all,

swiotlb_max_segment is a rather strange "API" export by swiotlb.c,
and i915 is the only (remaining) user.

swiotlb_max_segment returns 0 if swiotlb is not in use, 1 if
SWIOTLB_FORCE is set or swiotlb-zen is set, and the swiotlb segment
size when swiotlb is otherwise enabled.

i915 then uses it to:

 a) decided on the max order in i915_gem_object_get_pages_internal
 b) decide on a max segment size in i915_sg_segment_size

for a) it really seems i915 should switch to dma_alloc_noncoherent
or dma_alloc_noncontigous ASAP instead of using alloc_page and
streaming DMA mappings.  Any chance I could trick one of the i915
maintaines into doing just that given that the callchain is not
exactly trivial?

For b) I'm not sure swiotlb and i915 really agree on the meaning
of the value.  swiotlb_set_max_segment basically returns the entire
size of the swiotlb buffer, while i915 seems to use it to limit
the size each scatterlist entry.  It seems like dma_max_mapping_size
might be the best value to use here.

Once that is fixed I'd like to kill off swiotlb_max_segment as it is
a horribly confusing API.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
