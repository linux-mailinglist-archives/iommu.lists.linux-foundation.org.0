Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF3A4846A5
	for <lists.iommu@lfdr.de>; Tue,  4 Jan 2022 18:06:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A65240575;
	Tue,  4 Jan 2022 17:06:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d1R-lLgXEQAe; Tue,  4 Jan 2022 17:06:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C3D2E40420;
	Tue,  4 Jan 2022 17:06:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92423C006E;
	Tue,  4 Jan 2022 17:06:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 866AAC001E
 for <iommu@lists.linux-foundation.org>; Tue,  4 Jan 2022 17:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56AF1414C8
 for <iommu@lists.linux-foundation.org>; Tue,  4 Jan 2022 17:06:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vQgzajXcXuUV for <iommu@lists.linux-foundation.org>;
 Tue,  4 Jan 2022 17:06:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A184B414C6
 for <iommu@lists.linux-foundation.org>; Tue,  4 Jan 2022 17:06:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8754461521;
 Tue,  4 Jan 2022 17:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BDC2C36AED;
 Tue,  4 Jan 2022 17:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641315993;
 bh=s92lHlV9B1y8sS9ImfgWApRrW8AUqJJMtnEF5Ev1DqY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=j7P0q9nXAg/o99t9HPCrgze9DFgTvDvgqJsT5ucepqaFZzZff9B4kgE0E/Iqt202m
 L9p+eS2zTii/RLR6lzZ7htDhw14iYE4hswug3mZH7T9hlrkYXa/slzlRyQwI8hyElJ
 kW9V+c6DJGh+Vge2J0+PHqhruF9lMTh5G1Oduf9DGVAyX1Ukf12kHr7qVIVgUKRvni
 yavpxTvIr66Xgvtl4/wr2SK7CdAE86V54P4RmLuc9dtiUbCff0pAFG2Ay793w7USA6
 H7bbx5IrpRSSb39U839eTI4eqy6XRo3BPK1wHuLN9qAA2xjCT3c388KS+nMcJw+qNd
 Kw0Vb9qYzStzg==
Date: Tue, 4 Jan 2022 11:06:31 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v5 09/14] PCI: portdrv: Suppress kernel DMA ownership
 auto-claiming
Message-ID: <20220104170631.GA99771@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220104015644.2294354-10-baolu.lu@linux.intel.com>
Cc: Stuart Yoder <stuyoder@gmail.com>, rafael@kernel.org,
 David Airlie <airlied@linux.ie>, linux-pci@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Dmitry Osipenko <digetx@gmail.com>,
 Will Deacon <will@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Kevin Tian <kevin.tian@intel.com>,
 Chaitanya Kulkarni <kch@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, iommu@lists.linux-foundation.org,
 Jacob jun Pan <jacob.jun.pan@intel.com>, Daniel Vetter <daniel@ffwll.ch>,
 Robin Murphy <robin.murphy@arm.com>
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

On Tue, Jan 04, 2022 at 09:56:39AM +0800, Lu Baolu wrote:
> If a switch lacks ACS P2P Request Redirect, a device below the switch can
> bypass the IOMMU and DMA directly to other devices below the switch, so
> all the downstream devices must be in the same IOMMU group as the switch
> itself.

Help me think through what's going on here.  IIUC, we put devices in
the same IOMMU group when they can interfere with each other in any
way (DMA, config access, etc).

(We said "DMA" above, but I guess this would also apply to config
requests, right?)

*This* patch doesn't check for any ACS features.  Can you connect the
dots for me?  I guess the presence or absence of P2P Request Redirect
determines the size of the IOMMU group.  And the following says
something about what is allowed in the group?  And .no_kernel_api_dma
allows an exception to the general rule?

> The existing vfio framework allows the portdrv driver to be bound
> to the bridge while its downstream devices are assigned to user space.

I.e., the existing VFIO framework allows a switch to be in the same
IOMMU group as the devices below it, even though the switch has a
kernel driver and the other devices may have userspace drivers?

Is this a function of VFIO design or of the IOMMU driver?

> The pci_dma_configure() marks the iommu_group as containing only devices
> with kernel drivers that manage DMA. Avoid this default behavior for the
> portdrv driver in order for compatibility with the current vfio policy.

I assume "IOMMU group" means the same as "iommu_group"; maybe we can
use one of them consistently?

> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Suggested-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  drivers/pci/pcie/portdrv_pci.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pci/pcie/portdrv_pci.c b/drivers/pci/pcie/portdrv_pci.c
> index 35eca6277a96..2116f821c005 100644
> --- a/drivers/pci/pcie/portdrv_pci.c
> +++ b/drivers/pci/pcie/portdrv_pci.c
> @@ -202,6 +202,8 @@ static struct pci_driver pcie_portdriver = {
>  
>  	.err_handler	= &pcie_portdrv_err_handler,
>  
> +	.no_kernel_api_dma = true,
> +
>  	.driver.pm	= PCIE_PORTDRV_PM_OPS,
>  };
>  
> -- 
> 2.25.1
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
