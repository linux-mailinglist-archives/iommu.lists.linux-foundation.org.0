Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E2C349816
	for <lists.iommu@lfdr.de>; Thu, 25 Mar 2021 18:33:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC78D401DA;
	Thu, 25 Mar 2021 17:33:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kns2i7qQ4oat; Thu, 25 Mar 2021 17:33:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 067D9401D4;
	Thu, 25 Mar 2021 17:33:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE763C000A;
	Thu, 25 Mar 2021 17:33:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 80277C000A
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 17:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D8C860B2A
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 17:33:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZZ7zre035-9n for <iommu@lists.linux-foundation.org>;
 Thu, 25 Mar 2021 17:33:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AEAE660B28
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 17:33:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0A18261A28;
 Thu, 25 Mar 2021 17:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616693597;
 bh=qGpX3MaAi6iipXhij0xGuclaojia9d6LXGpZk4lS3FA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OpgdYXmTWs8MRabNzxRiFlKzCDpQS5h96vnrJxN9G4TZvg0WRGitBgXLTk+GnnXil
 f8b5nAYnfp30PmCcOMovoLPgDhNtradrGc8Y6FhFhQ36jubqzqqO6zBwewg68FYuJf
 Jv7k7kjnmjdLlFV3ePCk4UFG8Vd9Clf1rwUIugVfKpJsBtO7/w+BaxYqHIGJ7eDHwI
 mCIthIJWR0FmNz1DYmj+Kqua1EmULEJwj1xk8HRopvlZ1bKjcDSPYNKMZbYPYp8xr5
 TB9H5N62ZZMc3cBLXsUHr1mLRfZ6+pM2RtMNb99RhaB1IXnJpl6MiGYMIdbKb9KY+r
 w0OsMID+O3r1w==
Date: Thu, 25 Mar 2021 17:33:11 +0000
From: Will Deacon <will@kernel.org>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH 2/3] iommu/io-pgtable-arm: Add IOMMU_LLC page protection
 flag
Message-ID: <20210325173311.GA15504@willie-the-truck>
References: <3f589e7de3f9fa93e84c83420c5270c546a0c368.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <20210129090516.GB3998@willie-the-truck>
 <5d23fce629323bcda71594010824aad0@codeaurora.org>
 <20210201111556.GA7172@willie-the-truck>
 <CAF6AEGsARmkAFsjaQLfa2miMgeijo183MWDKGtW_ti-UCpzBqA@mail.gmail.com>
 <20210201182016.GA21629@jcrouse1-lnx.qualcomm.com>
 <7e9aade14d0b7f69285852ade4a5a9f4@codeaurora.org>
 <20210203214612.GB19847@willie-the-truck>
 <4988e2ef35f76a0c2f1fe3f66f023a3b@codeaurora.org>
 <9362873a3bcf37cdd073a6128f29c683@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9362873a3bcf37cdd073a6128f29c683@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, "list@263.net:IOMMU DRIVERS ,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Kristian H Kristensen <hoegsberg@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Tue, Mar 09, 2021 at 12:10:44PM +0530, Sai Prakash Ranjan wrote:
> On 2021-02-05 17:38, Sai Prakash Ranjan wrote:
> > On 2021-02-04 03:16, Will Deacon wrote:
> > > On Tue, Feb 02, 2021 at 11:56:27AM +0530, Sai Prakash Ranjan wrote:
> > > > On 2021-02-01 23:50, Jordan Crouse wrote:
> > > > > On Mon, Feb 01, 2021 at 08:20:44AM -0800, Rob Clark wrote:
> > > > > > On Mon, Feb 1, 2021 at 3:16 AM Will Deacon <will@kernel.org> wrote:
> > > > > > > On Fri, Jan 29, 2021 at 03:12:59PM +0530, Sai Prakash Ranjan wrote:
> > > > > > > > On 2021-01-29 14:35, Will Deacon wrote:
> > > > > > > > > On Mon, Jan 11, 2021 at 07:45:04PM +0530, Sai Prakash Ranjan wrote:
> > > > > > > > > > +#define IOMMU_LLC        (1 << 6)
> > > > > > > > >
> > > > > > > > > On reflection, I'm a bit worried about exposing this because I think it
> > > > > > > > > will
> > > > > > > > > introduce a mismatched virtual alias with the CPU (we don't even have a
> > > > > > > > > MAIR
> > > > > > > > > set up for this memory type). Now, we also have that issue for the PTW,
> > > > > > > > > but
> > > > > > > > > since we always use cache maintenance (i.e. the streaming API) for
> > > > > > > > > publishing the page-tables to a non-coheren walker, it works out.
> > > > > > > > > However,
> > > > > > > > > if somebody expects IOMMU_LLC to be coherent with a DMA API coherent
> > > > > > > > > allocation, then they're potentially in for a nasty surprise due to the
> > > > > > > > > mismatched outer-cacheability attributes.
> > > > > > > > >
> > > > > > > >
> > > > > > > > Can't we add the syscached memory type similar to what is done on android?
> > > > > > >
> > > > > > > Maybe. How does the GPU driver map these things on the CPU side?
> > > > > >
> > > > > > Currently we use writecombine mappings for everything, although there
> > > > > > are some cases that we'd like to use cached (but have not merged
> > > > > > patches that would give userspace a way to flush/invalidate)
> > > > > >
> > > > >
> > > > > LLC/system cache doesn't have a relationship with the CPU cache.  Its
> > > > > just a
> > > > > little accelerator that sits on the connection from the GPU to DDR and
> > > > > caches
> > > > > accesses. The hint that Sai is suggesting is used to mark the buffers as
> > > > > 'no-write-allocate' to prevent GPU write operations from being cached in
> > > > > the LLC
> > > > > which a) isn't interesting and b) takes up cache space for read
> > > > > operations.
> > > > >
> > > > > Its easiest to think of the LLC as a bonus accelerator that has no cost
> > > > > for
> > > > > us to use outside of the unfortunate per buffer hint.
> > > > >
> > > > > We do have to worry about the CPU cache w.r.t I/O coherency (which is a
> > > > > different hint) and in that case we have all of concerns that Will
> > > > > identified.
> > > > >
> > > > 
> > > > For mismatched outer cacheability attributes which Will
> > > > mentioned, I was
> > > > referring to [1] in android kernel.
> > > 
> > > I've lost track of the conversation here :/
> > > 
> > > When the GPU has a buffer mapped with IOMMU_LLC, is the buffer also
> > > mapped
> > > into the CPU and with what attributes? Rob said "writecombine for
> > > everything" -- does that mean ioremap_wc() / MEMREMAP_WC?
> > > 
> > 
> > Rob answered this.
> > 
> > > Finally, we need to be careful when we use the word "hint" as
> > > "allocation
> > > hint" has a specific meaning in the architecture, and if we only
> > > mismatch on
> > > those then we're actually ok. But I think IOMMU_LLC is more than
> > > just a
> > > hint, since it actually drives eviction policy (i.e. it enables
> > > writeback).
> > > 
> > > Sorry for the pedantry, but I just want to make sure we're all talking
> > > about the same things!
> > > 
> > 
> > Sorry for the confusion which probably was caused by my mentioning of
> > android, NWA(no write allocate) is an allocation hint which we can
> > ignore
> > for now as it is not introduced yet in upstream.
> > 
> 
> Any chance of taking this forward? We do not want to miss out on small fps
> gain when the product gets released.

Do we have a solution to the mismatched virtual alias?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
