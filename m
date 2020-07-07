Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CD206216FC0
	for <lists.iommu@lfdr.de>; Tue,  7 Jul 2020 17:11:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 865DA88B6E;
	Tue,  7 Jul 2020 15:11:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DXoj6T9OXk1U; Tue,  7 Jul 2020 15:11:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B4E4C88C85;
	Tue,  7 Jul 2020 15:11:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A67C7C07FF;
	Tue,  7 Jul 2020 15:11:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA590C016F
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 15:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A580C88B67
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 15:11:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jgGoTGxS9NUo for <iommu@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 15:11:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtp8.emailarray.com (smtp8.emailarray.com [65.39.216.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 88F8D88F06
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 15:11:27 +0000 (UTC)
Received: (qmail 99413 invoked by uid 89); 7 Jul 2020 15:11:12 -0000
Received: from unknown (HELO localhost)
 (amxlbW9uQGZsdWdzdmFtcC5jb21AMTYzLjExNC4xMzIuMw==) (POLARISLOCAL) 
 by smtp8.emailarray.com with SMTP; 7 Jul 2020 15:11:12 -0000
Date: Tue, 7 Jul 2020 08:11:09 -0700
From: Jonathan Lemon <jonathan.lemon@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 1/4] dma-mapping: add a new dma_need_sync API
Message-ID: <20200707151109.qui5uzzzq4dihfie@bsd-mbp>
References: <20200629130359.2690853-1-hch@lst.de>
 <20200629130359.2690853-2-hch@lst.de>
 <20200706194227.vfhv5o4lporxjxmq@bsd-mbp.dhcp.thefacebook.com>
 <20200707064730.GA23602@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200707064730.GA23602@lst.de>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, bpf@vger.kernel.org,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 Magnus Karlsson <magnus.karlsson@intel.com>
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

On Tue, Jul 07, 2020 at 08:47:30AM +0200, Christoph Hellwig wrote:
> On Mon, Jul 06, 2020 at 12:42:27PM -0700, Jonathan Lemon wrote:
> > On Mon, Jun 29, 2020 at 03:03:56PM +0200, Christoph Hellwig wrote:
> > > Add a new API to check if calls to dma_sync_single_for_{device,cpu} are
> > > required for a given DMA streaming mapping.
> > > 
> > > +::
> > > +
> > > +	bool
> > > +	dma_need_sync(struct device *dev, dma_addr_t dma_addr);
> > > +
> > > +Returns %true if dma_sync_single_for_{device,cpu} calls are required to
> > > +transfer memory ownership.  Returns %false if those calls can be skipped.
> > 
> > Hi Christoph -
> > 
> > Thie call above is for a specific dma_addr.  For correctness, would I
> > need to check every addr, or can I assume that for a specific memory
> > type (pages returned from malloc), that the answer would be identical?
> 
> You need to check every mapping.  E.g. this API pairs with a
> dma_map_single/page call.  For S/G mappings you'd need to call it for
> each entry, although if you have a use case for that we really should
> add a dma_sg_need_sync helper instea of open coding the scatterlist walk.

My use case is setting up a pinned memory area, and caching the dma
mappings.  I'd like to bypass storing the DMA addresses if they aren't
needed.  For example:

setup()
{
    if (dma_need_sync(dev, addr, len)) {
        kvmalloc_array(...)
        cache_dma_mappings(...)
    }


dev_get_dma(page)
{
    if (!cache)
        return page_to_phys(page)

    return dma_cache_lookup(...)



The reason for doing it this way is that the page in question may be
backed by either system memory, or device memory such as a GPU.  For the
latter, the GPU provides a table of DMA addresses where data may be
accessed, so I'm unable to use the dma_map_page() API.
-- 
Jonathan
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
