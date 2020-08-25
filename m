Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 968DA252185
	for <lists.iommu@lfdr.de>; Tue, 25 Aug 2020 22:04:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0B90386483;
	Tue, 25 Aug 2020 20:04:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dETBlA+wuVea; Tue, 25 Aug 2020 20:04:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DEDF3865D6;
	Tue, 25 Aug 2020 20:04:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CBD36C0051;
	Tue, 25 Aug 2020 20:04:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82F62C0051
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 20:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 712E7882A4
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 20:04:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HJ+MV39SRlnP for <iommu@lists.linux-foundation.org>;
 Tue, 25 Aug 2020 20:04:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 009688829D
 for <iommu@lists.linux-foundation.org>; Tue, 25 Aug 2020 20:04:26 +0000 (UTC)
Received: from localhost (104.sub-72-107-126.myvzw.com [72.107.126.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7118A2072D;
 Tue, 25 Aug 2020 20:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598385866;
 bh=dTMuBfpKgtEYOt9p2Rn3qpf/VvcSbFu+JYG5Bh8kmyA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=cKrsE5aH9KEYT64296qE0G5KVNFvq5DVTB2yGKvHtiT3unhAr1XB6ZHkLDbMCuiDT
 8DZix0IP8SqTBX4wL/zrtUQGVB7Ol9qfyAtIzmySuOVj4QsGoYhYhUC+8gCfgXeDAx
 LOglK+g2f0nZ29h0rIpk2nBkTgJ5E2NHxftE1KkY=
Date: Tue, 25 Aug 2020 15:04:25 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch RFC 20/38] PCI: vmd: Mark VMD irqdomain with
 DOMAIN_BUS_VMD_MSI
Message-ID: <20200825200425.GA1924566@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200821002947.263753263@linutronix.de>
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
 Jonathan Derrick <jonathan.derrick@intel.com>, Juergen Gross <jgross@suse.com>,
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

On Fri, Aug 21, 2020 at 02:24:44AM +0200, Thomas Gleixner wrote:
> Devices on the VMD bus use their own MSI irq domain, but it is not
> distinguishable from regular PCI/MSI irq domains. This is required
> to exclude VMD devices from getting the irq domain pointer set by
> interrupt remapping.
> 
> Override the default bus token.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Jonathan Derrick <jonathan.derrick@intel.com>
> Cc: linux-pci@vger.kernel.org

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/controller/vmd.c |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> --- a/drivers/pci/controller/vmd.c
> +++ b/drivers/pci/controller/vmd.c
> @@ -579,6 +579,12 @@ static int vmd_enable_domain(struct vmd_
>  		return -ENODEV;
>  	}
>  
> +	/*
> +	 * Override the irq domain bus token so the domain can be distinguished
> +	 * from a regular PCI/MSI domain.
> +	 */
> +	irq_domain_update_bus_token(vmd->irq_domain, DOMAIN_BUS_VMD_MSI);
> +
>  	pci_add_resource(&resources, &vmd->resources[0]);
>  	pci_add_resource_offset(&resources, &vmd->resources[1], offset[0]);
>  	pci_add_resource_offset(&resources, &vmd->resources[2], offset[1]);
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
