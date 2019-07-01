Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 987EA100D2
	for <lists.iommu@lfdr.de>; Tue, 30 Apr 2019 22:30:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8B8811DD8;
	Tue, 30 Apr 2019 20:30:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2C5A61CD7
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 20:30:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CC2B75F4
	for <iommu@lists.linux-foundation.org>;
	Tue, 30 Apr 2019 20:30:06 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 9E22067358; Tue, 30 Apr 2019 22:29:47 +0200 (CEST)
Date: Tue, 30 Apr 2019 22:29:47 +0200
From: Christoph Hellwig <hch@lst.de>
To: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH 5/7] MIPS: use the generic uncached segment support in
	dma-direct
Message-ID: <20190430202947.GA30262@lst.de>
References: <20190430110032.25301-1-hch@lst.de>
	<20190430110032.25301-6-hch@lst.de>
	<20190430201041.536amvinrcvd2wua@pburton-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190430201041.536amvinrcvd2wua@pburton-laptop>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Michal Simek <monstr@monstr.eu>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	James Hogan <jhogan@kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	Ralf Baechle <ralf@linux-mips.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
	Ley Foon Tan <lftan@altera.com>, Christoph Hellwig <hch@lst.de>
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

On Tue, Apr 30, 2019 at 08:10:43PM +0000, Paul Burton wrote:
> This series looks like a nice cleanup to me - the one thing that puzzles
> me is the !PageHighMem check above.
> 
> As far as I can see arch_dma_prep_coherent() should never be called with
> a highmem page, so would it make more sense to either drop this check or
> perhaps wrap it in a WARN_ON()?

dma_alloc_from_contigous can return highmem pages depending on where
the CMA area is located.  But given that these pages don't have a
direct kernel mapping we also shouldn't have to flush the caches
for them.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
