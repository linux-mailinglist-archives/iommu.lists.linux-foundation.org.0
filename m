Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 422CD26243A
	for <lists.iommu@lfdr.de>; Wed,  9 Sep 2020 02:51:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 1664D2E124;
	Wed,  9 Sep 2020 00:51:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id paHfwlnyMYo7; Wed,  9 Sep 2020 00:51:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BD3022E0EF;
	Wed,  9 Sep 2020 00:51:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A5BA6C0051;
	Wed,  9 Sep 2020 00:51:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D9C1C0051
 for <iommu@lists.linux-foundation.org>; Wed,  9 Sep 2020 00:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 215AB2E11D
 for <iommu@lists.linux-foundation.org>; Wed,  9 Sep 2020 00:51:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UQ8nxfkNcNyv for <iommu@lists.linux-foundation.org>;
 Wed,  9 Sep 2020 00:51:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by silver.osuosl.org (Postfix) with ESMTPS id 538972E0EF
 for <iommu@lists.linux-foundation.org>; Wed,  9 Sep 2020 00:51:22 +0000 (UTC)
IronPort-SDR: TojdVv8i2PeY5VPdupYDv/vBcT9i1gy/sZ8kOj9wtwlvD3ZQrsuyekOUhdlxCLFMdhrDGbUVO9
 RzLTCungR5cg==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="157525454"
X-IronPort-AV: E=Sophos;i="5.76,407,1592895600"; d="scan'208";a="157525454"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 17:51:21 -0700
IronPort-SDR: neuHOgq9l1gHuCN25qtE8sAqX/QJU8vSfuki6yo9jisO826Aixw7SHAUEIC0MEaTOWf29qdjUq
 ydr8xTMMTFVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,407,1592895600"; d="scan'208";a="407307247"
Received: from allen-box.sh.intel.com (HELO [10.239.159.139])
 ([10.239.159.139])
 by fmsmga001.fm.intel.com with ESMTP; 08 Sep 2020 17:51:19 -0700
Subject: Re: [PATCH V2 2/5] iommu: Add iommu_dma_free_cpu_cached_iovas function
To: Tom Murphy <murphyt7@tcd.ie>, iommu@lists.linux-foundation.org
References: <20200903201839.7327-1-murphyt7@tcd.ie>
 <20200903201839.7327-3-murphyt7@tcd.ie>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <b30be538-a4dd-987e-78df-ff23b703bbe3@linux.intel.com>
Date: Wed, 9 Sep 2020 08:45:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200903201839.7327-3-murphyt7@tcd.ie>
Content-Language: en-US
Cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 9/4/20 4:18 AM, Tom Murphy wrote:
> to dma-iommu ops
> 
> Add a iommu_dma_free_cpu_cached_iovas function to allow drivers which
> use the dma-iommu ops to free cached cpu iovas.
> 
> Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
> ---
>   drivers/iommu/dma-iommu.c | 9 +++++++++
>   include/linux/dma-iommu.h | 3 +++
>   2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index f69dc9467d71..33f3f4f5edc5 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -50,6 +50,15 @@ struct iommu_dma_cookie {
>   	struct iommu_domain		*fq_domain;
>   };
>   
> +void iommu_dma_free_cpu_cached_iovas(unsigned int cpu,
> +		struct iommu_domain *domain)
> +{
> +	struct iommu_dma_cookie *cookie = domain->iova_cookie;
> +	struct iova_domain *iovad = &cookie->iovad;
> +
> +	free_cpu_cached_iovas(cpu, iovad);
> +}
> +
>   static void iommu_dma_entry_dtor(unsigned long data)
>   {
>   	struct page *freelist = (struct page *)data;
> diff --git a/include/linux/dma-iommu.h b/include/linux/dma-iommu.h
> index 2112f21f73d8..316d22a4a860 100644
> --- a/include/linux/dma-iommu.h
> +++ b/include/linux/dma-iommu.h
> @@ -37,6 +37,9 @@ void iommu_dma_compose_msi_msg(struct msi_desc *desc,
>   
>   void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list);
>   
> +void iommu_dma_free_cpu_cached_iovas(unsigned int cpu,
> +		struct iommu_domain *domain);
> +
>   #else /* CONFIG_IOMMU_DMA */
>   
>   struct iommu_domain;
> 

I will add below in the next version:

diff --git a/include/linux/dma-iommu.h b/include/linux/dma-iommu.h
index 37df037788f0..ab4bffea3aaa 100644
--- a/include/linux/dma-iommu.h
+++ b/include/linux/dma-iommu.h
@@ -81,5 +81,10 @@ static inline void iommu_dma_get_resv_regions(struct 
device *dev, struct list_he
  {
  }

+static inline void iommu_dma_free_cpu_cached_iovas(unsigned int cpu,
+                                                  struct iommu_domain 
*domain)
+{
+}
+
  #endif /* CONFIG_IOMMU_DMA */
  #endif /* __DMA_IOMMU_H */

Others looks good to me.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
