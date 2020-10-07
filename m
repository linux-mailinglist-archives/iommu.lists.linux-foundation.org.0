Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2E128584F
	for <lists.iommu@lfdr.de>; Wed,  7 Oct 2020 08:00:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0EE5722D24;
	Wed,  7 Oct 2020 06:00:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id shCSB3qJbRo6; Wed,  7 Oct 2020 06:00:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7791222D0D;
	Wed,  7 Oct 2020 06:00:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3563AC0051;
	Wed,  7 Oct 2020 06:00:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FB68C0051
 for <iommu@lists.linux-foundation.org>; Wed,  7 Oct 2020 06:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 14D4F861F0
 for <iommu@lists.linux-foundation.org>; Wed,  7 Oct 2020 06:00:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WYbzq0b5_Z84 for <iommu@lists.linux-foundation.org>;
 Wed,  7 Oct 2020 06:00:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CFAC1861EE
 for <iommu@lists.linux-foundation.org>; Wed,  7 Oct 2020 06:00:12 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1BC7D68B02; Wed,  7 Oct 2020 08:00:09 +0200 (CEST)
Date: Wed, 7 Oct 2020 08:00:08 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: xen-swiotlb vs phys_to_dma
Message-ID: <20201007060008.GA10125@lst.de>
References: <20201002123436.GA30329@lst.de>
 <alpine.DEB.2.21.2010021313010.10908@sstabellini-ThinkPad-T480s>
 <20201006082656.GB10243@lst.de>
 <alpine.DEB.2.21.2010061325230.10908@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2010061325230.10908@sstabellini-ThinkPad-T480s>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
 Christoph Hellwig <hch@lst.de>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
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

On Tue, Oct 06, 2020 at 01:46:12PM -0700, Stefano Stabellini wrote:
> OK, this makes a lot of sense, and I like the patch because it makes the
> swiotlb interface clearer.
> 
> Just one comment below.
> 

> > +phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
> > +		size_t mapping_size, size_t alloc_size,
> > +		enum dma_data_direction dir, unsigned long attrs)
> >  {
> > +	dma_addr_t tbl_dma_addr = phys_to_dma_unencrypted(dev, io_tlb_start);
> 
> This is supposed to be hwdev, not dev

Yeah, te compiler would be rather unhappy oterwise.

I'll resend it after the dma-mapping and Xen trees are merged by Linus
to avoid a merge conflict.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
