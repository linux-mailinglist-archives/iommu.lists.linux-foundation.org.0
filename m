Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B6612D11
	for <lists.iommu@lfdr.de>; Fri,  3 May 2019 14:00:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AAFE1394B;
	Fri,  3 May 2019 12:00:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3F61D3940
	for <iommu@lists.linux-foundation.org>;
	Fri,  3 May 2019 11:59:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AAB1F79
	for <iommu@lists.linux-foundation.org>;
	Fri,  3 May 2019 11:59:37 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 0F59368AFE; Fri,  3 May 2019 13:59:19 +0200 (CEST)
Date: Fri, 3 May 2019 13:59:18 +0200
From: Christoph Hellwig <hch@lst.de>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: implement generic dma_map_ops for IOMMUs v4
Message-ID: <20190503115918.GA19657@lst.de>
References: <20190430105214.24628-1-hch@lst.de> <20190502132208.GA3069@lst.de>
	<20190503114731.GH55449@arrakis.emea.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190503114731.GH55449@arrakis.emea.arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Will Deacon <will.deacon@arm.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
	linux-arm-kernel@lists.infradead.org
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

On Fri, May 03, 2019 at 12:47:31PM +0100, Catalin Marinas wrote:
> On Thu, May 02, 2019 at 03:22:08PM +0200, Christoph Hellwig wrote:
> > can you quickly look over the arm64 parts?  I'd really like to still
> > get this series in for this merge window as it would conflict with
> > a lot of dma-mapping work for next merge window, and we also have
> > the amd and possibly intel iommu conversions to use it waiting.
> 
> Done. They look fine to me.

Ok, great.  Although I have to admit I feel about uneasy about
merging them for 5.2 unless Linus ends up doing an rc8.  I plan to
pull the prep_coherent patch into the dma-mapping tree as we'll
need it as a prepation for other things as well, and then we can
just have an immutable tree with the dma-iommu changes, so that
it doesn't block other DMA mapping changes that will touch this
code as well.

> 
> -- 
> Catalin
---end quoted text---
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
