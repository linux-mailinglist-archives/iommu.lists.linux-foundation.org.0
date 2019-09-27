Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 30827C0D2C
	for <lists.iommu@lfdr.de>; Fri, 27 Sep 2019 23:21:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 28E541115;
	Fri, 27 Sep 2019 21:21:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 35622110D
	for <iommu@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 21:21:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B320A87D
	for <iommu@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 21:21:08 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 569A468B05; Fri, 27 Sep 2019 23:21:04 +0200 (CEST)
Date: Fri, 27 Sep 2019 23:21:04 +0200
From: Christoph Hellwig <hch@lst.de>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [RFC PATCH 1/3] dma-mapping: make overriding GFP_* flags arch
	customizable
Message-ID: <20190927212104.GC16819@lst.de>
References: <20190923123418.22695-1-pasic@linux.ibm.com>
	<20190923123418.22695-2-pasic@linux.ibm.com>
	<20190923152117.GA2767@lst.de>
	<20190926143745.68bdd082.pasic@linux.ibm.com>
	<6c62da57-c94c-8078-957c-b6832ed7fd1b@arm.com>
	<20190927023314.3e5c8324.pasic@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190927023314.3e5c8324.pasic@linux.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-s390@vger.kernel.org, Janosch Frank <frankja@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	Peter Oberparleiter <oberpar@linux.ibm.com>, linux-kernel@vger.kernel.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
	Christoph Hellwig <hch@lst.de>,
	Gerald Schaefer <gerald.schaefer@de.ibm.com>
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

On Fri, Sep 27, 2019 at 02:33:14AM +0200, Halil Pasic wrote:
> Thank you for your feedback. Just to be sure we are on the same pager, I
> read commit a0be1db4304f like this:
> 1) virtio_pci_legacy needs to allocate the virtqueues so that the base
> address fits 44 bits
> 2) if 64 bit dma is possible they set coherent_dma_mask to
>   DMA_BIT_MASK(44) and dma_mask to DMA_BIT_MASK(64)
> 3) since the queues get allocated with coherent allocations 1) is
> satisfied
> 4) when the streaming mappings see a buffer that is beyond
>   DMA_BIT_MASK(44) then it has to treat it as not coherent memory
>   and do the syncing magic (which isn't actually required, just
>   a side effect of the workaround.

1-3 is correct, 4 is not.  The coherent mask is a little misnamed and
doesn't have to anything with coherency.  It is the mask for DMA
allocations, while the dma mask is for streaming mappings.

> I've already implemented a patch (see after the scissors line) that
> takes a similar route as commit a0be1db4304f, but I consider that a
> workaround at best. But if that is what the community wants... I have to
> get the job done one way or the other.

That patch (minus the comments about being a workaround) is what you
should have done from the beginning.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
