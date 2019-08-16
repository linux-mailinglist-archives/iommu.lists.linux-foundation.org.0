Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C1C90AD4
	for <lists.iommu@lfdr.de>; Sat, 17 Aug 2019 00:20:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 170CEC03;
	Fri, 16 Aug 2019 22:20:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D6897AE7
	for <iommu@lists.linux-foundation.org>;
	Fri, 16 Aug 2019 22:20:18 +0000 (UTC)
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id ED07B87E
	for <iommu@lists.linux-foundation.org>;
	Fri, 16 Aug 2019 22:20:16 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id C05E761C74; Fri, 16 Aug 2019 22:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1565994016;
	bh=n8EyLk80l4W+PQGIi1Q/9kn0a7jx+4AwnWTuTaAVMK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OqOHD6IawiYgFfBwa6LMZD1Y0zy7RvcaIE13nvtMkx/UNLt0Az9aH3MNzq1Ffvozm
	YhbXGpxwgn55YRtKgteXAfkGISTyACODYplL0Objkcvp7WFz4Xq0+CCdObx9sBNKId
	kJTCzlhORJeOxe2dRr9yuCjq+HEKB/5DXWLMf9yE=
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
	[199.106.103.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: jcrouse@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 1E74E61C57;
	Fri, 16 Aug 2019 22:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1565994015;
	bh=n8EyLk80l4W+PQGIi1Q/9kn0a7jx+4AwnWTuTaAVMK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nQyICEvuEqN+v08C3V39NgQwlicZp33j+tvVaED8dFJW1jYBvHL9IdSAJdzjAFKUD
	guqAP5T2rlcrk6uDtYpnrlNtY3watC+Aglbz61l/qEiHa4dI3w2lAEaYAu/w3vhgDf
	ikp5fuUuQheXDde4YgaGgpAWKrzmMw77H5zP3pkI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1E74E61C57
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Fri, 16 Aug 2019 16:20:01 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [Freedreno] [PATCH v3 0/2] iommu/arm-smmu: Split pagetable support
Message-ID: <20190816222000.GF28465@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Robin Murphy <robin.murphy@arm.com>,
	Rob Clark <robdclark@gmail.com>,
	freedreno <freedreno@lists.freedesktop.org>,
	Rob Herring <robh@kernel.org>, Will Deacon <will@kernel.org>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	Zhen Lei <thunder.leizhen@huawei.com>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>
References: <1565216500-28506-1-git-send-email-jcrouse@codeaurora.org>
	<20190815153304.GD28465@jcrouse1-lnx.qualcomm.com>
	<ac248f33-2528-c1d4-17ed-17e92e6ed5ad@arm.com>
	<CAF6AEGujjF+MQFw45g799i+2QE4X=eRZdDSsD_F3y3mfbc6UPw@mail.gmail.com>
	<3ea2755f-6d4d-736d-bebd-455a7967e381@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ea2755f-6d4d-736d-bebd-455a7967e381@arm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Rob Herring <robh@kernel.org>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Will Deacon <will@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	freedreno <freedreno@lists.freedesktop.org>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
	<linux-arm-kernel@lists.infradead.org>
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

On Fri, Aug 16, 2019 at 08:43:53PM +0100, Robin Murphy wrote:
> On 16/08/2019 19:12, Rob Clark wrote:
> >On Fri, Aug 16, 2019 at 9:58 AM Robin Murphy <robin.murphy@arm.com> wrote:
> >>
> >>Hi Jordan,
> >>
> >>On 15/08/2019 16:33, Jordan Crouse wrote:
> >>>On Wed, Aug 07, 2019 at 04:21:38PM -0600, Jordan Crouse wrote:
> >>>>(Sigh, resend. I freaked out my SMTP server)
> >>>>
> >>>>This is part of an ongoing evolution for enabling split pagetable support for
> >>>>arm-smmu. Previous versions can be found [1].
> >>>>
> >>>>In the discussion for v2 Robin pointed out that this is a very Adreno specific
> >>>>use case and that is exactly true. Not only do we want to configure and use a
> >>>>pagetable in the TTBR1 space, we also want to configure the TTBR0 region but
> >>>>not allocate a pagetable for it or touch it until the GPU hardware does so. As
> >>>>much as I want it to be a generic concept it really isn't.
> >>>>
> >>>>This revision leans into that idea. Most of the same io-pgtable code is there
> >>>>but now it is wrapped as an Adreno GPU specific format that is selected by the
> >>>>compatible string in the arm-smmu device.
> >>>>
> >>>>Additionally, per Robin's suggestion we are skipping creating a TTBR0 pagetable
> >>>>to save on wasted memory.
> >>>>
> >>>>This isn't as clean as I would like it to be but I think that this is a better
> >>>>direction than trying to pretend that the generic format would work.
> >>>>
> >>>>I'm tempting fate by posting this and then taking some time off, but I wanted
> >>>>to try to kick off a conversation or at least get some flames so I can try to
> >>>>refine this again next week. Please take a look and give some advice on the
> >>>>direction.
> >>>
> >>>Will, Robin -
> >>>
> >>>Modulo the impl changes from Robin, do you think that using a dedicated
> >>>pagetable format is the right approach for supporting split pagetables for the
> >>>Adreno GPU?
> >>
> >>How many different Adreno drivers would benefit from sharing it?
> >
> >Hypothetically everything back to a3xx, so I *could* see usefulness of
> >this in qcom_iommu (or maybe even msm-iommu).  OTOH maybe with
> >"modularizing" arm-smmu we could re-combine qcom_iommu and arm-smmu.
> 
> Indeed, that's certainly something I'm planning to investigate as a future
> refactoring step.
> 
> >And as a practical matter, I'm not sure if anyone will get around to
> >backporting per-context pagetables as far back as a3xx.
> >
> >BR,
> >-R
> >
> >>The more I come back to this, the more I'm convinced that io-pgtable
> >>should focus on the heavy lifting of pagetable management - the code
> >>that nobody wants to have to write at all, let alone more than once -
> >>and any subtleties which aren't essential to that should be pushed back
> >>into whichever callers actually care. Consider that already, literally
> >>no caller actually uses an unmodified stage 1 TCR value as provided in
> >>the io_pgtable_cfg.
> >>
> >>I feel it would be most productive to elaborate further in the form of
> >>patches, so let me get right on that and try to bash something out
> >>before I go home tonight...
> 
> ...and now there's a rough WIP branch here:
> 
> http://linux-arm.org/git?p=linux-rm.git;a=shortlog;h=refs/heads/iommu/pgtable
> 
> I'll finish testing and polishing those patches at some point next week,
> probably, but hopefully they're sufficiently illustrative for the moment.

This looks great so far. I can see where the TTBR1 stuff would fit in and I like
it a lot. I'll try to have some patches ready when you are done polishing.

Jordan

> Robin.

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
