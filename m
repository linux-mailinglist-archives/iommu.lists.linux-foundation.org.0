Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B434CB443
	for <lists.iommu@lfdr.de>; Thu,  3 Mar 2022 02:25:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74084813F6;
	Thu,  3 Mar 2022 01:25:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xKCktJIB0aPT; Thu,  3 Mar 2022 01:25:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 90C0A813F3;
	Thu,  3 Mar 2022 01:25:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6125FC0085;
	Thu,  3 Mar 2022 01:25:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 75200C000B
 for <iommu@lists.linux-foundation.org>; Thu,  3 Mar 2022 01:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E7FB40156
 for <iommu@lists.linux-foundation.org>; Thu,  3 Mar 2022 01:25:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jIW-3OdKle1Z for <iommu@lists.linux-foundation.org>;
 Thu,  3 Mar 2022 01:25:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 364CF400FE
 for <iommu@lists.linux-foundation.org>; Thu,  3 Mar 2022 01:25:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7F309B82358;
 Thu,  3 Mar 2022 01:25:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2074AC340F2;
 Thu,  3 Mar 2022 01:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646270712;
 bh=OIWkR7Zp9BS5KcWgPGvH+7lGxsauASKPDzT5dWHRzcg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=fyTcnY079RGVSWj1/bqnWf9UBPrXZmiZ32cJHGCuHKFrvhhlGSoeO8XnjyAULGbxy
 xuEeYIRqhVQfty7l070VwdiiUBm+vhQMOyp1/UPCRCwJW1H8chwVFdTWSqF8JxQ7i6
 pmngu4i/qw99iSRs7nF8V/KUQPfZMnX0OhdBfoyB3K0uXmVGkSCue1VhFC37hRyoHl
 lqT9JrJPLf0sbQoGpagSmC+bBJdDfAOOQZXY1qQ2kFojarLkPJJigndyp3UGVx/CEp
 1XnqlJ8dDyOAxVpGwUR+l8DwgqcaHVrJmCy/f+O96VijhpAG5o/2FbsTqBKQIZTLrT
 qEo+TADXZ7B8A==
Date: Wed, 2 Mar 2022 17:25:10 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 11/12] swiotlb: merge swiotlb-xen initialization into
 swiotlb
In-Reply-To: <20220302081500.GB23075@lst.de>
Message-ID: <alpine.DEB.2.22.394.2203021709470.3261@ubuntu-linux-20-04-desktop>
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-12-hch@lst.de>
 <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop>
 <20220302081500.GB23075@lst.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 tboot-devel@lists.sourceforge.net, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw2@infradead.org>, Tom Lendacky <thomas.lendacky@amd.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
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

On Wed, 2 Mar 2022, Christoph Hellwig wrote:
> On Tue, Mar 01, 2022 at 06:55:47PM -0800, Stefano Stabellini wrote:
> > Unrelated to this specific patch series: now that I think about it, if
> > io_tlb_default_mem.nslabs is already allocated by the time xen_mm_init
> > is called, wouldn't we potentially have an issue with the GFP flags used
> > for the earlier allocation (e.g. GFP_DMA32 not used)? Maybe something
> > for another day.
> 
> swiotlb_init allocates low memory from meblock, which is roughly
> equivalent to GFP_DMA allocations, so we'll be fine.
> 
> > > @@ -143,10 +141,15 @@ static int __init xen_mm_init(void)
> > >  	if (!xen_swiotlb_detect())
> > >  		return 0;
> > >  
> > > -	rc = xen_swiotlb_init();
> > >  	/* we can work with the default swiotlb */
> > > -	if (rc < 0 && rc != -EEXIST)
> > > -		return rc;
> > > +	if (!io_tlb_default_mem.nslabs) {
> > > +		if (!xen_initial_domain())
> > > +			return -EINVAL;
> > 
> > I don't think we need this xen_initial_domain() check. It is all
> > already sorted out by the xen_swiotlb_detect() check above.
> 
> Is it?
> 
> static inline int xen_swiotlb_detect(void)
> {
> 	if (!xen_domain())
> 		return 0;
> 	if (xen_feature(XENFEAT_direct_mapped))
> 		return 1;
> 	/* legacy case */
> 	if (!xen_feature(XENFEAT_not_direct_mapped) && xen_initial_domain())
> 		return 1;
> 	return 0;
> }

It used to be that we had a

  if (!xen_initial_domain())
      return -EINVAL;

check in the initialization of swiotlb-xen on ARM. Then we replaced it
with the more sophisticated xen_swiotlb_detect().

The reason is that swiotlb-xen on ARM relies on Dom0 being 1:1 mapped
(guest physical addresses == physical addresses). Recent changes in Xen
allowed also DomUs to be 1:1 mapped. Changes still under discussion will
allow Dom0 not to be 1:1 mapped.

So, before all the Xen-side changes, knowing what was going to happen, I
introduced a clearer interface: XENFEAT_direct_mapped and
XENFEAT_not_direct_mapped tell us whether the guest (Linux) is 1:1
mapped or not. If it is 1:1 mapped then Linux can take advantage of
swiotlb-xen. Now xen_swiotlb_detect() returns true if Linux is 1:1
mapped.

Then of course there is the legacy case. That's taken care of by:

 	if (!xen_feature(XENFEAT_not_direct_mapped) && xen_initial_domain())
 		return 1;

The intention is to say that if
XENFEAT_direct_mapped/XENFEAT_not_direct_mapped are not present, then
use xen_initial_domain() like we did before.

So if xen_swiotlb_detect() returns true we know that Linux is either
dom0 (xen_initial_domain() == true) or we have very good reasons to
think we should initialize swiotlb-xen anyway
(xen_feature(XENFEAT_direct_mapped) == true).


> I think I'd keep it as-is for now, as my planned next step would be to
> fold xen-swiotlb into swiotlb entirely.

Thinking more about it we actually need to drop the xen_initial_domain()
check otherwise some cases won't be functional (Dom0 not 1:1 mapped, or
DomU 1:1 mapped).
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
