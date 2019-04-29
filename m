Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF7AE18A
	for <lists.iommu@lfdr.de>; Mon, 29 Apr 2019 13:46:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 449601F59;
	Mon, 29 Apr 2019 11:46:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 886B41F3F
	for <iommu@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 11:44:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id ECAC5711
	for <iommu@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 11:44:18 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 405C268AFE; Mon, 29 Apr 2019 13:44:01 +0200 (CEST)
Date: Mon, 29 Apr 2019 13:44:01 +0200
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v3 02/10] swiotlb: Factor out slot allocation and free
Message-ID: <20190429114401.GA30333@lst.de>
References: <20190421011719.14909-3-baolu.lu@linux.intel.com>
	<20190422164555.GA31181@lst.de>
	<0c6e5983-312b-0d6b-92f5-64861cd6804d@linux.intel.com>
	<20190423061232.GB12762@lst.de>
	<dff50b2c-5e31-8b4a-7fdf-99d17852746b@linux.intel.com>
	<20190424144532.GA21480@lst.de>
	<a189444b-15c9-8069-901d-8cdf9af7fc3c@linux.intel.com>
	<20190426150433.GA19930@lst.de>
	<93b3d627-782d-cae0-2175-77a5a8b3fe6e@linux.intel.com>
	<90182d27-5764-7676-8ca6-b2773a40cfe1@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <90182d27-5764-7676-8ca6-b2773a40cfe1@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, mika.westerberg@linux.intel.com, ashok.raj@intel.com,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	alan.cox@intel.com, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, pengfei.xu@intel.com,
	jacob.jun.pan@intel.com, David Woodhouse <dwmw2@infradead.org>,
	Christoph Hellwig <hch@lst.de>
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

On Mon, Apr 29, 2019 at 12:06:52PM +0100, Robin Murphy wrote:
>
> From the reply up-thread I guess you're trying to include an optimisation 
> to only copy the head and tail of the buffer if it spans multiple pages, 
> and directly map the ones in the middle, but AFAICS that's going to tie you 
> to also using strict mode for TLB maintenance, which may not be a win 
> overall depending on the balance between invalidation bandwidth vs. memcpy 
> bandwidth. At least if we use standard SWIOTLB logic to always copy the 
> whole thing, we should be able to release the bounce pages via the flush 
> queue to allow 'safe' lazy unmaps.

Oh.  The head and tail optimization is what I missed.  Yes, for that
we'd need the offset.

> Either way I think it would be worth just implementing the straightforward 
> version first, then coming back to consider optimisations later.

Agreed, let's start simple.  Especially as large DMA mappings or
allocations should usually be properly aligned anyway, and if not we
should fix that for multiple reasons.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
