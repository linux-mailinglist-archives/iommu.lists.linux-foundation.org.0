Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F9E2A7E65
	for <lists.iommu@lfdr.de>; Thu,  5 Nov 2020 13:15:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id ECA8D86566;
	Thu,  5 Nov 2020 12:15:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BJxa-ZC620vy; Thu,  5 Nov 2020 12:15:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 24D1F86554;
	Thu,  5 Nov 2020 12:15:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 076CEC0889;
	Thu,  5 Nov 2020 12:15:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B000C0889
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 12:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id ED01D8511C
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 12:15:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TQk5ZbvJjSSa for <iommu@lists.linux-foundation.org>;
 Thu,  5 Nov 2020 12:15:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C399E85087
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 12:15:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E529142F;
 Thu,  5 Nov 2020 04:15:49 -0800 (PST)
Received: from [10.57.54.223] (unknown [10.57.54.223])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 62E5D3F719;
 Thu,  5 Nov 2020 04:15:47 -0800 (PST)
Subject: Re: [PATCH 1/6] RMDA/sw: don't allow drivers using dma_virt_ops on
 highmem configs
To: Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@ziepe.ca>
References: <20201105074205.1690638-1-hch@lst.de>
 <20201105074205.1690638-2-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <40d0a990-0fca-6f12-16ff-3612a9847ab3@arm.com>
Date: Thu, 5 Nov 2020 12:15:46 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201105074205.1690638-2-hch@lst.de>
Content-Language: en-GB
Cc: Zhu Yanjun <yanjunz@nvidia.com>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, linux-pci@vger.kernel.org,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <bhelgaas@google.com>,
 Bernard Metzler <bmt@zurich.ibm.com>, Logan Gunthorpe <logang@deltatee.com>
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

On 2020-11-05 07:42, Christoph Hellwig wrote:
> dma_virt_ops requires that all pages have a kernel virtual address.
> Introduce a INFINIBAND_VIRT_DMA Kconfig symbol that depends on !HIGHMEM
> and a large enough dma_addr_t, and make all three driver depend on the
> new symbol.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/infiniband/Kconfig           | 6 ++++++
>   drivers/infiniband/sw/rdmavt/Kconfig | 3 ++-
>   drivers/infiniband/sw/rxe/Kconfig    | 2 +-
>   drivers/infiniband/sw/siw/Kconfig    | 1 +
>   4 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/infiniband/Kconfig b/drivers/infiniband/Kconfig
> index 32a51432ec4f73..81acaf5fb5be67 100644
> --- a/drivers/infiniband/Kconfig
> +++ b/drivers/infiniband/Kconfig
> @@ -73,6 +73,12 @@ config INFINIBAND_ADDR_TRANS_CONFIGFS
>   	  This allows the user to config the default GID type that the CM
>   	  uses for each device, when initiaing new connections.
>   
> +config INFINIBAND_VIRT_DMA
> +	bool
> +	default y
> +	depends on !HIGHMEM
> +	depends on !64BIT || ARCH_DMA_ADDR_T_64BIT

Isn't that effectively always true now since 4965a68780c5? I had a quick 
try of manually overriding CONFIG_ARCH_DMA_ADDR_T_64BIT in my .config, 
and the build just forces it back to "=y".

Robin.

> +
>   if INFINIBAND_USER_ACCESS || !INFINIBAND_USER_ACCESS
>   source "drivers/infiniband/hw/mthca/Kconfig"
>   source "drivers/infiniband/hw/qib/Kconfig"
> diff --git a/drivers/infiniband/sw/rdmavt/Kconfig b/drivers/infiniband/sw/rdmavt/Kconfig
> index 9ef5f5ce1ff6b0..c8e268082952b0 100644
> --- a/drivers/infiniband/sw/rdmavt/Kconfig
> +++ b/drivers/infiniband/sw/rdmavt/Kconfig
> @@ -1,7 +1,8 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   config INFINIBAND_RDMAVT
>   	tristate "RDMA verbs transport library"
> -	depends on X86_64 && ARCH_DMA_ADDR_T_64BIT
> +	depends on INFINIBAND_VIRT_DMA
> +	depends on X86_64
>   	depends on PCI
>   	select DMA_VIRT_OPS
>   	help
> diff --git a/drivers/infiniband/sw/rxe/Kconfig b/drivers/infiniband/sw/rxe/Kconfig
> index a0c6c7dfc1814f..8810bfa680495a 100644
> --- a/drivers/infiniband/sw/rxe/Kconfig
> +++ b/drivers/infiniband/sw/rxe/Kconfig
> @@ -2,7 +2,7 @@
>   config RDMA_RXE
>   	tristate "Software RDMA over Ethernet (RoCE) driver"
>   	depends on INET && PCI && INFINIBAND
> -	depends on !64BIT || ARCH_DMA_ADDR_T_64BIT
> +	depends on INFINIBAND_VIRT_DMA
>   	select NET_UDP_TUNNEL
>   	select CRYPTO_CRC32
>   	select DMA_VIRT_OPS
> diff --git a/drivers/infiniband/sw/siw/Kconfig b/drivers/infiniband/sw/siw/Kconfig
> index b622fc62f2cd6d..3450ba5081df51 100644
> --- a/drivers/infiniband/sw/siw/Kconfig
> +++ b/drivers/infiniband/sw/siw/Kconfig
> @@ -1,6 +1,7 @@
>   config RDMA_SIW
>   	tristate "Software RDMA over TCP/IP (iWARP) driver"
>   	depends on INET && INFINIBAND && LIBCRC32C
> +	depends on INFINIBAND_VIRT_DMA
>   	select DMA_VIRT_OPS
>   	help
>   	This driver implements the iWARP RDMA transport over
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
