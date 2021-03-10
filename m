Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA4A333872
	for <lists.iommu@lfdr.de>; Wed, 10 Mar 2021 10:15:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 673BD431A8;
	Wed, 10 Mar 2021 09:15:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E6v-puc7WVmM; Wed, 10 Mar 2021 09:15:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D68E4319F;
	Wed, 10 Mar 2021 09:15:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2474CC0001;
	Wed, 10 Mar 2021 09:15:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62430C0001;
 Wed, 10 Mar 2021 09:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48A426F511;
 Wed, 10 Mar 2021 09:15:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v4ml26qnU42q; Wed, 10 Mar 2021 09:15:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9BE2A605B1;
 Wed, 10 Mar 2021 09:15:08 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4E49D68B05; Wed, 10 Mar 2021 10:15:02 +0100 (CET)
Date: Wed, 10 Mar 2021 10:15:01 +0100
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 14/17] iommu: remove DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE
Message-ID: <20210310091501.GC5928@lst.de>
References: <20210301084257.945454-1-hch@lst.de>
 <20210301084257.945454-15-hch@lst.de>
 <1658805c-ed28-b650-7385-a56fab3383e3@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1658805c-ed28-b650-7385-a56fab3383e3@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: kvm@vger.kernel.org, Will Deacon <will@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 Li Yang <leoyang.li@nxp.com>, iommu@lists.linux-foundation.org,
 netdev@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org, Michael Ellerman <mpe@ellerman.id.au>,
 virtualization@lists.linux-foundation.org, freedreno@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, linux-arm-msm@vger.kernel.org
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

On Thu, Mar 04, 2021 at 03:25:27PM +0000, Robin Murphy wrote:
> On 2021-03-01 08:42, Christoph Hellwig wrote:
>> Use explicit methods for setting and querying the information instead.
>
> Now that everyone's using iommu-dma, is there any point in bouncing this 
> through the drivers at all? Seems like it would make more sense for the x86 
> drivers to reflect their private options back to iommu_dma_strict (and 
> allow Intel's caching mode to override it as well), then have 
> iommu_dma_init_domain just test !iommu_dma_strict && 
> domain->ops->flush_iotlb_all.

Hmm.  I looked at this, and kill off ->dma_enable_flush_queue for
the ARM drivers and just looking at iommu_dma_strict seems like a
very clear win.

OTOH x86 is a little more complicated.  AMD and intel defaul to lazy
mode, so we'd have to change the global iommu_dma_strict if they are
initialized.  Also Intel has not only a "static" option to disable
lazy mode, but also a "dynamic" one where it iterates structure.  So
I think on the get side we're stuck with the method, but it still
simplifies the whole thing.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
