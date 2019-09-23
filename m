Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 06EF4BB7C9
	for <lists.iommu@lfdr.de>; Mon, 23 Sep 2019 17:21:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C255EDB1;
	Mon, 23 Sep 2019 15:21:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9F92CDA2
	for <iommu@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 15:21:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1008A8A0
	for <iommu@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 15:21:21 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8CFCD227A81; Mon, 23 Sep 2019 17:21:17 +0200 (CEST)
Date: Mon, 23 Sep 2019 17:21:17 +0200
From: Christoph Hellwig <hch@lst.de>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [RFC PATCH 1/3] dma-mapping: make overriding GFP_* flags arch
	customizable
Message-ID: <20190923152117.GA2767@lst.de>
References: <20190923123418.22695-1-pasic@linux.ibm.com>
	<20190923123418.22695-2-pasic@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190923123418.22695-2-pasic@linux.ibm.com>
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
	iommu@lists.linux-foundation.org, Christoph Hellwig <hch@lst.de>,
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

On Mon, Sep 23, 2019 at 02:34:16PM +0200, Halil Pasic wrote:
> Before commit 57bf5a8963f8 ("dma-mapping: clear harmful GFP_* flags in
> common code") tweaking the client code supplied GFP_* flags used to be
> an issue handled in the architecture specific code. The commit message
> suggests, that fixing the client code would actually be a better way
> of dealing with this.
> 
> On s390 common I/O devices are generally capable of using the full 64
> bit address space for DMA I/O, but some chunks of the DMA memory need to
> be 31 bit addressable (in physical address space) because the
> instructions involved mandate it. Before switching to DMA API this used
> to be a non-issue, we used to allocate those chunks from ZONE_DMA.
> Currently our only option with the DMA API is to restrict the devices to
> (via dma_mask and dma_mask_coherent) to 31 bit, which is sub-optimal.
> 
> Thus s390 we would benefit form having control over what flags are
> dropped.

No way, sorry.  You need to express that using a dma mask instead of
overloading the GFP flags.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
