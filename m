Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADC34539E6
	for <lists.iommu@lfdr.de>; Tue, 16 Nov 2021 20:12:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03FC140174;
	Tue, 16 Nov 2021 19:12:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gR4HBc5P2_MB; Tue, 16 Nov 2021 19:12:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0E2EE40126;
	Tue, 16 Nov 2021 19:12:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2CEAC0032;
	Tue, 16 Nov 2021 19:12:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B53B9C0012
 for <iommu@lists.linux-foundation.org>; Tue, 16 Nov 2021 19:12:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9BE9F404B2
 for <iommu@lists.linux-foundation.org>; Tue, 16 Nov 2021 19:12:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ovdv2y1YATV7 for <iommu@lists.linux-foundation.org>;
 Tue, 16 Nov 2021 19:12:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70ED740474
 for <iommu@lists.linux-foundation.org>; Tue, 16 Nov 2021 19:12:46 +0000 (UTC)
Received: from zn.tnic (p200300ec2f1b8100142ca11f4b264b2f.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f1b:8100:142c:a11f:4b26:4b2f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 63CAB1EC056D;
 Tue, 16 Nov 2021 20:12:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1637089963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=MvK45/ux9p/D3P3nIzsezA5z0FVwGNzV1VvGxFtGLKQ=;
 b=DYO/tXGYfoiflcnBZ3TlKfZZ+/Nly9hyIxYswP+umYZWIDlAGYy77xh7aqb7mOF0MVFTU+
 +GG5FsAU39HXZwuLfIERLqvO7NAOXLMV4qlBiPeZkbRl9YG9fRZFW3kcoexW0VM/khZZpy
 Hn5p4xjCfVD7JeZRj+4M3EhGy/fJ6lk=
Date: Tue, 16 Nov 2021 20:12:39 +0100
From: Borislav Petkov <bp@alien8.de>
To: Tianyu Lan <ltykernel@gmail.com>
Subject: Re: [PATCH 3/5] hyperv/IOMMU: Enable swiotlb bounce buffer for
 Isolation VM
Message-ID: <YZQCp6WWKAdOCbh8@zn.tnic>
References: <20211116153923.196763-1-ltykernel@gmail.com>
 <20211116153923.196763-4-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211116153923.196763-4-ltykernel@gmail.com>
Cc: linux-hyperv@vger.kernel.org, brijesh.singh@amd.com, peterz@infradead.org,
 dave.hansen@linux.intel.com, dave.hansen@intel.com, hpa@zytor.com,
 kys@microsoft.com, will@kernel.org, hch@lst.de, wei.liu@kernel.org,
 sstabellini@kernel.org, sthemmin@microsoft.com, linux-scsi@vger.kernel.org,
 boris.ostrovsky@oracle.com, x86@kernel.org, decui@microsoft.com,
 michael.h.kelley@microsoft.com, mingo@redhat.com, kuba@kernel.org,
 haiyangz@microsoft.com, parri.andrea@gmail.com, thomas.lendacky@amd.com,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, konrad.wilk@oracle.com,
 jejb@linux.ibm.com, luto@kernel.org, xen-devel@lists.xenproject.org,
 tglx@linutronix.de, jgross@suse.com, martin.petersen@oracle.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, vkuznets@redhat.com, robin.murphy@arm.com,
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

On Tue, Nov 16, 2021 at 10:39:21AM -0500, Tianyu Lan wrote:
> diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
> index 35487305d8af..65bc385ae07a 100644
> --- a/arch/x86/mm/mem_encrypt.c
> +++ b/arch/x86/mm/mem_encrypt.c
> @@ -31,6 +31,7 @@
>  #include <asm/processor-flags.h>
>  #include <asm/msr.h>
>  #include <asm/cmdline.h>
> +#include <asm/mshyperv.h>
>  
>  #include "mm_internal.h"
>  
> @@ -203,7 +204,8 @@ void __init sev_setup_arch(void)
>  	phys_addr_t total_mem = memblock_phys_mem_size();
>  	unsigned long size;
>  
> -	if (!cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
> +	if (!cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)
> +	    && !hv_is_isolation_supported())

Are we gonna start sprinkling this hv_is_isolation_supported() check
everywhere now?

Are those isolation VMs SEV-like guests? Is CC_ATTR_GUEST_MEM_ENCRYPT
set on them?

What you should do, instead, is add an isol. VM specific
hv_cc_platform_has() just like amd_cc_platform_has() and handle
the cc_attrs there for your platform, like return false for
CC_ATTR_GUEST_MEM_ENCRYPT and then you won't need to add that hv_* thing
everywhere.

And then fix it up in __set_memory_enc_dec() too.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
