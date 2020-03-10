Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6A018074C
	for <lists.iommu@lfdr.de>; Tue, 10 Mar 2020 19:47:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6C67A87E6F;
	Tue, 10 Mar 2020 18:47:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JoH92IVqkxaw; Tue, 10 Mar 2020 18:47:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B08FD87E75;
	Tue, 10 Mar 2020 18:47:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95D0DC0177;
	Tue, 10 Mar 2020 18:47:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16FDFC0177
 for <iommu@lists.linux-foundation.org>; Tue, 10 Mar 2020 18:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0DD008692B
 for <iommu@lists.linux-foundation.org>; Tue, 10 Mar 2020 18:47:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 88gZup30EH5r for <iommu@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 18:47:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CBC2386274
 for <iommu@lists.linux-foundation.org>; Tue, 10 Mar 2020 18:47:44 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2A66068BE1; Tue, 10 Mar 2020 19:47:41 +0100 (CET)
Date: Tue, 10 Mar 2020 19:47:41 +0100
From: Christoph Hellwig <hch@lst.de>
To: David Rientjes <rientjes@google.com>
Subject: Re: [rfc 5/6] dma-direct: atomic allocations must come from
 unencrypted pools
Message-ID: <20200310184740.GA9745@lst.de>
References: <alpine.DEB.2.21.1912311738130.68206@chino.kir.corp.google.com>
 <b22416ec-cc28-3fd2-3a10-89840be173fa@amd.com>
 <alpine.DEB.2.21.2002280118461.165532@chino.kir.corp.google.com>
 <alpine.DEB.2.21.2003011535510.213582@chino.kir.corp.google.com>
 <alpine.DEB.2.21.2003011538040.213582@chino.kir.corp.google.com>
 <20200305154456.GC5332@lst.de>
 <alpine.DEB.2.21.2003061623060.27928@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2003061623060.27928@chino.kir.corp.google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Tom Lendacky <thomas.lendacky@amd.com>, "Singh,
 Brijesh" <brijesh.singh@amd.com>, "Grimm, Jon" <jon.grimm@amd.com>,
 baekhw@google.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
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

On Fri, Mar 06, 2020 at 04:36:07PM -0800, David Rientjes wrote:
> As a preliminary change to this series, I could move the atomic pools and 
> coherent_pool command line to a new kernel/dma/atomic_pools.c file with a 
> new CONFIG_DMA_ATOMIC_POOLS that would get "select"ed by CONFIG_DMA_REMAP 
> and CONFIG_AMD_MEM_ENCRYPT and call into dma_common_contiguous_remap() if 
> we have CONFIG_DMA_DIRECT_REMAP when adding pages to the pool.

Yes.  Although I'd just name it kernel/dma/pool.c and
CONFIG_DMA_COHERENT_POOL or so, as I plan to reuse the code for
architectures that just preallocate all coherent memory at boot time
as well.

> I think that's what you mean by splitting the pool from remapping, 
> otherwise we still have a full CONFIG_DMA_REMAP dependency here.  If you 
> had something else in mind, please let me know.  Thanks!

Yes, that is exactly what I meant.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
