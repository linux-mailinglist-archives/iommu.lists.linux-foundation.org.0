Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCDDB6D2C
	for <lists.iommu@lfdr.de>; Wed, 18 Sep 2019 22:01:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A663BDD4;
	Wed, 18 Sep 2019 20:01:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 33CFDD97
	for <iommu@lists.linux-foundation.org>;
	Wed, 18 Sep 2019 20:01:12 +0000 (UTC)
X-Greylist: delayed 00:12:30 by SQLgrey-1.7.6
Received: from cvs.linux-mips.org (eddie.linux-mips.org [148.251.95.138])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 5D7E5711
	for <iommu@lists.linux-foundation.org>;
	Wed, 18 Sep 2019 20:01:11 +0000 (UTC)
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
	with ESMTP id S23994204AbfIRTuBXltuQ (ORCPT
	<rfc822;iommu@lists.linux-foundation.org>);
	Wed, 18 Sep 2019 21:50:01 +0200
Date: Wed, 18 Sep 2019 20:50:01 +0100 (BST)
From: "Maciej W. Rozycki" <macro@linux-mips.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 2/2] MIPS: remove support for DMA_ATTR_WRITE_COMBINE
In-Reply-To: <20190807061602.31217-3-hch@lst.de>
Message-ID: <alpine.LFD.2.21.1909182001260.31718@eddie.linux-mips.org>
References: <20190807061602.31217-1-hch@lst.de>
	<20190807061602.31217-3-hch@lst.de>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	UNPARSEABLE_RELAY autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Shawn Anastasio <shawn@anastas.io>, Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>, linux-mips@vger.kernel.org,
	iommu@lists.linux-foundation.org, Paul Burton <paul.burton@mips.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	James Hogan <jhogan@kernel.org>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
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

On Wed, 7 Aug 2019, Christoph Hellwig wrote:

> Mips uses the KSEG1 kernel memory segment to map dma coherent
> allocations for non-coherent devices as uncacheable, and does not have
> any kind of special support for DMA_ATTR_WRITE_COMBINE in the allocation
> path.  Thus supporting DMA_ATTR_WRITE_COMBINE in dma_mmap_attrs will
> lead to multiple mappings with different caching attributes.

 FYI, AFAIK _CACHE_UNCACHED_ACCELERATED (where supported) is effectively 
write-combine.  Though IIUC someone would have to wire it in first.

  Maciej
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
