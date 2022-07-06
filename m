Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB405696C9
	for <lists.iommu@lfdr.de>; Thu,  7 Jul 2022 02:17:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F7C740104;
	Thu,  7 Jul 2022 00:17:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F7C740104
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eJwRJaLj
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bRJ_poXd1vBD; Thu,  7 Jul 2022 00:17:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 56BA140C3C;
	Thu,  7 Jul 2022 00:17:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56BA140C3C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2E599C0077;
	Thu,  7 Jul 2022 00:17:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5EA87C0071
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 19:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3941F40120
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 19:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3941F40120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FyYihjOJWEm9 for <iommu@lists.linux-foundation.org>;
 Wed,  6 Jul 2022 19:51:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6193B400E9
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6193B400E9
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 19:51:35 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id k30so12455150edk.8
 for <iommu@lists.linux-foundation.org>; Wed, 06 Jul 2022 12:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uVRJxLaJq0X2dTEVHdjs/5npr6gEQxLAwcn1IdURs/k=;
 b=eJwRJaLjPY6p5OlY+dBZS+pQVxXthYVL1N5jmkzT/c94q/b9iLcykBlgK1Du7PYrbj
 MxeFxICUJdjjcV4pgyo6rucoawbvITuvIkDRgC3y6E0n3STMKsOWkCwG5d7oPtTTKfaQ
 CFJbvl3MaraUV2zfvMLcdpwYHQKkjh3E7iJ+ZuipphJXXm+sIz2ZtJKGA+lV1IAJKXp6
 gIDZb7UUy806TIzAtvVMLr5gXqD9LzJuCS61E1hq0d01/JhNgeMip92sz5laViF3SkKM
 OJDCVy+nMHqMI6LD/lQHtr3WAK81du9NPbq0PKiyiXcAkgdviF3QyjkUjKFU06wnf7Gi
 pZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uVRJxLaJq0X2dTEVHdjs/5npr6gEQxLAwcn1IdURs/k=;
 b=CbWLk+KXqJpJP/7ds4ndpjYpXHBvMBuMaw06Sge1mKD57QaIcnuZSn1EVubkE4NP/4
 nAs8uHQ92rkgOvSuOEl0TSkZ0TteAY9Sp4tVWqSAtrcK+wSlwNLVlMsXdEqxv2mDEc51
 3WiAgs5P50uqbcdmI4EyjYkAd42MKtTxnLBpTBi/B5DpaPFD6Wy0IXWJigsnc4K2slfW
 R6t3iDUIKgR6UCOeGVVQgAP69Mw2ETV+nLSfbhh1cAlbLZegi6mD7YdyoCdA/nymsxbG
 FWmCkQ7HAssdd2M53XXDmMEMglSgy33kHRfp3wl4ZBXSXzpvdA3iT7kWVV94Sg4CKhd3
 uQhQ==
X-Gm-Message-State: AJIora+n+WzmnMPq1w8ZJdIbWBVen647+H3A9ETezPTR6WucWhYIPgcs
 r1sDiRO59RRcidkS6YnWLJo=
X-Google-Smtp-Source: AGRyM1tywxH6QPdE1PtguR+LhaF12MVypJNb2omAg0HEbg3t9kWKGwOUtVflZEIr6YXGTMyib1Cy6w==
X-Received: by 2002:aa7:c45a:0:b0:435:d7a4:99bc with SMTP id
 n26-20020aa7c45a000000b00435d7a499bcmr56253345edr.158.1657137093482; 
 Wed, 06 Jul 2022 12:51:33 -0700 (PDT)
Received: from anparri.mshome.net (host-79-49-199-193.retail.telecomitalia.it.
 [79.49.199.193]) by smtp.gmail.com with ESMTPSA id
 kz11-20020a17090777cb00b0072af18329c4sm1968127ejc.225.2022.07.06.12.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 12:51:33 -0700 (PDT)
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
Subject: [RFC PATCH 2/2] dma-direct: Fix dma_direct_{alloc,
 free}() for Hyperv-V IVMs
Date: Wed,  6 Jul 2022 21:50:27 +0200
Message-Id: <20220706195027.76026-3-parri.andrea@gmail.com>
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

In Hyper-V AMD SEV-SNP Isolated VMs, the virtual address returned by
dma_direct_alloc() must map above dma_unencrypted_base because the
memory is shared with the hardware device and must not be encrypted.

Modify dma_direct_alloc() to do the necessary remapping.  In
dma_direct_free(), use the (unmodified) DMA address to derive the
original virtual address and re-encrypt the pages.

Suggested-by: Michael Kelley <mikelley@microsoft.com>
Co-developed-by: Dexuan Cui <decui@microsoft.com>
Signed-off-by: Dexuan Cui <decui@microsoft.com>
Signed-off-by: Andrea Parri (Microsoft) <parri.andrea@gmail.com>
---
 kernel/dma/direct.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 06b2b901e37a3..c4ce277687a49 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -13,6 +13,7 @@
 #include <linux/vmalloc.h>
 #include <linux/set_memory.h>
 #include <linux/slab.h>
+#include <linux/io.h> /* for memremap() */
 #include "direct.h"
 
 /*
@@ -305,6 +306,21 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 		ret = page_address(page);
 		if (dma_set_decrypted(dev, ret, size))
 			goto out_free_pages;
+#ifdef CONFIG_HAS_IOMEM
+		/*
+		 * Remap the pages in the unencrypted physical address space
+		 * when dma_unencrypted_base is set (e.g., for Hyper-V AMD
+		 * SEV-SNP isolated guests).
+		 */
+		if (dma_unencrypted_base) {
+			phys_addr_t ret_pa = virt_to_phys(ret);
+
+			ret_pa += dma_unencrypted_base;
+			ret = memremap(ret_pa, size, MEMREMAP_WB);
+			if (!ret)
+				goto out_encrypt_pages;
+		}
+#endif
 	}
 
 	memset(ret, 0, size);
@@ -360,11 +376,23 @@ void dma_direct_free(struct device *dev, size_t size,
 	    dma_free_from_pool(dev, cpu_addr, PAGE_ALIGN(size)))
 		return;
 
-	if (is_vmalloc_addr(cpu_addr)) {
+	/*
+	 * If dma_unencrypted_base is set, the virtual address returned by
+	 * dma_direct_alloc() is in the vmalloc address range.
+	 */
+	if (!dma_unencrypted_base && is_vmalloc_addr(cpu_addr)) {
 		vunmap(cpu_addr);
 	} else {
 		if (IS_ENABLED(CONFIG_ARCH_HAS_DMA_CLEAR_UNCACHED))
 			arch_dma_clear_uncached(cpu_addr, size);
+#ifdef CONFIG_HAS_IOMEM
+		if (dma_unencrypted_base) {
+			memunmap(cpu_addr);
+			/* re-encrypt the pages using the original address */
+			cpu_addr = page_address(pfn_to_page(PHYS_PFN(
+					dma_to_phys(dev, dma_addr))));
+		}
+#endif
 		if (dma_set_encrypted(dev, cpu_addr, size))
 			return;
 	}
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
