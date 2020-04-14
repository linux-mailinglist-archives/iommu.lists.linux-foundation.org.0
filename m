Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB5F1A886C
	for <lists.iommu@lfdr.de>; Tue, 14 Apr 2020 20:04:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 15EC9204ED;
	Tue, 14 Apr 2020 18:04:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7QLbysLkkK-m; Tue, 14 Apr 2020 18:04:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 217C01FD43;
	Tue, 14 Apr 2020 18:04:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19042C0172;
	Tue, 14 Apr 2020 18:04:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66FF9C0172
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 18:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 55A1784775
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 18:03:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UNE8Xl2Og8yK for <iommu@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 18:03:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 97DD1845D5
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 18:03:58 +0000 (UTC)
IronPort-SDR: p7HlBcMk1zwMx8KYIspxNE93TLhVJpgEgq014klpdCh7boo02MLuCGsm4jtmLGBgkY/NS9/AGt
 fp1nRzQ6MI7Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 11:03:58 -0700
IronPort-SDR: 01kgUQrqKZQX1pAj3dnDWz48ASk0atmd8PCFOSz4yl9e/0shzKXSFQ+E09Y5tSz5FmZPaOePWa
 U02OmUb4f5Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,383,1580803200"; d="scan'208";a="271475817"
Received: from swwoldee-mobl1.amr.corp.intel.com (HELO [10.251.15.118])
 ([10.251.15.118])
 by orsmga002.jf.intel.com with ESMTP; 14 Apr 2020 11:03:53 -0700
Subject: Re: [PATCH v5 24/25] PCI/ATS: Export PRI functions
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-mm@kvack.org
References: <20200414170252.714402-1-jean-philippe@linaro.org>
 <20200414170252.714402-25-jean-philippe@linaro.org>
From: "Kuppuswamy, Sathyanarayanan"
 <sathyanarayanan.kuppuswamy@linux.intel.com>
Message-ID: <5365fba9-093a-1948-e521-7cc931f06ff0@linux.intel.com>
Date: Tue, 14 Apr 2020 11:03:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200414170252.714402-25-jean-philippe@linaro.org>
Content-Language: en-US
Cc: kevin.tian@intel.com, will@kernel.org, catalin.marinas@arm.com,
 jgg@ziepe.ca, Bjorn Helgaas <bhelgaas@google.com>, zhangfei.gao@linaro.org,
 robin.murphy@arm.com, christian.koenig@amd.com
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
On 4/14/20 10:02 AM, Jean-Philippe Brucker wrote:
> The SMMUv3 driver uses pci_{enable,disable}_pri() and related
> functions. Export those functions to allow the driver to be built as a
> module.
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Kuppuswamy Sathyanarayanan 
<sathyanarayanan.kuppuswamy@linux.intel.com>
> ---
>   drivers/pci/ats.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
> index bbfd0d42b8b97..fc8fc6fc8bd55 100644
> --- a/drivers/pci/ats.c
> +++ b/drivers/pci/ats.c
> @@ -197,6 +197,7 @@ void pci_pri_init(struct pci_dev *pdev)
>   	if (status & PCI_PRI_STATUS_PASID)
>   		pdev->pasid_required = 1;
>   }
> +EXPORT_SYMBOL_GPL(pci_pri_init);
>   
>   /**
>    * pci_enable_pri - Enable PRI capability
> @@ -243,6 +244,7 @@ int pci_enable_pri(struct pci_dev *pdev, u32 reqs)
>   
>   	return 0;
>   }
> +EXPORT_SYMBOL_GPL(pci_enable_pri);
>   
>   /**
>    * pci_disable_pri - Disable PRI capability
> @@ -322,6 +324,7 @@ int pci_reset_pri(struct pci_dev *pdev)
>   
>   	return 0;
>   }
> +EXPORT_SYMBOL_GPL(pci_reset_pri);
>   
>   /**
>    * pci_prg_resp_pasid_required - Return PRG Response PASID Required bit
> @@ -337,6 +340,7 @@ int pci_prg_resp_pasid_required(struct pci_dev *pdev)
>   
>   	return pdev->pasid_required;
>   }
> +EXPORT_SYMBOL_GPL(pci_prg_resp_pasid_required);
>   #endif /* CONFIG_PCI_PRI */
>   
>   #ifdef CONFIG_PCI_PASID
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
