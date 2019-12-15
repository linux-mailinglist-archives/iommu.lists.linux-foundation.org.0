Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2A611F656
	for <lists.iommu@lfdr.de>; Sun, 15 Dec 2019 06:40:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 171D886144;
	Sun, 15 Dec 2019 05:40:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id huhTbAccTAvb; Sun, 15 Dec 2019 05:40:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9D6D6861C7;
	Sun, 15 Dec 2019 05:40:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 89773C1D85;
	Sun, 15 Dec 2019 05:40:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91CFAC0881
 for <iommu@lists.linux-foundation.org>; Sun, 15 Dec 2019 05:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8A57420365
 for <iommu@lists.linux-foundation.org>; Sun, 15 Dec 2019 05:40:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3zuXfEn-RlaD for <iommu@lists.linux-foundation.org>;
 Sun, 15 Dec 2019 05:40:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by silver.osuosl.org (Postfix) with ESMTPS id ACB7920347
 for <iommu@lists.linux-foundation.org>; Sun, 15 Dec 2019 05:40:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Dec 2019 21:40:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,316,1571727600"; d="scan'208";a="226735470"
Received: from allen-box.sh.intel.com (HELO [10.239.159.136])
 ([10.239.159.136])
 by orsmga002.jf.intel.com with ESMTP; 14 Dec 2019 21:40:20 -0800
Subject: Re: [PATCH] iommu/vt-d: Allocate reserved region for ISA with correct
 permission
To: Jerry Snitselaar <jsnitsel@redhat.com>, linux-kernel@vger.kernel.org
References: <20191213053642.5696-1-jsnitsel@redhat.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <3a9bcdc5-9e78-945d-f6e4-5af6829bf4f0@linux.intel.com>
Date: Sun, 15 Dec 2019 13:39:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191213053642.5696-1-jsnitsel@redhat.com>
Content-Language: en-US
Cc: iommu@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
 stable@vger.kernel.org
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

Hi,

On 12/13/19 1:36 PM, Jerry Snitselaar wrote:
> Currently the reserved region for ISA is allocated with no
> permissions. If a dma domain is being used, mapping this region will
> fail. Set the permissions to DMA_PTE_READ|DMA_PTE_WRITE.
> 
> Cc: Joerg Roedel <jroedel@suse.de>
> Cc: Lu Baolu <baolu.lu@linux.intel.com>
> Cc: iommu@lists.linux-foundation.org
> Cc: stable@vger.kernel.org # v5.3+
> Fixes: d850c2ee5fe2 ("iommu/vt-d: Expose ISA direct mapping region via iommu_get_resv_regions")
> Signed-off-by: Jerry Snitselaar <jsnitsel@redhat.com>

This fix looks reasonable to me.

Acked-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

> ---
>   drivers/iommu/intel-iommu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index 0c8d81f56a30..998529cebcf2 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -5736,7 +5736,7 @@ static void intel_iommu_get_resv_regions(struct device *device,
>   		struct pci_dev *pdev = to_pci_dev(device);
>   
>   		if ((pdev->class >> 8) == PCI_CLASS_BRIDGE_ISA) {
> -			reg = iommu_alloc_resv_region(0, 1UL << 24, 0,
> +			reg = iommu_alloc_resv_region(0, 1UL << 24, prot,
>   						      IOMMU_RESV_DIRECT);
>   			if (reg)
>   				list_add_tail(&reg->list, head);
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
