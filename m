Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD1A18F136
	for <lists.iommu@lfdr.de>; Mon, 23 Mar 2020 09:51:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2469186AF8;
	Mon, 23 Mar 2020 08:51:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CUJHSLTxar1T; Mon, 23 Mar 2020 08:51:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C531686B23;
	Mon, 23 Mar 2020 08:51:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95343C1D8F;
	Mon, 23 Mar 2020 08:51:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53BA9C0177
 for <iommu@lists.linux-foundation.org>; Mon, 23 Mar 2020 08:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4DEEF22621
 for <iommu@lists.linux-foundation.org>; Mon, 23 Mar 2020 08:51:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KkTf3HkRv3ZD for <iommu@lists.linux-foundation.org>;
 Mon, 23 Mar 2020 08:51:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id 128E320458
 for <iommu@lists.linux-foundation.org>; Mon, 23 Mar 2020 08:51:05 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id D778468BEB; Mon, 23 Mar 2020 09:50:59 +0100 (CET)
Date: Mon, 23 Mar 2020 09:50:59 +0100
From: Christoph Hellwig <hch@lst.de>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH 1/2] dma-mapping: add a dma_ops_bypass flag to struct
 device
Message-ID: <20200323085059.GA32528@lst.de>
References: <20200320141640.366360-1-hch@lst.de>
 <20200320141640.366360-2-hch@lst.de>
 <2f31d0dd-aa7e-8b76-c8a1-5759fda5afc9@ozlabs.ru>
 <20200323083705.GA31245@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200323083705.GA31245@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
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

On Mon, Mar 23, 2020 at 09:37:05AM +0100, Christoph Hellwig wrote:
> > > +	/*
> > > +	 * Allows IOMMU drivers to bypass dynamic translations if the DMA mask
> > > +	 * is large enough.
> > > +	 */
> > > +	if (dev->dma_ops_bypass) {
> > > +		if (min_not_zero(dev->coherent_dma_mask, dev->bus_dma_limit) >=
> > > +				dma_direct_get_required_mask(dev))
> > > +			return true;
> > > +	}
> > 
> > 
> > Why not do this in dma_map_direct() as well?
> 
> Mostly beacuse it is a relatively expensive operation, including a
> fls64.

Which I guess isn't too bad compared to a dynamic IOMMU mapping.  Can
you just send a draft patch for what you'd like to see for ppc?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
