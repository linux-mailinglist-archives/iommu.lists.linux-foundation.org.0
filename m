Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3F3276ECD
	for <lists.iommu@lfdr.de>; Thu, 24 Sep 2020 12:33:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 609A280A10;
	Thu, 24 Sep 2020 10:33:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Krsumb8NgOeA; Thu, 24 Sep 2020 10:33:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AABD686B90;
	Thu, 24 Sep 2020 10:33:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 917EEC0051;
	Thu, 24 Sep 2020 10:33:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1AC65C0051
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 10:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0ECDF228BD
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 10:33:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aH2i2ZvsZxWm for <iommu@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 10:33:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 5A2062E109
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 10:33:09 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 3723B295; Thu, 24 Sep 2020 12:33:06 +0200 (CEST)
Date: Thu, 24 Sep 2020 12:33:04 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH 0/3] iommu/tegra-smmu: Some small fixes
Message-ID: <20200924103304.GN27174@8bytes.org>
References: <20200911071643.17212-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200911071643.17212-1-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org, jonathanh@nvidia.com
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

On Fri, Sep 11, 2020 at 12:16:40AM -0700, Nicolin Chen wrote:
> These are a series of small fixes for tegra-smmu driver.
> They might not be critial bugs as current mainline does
> not enable a lot of clients, but be nicer to have since
> we are going to enable the DMA domain for other clients
> in the near future.
> 
> Nicolin Chen (3):
>   iommu/tegra-smmu: Do not use PAGE_SHIFT and PAGE_MASK
>   iommu/tegra-smmu: Fix iova->phys translation
>   iommu/tegra-smmu: Allow to group clients in same swgroup
> 
>  drivers/iommu/tegra-smmu.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
