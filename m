Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6435321E98D
	for <lists.iommu@lfdr.de>; Tue, 14 Jul 2020 09:08:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 14B6C8A9B3;
	Tue, 14 Jul 2020 07:08:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ty2FjOFQczdT; Tue, 14 Jul 2020 07:08:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E3EB28AADF;
	Tue, 14 Jul 2020 07:08:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BCFDCC0733;
	Tue, 14 Jul 2020 07:08:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 830EEC0733
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 07:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7CD448A9A9
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 07:08:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o4RselPekQMD for <iommu@lists.linux-foundation.org>;
 Tue, 14 Jul 2020 07:08:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DEC718A9A5
 for <iommu@lists.linux-foundation.org>; Tue, 14 Jul 2020 07:08:01 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id DFC6868CFC; Tue, 14 Jul 2020 09:07:57 +0200 (CEST)
Date: Tue, 14 Jul 2020 09:07:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH 4/5] dma-mapping: add a dma_ops_bypass flag to struct
 device
Message-ID: <20200714070757.GA776@lst.de>
References: <20200708152449.316476-1-hch@lst.de>
 <20200708152449.316476-5-hch@lst.de>
 <9bff7460-e6fa-f765-dcb4-cc96eb86d92c@ozlabs.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9bff7460-e6fa-f765-dcb4-cc96eb86d92c@ozlabs.ru>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Jesper Dangaard Brouer <brouer@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
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

On Mon, Jul 13, 2020 at 02:59:39PM +1000, Alexey Kardashevskiy wrote:
> 
> 
> On 09/07/2020 01:24, Christoph Hellwig wrote:
> > Several IOMMU drivers have a bypass mode where they can use a direct
> > mapping if the devices DMA mask is large enough.  Add generic support
> > to the core dma-mapping code to do that to switch those drivers to
> > a common solution.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  include/linux/device.h |  8 +++++
> >  kernel/dma/Kconfig     |  8 +++++
> >  kernel/dma/mapping.c   | 74 +++++++++++++++++++++++++++++-------------
> >  3 files changed, 68 insertions(+), 22 deletions(-)
> > 
> > diff --git a/include/linux/device.h b/include/linux/device.h
> > index 4c4af98321ebd6..1f71acf37f78d7 100644
> > --- a/include/linux/device.h
> > +++ b/include/linux/device.h
> > @@ -523,6 +523,11 @@ struct dev_links_info {
> >   *		  sync_state() callback.
> >   * @dma_coherent: this particular device is dma coherent, even if the
> >   *		architecture supports non-coherent devices.
> > + * @dma_ops_bypass: If set to %true then the dma_ops are bypassed for the
> > + *		streaming DMA operations (->map_* / ->unmap_* / ->sync_*),
> > + *		and optionall (if the coherent mask is large enough) also
> 
> 
> s/optionall/optional/g
> 
> Otherwise the series looks good and works well on powernv and pseries.
> Thanks,

Can you give a formal ACK?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
