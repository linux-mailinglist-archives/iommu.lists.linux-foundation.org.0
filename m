Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A86940AF36
	for <lists.iommu@lfdr.de>; Tue, 14 Sep 2021 15:39:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC67C80E85;
	Tue, 14 Sep 2021 13:39:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sZlOGCa12ZwV; Tue, 14 Sep 2021 13:39:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id CE8FC80DB8;
	Tue, 14 Sep 2021 13:39:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6402C000D;
	Tue, 14 Sep 2021 13:39:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC9DCC000D
 for <iommu@lists.linux-foundation.org>; Tue, 14 Sep 2021 13:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9956C40359
 for <iommu@lists.linux-foundation.org>; Tue, 14 Sep 2021 13:39:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ua8XPvMh3lGW for <iommu@lists.linux-foundation.org>;
 Tue, 14 Sep 2021 13:39:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E26040369
 for <iommu@lists.linux-foundation.org>; Tue, 14 Sep 2021 13:39:47 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id r2so12726137pgl.10
 for <iommu@lists.linux-foundation.org>; Tue, 14 Sep 2021 06:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=owa2epIC/5mze9MxnGBTWuFjw26S5l9iHD474a0FPZY=;
 b=YPR0RRcFGHUBaUpbP9gJUeI5hFz/Ykc2vEDRk21Y+Hx2ak94WCKoxp0mcESjgioo67
 zQ0QtdVf0Bv2thg+qZaXcGTuwv8ZB/9ONE9jPeCXqMp2Inclm/3Hhux53T4BLmW7uz90
 j7APkz+ekg0qxBWYqZuPr9Uy9XzMQeYfkCqJqS/Wzvh1ec7KuAQZ7pi6wk63IJlMzJ4i
 2oz+AnJOtCDleuDhptkGHliv7R41SodRqvAJ7f3Fb1eGVT1WzZv2aCriGL1Fh2H9+Gg/
 t9SRIkFCG/H7bZf6edW4ThgnW3aT2vnhMToatGUVRBJ7o+6iRnTqJSTDYkSghGECv/mb
 un1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=owa2epIC/5mze9MxnGBTWuFjw26S5l9iHD474a0FPZY=;
 b=0GC7PMCJ1zGQLbconxPs97+t/vkq3mBBsAIc20h8DqcypEiEF+ZeHhH8FQhbBq0hbv
 pHCuu0ZcWWThQt6aqoI7hFkQID6YDxgIdS3k+qqxZMQ3FLp5zzaioL/nYjAXi9K7Xg8x
 htzv6R+ix7G3OPaIninkRFSHh5+ZUW9OfLr3uNzMA16JEj6YhXES3CvRxxqoyll2DFPc
 2qqQycu2NEARU3mW+RMm7lRZwdYu1Ou4IWdaL7mlwYsfg1NMKvhdXMCO5XykZGoXQzzg
 SKjZ57EqNScjFkH7rJwDhchTZk8pPeykTztIE3C4G8eTn76NYRADE/+CBQkpOhArki4S
 baYQ==
X-Gm-Message-State: AOAM533O3EHBxOFlOhXDuhrEy2xc9cP7CI4LpeAJ3g9RN/PE9fs1cDNW
 kputw64RR8EKHiVQxXeF8aU=
X-Google-Smtp-Source: ABdhPJxXTtvlP911RHquYd4PWMjAFBqIUg4/wztNKPqgo3aV/dGiro8zblLWz9doF4YohiyUAH/bGw==
X-Received: by 2002:a05:6a00:2449:b0:43c:4a5e:55a6 with SMTP id
 d9-20020a056a00244900b0043c4a5e55a6mr4918302pfj.43.1631626786861; 
 Tue, 14 Sep 2021 06:39:46 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:7:6ea2:a529:4af3:5057])
 by smtp.gmail.com with ESMTPSA id v13sm10461234pfm.16.2021.09.14.06.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 06:39:46 -0700 (PDT)
From: Tianyu Lan <ltykernel@gmail.com>
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
 davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, gregkh@linuxfoundation.org, arnd@arndb.de,
 hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com,
 brijesh.singh@amd.com, Tianyu.Lan@microsoft.com, thomas.lendacky@amd.com,
 pgonda@google.com, akpm@linux-foundation.org,
 kirill.shutemov@linux.intel.com, rppt@kernel.org, sfr@canb.auug.org.au,
 aneesh.kumar@linux.ibm.com, saravanand@fb.com, krish.sadhukhan@oracle.com,
 xen-devel@lists.xenproject.org, tj@kernel.org, rientjes@google.com,
 michael.h.kelley@microsoft.com
Subject: [PATCH V5 09/12] x86/Swiotlb: Add Swiotlb bounce buffer remap
 function for HV IVM
Date: Tue, 14 Sep 2021 09:39:10 -0400
Message-Id: <20210914133916.1440931-10-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914133916.1440931-1-ltykernel@gmail.com>
References: <20210914133916.1440931-1-ltykernel@gmail.com>
MIME-Version: 1.0
Cc: linux-arch@vger.kernel.org, parri.andrea@gmail.com,
 linux-hyperv@vger.kernel.org, linux-scsi@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, dave.hansen@intel.com,
 iommu@lists.linux-foundation.org, vkuznets@redhat.com
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

In Isolation VM with AMD SEV, bounce buffer needs to be accessed via
extra address space which is above shared_gpa_boundary
(E.G 39 bit address line) reported by Hyper-V CPUID ISOLATION_CONFIG.
The access physical address will be original physical address +
shared_gpa_boundary. The shared_gpa_boundary in the AMD SEV SNP
spec is called virtual top of memory(vTOM). Memory addresses below
vTOM are automatically treated as private while memory above
vTOM is treated as shared.

Expose swiotlb_unencrypted_base for platforms to set unencrypted
memory base offset and call memremap() to map bounce buffer in the
swiotlb code, store map address and use the address to copy data
from/to swiotlb bounce buffer.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
Change since v4:
	* Expose swiotlb_unencrypted_base to set unencrypted memory
	  offset.
	* Use memremap() to map bounce buffer if swiotlb_unencrypted_
	  base is set.

Change since v1:
	* Make swiotlb_init_io_tlb_mem() return error code and return
          error when dma_map_decrypted() fails.
---
 include/linux/swiotlb.h |  6 ++++++
 kernel/dma/swiotlb.c    | 41 +++++++++++++++++++++++++++++++++++------
 2 files changed, 41 insertions(+), 6 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index b0cb2a9973f4..4998ed44ae3d 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -72,6 +72,9 @@ extern enum swiotlb_force swiotlb_force;
  * @end:	The end address of the swiotlb memory pool. Used to do a quick
  *		range check to see if the memory was in fact allocated by this
  *		API.
+ * @vaddr:	The vaddr of the swiotlb memory pool. The swiotlb
+ *		memory pool may be remapped in the memory encrypted case and store
+ *		virtual address for bounce buffer operation.
  * @nslabs:	The number of IO TLB blocks (in groups of 64) between @start and
  *		@end. For default swiotlb, this is command line adjustable via
  *		setup_io_tlb_npages.
@@ -91,6 +94,7 @@ extern enum swiotlb_force swiotlb_force;
 struct io_tlb_mem {
 	phys_addr_t start;
 	phys_addr_t end;
+	void *vaddr;
 	unsigned long nslabs;
 	unsigned long used;
 	unsigned int index;
@@ -185,4 +189,6 @@ static inline bool is_swiotlb_for_alloc(struct device *dev)
 }
 #endif /* CONFIG_DMA_RESTRICTED_POOL */
 
+extern phys_addr_t swiotlb_unencrypted_base;
+
 #endif /* __LINUX_SWIOTLB_H */
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 87c40517e822..9e30cc4bd872 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -50,6 +50,7 @@
 #include <asm/io.h>
 #include <asm/dma.h>
 
+#include <linux/io.h>
 #include <linux/init.h>
 #include <linux/memblock.h>
 #include <linux/iommu-helper.h>
@@ -72,6 +73,8 @@ enum swiotlb_force swiotlb_force;
 
 struct io_tlb_mem io_tlb_default_mem;
 
+phys_addr_t swiotlb_unencrypted_base;
+
 /*
  * Max segment that we can provide which (if pages are contingous) will
  * not be bounced (unless SWIOTLB_FORCE is set).
@@ -175,7 +178,7 @@ void __init swiotlb_update_mem_attributes(void)
 	memset(vaddr, 0, bytes);
 }
 
-static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
+static int swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
 				    unsigned long nslabs, bool late_alloc)
 {
 	void *vaddr = phys_to_virt(start);
@@ -196,13 +199,34 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
 		mem->slots[i].orig_addr = INVALID_PHYS_ADDR;
 		mem->slots[i].alloc_size = 0;
 	}
+
+	if (set_memory_decrypted((unsigned long)vaddr, bytes >> PAGE_SHIFT))
+		return -EFAULT;
+
+	/*
+	 * Map memory in the unencrypted physical address space when requested
+	 * (e.g. for Hyper-V AMD SEV-SNP Isolation VMs).
+	 */
+	if (swiotlb_unencrypted_base) {
+		phys_addr_t paddr = __pa(vaddr) + swiotlb_unencrypted_base;
+
+		vaddr = memremap(paddr, bytes, MEMREMAP_WB);
+		if (!vaddr) {
+			pr_err("Failed to map the unencrypted memory.\n");
+			return -ENOMEM;
+		}
+	}
+
 	memset(vaddr, 0, bytes);
+	mem->vaddr = vaddr;
+	return 0;
 }
 
 int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
 {
 	struct io_tlb_mem *mem = &io_tlb_default_mem;
 	size_t alloc_size;
+	int ret;
 
 	if (swiotlb_force == SWIOTLB_NO_FORCE)
 		return 0;
@@ -217,7 +241,11 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
 		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
 		      __func__, alloc_size, PAGE_SIZE);
 
-	swiotlb_init_io_tlb_mem(mem, __pa(tlb), nslabs, false);
+	ret = swiotlb_init_io_tlb_mem(mem, __pa(tlb), nslabs, false);
+	if (ret) {
+		memblock_free(__pa(mem), alloc_size);
+		return ret;
+	}
 
 	if (verbose)
 		swiotlb_print_info();
@@ -304,7 +332,7 @@ int
 swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 {
 	struct io_tlb_mem *mem = &io_tlb_default_mem;
-	unsigned long bytes = nslabs << IO_TLB_SHIFT;
+	int ret;
 
 	if (swiotlb_force == SWIOTLB_NO_FORCE)
 		return 0;
@@ -318,8 +346,9 @@ swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
 	if (!mem->slots)
 		return -ENOMEM;
 
-	set_memory_decrypted((unsigned long)tlb, bytes >> PAGE_SHIFT);
-	swiotlb_init_io_tlb_mem(mem, virt_to_phys(tlb), nslabs, true);
+	ret = swiotlb_init_io_tlb_mem(mem, virt_to_phys(tlb), nslabs, true);
+	if (ret)
+		return ret;
 
 	swiotlb_print_info();
 	swiotlb_set_max_segment(mem->nslabs << IO_TLB_SHIFT);
@@ -371,7 +400,7 @@ static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, size_t size
 	phys_addr_t orig_addr = mem->slots[index].orig_addr;
 	size_t alloc_size = mem->slots[index].alloc_size;
 	unsigned long pfn = PFN_DOWN(orig_addr);
-	unsigned char *vaddr = phys_to_virt(tlb_addr);
+	unsigned char *vaddr = mem->vaddr + tlb_addr - mem->start;
 	unsigned int tlb_offset, orig_addr_offset;
 
 	if (orig_addr == INVALID_PHYS_ADDR)
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
