Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B9323D661
	for <lists.iommu@lfdr.de>; Thu,  6 Aug 2020 07:18:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5F60386C67;
	Thu,  6 Aug 2020 05:18:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UbLogx8A_vvH; Thu,  6 Aug 2020 05:18:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 35E5986C51;
	Thu,  6 Aug 2020 05:18:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 205F8C004C;
	Thu,  6 Aug 2020 05:18:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09266C004C
 for <iommu@lists.linux-foundation.org>; Thu,  6 Aug 2020 05:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EC44986C67
 for <iommu@lists.linux-foundation.org>; Thu,  6 Aug 2020 05:18:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gUBIRiZVRCtL for <iommu@lists.linux-foundation.org>;
 Thu,  6 Aug 2020 05:18:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9794486C51
 for <iommu@lists.linux-foundation.org>; Thu,  6 Aug 2020 05:18:19 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id AB10868CFE; Thu,  6 Aug 2020 07:18:14 +0200 (CEST)
Date: Thu, 6 Aug 2020 07:18:14 +0200
From: Christoph Hellwig <hch@lst.de>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: Re: [PATCH v2 2/2] dma-pool: Only allocate from CMA when in same
 memory zone
Message-ID: <20200806051814.GA10143@lst.de>
References: <20200803160956.19235-1-nsaenzjulienne@suse.de>
 <20200803160956.19235-3-nsaenzjulienne@suse.de>
 <20200804060633.GA7368@lst.de>
 <e0b2a00c8cf86cb1a91804942d35c9d4b98e9f9f.camel@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e0b2a00c8cf86cb1a91804942d35c9d4b98e9f9f.camel@suse.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: amit.pundir@linaro.org, linux-kernel@vger.kernel.org, jeremy.linton@arm.com,
 iommu@lists.linux-foundation.org, linux-rpi-kernel@lists.infradead.org,
 rientjes@google.com, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>
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

On Tue, Aug 04, 2020 at 11:43:15AM +0200, Nicolas Saenz Julienne wrote:
> > Second I don't see the need (and actually some harm) in preventing GFP_KERNEL
> > allocations from dipping into lower CMA areas - something that we did support
> > before 5.8 with the single pool.
> 
> My thinking is the least we pressure CMA the better, it's generally scarse, and
> it'll not grow as the atomic pools grow. As far as harm is concerned, we now
> check addresses for correctness, so we shouldn't run into problems.
> 
> There is a potential case for architectures defining a default CMA but not
> defining DMA zones where this could be problematic. But isn't that just plain
> abusing CMA? If you need low memory allocations, you should be defining DMA
> zones.

The latter is pretty much what I expect, as we only support the default and
per-device DMA CMAs.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
