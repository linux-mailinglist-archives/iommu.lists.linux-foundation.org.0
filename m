Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FCC277ECE
	for <lists.iommu@lfdr.de>; Fri, 25 Sep 2020 06:14:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9745387562;
	Fri, 25 Sep 2020 04:14:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OF0rQRfKhirb; Fri, 25 Sep 2020 04:14:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D173487545;
	Fri, 25 Sep 2020 04:14:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C2A84C1AD6;
	Fri, 25 Sep 2020 04:14:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ED1BCC0859
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 04:14:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E712A85267
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 04:14:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GmalGiBcqAPD for <iommu@lists.linux-foundation.org>;
 Fri, 25 Sep 2020 04:14:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9B73784DD5
 for <iommu@lists.linux-foundation.org>; Fri, 25 Sep 2020 04:14:30 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0871E68AFE; Fri, 25 Sep 2020 06:14:26 +0200 (CEST)
Date: Fri, 25 Sep 2020 06:14:25 +0200
From: 'Christoph Hellwig' <hch@lst.de>
To: David Laight <David.Laight@ACULAB.COM>
Subject: Re: [PATCH 3/3] dma-mapping: better document dma_addr_t and
 DMA_MAPPING_ERROR
Message-ID: <20200925041425.GA9419@lst.de>
References: <20200922134002.1227279-1-hch@lst.de>
 <20200922134002.1227279-4-hch@lst.de>
 <f9c37e5ff1cb4a02bff6d2a8d0ea2dcc@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f9c37e5ff1cb4a02bff6d2a8d0ea2dcc@AcuMS.aculab.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 'Christoph Hellwig' <hch@lst.de>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
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

On Tue, Sep 22, 2020 at 01:56:46PM +0000, David Laight wrote:
> > +/*
> > + * A dma_addr_t can hold any valid DMA or bus address for the platform.  It can
> > + * be given to a device to use as a DMA source or target.  A CPU cannot
> > + * reference a dma_addr_t directly because there may be translation between its
> > + * physical address space and the bus address space.
> 
> It can't access it 'directly' because it isn't a virtual address....
> 
> > + *
> > + * DMA_MAPPING_ERROR is the magic error code if a mapping failed.  It should not
> > + * be used directly in drivers, but checked for using dma_mapping_error()
> > + * instead.
> > + */
> 
> I think it might be worth adding:
> 
> A dma_addr_t value may be device dependant and differ from the
> 'physical address' of the memory.

This is what I've committed:

 * A dma_addr_t can hold any valid DMA or bus address for the platform.  It can
 * be given to a device to use as a DMA source or target.  It is specific to a
 * given device and there may be a translation between the CPU physical address
 * space and the bus address space.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
