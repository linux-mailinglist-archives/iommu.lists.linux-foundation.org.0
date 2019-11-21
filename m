Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CE795104CBC
	for <lists.iommu@lfdr.de>; Thu, 21 Nov 2019 08:41:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 849B4887AF;
	Thu, 21 Nov 2019 07:41:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Ew6IliAZzj9; Thu, 21 Nov 2019 07:41:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2BBF6887B0;
	Thu, 21 Nov 2019 07:41:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10B84C1DDA;
	Thu, 21 Nov 2019 07:41:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05278C18DA
 for <iommu@lists.linux-foundation.org>; Thu, 21 Nov 2019 07:41:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E6EF386F16
 for <iommu@lists.linux-foundation.org>; Thu, 21 Nov 2019 07:41:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bpVtxcCzZ-n6 for <iommu@lists.linux-foundation.org>;
 Thu, 21 Nov 2019 07:41:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id AC11E864C3
 for <iommu@lists.linux-foundation.org>; Thu, 21 Nov 2019 07:41:04 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E48C268B05; Thu, 21 Nov 2019 08:41:00 +0100 (CET)
Date: Thu, 21 Nov 2019 08:41:00 +0100
From: Christoph Hellwig <hch@lst.de>
To: David Miller <davem@davemloft.net>
Subject: Re: [PATCH v3 0/4] dma-mapping: introduce new dma unmap and sync
 variants
Message-ID: <20191121074100.GD24024@lst.de>
References: <20191113122407.1171-1-laurentiu.tudor@nxp.com>
 <20191113.121132.1658930697082028145.davem@davemloft.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113.121132.1658930697082028145.davem@davemloft.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: ruxandra.radulescu@nxp.com, madalin.bucur@nxp.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
 iommu@lists.linux-foundation.org, camelia.groza@nxp.com, ioana.ciornei@nxp.com,
 robin.murphy@arm.com, hch@lst.de
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

On Wed, Nov 13, 2019 at 12:11:32PM -0800, David Miller wrote:
> > This series introduces a few new dma unmap and sync api variants that,
> > on top of what the originals do, return the virtual address
> > corresponding to the input dma address. In order to do that a new dma
> > map op is added, .get_virt_addr that takes the input dma address and
> > returns the virtual address backing it up.
> > The second patch adds an implementation for this new dma map op in the
> > generic iommu dma glue code and wires it in.
> > The third patch updates the dpaa2-eth driver to use the new apis.
> 
> The driver should store the mapping in it's private software state if
> it needs this kind of conversion.

I think the problem for this driver (and a few others) is that they
somehow manage to split I/O completions at a different boundary
than submissions.  For me with my block I/O background this seems
weird, but I'll need networking folks to double check the theory.

> This is huge precendence for this, and there is therefore no need to
> add even more complication and methods and burdon to architecture code
> for the sake of this.

Unfortunately there are various drivers that abuse iommu_iova_to_phys
to get a struct page to unmap.  Two of theose are network drivers
that went in through you (dpaa2 and thunder), additonally the 
caam crypto driver (which I think is the same SOC family as dpaa,
but I'm not sure) and the AMD GPU driver.

We also have drivers that just don't unmap and this don't work with
iommus or dma-debug (IBM EMAC another net driver).

That being said I hate these new API, but I still think they are less
bad than these IOMMU API abuses people do now.  If experienced
networking folks know a way to get rid of both I'm all for it.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
