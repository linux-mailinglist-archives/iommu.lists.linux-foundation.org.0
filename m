Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7039A29A5DD
	for <lists.iommu@lfdr.de>; Tue, 27 Oct 2020 08:55:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3631B852CF;
	Tue, 27 Oct 2020 07:55:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1D_OEO5auE89; Tue, 27 Oct 2020 07:55:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2A796851A4;
	Tue, 27 Oct 2020 07:55:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C469C0051;
	Tue, 27 Oct 2020 07:55:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4CA68C0051
 for <iommu@lists.linux-foundation.org>; Tue, 27 Oct 2020 07:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4190A851A4
 for <iommu@lists.linux-foundation.org>; Tue, 27 Oct 2020 07:54:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JaMECxioopns for <iommu@lists.linux-foundation.org>;
 Tue, 27 Oct 2020 07:54:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E53028506A
 for <iommu@lists.linux-foundation.org>; Tue, 27 Oct 2020 07:54:57 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2FBB867373; Tue, 27 Oct 2020 08:54:53 +0100 (CET)
Date: Tue, 27 Oct 2020 08:54:52 +0100
From: "hch@lst.de" <hch@lst.de>
To: "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>
Subject: Re: [PATCH] dma: Per-NUMA-node CMA should depend on NUMA
Message-ID: <20201027075452.GA22487@lst.de>
References: <74b66725883f065eb7d156f866678abb5be934bd.1603714996.git.robin.murphy@arm.com>
 <75cad228694b4f1587265a887069b241@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <75cad228694b4f1587265a887069b241@hisilicon.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, "hch@lst.de" <hch@lst.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Mon, Oct 26, 2020 at 08:07:43PM +0000, Song Bao Hua (Barry Song) wrote:
> > diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
> > index c99de4a21458..964b74c9b7e3 100644
> > --- a/kernel/dma/Kconfig
> > +++ b/kernel/dma/Kconfig
> > @@ -125,7 +125,8 @@ if  DMA_CMA
> > 
> >  config DMA_PERNUMA_CMA
> >  	bool "Enable separate DMA Contiguous Memory Area for each NUMA
> > Node"
> > -	default NUMA && ARM64
> > +	depends on NUMA
> > +	default ARM64
> 
> On the other hand, at this moment, only ARM64 is calling the init code
> to get per_numa cma. Do we need to
> depends on NUMA && ARM64 ?
> so that this is not enabled by non-arm64?

I actually hate having arch symbols in common code.  A new
ARCH_HAS_DMA_PERNUMA_CMA, only selected by arm64 for now would be more
clean I think.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
