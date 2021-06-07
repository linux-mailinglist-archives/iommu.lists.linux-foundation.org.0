Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5001C39D563
	for <lists.iommu@lfdr.de>; Mon,  7 Jun 2021 08:50:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E86AA40312;
	Mon,  7 Jun 2021 06:50:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QBtp7hR6eXUW; Mon,  7 Jun 2021 06:50:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E37640321;
	Mon,  7 Jun 2021 06:50:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40867C001C;
	Mon,  7 Jun 2021 06:50:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ED79DC0001
 for <iommu@lists.linux-foundation.org>; Mon,  7 Jun 2021 06:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB5B94019B
 for <iommu@lists.linux-foundation.org>; Mon,  7 Jun 2021 06:50:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZK-sILMj-YSl for <iommu@lists.linux-foundation.org>;
 Mon,  7 Jun 2021 06:50:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 15E0D40147
 for <iommu@lists.linux-foundation.org>; Mon,  7 Jun 2021 06:50:13 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6BD7A68AFE; Mon,  7 Jun 2021 08:50:07 +0200 (CEST)
Date: Mon, 7 Jun 2021 08:50:07 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tianyu Lan <ltykernel@gmail.com>
Subject: Re: [RFC PATCH V3 10/11] HV/Netvsc: Add Isolation VM support for
 netvsc driver
Message-ID: <20210607065007.GE24478@lst.de>
References: <20210530150628.2063957-1-ltykernel@gmail.com>
 <20210530150628.2063957-11-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210530150628.2063957-11-ltykernel@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-hyperv@vger.kernel.org, brijesh.singh@amd.com,
 thomas.lendacky@amd.com, peterz@infradead.org, dave.hansen@linux.intel.com,
 hpa@zytor.com, kys@microsoft.com, will@kernel.org, hch@lst.de,
 linux-arch@vger.kernel.org, wei.liu@kernel.org, sstabellini@kernel.org,
 sthemmin@microsoft.com, linux-scsi@vger.kernel.org, x86@kernel.org,
 decui@microsoft.com, mingo@redhat.com, xen-devel@lists.xenproject.org,
 jejb@linux.ibm.com, jgross@suse.com, Tianyu.Lan@microsoft.com, arnd@arndb.de,
 konrad.wilk@oracle.com, haiyangz@microsoft.com, kuba@kernel.org, bp@alien8.de,
 luto@kernel.org, krish.sadhukhan@oracle.com, tglx@linutronix.de,
 vkuznets@redhat.com, boris.ostrovsky@oracle.com, martin.petersen@oracle.com,
 saravanand@fb.com, netdev@vger.kernel.org, sunilmut@microsoft.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 kirill.shutemov@linux.intel.com, hannes@cmpxchg.org, cai@lca.pw,
 akpm@linux-foundation.org, robin.murphy@arm.com, davem@davemloft.net,
 rppt@kernel.org
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

On Sun, May 30, 2021 at 11:06:27AM -0400, Tianyu Lan wrote:
> +	if (hv_isolation_type_snp()) {
> +		pfns = kcalloc(buf_size / HV_HYP_PAGE_SIZE, sizeof(unsigned long),
> +			       GFP_KERNEL);
> +		for (i = 0; i < buf_size / HV_HYP_PAGE_SIZE; i++)
> +			pfns[i] = virt_to_hvpfn(net_device->recv_buf + i * HV_HYP_PAGE_SIZE) +
> +				(ms_hyperv.shared_gpa_boundary >> HV_HYP_PAGE_SHIFT);
> +
> +		vaddr = vmap_pfn(pfns, buf_size / HV_HYP_PAGE_SIZE, PAGE_KERNEL_IO);
> +		kfree(pfns);
> +		if (!vaddr)
> +			goto cleanup;
> +		net_device->recv_original_buf = net_device->recv_buf;
> +		net_device->recv_buf = vaddr;
> +	}

This probably wnats a helper to make the thing more readable.  But who
came up with this fucked up communication protocol where the host needs
to map random pfns into a contigous range?  Sometime I really have to
wonder what crack the hyper-v people take when comparing this to the
relatively sane approach others take.

> +	for (i = 0; i < page_count; i++)
> +		dma_unmap_single(&hv_dev->device, packet->dma_range[i].dma,
> +				 packet->dma_range[i].mapping_size,
> +				 DMA_TO_DEVICE);
> +
> +	kfree(packet->dma_range);

Any reason this isn't simply using a struct scatterlist?

> +	for (i = 0; i < page_count; i++) {
> +		char *src = phys_to_virt((pb[i].pfn << HV_HYP_PAGE_SHIFT)
> +					 + pb[i].offset);
> +		u32 len = pb[i].len;
> +
> +		dma = dma_map_single(&hv_dev->device, src, len,
> +				     DMA_TO_DEVICE);

dma_map_single can only be used on page baked memory, and if this is
using page backed memory you wouldn't need to do thee phys_to_virt
tricks.  Can someone explain the mess here in more detail?

>  	struct rndis_device *dev = nvdev->extension;
>  	struct rndis_request *request = NULL;
> +	struct hv_device *hv_dev = ((struct net_device_context *)
> +			netdev_priv(ndev))->device_ctx;

Why not use a net_device_context local variable instead of this cast
galore?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
