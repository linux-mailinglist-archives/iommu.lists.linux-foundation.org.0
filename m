Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7813A7E32
	for <lists.iommu@lfdr.de>; Tue, 15 Jun 2021 14:29:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99CD6402AE;
	Tue, 15 Jun 2021 12:29:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q5wIPR7spVOm; Tue, 15 Jun 2021 12:29:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A0DA940223;
	Tue, 15 Jun 2021 12:29:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D261C0022;
	Tue, 15 Jun 2021 12:29:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07E73C000B
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 12:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8F694046C
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 12:29:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new); dkim=neutral
 reason="invalid (public key: DNS error: query timed out)"
 header.d=mediatek.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gbEk9ouxFTJH for <iommu@lists.linux-foundation.org>;
 Tue, 15 Jun 2021 12:29:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C2644045E
 for <iommu@lists.linux-foundation.org>; Tue, 15 Jun 2021 12:29:42 +0000 (UTC)
X-UUID: 2caa48c5f2f4426095a7d3a514d19c4a-20210615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hy2ulTOYtTz6fWJfoMGqCOL0cJY7Tmx70wHn6d0aIag=; 
 b=KgyZsXtf1OcG8DAwz2BuLG8DJuwufQrmOzmvtPNmpochpW39dfI3+XMaOpzQp8cZJcpnBCu6GgrZBD8ybQ6ReJf7AM2ZvUl88RFRTcNn8E84gCCmaSEq1Ik70zhfOKdvsWF+qPhtRIbJwUjIR2alMlnYBLxxgu7tTS0TyvpcAas=;
X-UUID: 2caa48c5f2f4426095a7d3a514d19c4a-20210615
Received: from mtkcas32.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 69459193; Tue, 15 Jun 2021 20:29:35 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 15 Jun 2021 20:29:26 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 15 Jun 2021 20:29:26 +0800
Message-ID: <1623760166.24285.1.camel@mhfsdcap03>
Subject: Re: [PATCH v3 3/6] iommu: Improve iommu_iotlb_gather helpers
From: Yong Wu <yong.wu@mediatek.com>
To: Nadav Amit <nadav.amit@gmail.com>
Date: Tue, 15 Jun 2021 20:29:26 +0800
In-Reply-To: <20210607182541.119756-4-namit@vmware.com>
References: <20210607182541.119756-1-namit@vmware.com>
 <20210607182541.119756-4-namit@vmware.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 619EC6FAECE4DB4BFD5D7B0E99DD46A5676E4A97FF55DE65E1407293A0E41BBB2000:8
X-MTK: N
Cc: Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Jiajun Cao <caojiajun@vmware.com>,
 Will Deacon <will@kernel.org>
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

On Mon, 2021-06-07 at 11:25 -0700, Nadav Amit wrote:
> From: Robin Murphy <robin.murphy@arm.com>
> 
> The Mediatek driver is not the only one which might want a basic
> address-based gathering behaviour, so although it's arguably simple
> enough to open-code, let's factor it out for the sake of cleanliness.
> Let's also take this opportunity to document the intent of these
> helpers for clarity.
> 
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Jiajun Cao <caojiajun@vmware.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> 
> ---
> 
> Changes from Robin's version:
> * Added iommu_iotlb_gather_add_range() stub !CONFIG_IOMMU_API
> * Use iommu_iotlb_gather_add_range() in iommu_iotlb_gather_add_page()
> ---
>  drivers/iommu/mtk_iommu.c |  5 +----
>  include/linux/iommu.h     | 43 ++++++++++++++++++++++++++++++++++-----
>  2 files changed, 39 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index e06b8a0e2b56..0af4a91ac7da 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -523,10 +523,7 @@ static size_t mtk_iommu_unmap(struct iommu_domain *domain,
>  	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
>  	unsigned long end = iova + size - 1;

Please also help delete this "end".

>  
> -	if (gather->start > iova)
> -		gather->start = iova;
> -	if (gather->end < end)
> -		gather->end = end;
> +	iommu_iotlb_gather_add_range(gather, iova, size);
>  	return dom->iop->unmap(dom->iop, iova, size, gather);
>  }

[snip] 


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
