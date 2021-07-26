Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A4B3D588F
	for <lists.iommu@lfdr.de>; Mon, 26 Jul 2021 13:34:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A878D401E7;
	Mon, 26 Jul 2021 11:34:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dsD3zD4gzzam; Mon, 26 Jul 2021 11:34:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C5C24401B6;
	Mon, 26 Jul 2021 11:34:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9816BC000E;
	Mon, 26 Jul 2021 11:34:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 042BDC000E
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 11:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0F78401E7
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 11:34:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mGRHTyjqgSv9 for <iommu@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 11:34:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43AA6401B6
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 11:34:27 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 0D2A72B0; Mon, 26 Jul 2021 13:34:25 +0200 (CEST)
Date: Mon, 26 Jul 2021 13:34:23 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu: Unify iova_to_phys for identity domains
Message-ID: <YP6dv1aRED6BJ6xJ@8bytes.org>
References: <e701030cbf91b441f60d2d6788885f679317fad6.1626283714.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e701030cbf91b441f60d2d6788885f679317fad6.1626283714.git.robin.murphy@arm.com>
Cc: iommu@lists.linux-foundation.org, will@kernel.org,
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

On Wed, Jul 14, 2021 at 06:28:34PM +0100, Robin Murphy wrote:
> If people are going to insist on calling iommu_iova_to_phys()
> pointlessly and expecting it to work, we can at least do ourselves a
> favour by handling those cases in the core code, rather than repeatedly
> across an inconsistent handful of drivers.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/amd/io_pgtable.c              | 3 ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 3 ---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c       | 3 ---
>  drivers/iommu/iommu.c                       | 6 +++++-
>  4 files changed, 5 insertions(+), 10 deletions(-)

Applied to iommu/core, thanks.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
