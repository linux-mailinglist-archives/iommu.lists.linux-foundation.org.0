Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B9F1DB5DB
	for <lists.iommu@lfdr.de>; Wed, 20 May 2020 16:03:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A96268872E;
	Wed, 20 May 2020 14:03:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LhuaXFMIAfQf; Wed, 20 May 2020 14:03:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7E4B688326;
	Wed, 20 May 2020 14:03:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F93DC0176;
	Wed, 20 May 2020 14:03:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5A4F5C0176
 for <iommu@lists.linux-foundation.org>; Wed, 20 May 2020 14:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 484448828D
 for <iommu@lists.linux-foundation.org>; Wed, 20 May 2020 14:03:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7emV1jxQHgr5 for <iommu@lists.linux-foundation.org>;
 Wed, 20 May 2020 14:03:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 962D788018
 for <iommu@lists.linux-foundation.org>; Wed, 20 May 2020 14:03:23 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E20D320756;
 Wed, 20 May 2020 14:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589983403;
 bh=QuXivJWfSCHoFejw2WGsuzr9GwmENzgWc4fknuN2hVw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eiyArFOnyS9XWPVzx2pT9OR3PB51ouV4SYNXBJ/MysL4g4tA60zrn+LXVy2btR79O
 RI9k8qrNOLyJ2r26YpfZ9DWI8NVapbA8kStc2j9iMBOnMPrz+iik1p9pAf++tpwLEf
 mcWbA0DiSjTiLMPuGXhTXbwNZHh9ZjMLZ0mML4wI=
Date: Wed, 20 May 2020 16:03:20 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Subject: Re: [PATCH 09/15] device core: Add ability to handle multiple dma
 offsets
Message-ID: <20200520140320.GA3624154@kroah.com>
References: <20200519203419.12369-1-james.quinlan@broadcom.com>
 <20200519203419.12369-10-james.quinlan@broadcom.com>
 <20200520054349.GB2180554@kroah.com>
 <CA+-6iNyQFauYc0ZNbzRmao_oOZD8XM+1D0XE133HP_-zgMLzuA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+-6iNyQFauYc0ZNbzRmao_oOZD8XM+1D0XE133HP_-zgMLzuA@mail.gmail.com>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Saravana Kannan <saravanak@google.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Frank Rowand <frowand.list@gmail.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
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

On Wed, May 20, 2020 at 09:50:36AM -0400, Jim Quinlan wrote:
> On Wed, May 20, 2020 at 1:43 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Tue, May 19, 2020 at 04:34:07PM -0400, Jim Quinlan wrote:
> > > diff --git a/include/linux/device.h b/include/linux/device.h
> > > index ac8e37cd716a..6cd916860b5f 100644
> > > --- a/include/linux/device.h
> > > +++ b/include/linux/device.h
> > > @@ -493,6 +493,8 @@ struct dev_links_info {
> > >   * @bus_dma_limit: Limit of an upstream bridge or bus which imposes a smaller
> > >   *           DMA limit than the device itself supports.
> > >   * @dma_pfn_offset: offset of DMA memory range relatively of RAM
> > > + * @dma_map: Like dma_pfn_offset but used when there are multiple
> > > + *           pfn offsets for multiple dma-ranges.
> > >   * @dma_parms:       A low level driver may set these to teach IOMMU code about
> > >   *           segment limitations.
> > >   * @dma_pools:       Dma pools (if dma'ble device).
> > > @@ -578,7 +580,12 @@ struct device {
> > >                                            allocations such descriptors. */
> > >       u64             bus_dma_limit;  /* upstream dma constraint */
> > >       unsigned long   dma_pfn_offset;
> > > -
> > > +#ifdef CONFIG_DMA_PFN_OFFSET_MAP
> > > +     const void *dma_offset_map;     /* Like dma_pfn_offset, but for
> > > +                                      * the unlikely case of multiple
> > > +                                      * offsets. If non-null, dma_pfn_offset
> > > +                                      * will be 0. */
> > > +#endif
> > >       struct device_dma_parameters *dma_parms;
> > >
> > >       struct list_head        dma_pools;      /* dma pools (if dma'ble) */
> >
> > I'll defer to Christoph here, but I thought we were trying to get rid of
> > stuff like this from struct device, not add new things to it for dma
> Hi Greg,
> 
> I wasn't aware of this policy.  I put it in 'struct device' because
> just like the existing dma_pfn_offset; it seemed to be the only way to
> pull this off.  I'll certainly follow any ideas on alternative
> strategies from Christoph et al.
> 
> > apis.  And why is it a void *?
> Just wanted to minimize the number of lines I've added to device.h, no
> other reason.

How would using a real type make this more lines?  Never use a void *
unless you have to, we want the compiler to check our errors for us :)

thanks,

greg k-h
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
