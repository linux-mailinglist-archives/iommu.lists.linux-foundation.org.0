Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F8935F828
	for <lists.iommu@lfdr.de>; Wed, 14 Apr 2021 17:50:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C48540189;
	Wed, 14 Apr 2021 15:50:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZQyi6k_Vjsdf; Wed, 14 Apr 2021 15:50:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 284B94017E;
	Wed, 14 Apr 2021 15:50:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F3890C0012;
	Wed, 14 Apr 2021 15:50:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6099C000A
 for <iommu@lists.linux-foundation.org>; Wed, 14 Apr 2021 15:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A27F24016A
 for <iommu@lists.linux-foundation.org>; Wed, 14 Apr 2021 15:50:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yjVmZ4bUf8BS for <iommu@lists.linux-foundation.org>;
 Wed, 14 Apr 2021 15:50:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB944400D2
 for <iommu@lists.linux-foundation.org>; Wed, 14 Apr 2021 15:50:20 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 10BD568C7B; Wed, 14 Apr 2021 17:50:17 +0200 (CEST)
Date: Wed, 14 Apr 2021 17:50:16 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tianyu Lan <ltykernel@gmail.com>
Subject: Re: [Resend RFC PATCH V2 11/12] HV/Netvsc: Add Isolation VM
 support for netvsc driver
Message-ID: <20210414155016.GE32045@lst.de>
References: <20210414144945.3460554-1-ltykernel@gmail.com>
 <20210414144945.3460554-12-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210414144945.3460554-12-ltykernel@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: linux-hyperv@vger.kernel.org, brijesh.singh@amd.com, linux-mm@kvack.org,
 hpa@zytor.com, kys@microsoft.com, will@kernel.org, hch@lst.de,
 linux-arch@vger.kernel.org, wei.liu@kernel.org, sthemmin@microsoft.com,
 linux-scsi@vger.kernel.org, x86@kernel.org, mingo@redhat.com, kuba@kernel.org,
 jejb@linux.ibm.com, thomas.lendacky@amd.com,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, arnd@arndb.de, konrad.wilk@oracle.com,
 haiyangz@microsoft.com, bp@alien8.de, tglx@linutronix.de, vkuznets@redhat.com,
 martin.petersen@oracle.com, gregkh@linuxfoundation.org, sunilmut@microsoft.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 netdev@vger.kernel.org, akpm@linux-foundation.org, robin.murphy@arm.com,
 davem@davemloft.net
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

> +struct dma_range {
> +	dma_addr_t dma;
> +	u32 mapping_size;
> +};

That's a rather generic name that is bound to create a conflict sooner
or later.

>  #include "hyperv_net.h"
>  #include "netvsc_trace.h"
> +#include "../../hv/hyperv_vmbus.h"

Please move public interfaces out of the private header rather than doing
this.

> +	if (hv_isolation_type_snp()) {
> +		area = get_vm_area(buf_size, VM_IOREMAP);

Err, no.  get_vm_area is private a for a reason.

> +		if (!area)
> +			goto cleanup;
> +
> +		vaddr = (unsigned long)area->addr;
> +		for (i = 0; i < buf_size / HV_HYP_PAGE_SIZE; i++) {
> +			extra_phys = (virt_to_hvpfn(net_device->recv_buf + i * HV_HYP_PAGE_SIZE)
> +				<< HV_HYP_PAGE_SHIFT) + ms_hyperv.shared_gpa_boundary;
> +			ret |= ioremap_page_range(vaddr + i * HV_HYP_PAGE_SIZE,
> +					   vaddr + (i + 1) * HV_HYP_PAGE_SIZE,
> +					   extra_phys, PAGE_KERNEL_IO);
> +		}
> +
> +		if (ret)
> +			goto cleanup;

And this is not something a driver should ever do.  I think you are badly
reimplementing functionality that should be in the dma coherent allocator
here.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
