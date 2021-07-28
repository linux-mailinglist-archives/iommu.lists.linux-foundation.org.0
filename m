Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC2F3D9101
	for <lists.iommu@lfdr.de>; Wed, 28 Jul 2021 16:53:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BF2140691;
	Wed, 28 Jul 2021 14:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QOq8CrPzc9yv; Wed, 28 Jul 2021 14:53:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7BF334068B;
	Wed, 28 Jul 2021 14:53:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66688C000E;
	Wed, 28 Jul 2021 14:53:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3EBFFC000E
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 14:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D8DB4067F
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 14:53:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D9g0QA9lpn8v for <iommu@lists.linux-foundation.org>;
 Wed, 28 Jul 2021 14:53:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 886C0406A8
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 14:53:30 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id q2so2967457plr.11
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 07:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fRYEBTeqaJZ2nuhpRxylpNXV0HYL+RYR+rak5A96Ekw=;
 b=sig9nFz8eF+R0264OvGZWIOLFWHbYjYEwR2pu5Gx18nTH1XR1cSX7qthexUthkJGnF
 pJ3gnLUuVZV82sVUwcehqWiFsrDdsp1tZqg/jE/39e470wf89bUSF5Q65P+BWFm5oA6l
 tdiu0+NkRbrdrY5sf+SlZYMVQQRnay/soDyBm9yR+3Sk7hPDtBJcXtSKp6bbcAlin5vP
 TxrwmdY7JJpG3nMN0Kpik8j7JBNr1h1zSYFRfmYey7tr/PqG3AfyBn5BZzutMLEWs9dk
 Q8BFOoHDdjXEgX/RmQsfZ/nngsOe/X2TpZTA23wyhqE+8CwnuHHe28EpNrXDO0BWSkNE
 89qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fRYEBTeqaJZ2nuhpRxylpNXV0HYL+RYR+rak5A96Ekw=;
 b=REyyRnNSjcn4ZZTSrmEF1w8D87bPM/q+bYmQEwQWBt7OW0PNUZnRdRO45srAYoi3Wk
 pbQ51qLXyelykgqmAWUUUBB+lqiEz6LXyCKcoLKHHfr356sZkKNDPjENwYu9gjw34sRS
 TKkW8630P50o7pi0JIRj1A6140sRI5XbI/aXsLZV3dmikJDv2AF0Lggy8jLuCNcGCUXX
 oi6m0m9bu2gaooxNQJuRTUvixQ7G1RBvdTH1IfNt0PtMJF101xhtsCCa1joPokUZh/5A
 3P2qPXcyUd/IOajB6ZU7X17e5P8ARUH6p1ZvuJ5MJyM5X1sZyJDsdw5W5OwEZRi6dR/8
 RIeg==
X-Gm-Message-State: AOAM53093Qr3bsaj8dAJ7T/znX6vk5zPkemR73G/N0L5+LgUTu5IZG+O
 wL9jfps9se8y91C65sZ0hzY=
X-Google-Smtp-Source: ABdhPJw5OcxnrbSJBNvT8e2xeKUOHmvmo/7aRU5B5UYJ8E3STm6ku1q9/sANkCbS99R2obrk00cckA==
X-Received: by 2002:a17:90b:385:: with SMTP id
 ga5mr6922305pjb.183.1627484010063; 
 Wed, 28 Jul 2021 07:53:30 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:0:3823:141e:6d51:f0ad])
 by smtp.gmail.com with ESMTPSA id n134sm277558pfd.89.2021.07.28.07.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 07:53:29 -0700 (PDT)
From: Tianyu Lan <ltykernel@gmail.com>
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
 davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, arnd@arndb.de, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com, thomas.lendacky@amd.com,
 brijesh.singh@amd.com, ardb@kernel.org, Tianyu.Lan@microsoft.com,
 rientjes@google.com, martin.b.radev@gmail.com, akpm@linux-foundation.org,
 rppt@kernel.org, kirill.shutemov@linux.intel.com,
 aneesh.kumar@linux.ibm.com, krish.sadhukhan@oracle.com, saravanand@fb.com,
 xen-devel@lists.xenproject.org, pgonda@google.com, david@redhat.com,
 keescook@chromium.org, hannes@cmpxchg.org, sfr@canb.auug.org.au,
 michael.h.kelley@microsoft.com
Subject: [PATCH 09/13] DMA: Add dma_map_decrypted/dma_unmap_encrypted()
 function
Date: Wed, 28 Jul 2021 10:52:24 -0400
Message-Id: <20210728145232.285861-10-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728145232.285861-1-ltykernel@gmail.com>
References: <20210728145232.285861-1-ltykernel@gmail.com>
MIME-Version: 1.0
Cc: linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 anparri@microsoft.com, vkuznets@redhat.com
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

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

In Hyper-V Isolation VM with AMD SEV, swiotlb boucne buffer
needs to be mapped into address space above vTOM and so
introduce dma_map_decrypted/dma_unmap_encrypted() to map/unmap
bounce buffer memory. The platform can populate man/unmap callback
in the dma memory decrypted ops.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 include/linux/dma-map-ops.h |  9 +++++++++
 kernel/dma/mapping.c        | 22 ++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 0d53a96a3d64..01d60a024e45 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -71,6 +71,11 @@ struct dma_map_ops {
 	unsigned long (*get_merge_boundary)(struct device *dev);
 };
 
+struct dma_memory_decrypted_ops {
+	void *(*map)(void *addr, unsigned long size);
+	void (*unmap)(void *addr);
+};
+
 #ifdef CONFIG_DMA_OPS
 #include <asm/dma-mapping.h>
 
@@ -374,6 +379,10 @@ static inline void debug_dma_dump_mappings(struct device *dev)
 }
 #endif /* CONFIG_DMA_API_DEBUG */
 
+void *dma_map_decrypted(void *addr, unsigned long size);
+int dma_unmap_decrypted(void *addr, unsigned long size);
+
 extern const struct dma_map_ops dma_dummy_ops;
+extern struct dma_memory_decrypted_ops dma_memory_generic_decrypted_ops;
 
 #endif /* _LINUX_DMA_MAP_OPS_H */
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 2b06a809d0b9..6fb150dc1750 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -13,11 +13,13 @@
 #include <linux/of_device.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
+#include <asm/set_memory.h>
 #include "debug.h"
 #include "direct.h"
 
 bool dma_default_coherent;
 
+struct dma_memory_decrypted_ops dma_memory_generic_decrypted_ops;
 /*
  * Managed DMA API
  */
@@ -736,3 +738,23 @@ unsigned long dma_get_merge_boundary(struct device *dev)
 	return ops->get_merge_boundary(dev);
 }
 EXPORT_SYMBOL_GPL(dma_get_merge_boundary);
+
+void *dma_map_decrypted(void *addr, unsigned long size)
+{
+	if (set_memory_decrypted((unsigned long)addr,
+				 size / PAGE_SIZE))
+		return NULL;
+
+	if (dma_memory_generic_decrypted_ops.map)
+		return dma_memory_generic_decrypted_ops.map(addr, size);
+	else
+		return addr;
+}
+
+int dma_unmap_encrypted(void *addr, unsigned long size)
+{
+	if (dma_memory_generic_decrypted_ops.unmap)
+		dma_memory_generic_decrypted_ops.unmap(addr);
+
+	return set_memory_encrypted((unsigned long)addr, size / PAGE_SIZE);
+}
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
