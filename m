Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE7539BC28
	for <lists.iommu@lfdr.de>; Fri,  4 Jun 2021 17:44:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E8E7C40173;
	Fri,  4 Jun 2021 15:44:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EkjjzZhcOQXO; Fri,  4 Jun 2021 15:44:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FF30400AB;
	Fri,  4 Jun 2021 15:44:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 626E5C0001;
	Fri,  4 Jun 2021 15:44:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49F3DC0001
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 15:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 214FD84326
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 15:44:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L4Mj9aeyChsR for <iommu@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 15:44:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84D68842A6
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 15:44:48 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 993B93A9; Fri,  4 Jun 2021 17:44:46 +0200 (CEST)
Date: Fri, 4 Jun 2021 17:44:45 +0200
From: joro <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: Different type iommus integrated in a SoC
Message-ID: <YLpKbRVU1YPD/73L@8bytes.org>
References: <2021052710373173260118@rock-chips.com>
 <5d7127d5-b73c-2002-1734-98aab2295c8e@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5d7127d5-b73c-2002-1734-98aab2295c8e@arm.com>
Cc: linux-rockchip <linux-rockchip@lists.infradead.org>,
 iommu <iommu@lists.linux-foundation.org>, will <will@kernel.org>,
 hch <hch@lst.de>
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

On Thu, Jun 03, 2021 at 01:05:43PM +0100, Robin Murphy wrote:
> Hooray! I've been forecasting this for years, but the cases we regularly hit
> with internal FPGA prototyping (nor the secret unused MMU-400 I found on
> RK3288) have never really been a strong enough argument to stand behind.
> 
> Based on what I remember from looking into this a few years ago, converting
> *most* of the API to per-device ops (now via dev->iommu) is trivial; the
> main challenge will be getting the per-device data bootstrapped in
> iommu_probe_device(), which would probably need to rely on the fwspec and/or
> list of registered IOMMU instances.
> 
> The other notable thing which will need to change is the domain allocation
> interface, but in practice I think everyone who calls iommu_domain_alloc()
> today is in fact doing so for a specific device, so I don't think it's as
> big a problem as it might first appear.

Yeah, I think for that we have to give up on the promise that a domain
can be assigned to _any_ device. But this promise doesn't even hold true
now when there are several IOMMU of the same type but with different
feature sets in a system.

So I happily review patches enabling the Multi-IOMMU SOCs :)

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
