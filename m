Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 939CF6E33C
	for <lists.iommu@lfdr.de>; Fri, 19 Jul 2019 11:16:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1E638241B;
	Fri, 19 Jul 2019 09:16:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DDC802411
	for <iommu@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 09:15:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6A3EFF8
	for <iommu@lists.linux-foundation.org>;
	Fri, 19 Jul 2019 09:15:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jul 2019 02:15:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,281,1559545200"; d="scan'208";a="179572435"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
	([10.239.159.136])
	by orsmga002.jf.intel.com with ESMTP; 19 Jul 2019 02:15:48 -0700
Subject: Re: [PATCH 2/2] iommu/vt-d: Check if domain->pgd was allocated
To: Dmitry Safonov <dima@arista.com>, linux-kernel@vger.kernel.org
References: <20190716213806.20456-1-dima@arista.com>
	<20190716213806.20456-2-dima@arista.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <0748b24f-7c21-be93-59fa-88f62c3e8389@linux.intel.com>
Date: Fri, 19 Jul 2019 17:15:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190716213806.20456-2-dima@arista.com>
Content-Language: en-US
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Woodhouse <dwmw2@infradead.org>,
	Dmitry Safonov <0x7f454c46@gmail.com>, iommu@lists.linux-foundation.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi,

On 7/17/19 5:38 AM, Dmitry Safonov wrote:
> There is a couple of places where on domain_init() failure domain_exit()
> is called. While currently domain_init() can fail only if
> alloc_pgtable_page() has failed.
> 
> Make domain_exit() check if domain->pgd present, before calling
> domain_unmap(), as it theoretically should crash on clearing pte entries
> in dma_pte_clear_level().
> 
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>

This looks good to me. Thank you!

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
Baolu

> Cc: iommu@lists.linux-foundation.org
> Signed-off-by: Dmitry Safonov <dima@arista.com>
> ---
>   drivers/iommu/intel-iommu.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index 6d1510284d21..698cc40355ef 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -1835,7 +1835,6 @@ static inline int guestwidth_to_adjustwidth(int gaw)
>   
>   static void domain_exit(struct dmar_domain *domain)
>   {
> -	struct page *freelist;
>   
>   	/* Remove associated devices and clear attached or cached domains */
>   	domain_remove_dev_info(domain);
> @@ -1843,9 +1842,12 @@ static void domain_exit(struct dmar_domain *domain)
>   	/* destroy iovas */
>   	put_iova_domain(&domain->iovad);
>   
> -	freelist = domain_unmap(domain, 0, DOMAIN_MAX_PFN(domain->gaw));
> +	if (domain->pgd) {
> +		struct page *freelist;
>   
> -	dma_free_pagelist(freelist);
> +		freelist = domain_unmap(domain, 0, DOMAIN_MAX_PFN(domain->gaw));
> +		dma_free_pagelist(freelist);
> +	}
>   
>   	free_domain_mem(domain);
>   }
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
