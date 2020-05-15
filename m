Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F42C1D4D1F
	for <lists.iommu@lfdr.de>; Fri, 15 May 2020 13:58:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 94F8687D8A;
	Fri, 15 May 2020 11:58:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c8qAVsAmdEd0; Fri, 15 May 2020 11:58:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BACFB87D95;
	Fri, 15 May 2020 11:58:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A84B3C016F;
	Fri, 15 May 2020 11:58:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38FC0C016F
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 11:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1126F2E74A
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 11:58:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UWWCoTi3B05U for <iommu@lists.linux-foundation.org>;
 Fri, 15 May 2020 11:58:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id F26E92E2C4
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 11:58:02 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 56097379; Fri, 15 May 2020 13:57:59 +0200 (CEST)
Date: Fri, 15 May 2020 13:57:58 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH 1/4] PCI/ATS: Only enable ATS for trusted devices
Message-ID: <20200515115757.GT18353@8bytes.org>
References: <20200515104359.1178606-1-jean-philippe@linaro.org>
 <20200515104359.1178606-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515104359.1178606-2-jean-philippe@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alex.williamson@redhat.com, ashok.raj@intel.com, linux-pci@vger.kernel.org,
 robin.murphy@arm.com, iommu@lists.linux-foundation.org, bhelgaas@google.com,
 will@kernel.org, dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
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

Hi Jean-Philippe,

thanks for doing this!

On Fri, May 15, 2020 at 12:43:59PM +0200, Jean-Philippe Brucker wrote:
> Add pci_ats_supported(), which checks whether a device has an ATS
> capability, and whether it is trusted.  A device is untrusted if it is
> plugged into an external-facing port such as Thunderbolt and could be
> spoof an existing device to exploit weaknesses in the IOMMU
> configuration.  PCIe ATS is one such weaknesses since it allows
> endpoints to cache IOMMU translations and emit transactions with
> 'Translated' Address Type (10b) that partially bypass the IOMMU
> translation.
> 
> The SMMUv3 and VT-d IOMMU drivers already disallow ATS and transactions
> with 'Translated' Address Type for untrusted devices.  Add the check to
> pci_enable_ats() to let other drivers (AMD IOMMU for now) benefit from
> it.
> 
> By checking ats_cap, the pci_ats_supported() helper also returns whether
> ATS was globally disabled with pci=noats, and could later include more
> things, for example whether the whole PCIe hierarchy down to the
> endpoint supports ATS.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  include/linux/pci-ats.h |  3 +++
>  drivers/pci/ats.c       | 18 +++++++++++++++++-
>  2 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/pci-ats.h b/include/linux/pci-ats.h
> index d08f0869f1213e..f75c307f346de9 100644
> --- a/include/linux/pci-ats.h
> +++ b/include/linux/pci-ats.h
> @@ -6,11 +6,14 @@
>  
>  #ifdef CONFIG_PCI_ATS
>  /* Address Translation Service */
> +bool pci_ats_supported(struct pci_dev *dev);
>  int pci_enable_ats(struct pci_dev *dev, int ps);
>  void pci_disable_ats(struct pci_dev *dev);
>  int pci_ats_queue_depth(struct pci_dev *dev);
>  int pci_ats_page_aligned(struct pci_dev *dev);
>  #else /* CONFIG_PCI_ATS */
> +static inline bool pci_ats_supported(struct pci_dev *d)
> +{ return false; }
>  static inline int pci_enable_ats(struct pci_dev *d, int ps)
>  { return -ENODEV; }
>  static inline void pci_disable_ats(struct pci_dev *d) { }
> diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
> index 390e92f2d8d1fc..15fa0c37fd8e44 100644
> --- a/drivers/pci/ats.c
> +++ b/drivers/pci/ats.c
> @@ -30,6 +30,22 @@ void pci_ats_init(struct pci_dev *dev)
>  	dev->ats_cap = pos;
>  }
>  
> +/**
> + * pci_ats_supported - check if the device can use ATS
> + * @dev: the PCI device
> + *
> + * Returns true if the device supports ATS and is allowed to use it, false
> + * otherwise.
> + */
> +bool pci_ats_supported(struct pci_dev *dev)
> +{
> +	if (!dev->ats_cap)
> +		return false;
> +
> +	return !dev->untrusted;

dev->untrusted is an 'unsigned int :1', so while this works I would
prefer 'return (dev->untrusted == 0);' here, to be more type-safe.

With that changed:

Reviewed-by: Joerg Roedel <jroedel@suse.de>

> +}
> +EXPORT_SYMBOL_GPL(pci_ats_supported);
> +
>  /**
>   * pci_enable_ats - enable the ATS capability
>   * @dev: the PCI device
> @@ -42,7 +58,7 @@ int pci_enable_ats(struct pci_dev *dev, int ps)
>  	u16 ctrl;
>  	struct pci_dev *pdev;
>  
> -	if (!dev->ats_cap)
> +	if (!pci_ats_supported(dev))
>  		return -EINVAL;
>  
>  	if (WARN_ON(dev->ats_enabled))
> -- 
> 2.26.2
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
