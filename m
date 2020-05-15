Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE661D5041
	for <lists.iommu@lfdr.de>; Fri, 15 May 2020 16:21:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 535B588021;
	Fri, 15 May 2020 14:21:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FHCRuTeorTcc; Fri, 15 May 2020 14:20:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BAD4B88058;
	Fri, 15 May 2020 14:20:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3CAEC016F;
	Fri, 15 May 2020 14:20:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 80E4CC016F
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 14:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 68FA1899F5
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 14:20:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S1YLf29WUoHi for <iommu@lists.linux-foundation.org>;
 Fri, 15 May 2020 14:20:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B69DC899EB
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 14:20:53 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 792053C3; Fri, 15 May 2020 16:20:49 +0200 (CEST)
Date: Fri, 15 May 2020 16:20:48 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH] iommu: Implement deferred domain attachment
Message-ID: <20200515142047.GX18353@8bytes.org>
References: <20200515094519.20338-1-joro@8bytes.org>
 <8ce93a10-2ce0-e5a0-88a0-5d21d7003c0f@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8ce93a10-2ce0-e5a0-88a0-5d21d7003c0f@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, jroedel@suse.de,
 linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>
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

On Fri, May 15, 2020 at 09:51:03PM +0800, Lu Baolu wrote:
> On 2020/5/15 17:45, Joerg Roedel wrote:
> >   struct iommu_domain *iommu_get_dma_domain(struct device *dev)
> >   {
> > -	return dev->iommu_group->default_domain;
> > +	struct iommu_domain *domain = dev->iommu_group->default_domain;
> > +
> > +	if (__iommu_is_attach_deferred(domain, dev))
> > +		__iommu_attach_device_no_defer(domain, dev);
> 
> It seems that the return value needs to be checked. The default domain
> is invalid if attach() failed.

True, I looked at that, the callers can't handle returning NULL here, so
I kept it this way for now. The outcome is that DMA will fail, but
otherwise we'd see a NULL-ptr dereference really quickly after returning
from that function.

Bottom line: This needs to be cleaned up separatly.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
