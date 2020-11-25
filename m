Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 400192C447A
	for <lists.iommu@lfdr.de>; Wed, 25 Nov 2020 16:51:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D275F2DE2A;
	Wed, 25 Nov 2020 15:51:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gbepsk7gpzKj; Wed, 25 Nov 2020 15:51:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D82D92E173;
	Wed, 25 Nov 2020 15:51:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD859C0052;
	Wed, 25 Nov 2020 15:51:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E244BC0052
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 15:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C74568769B
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 15:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5lUYWPCTnX66 for <iommu@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 15:51:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8189187698
 for <iommu@lists.linux-foundation.org>; Wed, 25 Nov 2020 15:51:37 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 31D04205CB;
 Wed, 25 Nov 2020 15:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606319496;
 bh=ggNsVrCyQtbsTEL+kuTFOQsecsY7pAs6/oMUkc19NOw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bdHIWtOiue29cx6/dYEAyJcEbWsHshwrdBLRy9aawhXnzNCNcD8jvlPvkki4FeGX7
 JvU3T4C/OwziNdu8rKuz8FBKf9wMjDPN/rrztBnudXHDYwRe8he8GFCehWR0jEmpjF
 f1Mn2J0ZaBinFF6QYQ1rtsoSRqTurXGEZjgc7ki8=
Date: Wed, 25 Nov 2020 15:51:30 +0000
From: Will Deacon <will@kernel.org>
To: Konrad Rzeszutek Wilk <konrad@darnok.org>
Subject: Re: [PATCH 1/1] x86/tboot: Don't disable swiotlb when iommu is
 forced on
Message-ID: <20201125155130.GA16839@willie-the-truck>
References: <20201125014124.4070776-1-baolu.lu@linux.intel.com>
 <160630605367.4096500.10722779964348157570.b4-ty@kernel.org>
 <20201125154153.GA29929@localhost.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201125154153.GA29929@localhost.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ashok Raj <ashok.raj@intel.com>, catalin.marinas@arm.com, x86@kernel.org,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Ning Sun <ning.sun@intel.com>, tboot-devel@lists.sourceforge.net,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Adrian Huang <ahuang12@lenovo.com>, Thomas Gleixner <tglx@linutronix.de>,
 kernel-team@android.com
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

Hi Konrad,

On Wed, Nov 25, 2020 at 10:41:53AM -0500, Konrad Rzeszutek Wilk wrote:
> On Wed, Nov 25, 2020 at 02:05:15PM +0000, Will Deacon wrote:
> > On Wed, 25 Nov 2020 09:41:24 +0800, Lu Baolu wrote:
> > > After commit 327d5b2fee91c ("iommu/vt-d: Allow 32bit devices to uses DMA
> > > domain"), swiotbl could also be used for direct memory access if IOMMU
> > > is enabled but a device is configured to pass through the DMA translation.
> > > Keep swiotlb when IOMMU is forced on, otherwise, some devices won't work
> > > if "iommu=pt" kernel parameter is used.
> > 
> > Applied to arm64 (for-next/iommu/fixes), thanks!
> > 
> > [1/1] x86/tboot: Don't disable swiotlb when iommu is forced on
> >       https://git.kernel.org/arm64/c/e2be2a833ab5
> 
> But tboot never ran on ARM. It is a Intel specifc.
> 
> I think either me or Thomas should take this patch.

FWIW, I did check with Thomas before I picked it up. I know it looks weird
going via arm64, but that's only because I'm temporarily handling the IOMMU
tree there (including vt-d changes) while Joerg is away. Since this fixes a
vt-d regression, I thought I'd pick it up along with the other IOMMU fixes I
have queued for -rc6.

That said, if you insist, then I can revert it. I'm really only trying to
help here.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
