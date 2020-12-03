Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 188372CD4ED
	for <lists.iommu@lfdr.de>; Thu,  3 Dec 2020 12:53:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1ECA02E2FF;
	Thu,  3 Dec 2020 11:53:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3CEj5UVswiQh; Thu,  3 Dec 2020 11:53:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 95D4F2046F;
	Thu,  3 Dec 2020 11:53:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4921FC0FA7;
	Thu,  3 Dec 2020 11:53:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C964FC0FA7
 for <iommu@lists.linux-foundation.org>; Thu,  3 Dec 2020 11:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B0E7A873AB
 for <iommu@lists.linux-foundation.org>; Thu,  3 Dec 2020 11:53:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gkceu1UODfDw for <iommu@lists.linux-foundation.org>;
 Thu,  3 Dec 2020 11:53:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CF31787396
 for <iommu@lists.linux-foundation.org>; Thu,  3 Dec 2020 11:53:16 +0000 (UTC)
Date: Thu, 3 Dec 2020 11:53:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1606996396;
 bh=2j9fWjCkqKCoHT9xIh7hghfL78crppBPjSaMaUXDoYY=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=A0UDfFqlLtETJD75Yl5RAWp1KV5tqcTwRPIopAzSrJR9HvaNG1KREMDyqAwJF5xlZ
 M/yBC5lUKVu9flpaC1awMgw0In4UE75VfsaIyQThiGFt9Je09wNotz6B+c8QPvmt0C
 XTy5HZTVZ63ptNIh2iK7jVirr/msEdzin3ib7rDuhymchQycZlJSWKQZ+OsVk8ZO2b
 scCbjmQ1rOBhGExxE60lO32sX69i4cT/aa9DmiKMK8IkubKLCxhOutiL/MksHnti2f
 ap5kPwsX9zpRCthSiPzo3l6MDx98K3UqiXRRgkaJ05Itd4rdEu9cJT0D0aDVfMq+hY
 eF8gmVdjygfVQ==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/io-pgtable: Remove tlb_flush_leaf
Message-ID: <20201203115310.GC31188@willie-the-truck>
References: <9844ab0c5cb3da8b2f89c6c2da16941910702b41.1606324115.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9844ab0c5cb3da8b2f89c6c2da16941910702b41.1606324115.git.robin.murphy@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, tomeu.vizoso@collabora.com,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
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

On Wed, Nov 25, 2020 at 05:29:39PM +0000, Robin Murphy wrote:
> The only user of tlb_flush_leaf is a particularly hairy corner of the
> Arm short-descriptor code, which wants a synchronous invalidation to
> minimise the races inherent in trying to split a large page mapping.
> This is already far enough into "here be dragons" territory that no
> sensible caller should ever hit it, and thus it really doesn't need
> optimising. Although using tlb_flush_walk there may technically be
> more heavyweight than needed, it does the job and saves everyone else
> having to carry around useless baggage.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> Reviewing the Mediatek TLB optimisation patches just left me thinking
> "why do we even have this?"... Panfrost folks, this has zero functional
> impact to you, merely wants an ack for straying outside drivers/iommu.

Thanks, this looks good to me, but I'll defer queuing it until the last
minute so that I can merge all the iommu component branches together
first and then apply this on top. Should happen next week.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
