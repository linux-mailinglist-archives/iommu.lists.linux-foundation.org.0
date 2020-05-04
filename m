Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C451C3AFB
	for <lists.iommu@lfdr.de>; Mon,  4 May 2020 15:11:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E1ADE83A58;
	Mon,  4 May 2020 13:11:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WZnve2p4H1bH; Mon,  4 May 2020 13:11:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 80CFB84F7F;
	Mon,  4 May 2020 13:11:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66BC8C0175;
	Mon,  4 May 2020 13:11:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F520C0175
 for <iommu@lists.linux-foundation.org>; Mon,  4 May 2020 13:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3BAA287F81
 for <iommu@lists.linux-foundation.org>; Mon,  4 May 2020 13:11:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 84CETBnLfd62 for <iommu@lists.linux-foundation.org>;
 Mon,  4 May 2020 13:11:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B387D87D1A
 for <iommu@lists.linux-foundation.org>; Mon,  4 May 2020 13:11:14 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id F34BA68BFE; Mon,  4 May 2020 15:11:10 +0200 (CEST)
Date: Mon, 4 May 2020 15:11:10 +0200
From: Christoph Hellwig <hch@lst.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 00/21] DRM: fix struct sg_table nents vs. orig_nents
 misuse
Message-ID: <20200504131110.GA18918@lst.de>
References: <CGME20200504125032eucas1p2eeaf22690e6b557d69c834cc9dd75855@eucas1p2.samsung.com>
 <20200504125017.5494-1-m.szyprowski@samsung.com>
 <20200504125212.GA17241@lst.de>
 <b257279c-4138-b28e-584d-92bd15571ae1@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b257279c-4138-b28e-584d-92bd15571ae1@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
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

On Mon, May 04, 2020 at 03:05:30PM +0200, Marek Szyprowski wrote:
> Hi Christoph,
> 
> On 04.05.2020 14:52, Christoph Hellwig wrote:
> > On Mon, May 04, 2020 at 02:50:17PM +0200, Marek Szyprowski wrote:
> >> v2:
> >> - dropped most of the changes to drm/i915
> >> - added fixes for rcar-du, xen, media and ion
> >> - fixed a few issues pointed by kbuild test robot
> >> - added wide cc: list for each patch
> > Didn't you plan to add dma_map_sgbuf and co helper?
> 
> Yes, I have a followup patches for that, but I wanted to fix the 
> existing code in the first step. Then I wanted to send a wrappers and 
> their application. Do you think I should do everything at once, in one 
> patchset?

That would be my preference.  The helpers should be mostly trivial
wrappers, so they can easily backported, and they force passing of the
correct parameters.  So I don't really see a need to fix up all the 20+
places up first just to convert them to the proper API a little later.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
