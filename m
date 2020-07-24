Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0973B22BAB2
	for <lists.iommu@lfdr.de>; Fri, 24 Jul 2020 01:54:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A9C8120363;
	Thu, 23 Jul 2020 23:54:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GQ-GCwwIea+b; Thu, 23 Jul 2020 23:54:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 75F1D20356;
	Thu, 23 Jul 2020 23:54:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 566B8C004C;
	Thu, 23 Jul 2020 23:54:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 502E9C004C
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 23:54:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 37DAE87C0A
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 23:54:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x7skgRwzUjVw for <iommu@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 23:54:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9B12787A79
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 23:54:47 +0000 (UTC)
Received: from localhost (mobile-166-175-191-139.mycingular.net
 [166.175.191.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 08097207C4;
 Thu, 23 Jul 2020 23:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595548487;
 bh=UzX/AGYoCB8T78QYmOdcDcKyRy2jrBvxTcltmnDIzdA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=uslZaGUqify8pCiomAUIjTdXLyABjbNbCxTVEOTFmwx0PLP0IqN+Qa6V3cKr4XYfz
 BEvEgH18gnL2l4F0YWejix7P32QEZQk8AXvqCwAMGL5MwPNk+SLeTAPOwgpsSFX1od
 UxtN8lqUXA2GaU5toItGBuijaTpWKO6LXOfIOE38=
Date: Thu, 23 Jul 2020 18:54:45 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ashok Raj <ashok.raj@intel.com>
Subject: Re: [PATCH v3 1/1] PCI/ATS: Check PRI supported on the PF device
 when SRIOV is enabled
Message-ID: <20200723235445.GA1471911@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595543849-19692-1-git-send-email-ashok.raj@intel.com>
Cc: Lu Baolu <baolu.lu@intel.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <bhelgaas@google.com>
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

On Thu, Jul 23, 2020 at 03:37:29PM -0700, Ashok Raj wrote:
> PASID and PRI capabilities are only enumerated in PF devices. VF devices
> do not enumerate these capabilites. IOMMU drivers also need to enumerate
> them before enabling features in the IOMMU. Extending the same support as
> PASID feature discovery (pci_pasid_features) for PRI.
> 
> Fixes: b16d0cb9e2fc ("iommu/vt-d: Always enable PASID/PRI PCI capabilities before ATS")
> Signed-off-by: Ashok Raj <ashok.raj@intel.com>

This looks right to me, but I would like Joerg's ack before applying
it.

> To: Bjorn Helgaas <bhelgaas@google.com>
> To: Joerg Roedel <joro@8bytes.com>
> To: Lu Baolu <baolu.lu@intel.com>
> Cc: stable@vger.kernel.org
> Cc: linux-pci@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Ashok Raj <ashok.raj@intel.com>
> Cc: iommu@lists.linux-foundation.org
> ---
> v3: Added Fixes tag
> v2: Fixed build failure reported from lkp when CONFIG_PRI=n
> 
>  drivers/iommu/intel/iommu.c |  2 +-
>  drivers/pci/ats.c           | 13 +++++++++++++
>  include/linux/pci-ats.h     |  4 ++++
>  3 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index d759e7234e98..276452f5e6a7 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -2560,7 +2560,7 @@ static struct dmar_domain *dmar_insert_one_dev_info(struct intel_iommu *iommu,
>  			}
>  
>  			if (info->ats_supported && ecap_prs(iommu->ecap) &&
> -			    pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_PRI))
> +			    pci_pri_supported(pdev))
>  				info->pri_supported = 1;
>  		}
>  	}
> diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
> index b761c1f72f67..2e6cf0c700f7 100644
> --- a/drivers/pci/ats.c
> +++ b/drivers/pci/ats.c
> @@ -325,6 +325,19 @@ int pci_prg_resp_pasid_required(struct pci_dev *pdev)
>  
>  	return pdev->pasid_required;
>  }
> +
> +/**
> + * pci_pri_supported - Check if PRI is supported.
> + * @pdev: PCI device structure
> + *
> + * Returns true if PRI capability is present, false otherwise.
> + */
> +bool pci_pri_supported(struct pci_dev *pdev)
> +{
> +	/* VFs share the PF PRI configuration */
> +	return !!(pci_physfn(pdev)->pri_cap);
> +}
> +EXPORT_SYMBOL_GPL(pci_pri_supported);
>  #endif /* CONFIG_PCI_PRI */
>  
>  #ifdef CONFIG_PCI_PASID
> diff --git a/include/linux/pci-ats.h b/include/linux/pci-ats.h
> index f75c307f346d..df54cd5b15db 100644
> --- a/include/linux/pci-ats.h
> +++ b/include/linux/pci-ats.h
> @@ -28,6 +28,10 @@ int pci_enable_pri(struct pci_dev *pdev, u32 reqs);
>  void pci_disable_pri(struct pci_dev *pdev);
>  int pci_reset_pri(struct pci_dev *pdev);
>  int pci_prg_resp_pasid_required(struct pci_dev *pdev);
> +bool pci_pri_supported(struct pci_dev *pdev);
> +#else
> +static inline bool pci_pri_supported(struct pci_dev *pdev)
> +{ return false; }
>  #endif /* CONFIG_PCI_PRI */
>  
>  #ifdef CONFIG_PCI_PASID
> -- 
> 2.7.4
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
