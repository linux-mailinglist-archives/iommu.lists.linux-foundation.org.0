Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id C514C398878
	for <lists.iommu@lfdr.de>; Wed,  2 Jun 2021 13:41:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3330D402B9;
	Wed,  2 Jun 2021 11:41:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MJGRkuZDmEvZ; Wed,  2 Jun 2021 11:41:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2B6040260;
	Wed,  2 Jun 2021 11:41:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 834DAC0024;
	Wed,  2 Jun 2021 11:41:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59F60C0001
 for <iommu@lists.linux-foundation.org>; Wed,  2 Jun 2021 11:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3342D4022B
 for <iommu@lists.linux-foundation.org>; Wed,  2 Jun 2021 11:40:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7sb-mRUt2UnS for <iommu@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 11:40:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5CD3840146
 for <iommu@lists.linux-foundation.org>; Wed,  2 Jun 2021 11:40:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 47D4A61263;
 Wed,  2 Jun 2021 11:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622634054;
 bh=luXM2XCsQ4rkn0y3NiEdRQC6jdfN5IXOZ+jOaRPnlFg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ct7+og3+3E6SYutIXD/pNpjWtrnPmCFf8BaKm/iHB99vZY+0Ci4+qN5bI3F7svYLm
 Q0et+Mu62jNHaTAsN45RqAtfGxxwbk6vKdVTpWuSYD5jEVcNGW3tXk1Apu0zZ8hmsN
 89cyl3YL4CM/jpq0K8oXoVic8apkf2Epv0HLW8qYci6D8W3kVvoHsMNCz+jCsRX8ca
 B6ZO004XfWD0QH1DMsepoX4luYk53YrJ2bvnUdZ7QstpSdxxAkUZSU1XCTRg4TN3gR
 3rQXU8cEYe7v4/vVoMEmH+HSHfbBXvWyH4jXWLXB/c2FuH735NklGthDsVBjWDu0gR
 s3/dn/jyVRTWA==
Date: Wed, 2 Jun 2021 12:40:49 +0100
From: Will Deacon <will@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v2 00/10] arm64: tegra: Prevent early SMMU faults
Message-ID: <20210602114049.GF30593@willie-the-truck>
References: <20210420172619.3782831-1-thierry.reding@gmail.com>
 <YLEi2FonP568wYrE@orome.fritz.box>
 <20210601122646.GB27832@willie-the-truck>
 <YLZ3qPC8ofjsGkPi@orome.fritz.box>
 <6826d892-d1ac-e3b1-ebee-68392d11d7c5@canonical.com>
 <8c70f82f-0db9-2312-7fc4-c079899c25a0@canonical.com>
 <YLdGwD0dxfER4USn@orome.fritz.box>
 <e2341ca1-7b6d-cc19-8c43-1ada0b1f5601@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e2341ca1-7b6d-cc19-8c43-1ada0b1f5601@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, Jon Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Nicolin Chen <nicolinc@nvidia.com>,
 linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
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

On Wed, Jun 02, 2021 at 12:44:58PM +0200, Krzysztof Kozlowski wrote:
> On 02/06/2021 10:52, Thierry Reding wrote:
> > On Wed, Jun 02, 2021 at 09:35:13AM +0200, Krzysztof Kozlowski wrote:
> >> On 02/06/2021 09:33, Krzysztof Kozlowski wrote:
> >>> On 01/06/2021 20:08, Thierry Reding wrote:
> >>>> On Tue, Jun 01, 2021 at 01:26:46PM +0100, Will Deacon wrote:
> >>>>> On Fri, May 28, 2021 at 07:05:28PM +0200, Thierry Reding wrote:
> >>>>>> On Tue, Apr 20, 2021 at 07:26:09PM +0200, Thierry Reding wrote:
> >>>>>>> From: Thierry Reding <treding@nvidia.com>
> >>>>>>>
> >>>>> Probably best if I queue 3-6 on a separate branch once you send a v3,
> >>>>> then Krzysztof can pull that in if he needs it.
> >>>>
> >>>> Patch 5 has a build-time dependency on patch 1, so they need to go in
> >>>> together. The reason why I suggested Krzysztof pick these up is because
> >>>> there is a restructuring series that this depends on, which will go into
> >>>> Krzysztof's tree. So in order to pull in 3-6, you'd get a bunch of other
> >>>> and mostly unrelated stuff as well.
> >>>
> >>> I missed that part... what other series are needed for this one? Except
> >>> Dmitry's power management set I do not have anything in my sight for
> >>> Tegras memory controllers.
> >>>
> >>> Anyway, I can take the memory bits and provide a stable tag with these.
> >>> Recently there was quite a lot work around Tegra memory controllers, so
> >>> this makes especially sense if new patches appear.
> >>
> >> OK, I think I have now the patchset you talked about - "memory: tegra:
> >> Driver unification" v2, right?
> > 
> > Yes, that's the one. That series is fairly self-contained, but Dmitry's
> > power management set has dependencies that pull in the regulator, clock
> > and ARM SoC trees.
> > 
> > I did a test merge of the driver unification series with a branch that
> > has Dmitry's patches and all the dependencies and there are no conflicts
> > so that, fortunately, doesn't further complicates things.
> > 
> > Do you want me to send you a pull request with Dmitry's memory
> > controller changes? You could then apply the unification series on top,
> > which should allow this SMMU series to apply cleanly on top of that.
> 
> Makes sense and it looks quite bulletproof for future changes. Let's do
> like this. I will apply your patch 1/10 from this v2 on top of it and
> driver unification later.

Okey doke. Thierry -- please let me know which patches I can queue. Having
the SMMU driver changes in the IOMMU tree really helps in case of conflicts
with other SMMU changes. As I say, I can put stuff on a separate branch for
you if it helps.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
