Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C36F3BF7EB
	for <lists.iommu@lfdr.de>; Thu,  8 Jul 2021 12:03:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD46B404E5;
	Thu,  8 Jul 2021 10:03:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sdkRR-lfCuQI; Thu,  8 Jul 2021 10:03:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id F2D324026F;
	Thu,  8 Jul 2021 10:03:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC532C001F;
	Thu,  8 Jul 2021 10:03:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 154A6C000E
 for <iommu@lists.linux-foundation.org>; Thu,  8 Jul 2021 10:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA1BF83A5B
 for <iommu@lists.linux-foundation.org>; Thu,  8 Jul 2021 10:03:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bxb91_ggFOqt for <iommu@lists.linux-foundation.org>;
 Thu,  8 Jul 2021 10:03:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 441AB83A4A
 for <iommu@lists.linux-foundation.org>; Thu,  8 Jul 2021 10:03:53 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id F1134312; Thu,  8 Jul 2021 12:03:50 +0200 (CEST)
Date: Thu, 8 Jul 2021 12:03:45 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] iommu: qcom: Revert "iommu/arm: Cleanup resources in
 case of probe error path"
Message-ID: <YObNgSs+pd0nDfjG@8bytes.org>
References: <CGME20210705065703eucas1p2e89258a2fc286896b755047e06f514cb@eucas1p2.samsung.com>
 <20210705065657.30356-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210705065657.30356-1-m.szyprowski@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
 Amey Narkhede <ameynarkhede03@gmail.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
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

On Mon, Jul 05, 2021 at 08:56:57AM +0200, Marek Szyprowski wrote:
> QCOM IOMMU driver calls bus_set_iommu() for every IOMMU device controller,
> what fails for the second and latter IOMMU devices. This is intended and
> must be not fatal to the driver registration process. Also the cleanup
> path should take care of the runtime PM state, what is missing in the
> current patch. Revert relevant changes to the QCOM IOMMU driver until
> a proper fix is prepared.
> 
> This partially reverts commit 249c9dc6aa0db74a0f7908efd04acf774e19b155.
> 
> Fixes: 249c9dc6aa0d ("iommu/arm: Cleanup resources in case of probe error path")
> Suggested-by: Will Deacon <will@kernel.org>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)

Applied to iommu/fixes, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
