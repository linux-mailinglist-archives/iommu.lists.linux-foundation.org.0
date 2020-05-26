Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A621C3134
	for <lists.iommu@lfdr.de>; Mon,  4 May 2020 03:53:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 145DF88731;
	Mon,  4 May 2020 01:53:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wk2qP9Atwyed; Mon,  4 May 2020 01:53:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1BC658871F;
	Mon,  4 May 2020 01:53:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 036CAC0175;
	Mon,  4 May 2020 01:53:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04363C0175
 for <iommu@lists.linux-foundation.org>; Mon,  4 May 2020 01:53:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E091D226F5
 for <iommu@lists.linux-foundation.org>; Mon,  4 May 2020 01:53:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9W5qjSVRl+YX for <iommu@lists.linux-foundation.org>;
 Mon,  4 May 2020 01:52:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by silver.osuosl.org (Postfix) with ESMTPS id CB44C226F3
 for <iommu@lists.linux-foundation.org>; Mon,  4 May 2020 01:52:57 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 9683FB5E5B4FEA773DF0;
 Mon,  4 May 2020 09:52:54 +0800 (CST)
Received: from [127.0.0.1] (10.67.101.242) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Mon, 4 May 2020
 09:52:45 +0800
Subject: Re: [PATCH v6 01/25] mm: Add a PASID field to mm_struct
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 <iommu@lists.linux-foundation.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pci@vger.kernel.org>,
 <linux-mm@kvack.org>
References: <20200430143424.2787566-1-jean-philippe@linaro.org>
 <20200430143424.2787566-2-jean-philippe@linaro.org>
From: Xu Zaibo <xuzaibo@huawei.com>
Message-ID: <ffe0aca4-575b-98d3-0ba5-88d5e6eb29fe@huawei.com>
Date: Mon, 4 May 2020 09:52:44 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20200430143424.2787566-2-jean-philippe@linaro.org>
X-Originating-IP: [10.67.101.242]
X-CFilter-Loop: Reflected
Cc: fenghua.yu@intel.com, kevin.tian@intel.com, jgg@ziepe.ca,
 catalin.marinas@arm.com, robin.murphy@arm.com, hch@infradead.org,
 zhangfei.gao@linaro.org, felix.kuehling@amd.com, will@kernel.org,
 christian.koenig@amd.com
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


On 2020/4/30 22:34, Jean-Philippe Brucker wrote:
> Some devices can tag their DMA requests with a 20-bit Process Address
> Space ID (PASID), allowing them to access multiple address spaces. In
> combination with recoverable I/O page faults (for example PCIe PRI),
> PASID allows the IOMMU to share page tables with the MMU.
>
> To make sure that a single PASID is allocated for each address space, as
> required by Intel ENQCMD, store the PASID in the mm_struct. The IOMMU
> driver is in charge of serializing modifications to the PASID field.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> For the field's validity I'm thinking invalid PASID = 0. In ioasid.h we
> define INVALID_IOASID as ~0U, but I think we can now change it to 0,
> since Intel is now also reserving PASID #0 for Transactions without
> PASID and AMD IOMMU uses GIoV for this too.
> ---
>   include/linux/mm_types.h | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 4aba6c0c2ba80..8db6472758175 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -534,6 +534,10 @@ struct mm_struct {
>   		atomic_long_t hugetlb_usage;
>   #endif
>   		struct work_struct async_put_work;
> +#ifdef CONFIG_IOMMU_SUPPORT
> +		/* Address space ID used by device DMA */
> +		unsigned int pasid;
> +#endif
Maybe '#ifdef CONFIG_IOMMU_SVA ... #endif' is more reasonable?

Thanks,
Zaibo

.
>   	} __randomize_layout;
>   
>   	/*


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
