Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 021BA451591
	for <lists.iommu@lfdr.de>; Mon, 15 Nov 2021 21:45:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BE1380C74;
	Mon, 15 Nov 2021 20:45:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NImEnrS7ghHB; Mon, 15 Nov 2021 20:45:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4F5CC80C71;
	Mon, 15 Nov 2021 20:45:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F350C0032;
	Mon, 15 Nov 2021 20:45:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF9A7C0012
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 20:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9C3080C6B
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 20:45:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gXZP8EMotaVy for <iommu@lists.linux-foundation.org>;
 Mon, 15 Nov 2021 20:45:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2004380C69
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 20:45:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 675F763240;
 Mon, 15 Nov 2021 20:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637009100;
 bh=MQTFTpLy1DUXgbPj+fyTCEmPUUNZRsXNkWnZU16fcpY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=rZx5UIHF5logW4gHVcEgXUyevjPivURMroo650Fdw/AUpY0n/l1Bb6ap+gevHX6+6
 mIeO9tE3QD8U15KkS4T2WWO3OPw4gxlMXQVAYBmI8C/P1EbaIDCpB/lMoA4SjcJess
 0lWBWcPb7L01ARzsX2ppPjRYDP56tva1CTFp22W/xurRlmmEhHGivUasoQL0R4Ga0Z
 QiHfxHMf48coxqbWa1v41OMddgit7Bg/dqPToSW5VROvX8yPhuLLgcaPn9OeCjSWIm
 vuFDCcdPPrdy4iofvybgGIDko9rhUscWHj7Ku3ondcbE2sixuL4oB1odVITHqnnGt9
 uIfVjtbAjNbVQ==
Date: Mon, 15 Nov 2021 14:44:59 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 04/11] PCI: portdrv: Suppress kernel DMA ownership
 auto-claiming
Message-ID: <20211115204459.GA1585166@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211115020552.2378167-5-baolu.lu@linux.intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Chaitanya Kulkarni <kch@nvidia.com>,
 Ashok Raj <ashok.raj@intel.com>, kvm@vger.kernel.org, rafael@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-pci@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob jun Pan <jacob.jun.pan@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Bjorn Helgaas <bhelgaas@google.com>,
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

On Mon, Nov 15, 2021 at 10:05:45AM +0800, Lu Baolu wrote:
> IOMMU grouping on PCI necessitates that if we lack isolation on a bridge
> then all of the downstream devices will be part of the same IOMMU group
> as the bridge.

I think this means something like: "If a PCIe Switch Downstream Port
lacks <a specific set of ACS capabilities>, all downstream devices
will be part of the same IOMMU group as the switch," right?

If so, can you fill in the details to make it specific and concrete?

> As long as the bridge kernel driver doesn't map and
> access any PCI mmio bar, it's safe to bind it to the device in a USER-
> owned group. Hence, safe to suppress the kernel DMA ownership auto-
> claiming.

s/mmio/MMIO/ (also below)
s/bar/BAR/ (also below)

I don't understand what "kernel DMA ownership auto-claiming" means.
Presumably that's explained in previous patches and a code comment
near "suppress_auto_claim_dma_owner".

> The commit 5f096b14d421b ("vfio: Whitelist PCI bridges") permitted a
> class of kernel drivers. 

Permitted them to do what?

> This is not always safe. For example, the SHPC
> system design requires that it must be integrated into a PCI-to-PCI
> bridge or a host bridge.

If this SHPC example is important, it would be nice to have a citation
to the spec section that requires this.

> The shpchp_core driver relies on the PCI mmio
> bar access for the controller functionality. Binding it to the device
> belonging to a USER-owned group will allow the user to change the
> controller via p2p transactions which is unknown to the hot-plug driver
> and could lead to some unpredictable consequences.
> 
> Now that we have driver self-declaration of safety we should rely on that.

Can you spell out what drivers are self-declaring?  Are they declaring
that they don't program their devices to do DMA?

> This change may cause regression on some platforms, since all bridges were
> exempted before, but now they have to be manually audited before doing so.
> This is actually the desired outcome anyway.

Please spell out what regression this may cause and how users would
recognize it.  Also, please give a hint about why that is desirable.

> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Suggested-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/pci/pcie/portdrv_pci.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pci/pcie/portdrv_pci.c b/drivers/pci/pcie/portdrv_pci.c
> index 35eca6277a96..1285862a9aa8 100644
> --- a/drivers/pci/pcie/portdrv_pci.c
> +++ b/drivers/pci/pcie/portdrv_pci.c
> @@ -203,6 +203,8 @@ static struct pci_driver pcie_portdriver = {
>  	.err_handler	= &pcie_portdrv_err_handler,
>  
>  	.driver.pm	= PCIE_PORTDRV_PM_OPS,
> +
> +	.driver.suppress_auto_claim_dma_owner = true,
>  };
>  
>  static int __init dmi_pcie_pme_disable_msi(const struct dmi_system_id *d)
> -- 
> 2.25.1
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
