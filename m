Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE9F117D7
	for <lists.iommu@lfdr.de>; Thu,  2 May 2019 13:03:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id ACD4C3099;
	Thu,  2 May 2019 11:03:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 467DB306B
	for <iommu@lists.linux-foundation.org>;
	Thu,  2 May 2019 11:02:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id D2EE9189
	for <iommu@lists.linux-foundation.org>;
	Thu,  2 May 2019 11:02:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70351A78;
	Thu,  2 May 2019 04:02:45 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (e121166-lin.cambridge.arm.com
	[10.1.196.255])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B7143F719;
	Thu,  2 May 2019 04:02:43 -0700 (PDT)
Date: Thu, 2 May 2019 12:01:52 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: Re: [PATCH v5 2/3] iommu/dma: Reserve IOVA for PCIe inaccessible DMA
	address
Message-ID: <20190502110152.GA7313@e121166-lin.cambridge.arm.com>
References: <1556732186-21630-1-git-send-email-srinath.mannam@broadcom.com>
	<1556732186-21630-3-git-send-email-srinath.mannam@broadcom.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1556732186-21630-3-git-send-email-srinath.mannam@broadcom.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: poza@codeaurora.org, Ray Jui <rjui@broadcom.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	bcm-kernel-feedback-list@broadcom.com, linux-pci@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>, Robin Murphy <robin.murphy@arm.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Wed, May 01, 2019 at 11:06:25PM +0530, Srinath Mannam wrote:
> dma_ranges field of PCI host bridge structure has resource entries in
> sorted order of address range given through dma-ranges DT property. This
> list is the accessible DMA address range. So that this resource list will
> be processed and reserve IOVA address to the inaccessible address holes in
> the list.
> 
> This method is similar to PCI IO resources address ranges reserving in
> IOMMU for each EP connected to host bridge.
> 
> Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
> Based-on-patch-by: Oza Pawandeep <oza.oza@broadcom.com>
> Reviewed-by: Oza Pawandeep <poza@codeaurora.org>
> Acked-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/dma-iommu.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 77aabe6..da94844 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -212,6 +212,7 @@ static void iova_reserve_pci_windows(struct pci_dev *dev,
>  	struct pci_host_bridge *bridge = pci_find_host_bridge(dev->bus);
>  	struct resource_entry *window;
>  	unsigned long lo, hi;
> +	phys_addr_t start = 0, end;
>  
>  	resource_list_for_each_entry(window, &bridge->windows) {
>  		if (resource_type(window->res) != IORESOURCE_MEM)
> @@ -221,6 +222,24 @@ static void iova_reserve_pci_windows(struct pci_dev *dev,
>  		hi = iova_pfn(iovad, window->res->end - window->offset);
>  		reserve_iova(iovad, lo, hi);
>  	}
> +
> +	/* Get reserved DMA windows from host bridge */
> +	resource_list_for_each_entry(window, &bridge->dma_ranges) {

If this list is not sorted it seems to me the logic in this loop is
broken and you can't rely on callers to sort it because it is not a
written requirement and it is not enforced (you know because you
wrote the code but any other developer is not supposed to guess
it).

Can't we rewrite this loop so that it does not rely on list
entries order ?

I won't merge this series unless you sort it, no pun intended.

Lorenzo

> +		end = window->res->start - window->offset;
> +resv_iova:
> +		if (end - start) {
> +			lo = iova_pfn(iovad, start);
> +			hi = iova_pfn(iovad, end);
> +			reserve_iova(iovad, lo, hi);
> +		}
> +		start = window->res->end - window->offset + 1;
> +		/* If window is last entry */
> +		if (window->node.next == &bridge->dma_ranges &&
> +		    end != ~(dma_addr_t)0) {
> +			end = ~(dma_addr_t)0;
> +			goto resv_iova;
> +		}
> +	}
>  }
>  
>  static int iova_reserve_iommu_regions(struct device *dev,
> -- 
> 2.7.4
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
