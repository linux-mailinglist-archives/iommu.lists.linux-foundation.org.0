Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 591B256FF2
	for <lists.iommu@lfdr.de>; Wed, 26 Jun 2019 19:51:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 221C4DB2;
	Wed, 26 Jun 2019 17:51:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 77338D8B
	for <iommu@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 17:51:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AF01682C
	for <iommu@lists.linux-foundation.org>;
	Wed, 26 Jun 2019 17:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/vs8Egy5g6Si0QhAWTdGb3iiX4UWuX/9RaMs8MRYrk0=;
	b=ObuCZMnJZL8XNKfEkGcnHvqPQ
	0snBZEHMJeZIlgKormOrFx9XKNZKn33QySiOBBapISItR0gi6ysSoc9ZVrAvT5JH0ueHZqZMyuA+y
	izLVmercQAhaMcp4j3x985xKi65IjQaHbwJJMqkkU7xHeSx/4nYn3SbcYtle1VLXXJCgG+2cKeyhv
	YSqVHhTYdnvfShOwnTEnhzxv9QE0MO/ANXi1ljUb8edvZeH4nyR99EXN+gpeUJcDAg/hhxRxKWQhg
	tGB7O37l3u0XPhaTtCwYKe1W3Z2e3ktVUq+DPh5eltEiqNFJ1ofEPqZPq1qHKtMXUva310T8yKBvq
	edAHdacLA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
	Linux)) id 1hgC4x-0004yn-Oh; Wed, 26 Jun 2019 17:51:31 +0000
Date: Wed, 26 Jun 2019 10:51:31 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Pankaj Suryawanshi <pankajssuryawanshi@gmail.com>
Subject: Re: DMA-API attr - DMA_ATTR_NO_KERNEL_MAPPING
Message-ID: <20190626175131.GA17250@infradead.org>
References: <CACDBo564RoWpi8y2pOxoddnn0s3f3sA-fmNxpiXuxebV5TFBJA@mail.gmail.com>
	<CACDBo55GfomD4yAJ1qaOvdm8EQaD-28=etsRHb39goh+5VAeqw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACDBo55GfomD4yAJ1qaOvdm8EQaD-28=etsRHb39goh+5VAeqw@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-mm@kvack.org, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
	Michal Hocko <mhocko@kernel.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Wed, Jun 26, 2019 at 10:12:45PM +0530, Pankaj Suryawanshi wrote:
> [CC: linux kernel and Vlastimil Babka]

The right list is the list for the DMA mapping subsystem, which is
iommu@lists.linux-foundation.org.  I've also added that.

> > I am writing driver in which I used DMA_ATTR_NO_KERNEL_MAPPING attribute
> > for cma allocation using dma_alloc_attr(), as per kernel docs
> > https://www.kernel.org/doc/Documentation/DMA-attributes.txt  buffers
> > allocated with this attribute can be only passed to user space by calling
> > dma_mmap_attrs().
> >
> > how can I mapped in kernel space (after dma_alloc_attr with
> > DMA_ATTR_NO_KERNEL_MAPPING ) ?

You can't.  And that is the whole point of that API.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
