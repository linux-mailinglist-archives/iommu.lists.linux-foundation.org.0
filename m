Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 619A43BEADA
	for <lists.iommu@lfdr.de>; Wed,  7 Jul 2021 17:35:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EF394059D;
	Wed,  7 Jul 2021 15:35:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w2lg3bmSQ6ZB; Wed,  7 Jul 2021 15:35:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6471440646;
	Wed,  7 Jul 2021 15:35:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3DB90C000E;
	Wed,  7 Jul 2021 15:35:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D2A6C000E
 for <iommu@lists.linux-foundation.org>; Wed,  7 Jul 2021 15:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E8A440630
 for <iommu@lists.linux-foundation.org>; Wed,  7 Jul 2021 15:35:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I_FIIVan31XM for <iommu@lists.linux-foundation.org>;
 Wed,  7 Jul 2021 15:35:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 775544059D
 for <iommu@lists.linux-foundation.org>; Wed,  7 Jul 2021 15:35:26 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id 17so2519326pfz.4
 for <iommu@lists.linux-foundation.org>; Wed, 07 Jul 2021 08:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vp54ZQawAXt49CkThDbFLyNwiKlz10UxxnQhsKUA4kk=;
 b=mwz531LG8VwujMK/fd5kQ/Q8ztNgBlPusuZpI54hFc8jgqOztkk7xMjkai9f1xw53X
 3jxlAZ4KOhdZzm/m4iKXDfDQhymoaUUYGhagpN7uMa8SDq+Sa/a+9QYq8IIiAk61RTQH
 FISIxcvVNyPYsimguuW+ypAYfEtcepFacqbJC/17qxvGWSlq60CpijWs/75jJZvZzyGb
 qvIKYMC9RmADtJQMWKkXUtdz8rboMK6L4hW0HIUXaeky620CVc2L3afCPwaINmrFFCRY
 JZYaWq9lQwV+TVAsHHKe80RS57OD7apJlBxNfhMxCkhzAHCrwmE8wU2j7aIcz7I+/im4
 RQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vp54ZQawAXt49CkThDbFLyNwiKlz10UxxnQhsKUA4kk=;
 b=EG/hfmezkMkSrWPBPDPLGBoygkSWAgI0gqaYKCFnkYnUt+Zr1DpTKoz8rKO+r5bvoE
 o+RMM70wfPNwtwOcs6jV/PEdrsWiEBdFiOTqVwWDrfaWRFc56b3smxWfx4BXBIFjffK9
 R81gdOYH1b+N3/DhYGKgnlccEshvqBxWpDHzMHs3DOz3f4aSmlsZzlf6Iy6L2ma0/YJz
 +OOveqadybfTLd1Zqa6ki+1AxFweLpfm6Y6uOUQj7FOuOsOYkX72ssn44w7VQkmehSGS
 0/jnNGD5MoqYA7YgwceLXbFXiHBQXoMVDLtPU4Fg1PgDrIStxMwdr0eTdtqCOGvdWbCP
 cmmQ==
X-Gm-Message-State: AOAM532U4w2eurAhBMKVUFWnJ5jeabjGGDncN799GvWXfiAwI/0vcyRE
 +Tfae9s8U3+1iZUhht9UoMQ=
X-Google-Smtp-Source: ABdhPJy/YtYVUOWKU35lbBAipCtqLf3uH0TJVUFZXqf0ls2icNYxU0hgKlwktbZS6t3Am5XVfFxACw==
X-Received: by 2002:a65:4286:: with SMTP id j6mr14062875pgp.10.1625672125944; 
 Wed, 07 Jul 2021 08:35:25 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:0:6b7f:cf3e:bbf2:d229])
 by smtp.gmail.com with ESMTPSA id y11sm21096877pfo.160.2021.07.07.08.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jul 2021 08:35:25 -0700 (PDT)
From: Tianyu Lan <ltykernel@gmail.com>
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
 davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, arnd@arndb.de, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com, rppt@kernel.org,
 akpm@linux-foundation.org, kirill.shutemov@linux.intel.com,
 Tianyu.Lan@microsoft.com, thomas.lendacky@amd.com, ardb@kernel.org,
 nramas@linux.microsoft.com, robh@kernel.org, keescook@chromium.org,
 rientjes@google.com, pgonda@google.com, martin.b.radev@gmail.com,
 hannes@cmpxchg.org, saravanand@fb.com, krish.sadhukhan@oracle.com,
 xen-devel@lists.xenproject.org, tj@kernel.org,
 michael.h.kelley@microsoft.com
Subject: [RFC PATCH V4 08/12] x86/Swiotlb/HV: Add Swiotlb bounce buffer remap
 function for HV IVM
Date: Wed,  7 Jul 2021 11:34:49 -0400
Message-Id: <20210707153456.3976348-9-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210707153456.3976348-1-ltykernel@gmail.com>
References: <20210707153456.3976348-1-ltykernel@gmail.com>
MIME-Version: 1.0
Cc: linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org,
 brijesh.singh@amd.com, linux-scsi@vger.kernel.org, netdev@vger.kernel.org,
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

In Isolation VM with AMD SEV, bounce buffer needs to be accessed via
extra address space which is above shared_gpa_boundary
(E.G 39 bit address line) reported by Hyper-V CPUID ISOLATION_CONFIG.
The access physical address will be original physical address +
shared_gpa_boundary. The shared_gpa_boundary in the AMD SEV SNP
spec is called virtual top of memory(vTOM). Memory addresses below
vTOM are automatically treated as private while memory above
vTOM is treated as shared.

Introduce set_memory_decrypted_map() function to decrypt memory and
remap memory with platform callback. Use set_memory_decrypted_
map() in the swiotlb code, store remap address returned by the new
API and use the remap address to copy data from/to swiotlb bounce buffer.

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
 arch/x86/hyperv/ivm.c             | 30 ++++++++++++++++++++++++++++++
 arch/x86/include/asm/mshyperv.h   |  2 ++
 arch/x86/include/asm/set_memory.h |  2 ++
 arch/x86/mm/pat/set_memory.c      | 28 ++++++++++++++++++++++++++++
 include/linux/swiotlb.h           |  4 ++++
 kernel/dma/swiotlb.c              | 11 ++++++++---
 6 files changed, 74 insertions(+), 3 deletions(-)

diff --git a/arch/x86/hyperv/ivm.c b/arch/x86/hyperv/ivm.c
index 8a6f4e9e3d6c..ea33935e0c17 100644
--- a/arch/x86/hyperv/ivm.c
+++ b/arch/x86/hyperv/ivm.c
@@ -267,3 +267,33 @@ int hv_set_mem_enc(unsigned long addr, int numpages, bool enc)
 			enc ? VMBUS_PAGE_NOT_VISIBLE
 			: VMBUS_PAGE_VISIBLE_READ_WRITE);
 }
+
+/*
+ * hv_map_memory - map memory to extra space in the AMD SEV-SNP Isolation VM.
+ */
+unsigned long hv_map_memory(unsigned long addr, unsigned long size)
+{
+	unsigned long *pfns = kcalloc(size / HV_HYP_PAGE_SIZE,
+				      sizeof(unsigned long),
+		       GFP_KERNEL);
+	unsigned long vaddr;
+	int i;
+
+	if (!pfns)
+		return (unsigned long)NULL;
+
+	for (i = 0; i < size / HV_HYP_PAGE_SIZE; i++)
+		pfns[i] = virt_to_hvpfn((void *)addr + i * HV_HYP_PAGE_SIZE) +
+			(ms_hyperv.shared_gpa_boundary >> HV_HYP_PAGE_SHIFT);
+
+	vaddr = (unsigned long)vmap_pfn(pfns, size / HV_HYP_PAGE_SIZE,
+					PAGE_KERNEL_IO);
+	kfree(pfns);
+
+	return vaddr;
+}
+
+void hv_unmap_memory(unsigned long addr)
+{
+	vunmap((void *)addr);
+}
diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
index fe03e3e833ac..ba3cb9e32fdb 100644
--- a/arch/x86/include/asm/mshyperv.h
+++ b/arch/x86/include/asm/mshyperv.h
@@ -253,6 +253,8 @@ int hv_map_ioapic_interrupt(int ioapic_id, bool level, int vcpu, int vector,
 int hv_unmap_ioapic_interrupt(int ioapic_id, struct hv_interrupt_entry *entry);
 int hv_mark_gpa_visibility(u16 count, const u64 pfn[], u32 visibility);
 int hv_set_mem_enc(unsigned long addr, int numpages, bool enc);
+unsigned long hv_map_memory(unsigned long addr, unsigned long size);
+void hv_unmap_memory(unsigned long addr);
 void hv_sint_wrmsrl_ghcb(u64 msr, u64 value);
 void hv_sint_rdmsrl_ghcb(u64 msr, u64 *value);
 void hv_signal_eom_ghcb(void);
diff --git a/arch/x86/include/asm/set_memory.h b/arch/x86/include/asm/set_memory.h
index 43fa081a1adb..7a2117931830 100644
--- a/arch/x86/include/asm/set_memory.h
+++ b/arch/x86/include/asm/set_memory.h
@@ -49,6 +49,8 @@ int set_memory_decrypted(unsigned long addr, int numpages);
 int set_memory_np_noalias(unsigned long addr, int numpages);
 int set_memory_nonglobal(unsigned long addr, int numpages);
 int set_memory_global(unsigned long addr, int numpages);
+unsigned long set_memory_decrypted_map(unsigned long addr, unsigned long size);
+int set_memory_encrypted_unmap(unsigned long addr, unsigned long size);
 
 int set_pages_array_uc(struct page **pages, int addrinarray);
 int set_pages_array_wc(struct page **pages, int addrinarray);
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 6cc83c57383d..5d4d3963f4a2 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -2039,6 +2039,34 @@ int set_memory_decrypted(unsigned long addr, int numpages)
 }
 EXPORT_SYMBOL_GPL(set_memory_decrypted);
 
+static unsigned long __map_memory(unsigned long addr, unsigned long size)
+{
+	if (hv_is_isolation_supported())
+		return hv_map_memory(addr, size);
+
+	return addr;
+}
+
+static void __unmap_memory(unsigned long addr)
+{
+	if (hv_is_isolation_supported())
+		hv_unmap_memory(addr);
+}
+
+unsigned long set_memory_decrypted_map(unsigned long addr, unsigned long size)
+{
+	if (__set_memory_enc_dec(addr, size / PAGE_SIZE, false))
+		return (unsigned long)NULL;
+
+	return __map_memory(addr, size);
+}
+
+int set_memory_encrypted_unmap(unsigned long addr, unsigned long size)
+{
+	__unmap_memory(addr);
+	return __set_memory_enc_dec(addr, size / PAGE_SIZE, true);
+}
+
 int set_pages_uc(struct page *page, int numpages)
 {
 	unsigned long addr = (unsigned long)page_address(page);
diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index f507e3eacbea..5c6f6c7380ef 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -72,6 +72,9 @@ extern enum swiotlb_force swiotlb_force;
  * @end:	The end address of the swiotlb memory pool. Used to do a quick
  *		range check to see if the memory was in fact allocated by this
  *		API.
+ * @vstart:	The virtual start address of the swiotlb memory pool. The swiotlb
+ *		memory pool may be remapped in the memory encrypted case and store
+ *		virtual address for bounce buffer operation.
  * @nslabs:	The number of IO TLB blocks (in groups of 64) between @start and
  *		@end. For default swiotlb, this is command line adjustable via
  *		setup_io_tlb_npages.
@@ -89,6 +92,7 @@ extern enum swiotlb_force swiotlb_force;
 struct io_tlb_mem {
 	phys_addr_t start;
 	phys_addr_t end;
+	void *vstart;
 	unsigned long nslabs;
 	unsigned long used;
 	unsigned int index;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index d3fa4669229b..9911817250a8 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -194,8 +194,13 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
 		mem->slots[i].alloc_size = 0;
 	}
 
-	set_memory_decrypted((unsigned long)vaddr, bytes >> PAGE_SHIFT);
-	memset(vaddr, 0, bytes);
+	mem->vstart = (void *)set_memory_decrypted_map((unsigned long)vaddr, bytes);
+	if (!mem->vstart) {
+		pr_err("Failed to decrypt memory.\n");
+		return;
+	}
+
+	memset(mem->vstart, 0, bytes);
 }
 
 int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
@@ -352,7 +357,7 @@ static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, size_t size
 	phys_addr_t orig_addr = mem->slots[index].orig_addr;
 	size_t alloc_size = mem->slots[index].alloc_size;
 	unsigned long pfn = PFN_DOWN(orig_addr);
-	unsigned char *vaddr = phys_to_virt(tlb_addr);
+	unsigned char *vaddr = mem->vstart + tlb_addr - mem->start;
 
 	if (orig_addr == INVALID_PHYS_ADDR)
 		return;
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
