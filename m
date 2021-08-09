Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E81293E4833
	for <lists.iommu@lfdr.de>; Mon,  9 Aug 2021 16:57:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B617605D6;
	Mon,  9 Aug 2021 14:57:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 754aEjhojfAO; Mon,  9 Aug 2021 14:57:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B558F6058B;
	Mon,  9 Aug 2021 14:57:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 495A9C001F;
	Mon,  9 Aug 2021 14:57:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F12D5C000E
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 14:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD3376058B
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 14:56:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OGflN-OxaqQH for <iommu@lists.linux-foundation.org>;
 Mon,  9 Aug 2021 14:56:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E163600CC
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 14:56:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 323F660E97;
 Mon,  9 Aug 2021 14:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628521017;
 bh=G323JprWZzOyl+vO9ovexKueJS34erdid0unY4KZmOs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UYrRYUaUhBDq2QIa5NgjJuV38S7Y8s9Rh2CeLKEua2N95BBFmdUQnRYdttvlrSDQl
 7by27EMvn+Af78JXPh2se0/F5KkvX4wRF0nU0QgdVCGm6EAU57k6jNTf4DEAGw08p9
 Y35dtqPgcPScv2V0ZBO2FhT3clbJJamV9JclVpU9fzScUn2J+2OW1ET1l0kwadT/ZZ
 pnBylF29rtzo2KdCJzlm666k24/ezFuyCZRvSUfeUOW5KPQIFXyrm+X/MzMdgnoik9
 uE5Ud3DTK0iQELvZdsJRgTslHOIun2GlLASKiodbYQ+lm1sXG5uA2ZVrSQ+ZOi7Lwu
 dNrmlZX44yeZA==
Date: Mon, 9 Aug 2021 15:56:51 +0100
From: Will Deacon <will@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH 0/3] iommu/drm/msm: Allow non-coherent
 masters to use system cache
Message-ID: <20210809145651.GC1458@willie-the-truck>
References: <cover.1610372717.git.saiprakash.ranjan@codeaurora.org>
 <20210728140052.GB22887@mms-0441>
 <8b2742c8891abe4fec3664730717a089@codeaurora.org>
 <20210802105544.GA27657@willie-the-truck>
 <CAF6AEGvtpFu8st=ZFNoKjP9YsAenciLxL1zMFi_iqMCvdby73w@mail.gmail.com>
 <20210802151409.GE28735@willie-the-truck>
 <CAF6AEGtzvyEUm0Fc8QT5t9KNK7i0FbFyi7zDM2_PMCzZBp7qbw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGtzvyEUm0Fc8QT5t9KNK7i0FbFyi7zDM2_PMCzZBp7qbw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Kristian H Kristensen <hoegsberg@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>
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

On Mon, Aug 02, 2021 at 06:36:04PM -0700, Rob Clark wrote:
> On Mon, Aug 2, 2021 at 8:14 AM Will Deacon <will@kernel.org> wrote:
> >
> > On Mon, Aug 02, 2021 at 08:08:07AM -0700, Rob Clark wrote:
> > > On Mon, Aug 2, 2021 at 3:55 AM Will Deacon <will@kernel.org> wrote:
> > > >
> > > > On Thu, Jul 29, 2021 at 10:08:22AM +0530, Sai Prakash Ranjan wrote:
> > > > > On 2021-07-28 19:30, Georgi Djakov wrote:
> > > > > > On Mon, Jan 11, 2021 at 07:45:02PM +0530, Sai Prakash Ranjan wrote:
> > > > > > > commit ecd7274fb4cd ("iommu: Remove unused IOMMU_SYS_CACHE_ONLY flag")
> > > > > > > removed unused IOMMU_SYS_CACHE_ONLY prot flag and along with it went
> > > > > > > the memory type setting required for the non-coherent masters to use
> > > > > > > system cache. Now that system cache support for GPU is added, we will
> > > > > > > need to set the right PTE attribute for GPU buffers to be sys cached.
> > > > > > > Without this, the system cache lines are not allocated for GPU.
> > > > > > >
> > > > > > > So the patches in this series introduces a new prot flag IOMMU_LLC,
> > > > > > > renames IO_PGTABLE_QUIRK_ARM_OUTER_WBWA to IO_PGTABLE_QUIRK_PTW_LLC
> > > > > > > and makes GPU the user of this protection flag.
> > > > > >
> > > > > > Thank you for the patchset! Are you planning to refresh it, as it does
> > > > > > not apply anymore?
> > > > > >
> > > > >
> > > > > I was waiting on Will's reply [1]. If there are no changes needed, then
> > > > > I can repost the patch.
> > > >
> > > > I still think you need to handle the mismatched alias, no? You're adding
> > > > a new memory type to the SMMU which doesn't exist on the CPU side. That
> > > > can't be right.
> > > >
> > >
> > > Just curious, and maybe this is a dumb question, but what is your
> > > concern about mismatched aliases?  I mean the cache hierarchy on the
> > > GPU device side (anything beyond the LLC) is pretty different and
> > > doesn't really care about the smmu pgtable attributes..
> >
> > If the CPU accesses a shared buffer with different attributes to those which
> > the device is using then you fall into the "mismatched memory attributes"
> > part of the Arm architecture. It's reasonably unforgiving (you should go and
> > read it) and in some cases can apply to speculative accesses as well, but
> > the end result is typically loss of coherency.
> 
> Ok, I might have a few other sections to read first to decipher the
> terminology..
> 
> But my understanding of LLC is that it looks just like system memory
> to the CPU and GPU (I think that would make it "the point of
> coherence" between the GPU and CPU?)  If that is true, shouldn't it be
> invisible from the point of view of different CPU mapping options?

You could certainly build a system where mismatched attributes don't cause
loss of coherence, but as it's not guaranteed by the architecture and the
changes proposed here affect APIs which are exposed across SoCs, then I
don't think it helps much.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
