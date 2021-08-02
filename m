Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B44563DD4FA
	for <lists.iommu@lfdr.de>; Mon,  2 Aug 2021 13:53:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58F7E403A5;
	Mon,  2 Aug 2021 11:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h6mIS78VfO-a; Mon,  2 Aug 2021 11:53:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 1E8B3403A9;
	Mon,  2 Aug 2021 11:53:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4345C000E;
	Mon,  2 Aug 2021 11:53:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1CD6CC000E
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 11:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 036E6403A6
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 11:53:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jF7v4mwSpY52 for <iommu@lists.linux-foundation.org>;
 Mon,  2 Aug 2021 11:53:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B2C9A403A5
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 11:53:35 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 835EB379; Mon,  2 Aug 2021 13:53:32 +0200 (CEST)
Date: Mon, 2 Aug 2021 13:53:26 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Tianyu Lan <ltykernel@gmail.com>
Subject: Re: [PATCH 01/13] x86/HV: Initialize GHCB page in Isolation VM
Message-ID: <YQfctjRm16IP0qZy@8bytes.org>
References: <20210728145232.285861-1-ltykernel@gmail.com>
 <20210728145232.285861-2-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210728145232.285861-2-ltykernel@gmail.com>
Cc: linux-hyperv@vger.kernel.org, brijesh.singh@amd.com, david@redhat.com,
 peterz@infradead.org, dave.hansen@linux.intel.com, vkuznets@redhat.com,
 hpa@zytor.com, anparri@microsoft.com, kys@microsoft.com, will@kernel.org,
 boris.ostrovsky@oracle.com, linux-arch@vger.kernel.org, sfr@canb.auug.org.au,
 wei.liu@kernel.org, sstabellini@kernel.org, sthemmin@microsoft.com,
 xen-devel@lists.xenproject.org, linux-scsi@vger.kernel.org,
 aneesh.kumar@linux.ibm.com, x86@kernel.org, decui@microsoft.com, hch@lst.de,
 michael.h.kelley@microsoft.com, mingo@redhat.com, pgonda@google.com,
 rientjes@google.com, kuba@kernel.org, jejb@linux.ibm.com,
 martin.b.radev@gmail.com, thomas.lendacky@amd.com, Tianyu.Lan@microsoft.com,
 keescook@chromium.org, arnd@arndb.de, konrad.wilk@oracle.com,
 haiyangz@microsoft.com, bp@alien8.de, luto@kernel.org,
 krish.sadhukhan@oracle.com, tglx@linutronix.de, akpm@linux-foundation.org,
 jgross@suse.com, martin.petersen@oracle.com, saravanand@fb.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, kirill.shutemov@linux.intel.com,
 hannes@cmpxchg.org, ardb@kernel.org, robin.murphy@arm.com, davem@davemloft.net,
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

On Wed, Jul 28, 2021 at 10:52:16AM -0400, Tianyu Lan wrote:
> +static int hyperv_init_ghcb(void)
> +{
> +	u64 ghcb_gpa;
> +	void *ghcb_va;
> +	void **ghcb_base;
> +
> +	if (!ms_hyperv.ghcb_base)
> +		return -EINVAL;
> +
> +	rdmsrl(MSR_AMD64_SEV_ES_GHCB, ghcb_gpa);
> +	ghcb_va = memremap(ghcb_gpa, HV_HYP_PAGE_SIZE, MEMREMAP_WB);

This deserves a comment. As I understand it, the GHCB pa is set by
Hyper-V or the paravisor, so the page does not need to be allocated by
Linux.
And it is not mapped unencrypted because the GHCB page is allocated
above the VTOM boundary?

> @@ -167,6 +190,31 @@ static int hv_cpu_die(unsigned int cpu)
>  {
>  	struct hv_reenlightenment_control re_ctrl;
>  	unsigned int new_cpu;
> +	unsigned long flags;
> +	void **input_arg;
> +	void *pg;
> +	void **ghcb_va = NULL;
> +
> +	local_irq_save(flags);
> +	input_arg = (void **)this_cpu_ptr(hyperv_pcpu_input_arg);
> +	pg = *input_arg;

Pg is never used later on, why is it set?

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
