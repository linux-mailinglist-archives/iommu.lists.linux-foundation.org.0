Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DED82CC8C7
	for <lists.iommu@lfdr.de>; Sat,  5 Oct 2019 10:28:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C28E17F6;
	Sat,  5 Oct 2019 08:28:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BE4809D
	for <iommu@lists.linux-foundation.org>;
	Sat,  5 Oct 2019 08:27:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 552C98B2
	for <iommu@lists.linux-foundation.org>;
	Sat,  5 Oct 2019 08:27:59 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
	id A75D7227A81; Sat,  5 Oct 2019 10:27:54 +0200 (CEST)
Date: Sat, 5 Oct 2019 10:27:54 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] dma-mapping: Lift address space checks out of debug code
Message-ID: <20191005082754.GB12308@lst.de>
References: <201910021341.7819A660@keescook>
	<7a5dc7aa-66ec-0249-e73f-285b8807cb73@arm.com>
	<201910021643.75E856C@keescook>
	<fc9fffc8-3cff-4a6f-d426-4a4cc895ebb1@arm.com>
	<201910031438.A67C40B97C@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201910031438.A67C40B97C@keescook>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, DOS_RCVD_IP_TWICE_B,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
	iommu@lists.linux-foundation.org,
	Semmle Security Reports <security-reports@semmle.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Jesper Dangaard Brouer <brouer@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, Laura Abbott <labbott@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
	Allison Randal <allison@lohutok.net>
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

On Thu, Oct 03, 2019 at 02:38:43PM -0700, Kees Cook wrote:
> > I think it would be reasonable to pull the is_vmalloc_addr() check inline,
> > as that probably covers 90+% of badness (especially given vmapped stacks),
> > and as you say should be reliably cheap everywhere. Callers are certainly
> > expected to use dma_mapping_error() and handle failure, so refusing to do a
> > bogus mapping operation should be OK API-wise - ultimately if a driver goes
> > ahead and uses DMA_MAPPING_ERROR as an address anyway, that's not likely to
> > be any *more* catastrophic than if it did the same with whatever nonsense
> > virt_to_phys() of a vmalloc address had returned.
> 
> What do you think about the object_is_on_stack() check? That does a
> dereference through "current" to find the stack bounds...

I can be persuaded about just the vmalloc check as people tend to get
a lot of vmalloc alloctions without knowing these days.  But what I'd
really like to see is a new config option that enables relatively
cheap checks without the full dma debugging infrastructure.  That way
you can turn those on at least for all development builds, and can
easily benchmark having the checks vs not.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
