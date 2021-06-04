Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A9E39BB79
	for <lists.iommu@lfdr.de>; Fri,  4 Jun 2021 17:12:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B82A41D9B;
	Fri,  4 Jun 2021 15:12:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eivoLmFF2Cyg; Fri,  4 Jun 2021 15:11:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id F134B41DAA;
	Fri,  4 Jun 2021 15:11:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D687EC0001;
	Fri,  4 Jun 2021 15:11:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C08C8C0001
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 15:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66B7B843C8
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 15:11:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KH8R0W0kwG-H for <iommu@lists.linux-foundation.org>;
 Fri,  4 Jun 2021 15:11:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4580083A98
 for <iommu@lists.linux-foundation.org>; Fri,  4 Jun 2021 15:11:50 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 77ED03A9; Fri,  4 Jun 2021 17:11:48 +0200 (CEST)
Date: Fri, 4 Jun 2021 17:11:47 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/rockchip: Remove redundant DMA syncs
Message-ID: <YLpCs7OywLy2ZQTH@8bytes.org>
References: <5c29a9ff0a20df0167635b1901f94b5195c1fb28.1621604979.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5c29a9ff0a20df0167635b1901f94b5195c1fb28.1621604979.git.robin.murphy@arm.com>
Cc: benjamin.gaignard@collabora.com, heiko@sntech.de,
 linux-rockchip@lists.infradead.org, iommu@lists.linux-foundation.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
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

On Fri, May 21, 2021 at 02:49:39PM +0100, Robin Murphy wrote:
> When we allocate new pagetable pages, we don't modify them between the
> initial dma_map_single() call and the dma_sync_single_for_device() call
> via rk_iommu_flush(), so the latter is entirely pointless.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/rockchip-iommu.c | 3 ---
>  1 file changed, 3 deletions(-)

Applied, thanks Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
