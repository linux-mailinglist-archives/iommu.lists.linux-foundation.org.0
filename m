Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2411E2F4B64
	for <lists.iommu@lfdr.de>; Wed, 13 Jan 2021 13:37:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D6E09864B3;
	Wed, 13 Jan 2021 12:37:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FQc7CyQPUvHz; Wed, 13 Jan 2021 12:37:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 86E25864D0;
	Wed, 13 Jan 2021 12:37:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7298CC013A;
	Wed, 13 Jan 2021 12:37:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B59FC013A
 for <iommu@lists.linux-foundation.org>; Wed, 13 Jan 2021 12:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 39388854E7
 for <iommu@lists.linux-foundation.org>; Wed, 13 Jan 2021 12:37:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gvIO2MBuPINb for <iommu@lists.linux-foundation.org>;
 Wed, 13 Jan 2021 12:37:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BD0FF8721F
 for <iommu@lists.linux-foundation.org>; Wed, 13 Jan 2021 12:37:27 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B5B9868AFE; Wed, 13 Jan 2021 13:37:21 +0100 (CET)
Date: Wed, 13 Jan 2021 13:37:21 +0100
From: Christoph Hellwig <hch@lst.de>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH v3 2/6] swiotlb: Add restricted DMA pool
Message-ID: <20210113123721.GA1098@lst.de>
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-3-tientzu@chromium.org> <X/VrqxcaAMi65CF0@kroah.com>
 <20210113115126.GB29376@lst.de> <X/7nkb/YDpKlakRO@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X/7nkb/YDpKlakRO@kroah.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: heikki.krogerus@linux.intel.com, peterz@infradead.org,
 benh@kernel.crashing.org, grant.likely@arm.com, paulus@samba.org,
 frowand.list@gmail.com, mingo@kernel.org, sstabellini@kernel.org,
 saravanak@google.com, xypron.glpk@gmx.de, rafael.j.wysocki@intel.com,
 Christoph Hellwig <hch@lst.de>, bgolaszewski@baylibre.com,
 xen-devel@lists.xenproject.org, treding@nvidia.com, devicetree@vger.kernel.org,
 will@kernel.org, konrad.wilk@oracle.com, dan.j.williams@intel.com,
 robh+dt@kernel.org, Claire Chang <tientzu@chromium.org>,
 boris.ostrovsky@oracle.com, andriy.shevchenko@linux.intel.com, jgross@suse.com,
 drinkcat@chromium.org, linuxppc-dev@lists.ozlabs.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 mpe@ellerman.id.au, robin.murphy@arm.com
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

On Wed, Jan 13, 2021 at 01:29:05PM +0100, Greg KH wrote:
> > > Why does this have to be added here?  Shouldn't the platform-specific
> > > code handle it instead?
> > 
> > The whole code added here is pretty generic.  What we need to eventually
> > do, though is to add a separate dma_device instead of adding more and more
> > bloat to struct device.
> 
> I have no objections for that happening!

I'm pretty sure you agreed to it before in fact.  Now someone just needs
to find the time to do this heavy lifting, where "someone" probably means
me.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
