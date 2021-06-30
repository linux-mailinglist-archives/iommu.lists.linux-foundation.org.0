Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D11003B7DD3
	for <lists.iommu@lfdr.de>; Wed, 30 Jun 2021 09:06:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4049640178;
	Wed, 30 Jun 2021 07:06:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HNrYJ31rvT5X; Wed, 30 Jun 2021 07:06:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 64B7C40004;
	Wed, 30 Jun 2021 07:06:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 434A5C000E;
	Wed, 30 Jun 2021 07:06:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1C3BFC000E
 for <iommu@lists.linux-foundation.org>; Wed, 30 Jun 2021 07:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09CB040635
 for <iommu@lists.linux-foundation.org>; Wed, 30 Jun 2021 07:06:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id siKfya_DRPoJ for <iommu@lists.linux-foundation.org>;
 Wed, 30 Jun 2021 07:06:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58D2F40632
 for <iommu@lists.linux-foundation.org>; Wed, 30 Jun 2021 07:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=dsmF65Hp+Uqc28Sl8LwGXWskjtwe7+DI92hwHXbQkFA=; b=GIxFrLBhO6vSrFlIovAS3oKhAk
 2Lz/EWmV4MXClGxqw8kfRDKlmi2GtdV0uLz8GInzsTYbp/j6OaWyhAKVo1eo4a9b8H2/k56EKbDvV
 y2GtJ+TR5lnwszsDINs9HafiqdqlixqmpVUDT5RFgxU2QLLv+/cho+grL+1Vc0g8+2/SlnePBKOG7
 OLho8hViHIYAx4TUPolbnmtBlBALFzfpGJ4VyBleE5rlmpssM7wYM8+dhx4YMPSsVXI8Z8G2kF82i
 JQuions/tMg957LyjA2UxTSvzyqVxDMuHCys225WIfNum1nPw/BR1E6gHvktOeYDO7jdCSD6Jd991
 piooUF5A==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1lyUI0-0051Ka-BD; Wed, 30 Jun 2021 07:05:46 +0000
Date: Wed, 30 Jun 2021 08:05:40 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC] /dev/ioasid uAPI proposal
Message-ID: <YNwXxAEIRz5t631E@infradead.org>
References: <20210602173510.GE1002214@nvidia.com>
 <20210602120111.5e5bcf93.alex.williamson@redhat.com>
 <20210602180925.GH1002214@nvidia.com>
 <20210602130053.615db578.alex.williamson@redhat.com>
 <20210602195404.GI1002214@nvidia.com>
 <20210602143734.72fb4fa4.alex.williamson@redhat.com>
 <6a9426d7-ed55-e006-9c4c-6b7c78142e39@redhat.com>
 <20210603130927.GZ1002214@nvidia.com>
 <65614634-1db4-7119-1a90-64ba5c6e9042@redhat.com>
 <20210604115805.GG1002214@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210604115805.GG1002214@nvidia.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Jiang, Dave" <dave.jiang@intel.com>, "Raj,
 Ashok" <ashok.raj@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Robin Murphy <robin.murphy@arm.com>,
 Jason Wang <jasowang@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>,
 David Gibson <david@gibson.dropbear.id.au>
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

On Fri, Jun 04, 2021 at 08:58:05AM -0300, Jason Gunthorpe wrote:
> On Fri, Jun 04, 2021 at 09:11:03AM +0800, Jason Wang wrote:
> > > nor do any virtio drivers implement the required platform specific
> > > cache flushing to make no-snoop TLPs work.
> > 
> > I don't get why virtio drivers needs to do that. I think DMA API should hide
> > those arch/platform specific stuffs from us.
> 
> It is not arch/platform stuff. If the device uses no-snoop then a
> very platform specific recovery is required in the device driver.

Well, the proper way to support NO_SNOOP DMA would be to force the
DMA API into supporting the device as if the platform was not DMA
coherent, probably on a per-call basis.  It is just that no one bothered
to actually do the work an people just kept piling hacks over hacks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
