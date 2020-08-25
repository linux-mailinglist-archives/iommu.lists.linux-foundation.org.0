Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC7B2521BF
	for <lists.iommu@lfdr.de>; Tue, 25 Aug 2020 22:16:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 881A88681B;
	Tue, 25 Aug 2020 20:16:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lXKdNbtMfUoY; Tue, 25 Aug 2020 20:16:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9B4C986819;
	Tue, 25 Aug 2020 20:16:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78078C0051;
	Tue, 25 Aug 2020 20:16:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5A070C0051
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 20:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 406778766C
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 20:16:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mf1jfZmOeASh for <iommu@lists.linux-foundation.org>;
 Tue, 25 Aug 2020 20:16:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9332487634
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 20:16:36 +0000 (UTC)
Received: from localhost (104.sub-72-107-126.myvzw.com [72.107.126.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 067E02074D;
 Tue, 25 Aug 2020 20:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598386596;
 bh=D7Rw2PMoe8IDZOMsNEwXYiBG5PbxcS/orkj8Yivovec=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=ov+X/vU+a12BRBzFUckIxiGJXa6k21v6DegMqYXhC5Zng0n4wC039Oo6Bh3gFLV6x
 5vD3ZwCEzBTgAbeasiFHcdum1DtDxjLMC1uSLEqHlzqHo8MC0nxm4f0VoTgli+T0Qr
 kEY+uzx7LZz3MSVAGwF8UOQyU/JHe/YeVdDsMVuw=
Date: Tue, 25 Aug 2020 15:16:34 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch RFC 21/38] PCI: MSI: Provide
 pci_dev_has_special_msi_domain() helper
Message-ID: <20200825201634.GA1924972@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200821002947.373714034@linutronix.de>
Cc: Dimitri Sivanich <sivanich@hpe.com>, linux-hyperv@vger.kernel.org,
 Steve Wahl <steve.wahl@hpe.com>, linux-pci@vger.kernel.org,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Dan Williams <dan.j.williams@intel.com>, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, Baolu Lu <baolu.lu@intel.com>,
 Marc Zyngier <maz@kernel.org>, x86@kernel.org,
 Jason Gunthorpe <jgg@mellanox.com>, Megha Dey <megha.dey@intel.com>,
 xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Jiang <dave.jiang@intel.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Jon Derrick <jonathan.derrick@intel.com>, Juergen Gross <jgross@suse.com>,
 Russ Anderson <rja@hpe.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Jacob Pan <jacob.jun.pan@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>
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

On Fri, Aug 21, 2020 at 02:24:45AM +0200, Thomas Gleixner wrote:
> Provide a helper function to check whether a PCI device is handled by a
> non-standard PCI/MSI domain. This will be used to exclude such devices
> which hang of a special bus, e.g. VMD, to be excluded from the irq domain
> override in irq remapping.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: linux-pci@vger.kernel.org

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

s|PCI: MSI:|PCI/MSI:| in the subject if feasible.

> ---
>  drivers/pci/msi.c   |   22 ++++++++++++++++++++++
>  include/linux/msi.h |    1 +
>  2 files changed, 23 insertions(+)
> 
> --- a/drivers/pci/msi.c
> +++ b/drivers/pci/msi.c
> @@ -1553,4 +1553,26 @@ struct irq_domain *pci_msi_get_device_do
>  					     DOMAIN_BUS_PCI_MSI);
>  	return dom;
>  }
> +
> +/**
> + * pci_dev_has_special_msi_domain - Check whether the device is handled by
> + *				    a non-standard PCI-MSI domain
> + * @pdev:	The PCI device to check.
> + *
> + * Returns: True if the device irqdomain or the bus irqdomain is
> + * non-standard PCI/MSI.
> + */
> +bool pci_dev_has_special_msi_domain(struct pci_dev *pdev)
> +{
> +	struct irq_domain *dom = dev_get_msi_domain(&pdev->dev);
> +
> +	if (!dom)
> +		dom = dev_get_msi_domain(&pdev->bus->dev);
> +
> +	if (!dom)
> +		return true;
> +
> +	return dom->bus_token != DOMAIN_BUS_PCI_MSI;
> +}
> +
>  #endif /* CONFIG_PCI_MSI_IRQ_DOMAIN */
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -374,6 +374,7 @@ int pci_msi_domain_check_cap(struct irq_
>  			     struct msi_domain_info *info, struct device *dev);
>  u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev);
>  struct irq_domain *pci_msi_get_device_domain(struct pci_dev *pdev);
> +bool pci_dev_has_special_msi_domain(struct pci_dev *pdev);
>  #else
>  static inline struct irq_domain *pci_msi_get_device_domain(struct pci_dev *pdev)
>  {
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
