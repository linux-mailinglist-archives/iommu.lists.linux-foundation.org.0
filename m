Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8365410C48E
	for <lists.iommu@lfdr.de>; Thu, 28 Nov 2019 08:52:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F3AE7868F5;
	Thu, 28 Nov 2019 07:52:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2aqJzARoqGF1; Thu, 28 Nov 2019 07:52:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6CC05868E5;
	Thu, 28 Nov 2019 07:52:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4BE3AC0881;
	Thu, 28 Nov 2019 07:52:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44A11C0881
 for <iommu@lists.linux-foundation.org>; Thu, 28 Nov 2019 07:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2E0DB86DDB
 for <iommu@lists.linux-foundation.org>; Thu, 28 Nov 2019 07:51:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fmoSI30CYOK7 for <iommu@lists.linux-foundation.org>;
 Thu, 28 Nov 2019 07:51:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 00A3986864
 for <iommu@lists.linux-foundation.org>; Thu, 28 Nov 2019 07:51:56 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7F47868B05; Thu, 28 Nov 2019 08:51:53 +0100 (CET)
Date: Thu, 28 Nov 2019 08:51:53 +0100
From: "hch@lst.de" <hch@lst.de>
To: Thomas Hellstrom <thellstrom@vmware.com>
Subject: Re: [PATCH 2/2] dma-mapping: force unencryped devices are always
 addressing limited
Message-ID: <20191128075153.GD20659@lst.de>
References: <20191127144006.25998-1-hch@lst.de>
 <20191127144006.25998-3-hch@lst.de>
 <a95d9115fc2a80de2f97f001bbcd9aba6636e685.camel@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a95d9115fc2a80de2f97f001bbcd9aba6636e685.camel@vmware.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: "thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hch@lst.de" <hch@lst.de>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
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

On Wed, Nov 27, 2019 at 06:22:57PM +0000, Thomas Hellstrom wrote:
> >  bool dma_addressing_limited(struct device *dev)
> >  {
> > +	if (force_dma_unencrypted(dev))
> > +		return true;
> >  	return min_not_zero(dma_get_mask(dev), dev->bus_dma_limit) <
> >  			    dma_get_required_mask(dev);
> >  }
> 
> Any chance to have the case
> 
> (swiotlb_force == SWIOTLB_FORCE)
> 
> also included?

We have a hard time handling that in generic code.  Do we have any
good use case for SWIOTLB_FORCE not that we have force_dma_unencrypted?
I'd love to be able to get rid of it..
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
