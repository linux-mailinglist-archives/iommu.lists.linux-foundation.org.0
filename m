Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 213CE39FCCD
	for <lists.iommu@lfdr.de>; Tue,  8 Jun 2021 18:49:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83580403ED;
	Tue,  8 Jun 2021 16:49:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rXzfa_79rVbk; Tue,  8 Jun 2021 16:49:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ABCA402C9;
	Tue,  8 Jun 2021 16:49:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F8E8C0011;
	Tue,  8 Jun 2021 16:49:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1C569C0001
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 16:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A16C60671
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 16:48:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rSdstZ6i5BZZ for <iommu@lists.linux-foundation.org>;
 Tue,  8 Jun 2021 16:48:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 385A16064D
 for <iommu@lists.linux-foundation.org>; Tue,  8 Jun 2021 16:48:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3543C6127A;
 Tue,  8 Jun 2021 16:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623170937;
 bh=g1CnEO+bLWj67r3E90OwsKLARWnKaYhTlQdxSZYfl5I=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=EtOn2cixsApaZz38iwirVI0QAvf/um1VFSRwQOMuhnJl05+Qs43ICBvq1bXCwx+Bf
 rpRQpSMVuGmdYqtS1ePKqsb45f8mKLGYJbiCPdYuRdvaqGO3VSySpksUn2/TTj7CMw
 Lw5lls9mclspL0KyBr5VuhUYAzFxPww2uOS5Hb1adRpCFVsT21iR9xRaC+bXUSc8YS
 +y9yMJs4s8Jf2FMZIsgu8+6PvmL+lUgTdTrspsdqIRyyB392JJvGfRcy4W0ZolbjmX
 D3RTt7WKhC4dj/fYdBDXIKjyHweOebAspN+HX4+jLZKIGkIgIIuappcilFwjVtOoxb
 eO8A4mUUuwmqg==
Date: Tue, 8 Jun 2021 17:48:51 +0100
From: Will Deacon <will@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [GIT PULL] memory: Tegra memory controller for v5.14
Message-ID: <20210608164851.GB10994@willie-the-truck>
References: <20210607084910.21024-1-krzysztof.kozlowski@canonical.com>
 <20210608120128.GB10174@willie-the-truck>
 <YL+A+MPjjaa3nSwq@orome.fritz.box>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YL+A+MPjjaa3nSwq@orome.fritz.box>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, soc@kernel.org,
 arm@kernel.org, Nicolin Chen <nicolinc@nvidia.com>,
 iommu@lists.linux-foundation.org, Dmitry Osipenko <digetx@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

On Tue, Jun 08, 2021 at 04:38:48PM +0200, Thierry Reding wrote:
> On Tue, Jun 08, 2021 at 01:01:29PM +0100, Will Deacon wrote:
> > On Mon, Jun 07, 2021 at 10:49:10AM +0200, Krzysztof Kozlowski wrote:
> > > This is the pull for you to base further SMMU aptches (prevent early SMMU
> > > faults).
> > 
> > This is a tonne of code for me to pull into the SMMU tree given that I only
> > want one patch!
> > 
> > Thierry, if I just stick:
> > 
> > https://lore.kernel.org/r/20210603164632.1000458-4-thierry.reding@gmail.com
> > 
> > on its own branch, can you stitch together whatever you need?
> 
> I'm not sure I understand what you're proposing. For reference, here's
> the set of patches that I sent out:
> 
>   1. memory: tegra: Implement SID override programming
>   2. dt-bindings: arm-smmu: Add Tegra186 compatible string
>   3. iommu/arm-smmu: Implement ->probe_finalize()
>   4. iommu/arm-smmu: tegra: Detect number of instances at runtime
>   5. iommu/arm-smmu: tegra: Implement SID override programming
>   6. iommu/arm-smmu: Use Tegra implementation on Tegra186
>   7. arm64: tegra: Use correct compatible string for Tegra186 SMMU
>   8. arm64: tegra: Hook up memory controller to SMMU on Tegra186
>   9. arm64: tegra: Enable SMMU support on Tegra194
> 
> Krzysztof already picked up patch 1 and I was assuming that you'd pick
> up 2-6 because they are to the ARM SMMU driver. However, if you're
> primarily interested in just patch 3, which is more "core" ARM SMMU than
> the rest, which are Tegra-specific, then I suppose what we could do is
> for you to give an Acked-by on the rest (2, 4-6) and then Krzysztof or I
> can pick them up and take them via ARM SoC, based on the stable branch
> from your tree that only has patch 3.

I think you previously said that patch 5 depends on patch 1, so I can't
take 2-6 without also pulling in the memory controller queue.

> Patch 6 touches arm-smmu-impl.c, though it's a two-line change that
> touches only the Tegra-specific matching bit in arm_smmu_impl_init(), so
> the likelihood of that conflicting with anything else is fairly small.
> 
> Is that what you were proposing?

I can queue as much or as little of 2-6 as you like, but I would like to
avoid pulling in the memory controller queue into the arm smmu tree. But
yes, whichever of those I take, I can put them on a separate branch so
that you're not blocked for the later patches.

You have a better handle on the dependencies, so please tell me what works
for you. I just want to make sure that at least patch 3 lands in my tree,
so we don't get late conflicts with other driver changes.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
