Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 46976EB69F
	for <lists.iommu@lfdr.de>; Thu, 31 Oct 2019 19:06:30 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 3220CDDE;
	Thu, 31 Oct 2019 18:06:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 020CDDC5
	for <iommu@lists.linux-foundation.org>;
	Thu, 31 Oct 2019 18:06:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 5D69B87C
	for <iommu@lists.linux-foundation.org>;
	Thu, 31 Oct 2019 18:06:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC1D41FB;
	Thu, 31 Oct 2019 11:06:23 -0700 (PDT)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.197.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
	A95563F6C4; Thu, 31 Oct 2019 11:06:21 -0700 (PDT)
Date: Thu, 31 Oct 2019 18:06:19 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] dma/direct: turn ARCH_ZONE_DMA_BITS into a variable
Message-ID: <20191031180619.GI39590@arrakis.emea.arm.com>
References: <20191031152837.15253-1-nsaenzjulienne@suse.de>
	<20191031154759.GA7162@lst.de>
	<40d06d463c05d36968e8b64924d78f7794f8de50.camel@suse.de>
	<20191031155750.GA7394@lst.de>
	<6726a651c12d91ca22b9d8984745d90db5d507ec.camel@suse.de>
	<20191031165853.GA8532@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191031165853.GA8532@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linuxppc-dev@lists.ozlabs.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
	Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	iommu@lists.linux-foundation.org, Paul Mackerras <paulus@samba.org>,
	linux-arm-kernel@lists.infradead.org,
	Michael Ellerman <mpe@ellerman.id.au>, Will Deacon <will@kernel.org>,
	Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
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

On Thu, Oct 31, 2019 at 05:58:53PM +0100, Christoph Hellwig wrote:
> On Thu, Oct 31, 2019 at 05:22:59PM +0100, Nicolas Saenz Julienne wrote:
> > OK, I see what you mean now. It's wrong indeed.
> > 
> > The trouble is the ZONE_DMA series[1] in arm64, also due for v5.5, will be
> > affected by this patch. I don't know the right way to approach this problem
> > since depending on the merge order, this patch should be updated or the arm64
> > ZONE_DMA series fixed.
> > 
> > Maybe it's easier to just wait for v5.6.
> 
> Ok, I can wait.  Or the arm64 maintainers can pick up this patch if
> you want to add it to that series.

This branch is stable (may add a fix but not I'm not rebasing it) if you
want to base this patch on top:

https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=for-next/zone-dma

Otherwise, with your ack, I can add it on top of the above branch (aimed
at 5.5).

-- 
Catalin
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
