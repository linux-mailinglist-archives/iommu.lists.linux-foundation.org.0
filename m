Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id B225E3DD5A6
	for <lists.iommu@lfdr.de>; Mon,  2 Aug 2021 14:28:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 230B3403BD;
	Mon,  2 Aug 2021 12:28:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iXDYnECfxACt; Mon,  2 Aug 2021 12:28:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C5381403BB;
	Mon,  2 Aug 2021 12:28:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7BF17C0022;
	Mon,  2 Aug 2021 12:28:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C101C000E
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 12:28:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01C3A40338
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 12:28:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vWhb0hhfGG0g for <iommu@lists.linux-foundation.org>;
 Mon,  2 Aug 2021 12:28:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F082C40331
 for <iommu@lists.linux-foundation.org>; Mon,  2 Aug 2021 12:28:44 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 3FDE620C; Mon,  2 Aug 2021 14:28:42 +0200 (CEST)
Date: Mon, 2 Aug 2021 14:28:36 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Tianyu Lan <ltykernel@gmail.com>
Subject: Re: [PATCH 05/13] HV: Add Write/Read MSR registers via ghcb page
Message-ID: <YQfk9G+k0Tj8ihyu@8bytes.org>
References: <20210728145232.285861-1-ltykernel@gmail.com>
 <20210728145232.285861-6-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210728145232.285861-6-ltykernel@gmail.com>
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

On Wed, Jul 28, 2021 at 10:52:20AM -0400, Tianyu Lan wrote:
> +void hv_ghcb_msr_write(u64 msr, u64 value)
> +{
> +	union hv_ghcb *hv_ghcb;
> +	void **ghcb_base;
> +	unsigned long flags;
> +
> +	if (!ms_hyperv.ghcb_base)
> +		return;
> +
> +	WARN_ON(in_nmi());
> +
> +	local_irq_save(flags);
> +	ghcb_base = (void **)this_cpu_ptr(ms_hyperv.ghcb_base);
> +	hv_ghcb = (union hv_ghcb *)*ghcb_base;
> +	if (!hv_ghcb) {
> +		local_irq_restore(flags);
> +		return;
> +	}
> +
> +	memset(hv_ghcb, 0x00, HV_HYP_PAGE_SIZE);

Do you really need to zero out the whole 4k? The validation bitmap
should be enough, there are no secrets on the page anyway.
Same in hv_ghcb_msr_read().

> +enum es_result sev_es_ghcb_hv_call(struct ghcb *ghcb,
> +				   struct es_em_ctxt *ctxt,
> +				   u64 exit_code, u64 exit_info_1,
> +				   u64 exit_info_2)
>  {
>  	enum es_result ret;
>  
> @@ -109,7 +109,16 @@ static enum es_result sev_es_ghcb_hv_call(struct ghcb *ghcb,
>  	ghcb_set_sw_exit_info_1(ghcb, exit_info_1);
>  	ghcb_set_sw_exit_info_2(ghcb, exit_info_2);
>  
> -	sev_es_wr_ghcb_msr(__pa(ghcb));
> +	/*
> +	 * Hyper-V runs paravisor with SEV. Ghcb page is allocated by
> +	 * paravisor and not needs to be updated in the Linux guest.
> +	 * Otherwise, the ghcb page's PA reported by paravisor is above
> +	 * VTOM. Hyper-V use this function with NULL for ctxt point and
> +	 * skip setting ghcb page in such case.
> +	 */
> +	if (ctxt)
> +		sev_es_wr_ghcb_msr(__pa(ghcb));

No, do not make this function work with ctxt==NULL. Instead, factor out
a helper function which contains what Hyper-V needs and use that in
sev_es_ghcb_hv_call() and Hyper-V code.

> +union hv_ghcb {
> +	struct ghcb ghcb;
> +} __packed __aligned(PAGE_SIZE);

I am curious what this will end up being good for.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
