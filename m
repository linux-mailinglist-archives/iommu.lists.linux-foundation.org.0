Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1B11A25BA
	for <lists.iommu@lfdr.de>; Wed,  8 Apr 2020 17:42:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2035B85E98;
	Wed,  8 Apr 2020 15:42:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q_0KlVaRL9vd; Wed,  8 Apr 2020 15:42:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BDE4485E51;
	Wed,  8 Apr 2020 15:42:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A71D1C1D89;
	Wed,  8 Apr 2020 15:42:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37BFAC0177
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 15:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 27B1C8821F
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 15:42:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rNX5MPHmGeCT for <iommu@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 15:42:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0CC3586D41
 for <iommu@lists.linux-foundation.org>; Wed,  8 Apr 2020 15:42:29 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 313AE68C4E; Wed,  8 Apr 2020 17:42:26 +0200 (CEST)
Date: Wed, 8 Apr 2020 17:42:25 +0200
From: Christoph Hellwig <hch@lst.de>
To: Hillf Danton <hdanton@sina.com>
Subject: Re: [PATCH 04/28] dma-mapping: use vmap insted of reimplementing it
Message-ID: <20200408154225.GA28676@lst.de>
References: <20200408115926.1467567-1-hch@lst.de>
 <20200408131736.9532-1-hdanton@sina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408131736.9532-1-hdanton@sina.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
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

On Wed, Apr 08, 2020 at 09:17:36PM +0800, Hillf Danton wrote:
> > @@ -62,24 +42,20 @@ void *dma_common_pages_remap(struct page **pages, size_t size,
> >  void *dma_common_contiguous_remap(struct page *page, size_t size,
> >  			pgprot_t prot, const void *caller)
> >  {
> > -	int i;
> > +	int count = size >> PAGE_SHIFT;
> >  	struct page **pages;
> > -	struct vm_struct *area;
> > +	void *vaddr;
> > +	int i;
> >  
> > -	pages = kmalloc(sizeof(struct page *) << get_order(size), GFP_KERNEL);
> > +	pages = kmalloc_array(count, sizeof(struct page *), GFP_KERNEL);
> 
> Is it making sense to vmalloc pages as long as array size is bigger than
> PAGE_SIZE?

Maybe, maybe not.  But it certainly doesn't fit this series.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
