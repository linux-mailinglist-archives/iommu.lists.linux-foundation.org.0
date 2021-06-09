Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AED3A14E0
	for <lists.iommu@lfdr.de>; Wed,  9 Jun 2021 14:49:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE55883C61;
	Wed,  9 Jun 2021 12:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D799ycqJ9ipz; Wed,  9 Jun 2021 12:49:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C4EDD830A7;
	Wed,  9 Jun 2021 12:49:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E8D1C000B;
	Wed,  9 Jun 2021 12:49:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A1B4FC000B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 12:49:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CBB14016D
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 12:49:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3NM-y5hqgDtJ for <iommu@lists.linux-foundation.org>;
 Wed,  9 Jun 2021 12:49:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B9BD40104
 for <iommu@lists.linux-foundation.org>; Wed,  9 Jun 2021 12:49:22 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id B439236A; Wed,  9 Jun 2021 14:49:20 +0200 (CEST)
Date: Wed, 9 Jun 2021 14:49:19 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Tianyu Lan <ltykernel@gmail.com>
Subject: Re: [RFC PATCH V3 05/11] HV: Add ghcb hvcall support for SNP VM
Message-ID: <YMC4z6L0PU3+HCTD@8bytes.org>
References: <20210530150628.2063957-1-ltykernel@gmail.com>
 <20210530150628.2063957-6-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210530150628.2063957-6-ltykernel@gmail.com>
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

On Sun, May 30, 2021 at 11:06:22AM -0400, Tianyu Lan wrote:
> +u64 hv_ghcb_hypercall(u64 control, void *input, void *output, u32 input_size)
> +{
> +	union hv_ghcb *hv_ghcb;
> +	void **ghcb_base;
> +	unsigned long flags;
> +
> +	if (!ms_hyperv.ghcb_base)
> +		return -EFAULT;
> +
> +	local_irq_save(flags);
> +	ghcb_base = (void **)this_cpu_ptr(ms_hyperv.ghcb_base);
> +	hv_ghcb = (union hv_ghcb *)*ghcb_base;
> +	if (!hv_ghcb) {
> +		local_irq_restore(flags);
> +		return -EFAULT;
> +	}
> +
> +	memset(hv_ghcb, 0x00, HV_HYP_PAGE_SIZE);
> +	hv_ghcb->ghcb.protocol_version = 1;
> +	hv_ghcb->ghcb.ghcb_usage = 1;
> +
> +	hv_ghcb->hypercall.outputgpa = (u64)output;
> +	hv_ghcb->hypercall.hypercallinput.asuint64 = 0;
> +	hv_ghcb->hypercall.hypercallinput.callcode = control;
> +
> +	if (input_size)
> +		memcpy(hv_ghcb->hypercall.hypercalldata, input, input_size);
> +
> +	VMGEXIT();

Also not NMI-safe. When you re-use the existing GHCB setup code from
from SEV-ES code, you can also use sev_es_get/put_ghcb() which takes
care of re-using a GHCB already in use.

Regards,

	Joerg

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
