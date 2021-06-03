Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7AA399CC4
	for <lists.iommu@lfdr.de>; Thu,  3 Jun 2021 10:40:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 958ED400DB;
	Thu,  3 Jun 2021 08:40:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id squy9vOR5Shq; Thu,  3 Jun 2021 08:40:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD3E140515;
	Thu,  3 Jun 2021 08:40:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7D98AC0024;
	Thu,  3 Jun 2021 08:40:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 478ECC0001
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 08:40:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2119E400DF
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 08:40:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pVnvPMdOlGLE for <iommu@lists.linux-foundation.org>;
 Thu,  3 Jun 2021 08:40:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7841C400DB
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 08:40:23 +0000 (UTC)
IronPort-SDR: agQBs8Vdb34Og+IBgOKK7oM7pI3TDnYF6s3WTjGQvYUxG/RAKF3YAmA+b9Rbn90gj5rI0aBARm
 SRVSD3q5AOPA==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="267863704"
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="267863704"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 01:40:16 -0700
IronPort-SDR: zaG+TekgVIYKs3X+kNC3Jpsm3GjArPLb8T4622NANIInNlDbUKxCtdKvLc+2gWRl4PG2o1KJSB
 DWHRmeXMxOlg==
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="447770231"
Received: from nichilds-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.26.250])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 01:40:13 -0700
MIME-Version: 1.0
In-Reply-To: <YKZ8eqnSnaso3aoe@0xbeefdead.lan>
References: <20210510152525.GA30093@lst.de> <YKZ8eqnSnaso3aoe@0xbeefdead.lan>
Subject: Re: i915 and swiotlb_max_segment
To: Christoph Hellwig <hch@lst.de>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <162270961054.11739.9148402963893484386@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Thu, 03 Jun 2021 11:40:10 +0300
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>
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

+ Tvrtko to take a look

Quoting Konrad Rzeszutek Wilk (2021-05-20 18:12:58)
> On Mon, May 10, 2021 at 05:25:25PM +0200, Christoph Hellwig wrote:
> > Hi all,
> > 
> > swiotlb_max_segment is a rather strange "API" export by swiotlb.c,
> > and i915 is the only (remaining) user.
> > 
> > swiotlb_max_segment returns 0 if swiotlb is not in use, 1 if
> > SWIOTLB_FORCE is set or swiotlb-zen is set, and the swiotlb segment
> > size when swiotlb is otherwise enabled.
> > 
> > i915 then uses it to:
> > 
> >  a) decided on the max order in i915_gem_object_get_pages_internal
> >  b) decide on a max segment size in i915_sg_segment_size
> > 
> > for a) it really seems i915 should switch to dma_alloc_noncoherent
> > or dma_alloc_noncontigous ASAP instead of using alloc_page and
> > streaming DMA mappings.  Any chance I could trick one of the i915
> > maintaines into doing just that given that the callchain is not
> > exactly trivial?
> > 
> > For b) I'm not sure swiotlb and i915 really agree on the meaning
> > of the value.  swiotlb_set_max_segment basically returns the entire
> > size of the swiotlb buffer, while i915 seems to use it to limit
> > the size each scatterlist entry.  It seems like dma_max_mapping_size
> > might be the best value to use here.
> 
> Yes. The background behind that was SWIOTLB would fail because well, the
> size of the sg was too large. And some way to limit it to max size
> was needed - the dma_max_mapping_size "should" be just fine.
> 
> > 
> > Once that is fixed I'd like to kill off swiotlb_max_segment as it is
> > a horribly confusing API.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
