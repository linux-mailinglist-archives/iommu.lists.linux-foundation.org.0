Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 918B31A24B4
	for <lists.iommu@lfdr.de>; Wed,  8 Apr 2020 17:12:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3D3F1204E0;
	Wed,  8 Apr 2020 15:12:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JR+zvvl9KSsq; Wed,  8 Apr 2020 15:12:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 96247204C5;
	Wed,  8 Apr 2020 15:12:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A5D9C1D89;
	Wed,  8 Apr 2020 15:12:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 183B3C0177
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 15:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1333787B5D
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 15:12:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bk+dkU9cjtt1 for <iommu@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 15:12:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 928DA8766C
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 15:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Rjv5131jSAiyIu5HYACdcXLWZcmDSy5Ae4NdyG3A0EU=; b=FuXsAshYsSTgOfgG+tafxq311H
 2DLcoyBxKM/nbGCT2GEvorwEQ03/VOWi5DKAbxhI4DqIPjAGXNNsOWsSOG7aU/Lla3ICxHLRu6SzM
 /q9DEwOTHGBUUXd+C1gWvP9Pjgc6GcW+Xi/RtUJFOAx/HNAnnerQFGHAfcPScOe5j3ll7FaXVMW5Z
 Z2xjwSDzwp0YcD5TzxjStK7nQDDKjXVISOx5Itl6OOQeUK3wpMFWDuSjU7Q7E7VC31GOzaWh+PQx5
 zbPF7UcdVGkG+53Xs4Olbyq1FLyXUWKqf1azA1wf6Pm9lsIEV7Cpflmxs3MnCPe2MFR6K51PRMHF8
 JF/j+ctA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMCN3-0004v8-A7; Wed, 08 Apr 2020 15:12:05 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 64B9E300478;
 Wed,  8 Apr 2020 17:12:03 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 2B71F2BB026A0; Wed,  8 Apr 2020 17:12:03 +0200 (CEST)
Date: Wed, 8 Apr 2020 17:12:03 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 10/28] mm: only allow page table mappings for built-in
 zsmalloc
Message-ID: <20200408151203.GN20730@hirez.programming.kicks-ass.net>
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-11-hch@lst.de>
 <c0c86feb-b3d8-78f2-127f-71d682ffc51f@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c0c86feb-b3d8-78f2-127f-71d682ffc51f@infradead.org>
Cc: linux-hyperv@vger.kernel.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 "K. Y. Srinivasan" <kys@microsoft.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 x86@kernel.org, Christoph Hellwig <hch@lst.de>,
 Laura Abbott <labbott@redhat.com>, Nitin Gupta <ngupta@vflare.org>,
 Daniel Vetter <daniel@ffwll.ch>, Haiyang Zhang <haiyangz@microsoft.com>,
 linaro-mm-sig@lists.linaro.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Minchan Kim <minchan@kernel.org>, iommu@lists.linux-foundation.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
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

On Wed, Apr 08, 2020 at 08:01:00AM -0700, Randy Dunlap wrote:
> Hi,
> 
> On 4/8/20 4:59 AM, Christoph Hellwig wrote:
> > diff --git a/mm/Kconfig b/mm/Kconfig
> > index 36949a9425b8..614cc786b519 100644
> > --- a/mm/Kconfig
> > +++ b/mm/Kconfig
> > @@ -702,7 +702,7 @@ config ZSMALLOC
> >  
> >  config ZSMALLOC_PGTABLE_MAPPING
> >  	bool "Use page table mapping to access object in zsmalloc"
> > -	depends on ZSMALLOC
> > +	depends on ZSMALLOC=y
> 
> It's a bool so this shouldn't matter... not needed.

My mm/Kconfig has:

config ZSMALLOC
	tristate "Memory allocator for compressed pages"
	depends on MMU

which I think means it can be modular, no?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
