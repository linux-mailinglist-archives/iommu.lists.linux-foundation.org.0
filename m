Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8840F248953
	for <lists.iommu@lfdr.de>; Tue, 18 Aug 2020 17:19:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3358284B88;
	Tue, 18 Aug 2020 15:19:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nrRmBOojP3GZ; Tue, 18 Aug 2020 15:19:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2489B84E68;
	Tue, 18 Aug 2020 15:19:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19556C07FF;
	Tue, 18 Aug 2020 15:19:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4418BC0051
 for <iommu@lists.linux-foundation.org>; Tue, 18 Aug 2020 15:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3F6778543A
 for <iommu@lists.linux-foundation.org>; Tue, 18 Aug 2020 15:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UwfkEzpOiuFJ for <iommu@lists.linux-foundation.org>;
 Tue, 18 Aug 2020 15:19:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 81668844C7
 for <iommu@lists.linux-foundation.org>; Tue, 18 Aug 2020 15:19:44 +0000 (UTC)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B392120825;
 Tue, 18 Aug 2020 15:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597763984;
 bh=pL5CdAsZOVSK1FyJ8jy1wDcujnpLwkr1X4pjuThf/H8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EiIoYcdepvdhi9XjcFbEWk2OPyadRQMLSnsTw7dwumwEFzOMsu117hpNz9Qp5IxXU
 ed1wANtxTvtneZaMWRYIRdfqCjJQvQWFqyOipJTJ4ZnzmAPZuNKt9rFWlVzxF6pqnj
 x+DSi8lkJA3KMhcma6u3/0Bcl5zUfyOFmcNgdzW4=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 16/17] memblock: implement for_each_reserved_mem_region()
 using __next_mem_region()
Date: Tue, 18 Aug 2020 18:16:33 +0300
Message-Id: <20200818151634.14343-17-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818151634.14343-1-rppt@kernel.org>
References: <20200818151634.14343-1-rppt@kernel.org>
MIME-Version: 1.0
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Mike Rapoport <rppt@linux.ibm.com>, clang-built-linux@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Daniel Axtens <dja@axtens.net>, Michal Simek <monstr@monstr.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
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

From: Mike Rapoport <rppt@linux.ibm.com>

Iteration over memblock.reserved with for_each_reserved_mem_region() used
__next_reserved_mem_region() that implemented a subset of
__next_mem_region().

Use __for_each_mem_range() and, essentially, __next_mem_region() with
appropriate parameters to reduce code duplication.

While on it, rename for_each_reserved_mem_region() to
for_each_reserved_mem_range() for consistency.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> # .clang-format
---
 .clang-format                    |  2 +-
 arch/arm64/kernel/setup.c        |  2 +-
 drivers/irqchip/irq-gic-v3-its.c |  2 +-
 include/linux/memblock.h         | 12 +++----
 mm/memblock.c                    | 56 ++++++++++++--------------------
 5 files changed, 27 insertions(+), 47 deletions(-)

diff --git a/.clang-format b/.clang-format
index 3e42a8e4df73..2b77cc419b97 100644
--- a/.clang-format
+++ b/.clang-format
@@ -267,7 +267,7 @@ ForEachMacros:
   - 'for_each_process_thread'
   - 'for_each_property_of_node'
   - 'for_each_registered_fb'
-  - 'for_each_reserved_mem_region'
+  - 'for_each_reserved_mem_range'
   - 'for_each_rtd_codec_dais'
   - 'for_each_rtd_codec_dais_rollback'
   - 'for_each_rtd_components'
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 77c4c9bad1b8..a986c6f8ab42 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -257,7 +257,7 @@ static int __init reserve_memblock_reserved_regions(void)
 		if (!memblock_is_region_reserved(mem->start, mem_size))
 			continue;
 
-		for_each_reserved_mem_region(j, &r_start, &r_end) {
+		for_each_reserved_mem_range(j, &r_start, &r_end) {
 			resource_size_t start, end;
 
 			start = max(PFN_PHYS(PFN_DOWN(r_start)), mem->start);
diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 95f097448f97..ca5c470ed0d0 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -2192,7 +2192,7 @@ static bool gic_check_reserved_range(phys_addr_t addr, unsigned long size)
 
 	addr_end = addr + size - 1;
 
-	for_each_reserved_mem_region(i, &start, &end) {
+	for_each_reserved_mem_range(i, &start, &end) {
 		if (addr >= start && addr_end <= end)
 			return true;
 	}
diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 15ed119701c1..354078713cd1 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -132,9 +132,6 @@ void __next_mem_range_rev(u64 *idx, int nid, enum memblock_flags flags,
 			  struct memblock_type *type_b, phys_addr_t *out_start,
 			  phys_addr_t *out_end, int *out_nid);
 
-void __next_reserved_mem_region(u64 *idx, phys_addr_t *out_start,
-				phys_addr_t *out_end);
-
 void __memblock_free_late(phys_addr_t base, phys_addr_t size);
 
 #ifdef CONFIG_HAVE_MEMBLOCK_PHYS_MAP
@@ -224,7 +221,7 @@ static inline void __next_physmem_range(u64 *idx, struct memblock_type *type,
 				 MEMBLOCK_NONE, p_start, p_end, NULL)
 
 /**
- * for_each_reserved_mem_region - iterate over all reserved memblock areas
+ * for_each_reserved_mem_range - iterate over all reserved memblock areas
  * @i: u64 used as loop variable
  * @p_start: ptr to phys_addr_t for start address of the range, can be %NULL
  * @p_end: ptr to phys_addr_t for end address of the range, can be %NULL
@@ -232,10 +229,9 @@ static inline void __next_physmem_range(u64 *idx, struct memblock_type *type,
  * Walks over reserved areas of memblock. Available as soon as memblock
  * is initialized.
  */
-#define for_each_reserved_mem_region(i, p_start, p_end)			\
-	for (i = 0UL, __next_reserved_mem_region(&i, p_start, p_end);	\
-	     i != (u64)ULLONG_MAX;					\
-	     __next_reserved_mem_region(&i, p_start, p_end))
+#define for_each_reserved_mem_range(i, p_start, p_end)			\
+	__for_each_mem_range(i, &memblock.reserved, NULL, NUMA_NO_NODE,	\
+			     MEMBLOCK_NONE, p_start, p_end, NULL)
 
 static inline bool memblock_is_hotpluggable(struct memblock_region *m)
 {
diff --git a/mm/memblock.c b/mm/memblock.c
index eb4f866bea34..d0be57acccf2 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -132,6 +132,14 @@ struct memblock_type physmem = {
 };
 #endif
 
+/*
+ * keep a pointer to &memblock.memory in the text section to use it in
+ * __next_mem_range() and its helpers.
+ *  For architectures that do not keep memblock data after init, this
+ * pointer will be reset to NULL at memblock_discard()
+ */
+static __refdata struct memblock_type *memblock_memory = &memblock.memory;
+
 #define for_each_memblock_type(i, memblock_type, rgn)			\
 	for (i = 0, rgn = &memblock_type->regions[0];			\
 	     i < memblock_type->cnt;					\
@@ -399,6 +407,8 @@ void __init memblock_discard(void)
 				  memblock.memory.max);
 		__memblock_free_late(addr, size);
 	}
+
+	memblock_memory = NULL;
 }
 #endif
 
@@ -949,42 +959,16 @@ int __init_memblock memblock_clear_nomap(phys_addr_t base, phys_addr_t size)
 	return memblock_setclr_flag(base, size, 0, MEMBLOCK_NOMAP);
 }
 
-/**
- * __next_reserved_mem_region - next function for for_each_reserved_region()
- * @idx: pointer to u64 loop variable
- * @out_start: ptr to phys_addr_t for start address of the region, can be %NULL
- * @out_end: ptr to phys_addr_t for end address of the region, can be %NULL
- *
- * Iterate over all reserved memory regions.
- */
-void __init_memblock __next_reserved_mem_region(u64 *idx,
-					   phys_addr_t *out_start,
-					   phys_addr_t *out_end)
-{
-	struct memblock_type *type = &memblock.reserved;
-
-	if (*idx < type->cnt) {
-		struct memblock_region *r = &type->regions[*idx];
-		phys_addr_t base = r->base;
-		phys_addr_t size = r->size;
-
-		if (out_start)
-			*out_start = base;
-		if (out_end)
-			*out_end = base + size - 1;
-
-		*idx += 1;
-		return;
-	}
-
-	/* signal end of iteration */
-	*idx = ULLONG_MAX;
-}
-
-static bool should_skip_region(struct memblock_region *m, int nid, int flags)
+static bool should_skip_region(struct memblock_type *type,
+			       struct memblock_region *m,
+			       int nid, int flags)
 {
 	int m_nid = memblock_get_region_node(m);
 
+	/* we never skip regions when iterating memblock.reserved or physmem */
+	if (type != memblock_memory)
+		return false;
+
 	/* only memory regions are associated with nodes, check it */
 	if (nid != NUMA_NO_NODE && nid != m_nid)
 		return true;
@@ -1049,7 +1033,7 @@ void __next_mem_range(u64 *idx, int nid, enum memblock_flags flags,
 		phys_addr_t m_end = m->base + m->size;
 		int	    m_nid = memblock_get_region_node(m);
 
-		if (should_skip_region(m, nid, flags))
+		if (should_skip_region(type_a, m, nid, flags))
 			continue;
 
 		if (!type_b) {
@@ -1153,7 +1137,7 @@ void __init_memblock __next_mem_range_rev(u64 *idx, int nid,
 		phys_addr_t m_end = m->base + m->size;
 		int m_nid = memblock_get_region_node(m);
 
-		if (should_skip_region(m, nid, flags))
+		if (should_skip_region(type_a, m, nid, flags))
 			continue;
 
 		if (!type_b) {
@@ -1978,7 +1962,7 @@ static unsigned long __init free_low_memory_core_early(void)
 
 	memblock_clear_hotplug(0, -1);
 
-	for_each_reserved_mem_region(i, &start, &end)
+	for_each_reserved_mem_range(i, &start, &end)
 		reserve_bootmem_region(start, end);
 
 	/*
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
