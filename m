Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCD42C23E0
	for <lists.iommu@lfdr.de>; Tue, 24 Nov 2020 12:10:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BB08C80CE9;
	Tue, 24 Nov 2020 11:10:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tJQPpMvqqOZB; Tue, 24 Nov 2020 11:10:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 49A06856E9;
	Tue, 24 Nov 2020 11:10:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3CDEAC0052;
	Tue, 24 Nov 2020 11:10:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D25FC0052
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 11:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7202387258
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 11:10:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CEsFporJyC9n for <iommu@lists.linux-foundation.org>;
 Tue, 24 Nov 2020 11:10:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D756187242
 for <iommu@lists.linux-foundation.org>; Tue, 24 Nov 2020 11:10:34 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E99E52073C;
 Tue, 24 Nov 2020 11:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606216234;
 bh=2uK6gknCKN4AYaBsRSYNpCUpw9VdB72lt/njxbxA6GA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W2t4y8oN8c0g38vhBQq66MuAcmgMMFWcHRYuxyuRtuX8qaVsF+C1CKqA9RJfInMj1
 qZff1xDjS64XFMDr0/sXiHg0S+ie8s1dELjmSWS9eDscf4ptO9IGUHDT3JkTNVJlbk
 uKw/lXPS1M5h4yLJHyV+JPEHYysKkMbXjwvEYBvU=
Date: Tue, 24 Nov 2020 11:10:28 +0000
From: Will Deacon <will@kernel.org>
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCHv8 0/8] System Cache support for GPU and required SMMU
 support
Message-ID: <20201124111027.GA13151@willie-the-truck>
References: <cover.1605621785.git.saiprakash.ranjan@codeaurora.org>
 <20201123152146.GE11033@willie-the-truck>
 <50b68f2bdf9413b896fbe816ba4ddbc9@codeaurora.org>
 <CAF6AEGse=WBAC1WbTi6aD5_m1_NBg91f=veYm-7V=Uds7NA0Lw@mail.gmail.com>
 <1c665e33d1d27263fb5056c16d30b827@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1c665e33d1d27263fb5056c16d30b827@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, "list@263.net:IOMMU DRIVERS ,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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

On Tue, Nov 24, 2020 at 09:32:54AM +0530, Sai Prakash Ranjan wrote:
> On 2020-11-24 00:52, Rob Clark wrote:
> > On Mon, Nov 23, 2020 at 9:01 AM Sai Prakash Ranjan
> > <saiprakash.ranjan@codeaurora.org> wrote:
> > > 
> > > On 2020-11-23 20:51, Will Deacon wrote:
> > > > On Tue, Nov 17, 2020 at 08:00:39PM +0530, Sai Prakash Ranjan wrote:
> > > >> Some hardware variants contain a system cache or the last level
> > > >> cache(llc). This cache is typically a large block which is shared
> > > >> by multiple clients on the SOC. GPU uses the system cache to cache
> > > >> both the GPU data buffers(like textures) as well the SMMU pagetables.
> > > >> This helps with improved render performance as well as lower power
> > > >> consumption by reducing the bus traffic to the system memory.
> > > >>
> > > >> The system cache architecture allows the cache to be split into slices
> > > >> which then be used by multiple SOC clients. This patch series is an
> > > >> effort to enable and use two of those slices preallocated for the GPU,
> > > >> one for the GPU data buffers and another for the GPU SMMU hardware
> > > >> pagetables.
> > > >>
> > > >> Patch 1 - Patch 6 adds system cache support in SMMU and GPU driver.
> > > >> Patch 7 and 8 are minor cleanups for arm-smmu impl.
> > > >>
> > > >> Changes in v8:
> > > >>  * Introduce a generic domain attribute for pagetable config (Will)
> > > >>  * Rename quirk to more generic IO_PGTABLE_QUIRK_ARM_OUTER_WBWA (Will)
> > > >>  * Move non-strict mode to use new struct domain_attr_io_pgtbl_config
> > > >> (Will)
> > > >
> > > > Modulo some minor comments I've made, this looks good to me. What is
> > > > the
> > > > plan for merging it? I can take the IOMMU parts, but patches 4-6 touch
> > > > the
> > > > MSM GPU driver and I'd like to avoid conflicts with that.
> > > >
> > > 
> > > SMMU bits are pretty much independent and GPU relies on the domain
> > > attribute
> > > and the quirk exposed, so as long as SMMU changes go in first it
> > > should
> > > be good.
> > > Rob?
> > 
> > I suppose one option would be to split out the patch that adds the
> > attribute into it's own patch, and merge that both thru drm and iommu?
> > 
> 
> Ok I can split out domain attr and quirk into its own patch if Will is
> fine with that approach.

Why don't I just queue the first two patches on their own branch and we
both pull that?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
