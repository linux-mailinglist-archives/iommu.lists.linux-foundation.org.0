Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C251C53FB
	for <lists.iommu@lfdr.de>; Tue,  5 May 2020 13:09:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5071E87C5C;
	Tue,  5 May 2020 11:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FUj-gk22h6ZR; Tue,  5 May 2020 11:09:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C6C2A87B07;
	Tue,  5 May 2020 11:09:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF3E7C0175;
	Tue,  5 May 2020 11:09:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1AACAC0175
 for <iommu@lists.linux-foundation.org>; Tue,  5 May 2020 11:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 08A5820450
 for <iommu@lists.linux-foundation.org>; Tue,  5 May 2020 11:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cECcPpFP+QUW for <iommu@lists.linux-foundation.org>;
 Tue,  5 May 2020 11:09:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id 41D1120418
 for <iommu@lists.linux-foundation.org>; Tue,  5 May 2020 11:09:54 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4A89768C4E; Tue,  5 May 2020 13:09:50 +0200 (CEST)
Date: Tue, 5 May 2020 13:09:50 +0200
From: Christoph Hellwig <hch@lst.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v3 02/25] drm: core: fix common struct sg_table related
 issues
Message-ID: <20200505110950.GA19067@lst.de>
References: <20200505083926.28503-1-m.szyprowski@samsung.com>
 <20200505084614.30424-1-m.szyprowski@samsung.com>
 <CGME20200505084625eucas1p1a3c25fd171f360e0aab2f76700699454@eucas1p1.samsung.com>
 <20200505084614.30424-2-m.szyprowski@samsung.com>
 <20200505101508.GA14860@lst.de>
 <5dd1cb55-accb-0dc6-4ca5-90c57cd19527@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5dd1cb55-accb-0dc6-4ca5-90c57cd19527@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux-foundation.org,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
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

On Tue, May 05, 2020 at 12:51:58PM +0200, Marek Szyprowski wrote:
> Hi Christoph,
> 
> On 05.05.2020 12:15, Christoph Hellwig wrote:
> >> -		for_each_sg_page(st->sgl, &sg_iter, st->nents, 0)
> >> +		for_each_sg_page(st->sgl, &sg_iter, st->orig_nents, 0)
> > Would it make sense to also add a for_each_sgtable_page helper that
> > hides the use of orig_nents?  To be used like:
> >
> > 		for_each_sgtable_page(st, &sg_iter, 0) {
> 
> We would need two helpers:
> 
> for_each_sgtable_cpu_page() and for_each_sgtable_dma_page().
> 
> I considered them, but then I found that there are already 
> for_each_sg_page(), for_each_sg_dma_page() and various special iterators 
> like sg_page_iter, sg_dma_page_iter and sg_mapping_iter. Too bad that 
> they are almost not used, at least in the DRM subsystem. I wonder if it 
> make sense to apply them or simply provide the two above mentioned 
> wrappers?

None of the helpers helps with passing the right parameters from the
sg_table.  So in doube we'd need wrappers for all of the above, or
none..
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
