Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8045696C8
	for <lists.iommu@lfdr.de>; Thu,  7 Jul 2022 02:17:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9648A41869;
	Thu,  7 Jul 2022 00:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9648A41869
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WD0C7sqA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c4E0uHrRdgBc; Thu,  7 Jul 2022 00:17:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 18FDF4189A;
	Thu,  7 Jul 2022 00:17:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18FDF4189A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F26C8C002D;
	Thu,  7 Jul 2022 00:17:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BBB94C002D
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 19:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9501540120
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 19:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9501540120
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WD0C7sqA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KcEOBUrHuOJx for <iommu@lists.linux-foundation.org>;
 Wed,  6 Jul 2022 19:51:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39C87400E9
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39C87400E9
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 19:51:32 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id fd6so20574483edb.5
 for <iommu@lists.linux-foundation.org>; Wed, 06 Jul 2022 12:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=940NON5ZiCzvUCu0CiIkGxD8PkrHui9fksTxAlvFF2Q=;
 b=WD0C7sqAbS/txx8ZqA2ZODw2GWOvOZUpy0KcNt4GEbk3hexy6PqipKnUOgnU/RQZj7
 DAPrsGVCzF2QPmv9S6BDYMgfx9Ic7s1TIWhwJSf5xBaivP9Ymlr9cWWFdW78LXCa3ZJc
 zdIU2bTW3ijEsmGqK7YeX+sgqONpDpotZUTnlmvDJ0YT4D/t1pYpKal5WjL2bp5NUxNu
 PcOP/CfQqL+bX9x27rKyKKehJ6719Bl0f7yb+57RBkEOO6GZtffD2YffmLbr9nRfGTi2
 GrbJNHqUcZNtdn52CTSFohmmQ6/2uaCCLchXKCO8IHROMUd7DXmlGifRDXi6wOjdOEog
 GtrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=940NON5ZiCzvUCu0CiIkGxD8PkrHui9fksTxAlvFF2Q=;
 b=uLVc7/E9b3U3Mw06wb67woc80gww+06ITH8wsABTeP7/fHYPMhPVho8KwpcStDdsh8
 u9WVHeMr0p/hwDFlihumPuAOgj9S0a4v8Plgd8AQIYhp+k0H3fQVI3mSYb4QH04JI8Ca
 vT/108vdpWE0fwtUab3PCjcgPwncoE1Wi7UdFtbqOTgmGk3xAZRp+Dwp8jUZcoz/dgZn
 A1cTPkbmR9qbhPpBrBiq1QMPrxFx58RyoeABrU0xh2xxMF7V7A1xY5Kr1sbzAk/l99nc
 SUUs0OXwfRMmcDEmoSXaUFQwv3bz7lzL+cT/8JaR0nZF7GBnS9xwNO2wPTID9HrCwH/M
 Nydw==
X-Gm-Message-State: AJIora8ULHK8BNVjKYpMzWw01BCCim15WaygL2g3a0Xi8sh3RcTnuc3s
 j0ZFAwO+KH9Hcb4c4e75fcE=
X-Google-Smtp-Source: AGRyM1uUFyCfr9/9lM3NU3hu2Vav+/0R7nlwqn8fsfMebpuG36p/QatZHggyU+N4+LYrdP/Tmf2M8A==
X-Received: by 2002:a05:6402:4507:b0:43a:5b42:2be5 with SMTP id
 ez7-20020a056402450700b0043a5b422be5mr23610276edb.392.1657137090388; 
 Wed, 06 Jul 2022 12:51:30 -0700 (PDT)
Received: from anparri.mshome.net (host-79-49-199-193.retail.telecomitalia.it.
 [79.49.199.193]) by smtp.gmail.com with ESMTPSA id
 kz11-20020a17090777cb00b0072af18329c4sm1968127ejc.225.2022.07.06.12.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 12:51:30 -0700 (PDT)
From: "Andrea Parri (Microsoft)" <parri.andrea@gmail.com>
To: Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, KY Srinivasan <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Michael Kelley <mikelley@microsoft.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Peter Anvin <hpa@zytor.com>
Subject: [RFC PATCH 1/2] swiotlb,
 dma-direct: Move swiotlb_unencrypted_base to direct.c
Date: Wed,  6 Jul 2022 21:50:26 +0200
Message-Id: <20220706195027.76026-2-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220706195027.76026-1-parri.andrea@gmail.com>
References: <20220706195027.76026-1-parri.andrea@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 07 Jul 2022 00:17:33 +0000
Cc: "Andrea Parri \(Microsoft\)" <parri.andrea@gmail.com>,
 linux-hyperv@vger.kernel.org, iommu@lists.linux.dev, x86@kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
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

The variable will come in handy to enable dma_direct_{alloc,free}()
for Hyper-V AMD SEV-SNP Isolated VMs.

Rename swiotlb_unencrypted_base to dma_unencrypted_base to indicate
that the notion is not restricted to SWIOTLB.

No functional change.

Suggested-by: Michael Kelley <mikelley@microsoft.com>
Signed-off-by: Andrea Parri (Microsoft) <parri.andrea@gmail.com>
---
Yeah, this is in some sense trading the dependency on SWIOTLB for a
dependency on HAS_DMA:

Q1. I'm unable to envision a scenario where SWIOTLB without HAS_DMA
would make sense but I'm also expecting one of the kernel test bots
to try such a nonsensical configuration... should the references to
dma_unencrypted_base in swiotlb.c be protected with HAS_DMA? other?

Q2. Can the #ifdef CONFIG_HAS_DMA in arch/x86/kernel/cpu/mshyperv.c
be removed? can we make HYPERV "depends on HAS_DMA"?

...

 arch/x86/kernel/cpu/mshyperv.c |  6 +++---
 include/linux/dma-direct.h     |  2 ++
 include/linux/swiotlb.h        |  2 --
 kernel/dma/direct.c            |  8 ++++++++
 kernel/dma/swiotlb.c           | 12 +++++-------
 5 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index 831613959a92a..47e9cece86ff8 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -18,7 +18,7 @@
 #include <linux/kexec.h>
 #include <linux/i8253.h>
 #include <linux/random.h>
-#include <linux/swiotlb.h>
+#include <linux/dma-direct.h>
 #include <asm/processor.h>
 #include <asm/hypervisor.h>
 #include <asm/hyperv-tlfs.h>
@@ -333,8 +333,8 @@ static void __init ms_hyperv_init_platform(void)
 
 		if (hv_get_isolation_type() == HV_ISOLATION_TYPE_SNP) {
 			static_branch_enable(&isolation_type_snp);
-#ifdef CONFIG_SWIOTLB
-			swiotlb_unencrypted_base = ms_hyperv.shared_gpa_boundary;
+#ifdef CONFIG_HAS_DMA
+			dma_unencrypted_base = ms_hyperv.shared_gpa_boundary;
 #endif
 		}
 		/* Isolation VMs are unenlightened SEV-based VMs, thus this check: */
diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index 18aade195884d..0b7e4c4b7b34c 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -14,6 +14,8 @@
 
 extern unsigned int zone_dma_bits;
 
+extern phys_addr_t dma_unencrypted_base;
+
 /*
  * Record the mapping of CPU physical to DMA addresses for a given region.
  */
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 7ed35dd3de6e7..fa2e85f21af61 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -190,6 +190,4 @@ static inline bool is_swiotlb_for_alloc(struct device *dev)
 }
 #endif /* CONFIG_DMA_RESTRICTED_POOL */
 
-extern phys_addr_t swiotlb_unencrypted_base;
-
 #endif /* __LINUX_SWIOTLB_H */
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 8d0b68a170422..06b2b901e37a3 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -22,6 +22,14 @@
  */
 unsigned int zone_dma_bits __ro_after_init = 24;
 
+/*
+ * Certain Confidential Computing solutions, such as Hyper-V AMD SEV-SNP
+ * isolated VMs, use dma_unencrypted_base as a watermark: memory addresses
+ * below dma_unencrypted_base are treated as private, while memory above
+ * dma_unencrypted_base is treated as shared.
+ */
+phys_addr_t dma_unencrypted_base;
+
 static inline dma_addr_t phys_to_dma_direct(struct device *dev,
 		phys_addr_t phys)
 {
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index cb50f8d383606..78d4f5294a56c 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -67,8 +67,6 @@ static bool swiotlb_force_disable;
 
 struct io_tlb_mem io_tlb_default_mem;
 
-phys_addr_t swiotlb_unencrypted_base;
-
 static unsigned long default_nslabs = IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
 
 static int __init
@@ -142,7 +140,7 @@ static inline unsigned long nr_slots(u64 val)
 
 /*
  * Remap swioltb memory in the unencrypted physical address space
- * when swiotlb_unencrypted_base is set. (e.g. for Hyper-V AMD SEV-SNP
+ * when dma_unencrypted_base is set. (e.g. for Hyper-V AMD SEV-SNP
  * Isolation VMs).
  */
 #ifdef CONFIG_HAS_IOMEM
@@ -150,8 +148,8 @@ static void *swiotlb_mem_remap(struct io_tlb_mem *mem, unsigned long bytes)
 {
 	void *vaddr = NULL;
 
-	if (swiotlb_unencrypted_base) {
-		phys_addr_t paddr = mem->start + swiotlb_unencrypted_base;
+	if (dma_unencrypted_base) {
+		phys_addr_t paddr = mem->start + dma_unencrypted_base;
 
 		vaddr = memremap(paddr, bytes, MEMREMAP_WB);
 		if (!vaddr)
@@ -213,10 +211,10 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
 	}
 
 	/*
-	 * If swiotlb_unencrypted_base is set, the bounce buffer memory will
+	 * If dma_unencrypted_base is set, the bounce buffer memory will
 	 * be remapped and cleared in swiotlb_update_mem_attributes.
 	 */
-	if (swiotlb_unencrypted_base)
+	if (dma_unencrypted_base)
 		return;
 
 	memset(vaddr, 0, bytes);
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
