Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A001A21DE
	for <lists.iommu@lfdr.de>; Wed,  8 Apr 2020 14:24:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2E8E888091;
	Wed,  8 Apr 2020 12:24:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KdHUhvHrsATF; Wed,  8 Apr 2020 12:24:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C1DD48807C;
	Wed,  8 Apr 2020 12:24:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B7B48C0177;
	Wed,  8 Apr 2020 12:24:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9F2A4C0177
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 12:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9632A204DD
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 12:24:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XJSMd3TPok8C for <iommu@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 12:24:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id 37BFE2048D
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 12:24:04 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 450A868C4E; Wed,  8 Apr 2020 14:23:57 +0200 (CEST)
Date: Wed, 8 Apr 2020 14:23:56 +0200
From: Christoph Hellwig <hch@lst.de>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 17/28] mm: remove the prot argument from vm_map_ram
Message-ID: <20200408122356.GA13282@lst.de>
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408115926.1467567-18-hch@lst.de>
 <20200408122104.GZ20713@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408122104.GZ20713@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
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

On Wed, Apr 08, 2020 at 02:21:04PM +0200, Peter Zijlstra wrote:
> On Wed, Apr 08, 2020 at 01:59:15PM +0200, Christoph Hellwig wrote:
> > This is always GFP_KERNEL - for long term mappings with other properties
> > vmap should be used.
> 
>  PAGE_KERNEL != GFP_KERNEL :-)

Yep.  The compiler complained about that a few times :)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
