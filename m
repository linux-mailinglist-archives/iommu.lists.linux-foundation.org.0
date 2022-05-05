Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 340CD51C309
	for <lists.iommu@lfdr.de>; Thu,  5 May 2022 16:53:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B350D83E86;
	Thu,  5 May 2022 14:53:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ycc7sxrxxrFr; Thu,  5 May 2022 14:53:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CE32883E81;
	Thu,  5 May 2022 14:53:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AAB9DC002D;
	Thu,  5 May 2022 14:53:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93A18C002D
 for <iommu@lists.linux-foundation.org>; Thu,  5 May 2022 14:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 734F6418C1
 for <iommu@lists.linux-foundation.org>; Thu,  5 May 2022 14:53:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0oTR4AVeAbCN for <iommu@lists.linux-foundation.org>;
 Thu,  5 May 2022 14:53:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 83045416F9
 for <iommu@lists.linux-foundation.org>; Thu,  5 May 2022 14:53:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D4F73B82D82;
 Thu,  5 May 2022 14:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54603C385A4;
 Thu,  5 May 2022 14:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651762393;
 bh=oSwfd81AM0OY4QoBIEasIKXinM4DcH+LT1YNQY4fTgw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DkD+hHPOPezMyZSaKjaYBAhl7weGZAqObGKfIaJFmAANGGXKUv77/oaKv+jMfRWCg
 /XvY6hqHucR0Zz0lKr3+oRk4s0cnPcN3r30mark5nHyJOZ/phTa1CQHJSWajK40jLu
 P47QrJhDb5N/t7h4sjRzVsjOsvv5MrnPyvCFYQmDIvZVirQ9X6af6fu10CD0U+wReF
 Ul9UzhRj4iHFWN22y++XuFgKxzCA3OtJK1raNXtDHpY7rQJEL7CUzL8yaDAkyjn3BE
 6vNLq8qpb4psTGCm/A2YCAxSOJAo3HJ3Q78BjwjBvWToRL4JO1NuvgZPuyeH8HQKbz
 DbNYq8GiOiZCA==
Date: Thu, 5 May 2022 15:53:08 +0100
From: Will Deacon <will@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 0/3] iommu/arm-smmu: Support Tegra234 SMMU
Message-ID: <20220505145307.GA21784@willie-the-truck>
References: <20220429082243.496000-1-thierry.reding@gmail.com>
 <YnPcAaQTMRsNEQYJ@orome>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YnPcAaQTMRsNEQYJ@orome>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

On Thu, May 05, 2022 at 04:15:29PM +0200, Thierry Reding wrote:
> On Fri, Apr 29, 2022 at 10:22:40AM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> > 
> > Hi Joerg,
> > 
> > this is essentially a resend of v2 with a Acked-by:s from Robin and Will
> > added. These have been on the list for quite a while now, but apparently
> > there was a misunderstanding, so neither you nor Will picked this up.
> > 
> > Since Will acked these, I think it's probably best for you to pick these
> > up directly. If not, let me know and I'll work with Will to merge via
> > the ARM SMMU tree.
> > 
> > Thanks,
> > Thierry
> > 
> > Thierry Reding (3):
> >   dt-bindings: arm-smmu: Document nvidia,memory-controller property
> >   dt-bindings: arm-smmu: Add compatible for Tegra234 SOC
> >   iommu/arm-smmu: Support Tegra234 SMMU
> > 
> >  .../devicetree/bindings/iommu/arm,smmu.yaml   | 23 +++++++++++++++++--
> >  drivers/iommu/arm/arm-smmu/arm-smmu-impl.c    |  3 ++-
> >  2 files changed, 23 insertions(+), 3 deletions(-)
> 
> Joerg,
> 
> anything left to do on this from your perspective, or can this go into
> v5.19?

I'll pick them up in the Arm SMMU queue, as there are some other SMMU
patches kicking around and we may as well keep them all together.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
