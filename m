Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D823623D1
	for <lists.iommu@lfdr.de>; Fri, 16 Apr 2021 17:22:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEB6384856;
	Fri, 16 Apr 2021 15:22:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GSE03L01QlDv; Fri, 16 Apr 2021 15:22:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0A8584855;
	Fri, 16 Apr 2021 15:22:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0608C000A;
	Fri, 16 Apr 2021 15:22:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E04EC000A
 for <iommu@lists.linux-foundation.org>; Fri, 16 Apr 2021 15:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01B02401F7
 for <iommu@lists.linux-foundation.org>; Fri, 16 Apr 2021 15:22:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XRM7cq_iYFrZ for <iommu@lists.linux-foundation.org>;
 Fri, 16 Apr 2021 15:22:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 25488400C5
 for <iommu@lists.linux-foundation.org>; Fri, 16 Apr 2021 15:22:50 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 6A174223; Fri, 16 Apr 2021 17:22:47 +0200 (CEST)
Date: Fri, 16 Apr 2021 17:22:46 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 1/2] iommu: Statically set module owner
Message-ID: <YHmrxuIXH2rOozti@8bytes.org>
References: <31423b99ff609c3d4b291c701a7a7a810d9ce8dc.1617285386.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <31423b99ff609c3d4b291c701a7a7a810d9ce8dc.1617285386.git.robin.murphy@arm.com>
Cc: iommu@lists.linux-foundation.org, will@kernel.org,
 linux-kernel@vger.kernel.org, hch@lst.de
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

On Thu, Apr 01, 2021 at 02:56:25PM +0100, Robin Murphy wrote:
> It happens that the 3 drivers which first supported being modular are
> also ones which play games with their pgsize_bitmap, so have non-const
> iommu_ops where dynamically setting the owner manages to work out OK.
> However, it's less than ideal to force that upon all drivers which want
> to be modular - like the new sprd-iommu driver which now has a potential
> bug in that regard - so let's just statically set the module owner and
> let ops remain const wherever possible.
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Will Deacon <will@kernel.org>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 1 +
>  drivers/iommu/arm/arm-smmu/arm-smmu.c       | 1 +
>  drivers/iommu/sprd-iommu.c                  | 1 +
>  drivers/iommu/virtio-iommu.c                | 1 +
>  include/linux/iommu.h                       | 9 +--------
>  5 files changed, 5 insertions(+), 8 deletions(-)

Applied these two directly on-top of my next branch. This essentially
means that all topic branches are frozen now until after the merge
window.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
