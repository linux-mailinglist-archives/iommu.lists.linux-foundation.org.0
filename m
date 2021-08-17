Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB8F3EE8F6
	for <lists.iommu@lfdr.de>; Tue, 17 Aug 2021 11:00:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 231B540359;
	Tue, 17 Aug 2021 09:00:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EgsEKu-K-pgz; Tue, 17 Aug 2021 09:00:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D18E840330;
	Tue, 17 Aug 2021 09:00:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 925C8C000E;
	Tue, 17 Aug 2021 09:00:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33B55C000E
 for <iommu@lists.linux-foundation.org>; Tue, 17 Aug 2021 09:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2350D80D80
 for <iommu@lists.linux-foundation.org>; Tue, 17 Aug 2021 09:00:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=alien8.de
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vPT6brgLxacN for <iommu@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 09:00:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0237780D73
 for <iommu@lists.linux-foundation.org>; Tue, 17 Aug 2021 09:00:23 +0000 (UTC)
Received: from zn.tnic (p200300ec2f1175003091845243004ed4.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f11:7500:3091:8452:4300:4ed4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id C31EA1EC01B5;
 Tue, 17 Aug 2021 11:00:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1629190817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=CTZxwlhCTYBphd87lvceDZBtTDENyNB6RWw2n2fhNqo=;
 b=cLyGe6Vfp/ZbXlGAJcu8s+oDyI+Cek5fSPumAUCPjd+TtrDcq8WnlTuq148AmmSefmwouf
 U4RljFOl7bpVd/jo/MMo7NW5c66AcB8pntylvfCw1TSAnl6S3l0D/M7WEba3xU2EPv7jkK
 R7PUFWJBwQxeCIeQqdKssk1UJ8FLB8Y=
Date: Tue, 17 Aug 2021 11:00:56 +0200
From: Borislav Petkov <bp@alien8.de>
To: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v2 05/12] x86/sme: Replace occurrences of sme_active()
 with prot_guest_has()
Message-ID: <YRt6yCNCBLwyyx5X@zn.tnic>
References: <cover.1628873970.git.thomas.lendacky@amd.com>
 <c6c38d6253dc78381f9ff0f1823b6ee5ddeefacc.1628873970.git.thomas.lendacky@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c6c38d6253dc78381f9ff0f1823b6ee5ddeefacc.1628873970.git.thomas.lendacky@amd.com>
Cc: linux-efi@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Will Deacon <will@kernel.org>,
 linux-s390@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 linux-graphics-maintainer@vmware.com, Joerg Roedel <jroedel@suse.de>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
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

On Fri, Aug 13, 2021 at 11:59:24AM -0500, Tom Lendacky wrote:
> diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
> index edc67ddf065d..5635ca9a1fbe 100644
> --- a/arch/x86/mm/mem_encrypt.c
> +++ b/arch/x86/mm/mem_encrypt.c
> @@ -144,7 +144,7 @@ void __init sme_unmap_bootdata(char *real_mode_data)
>  	struct boot_params *boot_data;
>  	unsigned long cmdline_paddr;
>  
> -	if (!sme_active())
> +	if (!amd_prot_guest_has(PATTR_SME))
>  		return;
>  
>  	/* Get the command line address before unmapping the real_mode_data */
> @@ -164,7 +164,7 @@ void __init sme_map_bootdata(char *real_mode_data)
>  	struct boot_params *boot_data;
>  	unsigned long cmdline_paddr;
>  
> -	if (!sme_active())
> +	if (!amd_prot_guest_has(PATTR_SME))
>  		return;
>  
>  	__sme_early_map_unmap_mem(real_mode_data, sizeof(boot_params), true);
> @@ -378,7 +378,7 @@ bool sev_active(void)
>  	return sev_status & MSR_AMD64_SEV_ENABLED;
>  }
>  
> -bool sme_active(void)
> +static bool sme_active(void)

Just get rid of it altogether. Also, there's an

EXPORT_SYMBOL_GPL(sev_active);

which needs to go under the actual function. Here's a diff ontop:

---
diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
index 5635ca9a1fbe..a3a2396362a5 100644
--- a/arch/x86/mm/mem_encrypt.c
+++ b/arch/x86/mm/mem_encrypt.c
@@ -364,8 +364,9 @@ int __init early_set_memory_encrypted(unsigned long vaddr, unsigned long size)
 /*
  * SME and SEV are very similar but they are not the same, so there are
  * times that the kernel will need to distinguish between SME and SEV. The
- * sme_active() and sev_active() functions are used for this.  When a
- * distinction isn't needed, the mem_encrypt_active() function can be used.
+ * PATTR_HOST_MEM_ENCRYPT and PATTR_GUEST_MEM_ENCRYPT flags to
+ * amd_prot_guest_has() are used for this. When a distinction isn't needed,
+ * the mem_encrypt_active() function can be used.
  *
  * The trampoline code is a good example for this requirement.  Before
  * paging is activated, SME will access all memory as decrypted, but SEV
@@ -377,11 +378,6 @@ bool sev_active(void)
 {
 	return sev_status & MSR_AMD64_SEV_ENABLED;
 }
-
-static bool sme_active(void)
-{
-	return sme_me_mask && !sev_active();
-}
 EXPORT_SYMBOL_GPL(sev_active);
 
 /* Needs to be called from non-instrumentable code */
@@ -398,7 +394,7 @@ bool amd_prot_guest_has(unsigned int attr)
 
 	case PATTR_SME:
 	case PATTR_HOST_MEM_ENCRYPT:
-		return sme_active();
+		return sme_me_mask && !sev_active();
 
 	case PATTR_SEV:
 	case PATTR_GUEST_MEM_ENCRYPT:

>  {
>  	return sme_me_mask && !sev_active();
>  }
> @@ -428,7 +428,7 @@ bool force_dma_unencrypted(struct device *dev)
>  	 * device does not support DMA to addresses that include the
>  	 * encryption mask.
>  	 */
> -	if (sme_active()) {
> +	if (amd_prot_guest_has(PATTR_SME)) {

So I'm not sure: you add PATTR_SME which you call with
amd_prot_guest_has() and PATTR_HOST_MEM_ENCRYPT which you call with
prot_guest_has() and they both end up being the same thing on AMD.

So why even bother with PATTR_SME?

This is only going to cause confusion later and I'd say let's simply use
prot_guest_has(PATTR_HOST_MEM_ENCRYPT) everywhere...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
