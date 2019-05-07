Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D963A162E6
	for <lists.iommu@lfdr.de>; Tue,  7 May 2019 13:35:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 422C3131C;
	Tue,  7 May 2019 11:34:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CF4E412F3
	for <iommu@lists.linux-foundation.org>;
	Tue,  7 May 2019 11:34:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 748198C3
	for <iommu@lists.linux-foundation.org>;
	Tue,  7 May 2019 09:05:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DE3B374;
	Tue,  7 May 2019 02:05:57 -0700 (PDT)
Received: from fuggles.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
	[10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 868BD3F238;
	Tue,  7 May 2019 02:05:55 -0700 (PDT)
Date: Tue, 7 May 2019 10:05:50 +0100
From: Will Deacon <will.deacon@arm.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 01/25] arm64/iommu: handle non-remapped addresses in
	->mmap and ->get_sgtable
Message-ID: <20190507090550.GA16148@fuggles.cambridge.arm.com>
References: <20190430105214.24628-1-hch@lst.de>
	<20190430105214.24628-2-hch@lst.de>
	<20190503113352.GA55449@arrakis.emea.arm.com>
	<20190507063720.GB28147@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190507063720.GB28147@lst.de>
User-Agent: Mutt/1.11.1+86 (6f28e57d73f2) ()
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

On Tue, May 07, 2019 at 08:37:20AM +0200, Christoph Hellwig wrote:
> On Fri, May 03, 2019 at 12:33:53PM +0100, Catalin Marinas wrote:
> > On Tue, Apr 30, 2019 at 06:51:50AM -0400, Christoph Hellwig wrote:
> > > DMA allocations that can't sleep may return non-remapped addresses, but
> > > we do not properly handle them in the mmap and get_sgtable methods.
> > > Resolve non-vmalloc addresses using virt_to_page to handle this corner
> > > case.
> > > 
> > > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > > Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> > 
> > Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> 
> Given that this is a bug fix mostly separate from the rest of the
> series - do you want to pick it up for 5.2 and maybe add a Cc for
> stable?

Sure thing; I'll probably send it after -rc1 unless we get some other fixes
in during the merge window.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
