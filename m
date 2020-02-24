Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EC616B082
	for <lists.iommu@lfdr.de>; Mon, 24 Feb 2020 20:45:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 428708715D;
	Mon, 24 Feb 2020 19:45:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pC4mLk2vM+FL; Mon, 24 Feb 2020 19:45:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BF1CA8700D;
	Mon, 24 Feb 2020 19:45:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BAB22C0177;
	Mon, 24 Feb 2020 19:45:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11F7FC0177
 for <iommu@lists.linux-foundation.org>; Mon, 24 Feb 2020 19:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0EE4585F7E
 for <iommu@lists.linux-foundation.org>; Mon, 24 Feb 2020 19:45:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EpcXplfiHpuJ for <iommu@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 19:45:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DC24385F50
 for <iommu@lists.linux-foundation.org>; Mon, 24 Feb 2020 19:45:34 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4E85268B05; Mon, 24 Feb 2020 20:45:29 +0100 (CET)
Date: Mon, 24 Feb 2020 20:45:28 +0100
From: Christoph Hellwig <hch@lst.de>
To: Stafford Horne <shorne@gmail.com>
Subject: Re: [PATCH 2/2] openrisc: use the generic in-place uncached DMA
 allocator
Message-ID: <20200224194528.GA10155@lst.de>
References: <20200220170139.387354-1-hch@lst.de>
 <20200220170139.387354-3-hch@lst.de>
 <20200221221447.GA7926@lianli.shorne-pla.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221221447.GA7926@lianli.shorne-pla.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Jonas Bonn <jonas@southpole.se>, Mark Rutland <mark.rutland@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 iommu@lists.linux-foundation.org, openrisc@lists.librecores.org,
 linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
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

On Sat, Feb 22, 2020 at 07:14:47AM +0900, Stafford Horne wrote:
> On Thu, Feb 20, 2020 at 09:01:39AM -0800, Christoph Hellwig wrote:
> > Switch openrisc to use the dma-direct allocator and just provide the
> > hooks for setting memory uncached or cached.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Reviewed-by: Stafford Horne <shorne@gmail.com>
> 
> Also, I test booted openrisc with linux 5.5 + these patches.  Thanks for
> continuing to shrink my code base.

I just resent a new version that changes how the hooks work based on
feedback from Robin.  Everything should work as-is, but if you have
some time to retest that would be great.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
