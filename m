Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9DF135B64
	for <lists.iommu@lfdr.de>; Thu,  9 Jan 2020 15:31:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6C9A52001F;
	Thu,  9 Jan 2020 14:31:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m3lbiJ3MGXI0; Thu,  9 Jan 2020 14:31:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1440520C41;
	Thu,  9 Jan 2020 14:31:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08542C18DC;
	Thu,  9 Jan 2020 14:31:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8BD6AC0881
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 14:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 81C8588007
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 14:31:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f-V4aorZfswG for <iommu@lists.linux-foundation.org>;
 Thu,  9 Jan 2020 14:31:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2AAF487FFB
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jan 2020 14:31:12 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7011068BFE; Thu,  9 Jan 2020 15:31:08 +0100 (CET)
Date: Thu, 9 Jan 2020 15:31:08 +0100
From: Christoph Hellwig <hch@lst.de>
To: David Rientjes <rientjes@google.com>
Subject: Re: [rfc] dma-mapping: preallocate unencrypted DMA atomic pool
Message-ID: <20200109143108.GA22656@lst.de>
References: <alpine.DEB.2.21.1912311738130.68206@chino.kir.corp.google.com>
 <3213a6ac-5aad-62bc-bf95-fae8ba088b9e@arm.com> <20200107105458.GA3139@lst.de>
 <alpine.DEB.2.21.2001071152020.183706@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2001071152020.183706@chino.kir.corp.google.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>, "Singh,
 Brijesh" <brijesh.singh@amd.com>, "Grimm, Jon" <jon.grimm@amd.com>,
 baekhw@google.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

On Tue, Jan 07, 2020 at 11:57:24AM -0800, David Rientjes wrote:
> I'll rely on Thomas to chime in if this doesn't make sense for the SEV 
> usecase.
> 
> I think the sizing of the single atomic pool needs to be determined.  Our 
> peak usage that we have measured from NVMe is ~1.4MB and atomic_pool is 
> currently sized to 256KB by default.  I'm unsure at this time if we need 
> to be able to dynamically expand this pool with a kworker.
>
> Maybe when CONFIG_AMD_MEM_ENCRYPT is enabled this atomic pool should be 
> sized to 2MB or so and then when it reaches half capacity we schedule some 
> background work to dynamically increase it?  That wouldn't be hard unless 
> the pool can be rapidly depleted.
> 

Note that a non-coherent architecture with the same workload would need
the same size.

> Do we want to increase the atomic pool size by default and then do 
> background dynamic expansion?

For now I'd just scale with system memory size.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
