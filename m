Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAAC307661
	for <lists.iommu@lfdr.de>; Thu, 28 Jan 2021 13:51:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CAD0D86354;
	Thu, 28 Jan 2021 12:51:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cLsXmIZzGz7c; Thu, 28 Jan 2021 12:51:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3DE9D86B78;
	Thu, 28 Jan 2021 12:51:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1A0AAC1E6F;
	Thu, 28 Jan 2021 12:51:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF892C013A
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 12:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D11DD873BC
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 12:51:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e18afUru3p0Y for <iommu@lists.linux-foundation.org>;
 Thu, 28 Jan 2021 12:51:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CB1D9873AB
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 12:51:15 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 0B69051D; Thu, 28 Jan 2021 13:51:13 +0100 (CET)
Date: Thu, 28 Jan 2021 13:51:12 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Chuck Lever <chuck.lever@oracle.com>
Subject: Re: [PATCH RFC 2/9] iommu: Add iova and size as parameters in
 iotlb_sync_map
Message-ID: <20210128125112.GN32671@8bytes.org>
References: <161177711359.1311.417185373365934204.stgit@manet.1015granger.net>
 <161177763296.1311.15197214300351076283.stgit@manet.1015granger.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <161177763296.1311.15197214300351076283.stgit@manet.1015granger.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: isaacm@codeaurora.org, robin.murphy@arm.com,
 iommu@lists.linux-foundation.org, will@kernel.org
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

Hi Chuck,

thanks for your optimizations!

On Wed, Jan 27, 2021 at 03:00:32PM -0500, Chuck Lever wrote:
> From: Yong Wu <yong.wu@mediatek.com>
> 
> iotlb_sync_map allow IOMMU drivers tlb sync after completing the whole
> mapping. This patch adds iova and size as the parameters in it. then the
> IOMMU driver could flush tlb with the whole range once after iova mapping
> to improve performance.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Chuck Lever <chuck.lever@oracle.com>
> ---
>  drivers/iommu/iommu.c      |    4 ++--
>  drivers/iommu/tegra-gart.c |    7 +++++--
>  include/linux/iommu.h      |    3 ++-
>  3 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index c304a6a30d42..3d099a31ddca 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -2443,7 +2443,7 @@ static int _iommu_map(struct iommu_domain *domain, unsigned long iova,
>  
>  	ret = __iommu_map(domain, iova, paddr, size, prot, GFP_KERNEL);
>  	if (ret == 0 && ops->iotlb_sync_map)
> -		ops->iotlb_sync_map(domain);
> +		ops->iotlb_sync_map(domain, iova, size);

How about using 'struct iommu_iotlb_gather' instead of directly passing
the iova/size parameters here? The iotlb_sync() call-back uses it
already.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
