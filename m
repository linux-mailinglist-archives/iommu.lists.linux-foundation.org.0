Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1852358E5
	for <lists.iommu@lfdr.de>; Sun,  2 Aug 2020 18:38:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3766C20454;
	Sun,  2 Aug 2020 16:38:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EcmZBCKHg1xK; Sun,  2 Aug 2020 16:38:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 98A54203CC;
	Sun,  2 Aug 2020 16:38:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91002C004C;
	Sun,  2 Aug 2020 16:38:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0AB3C004C
 for <iommu@lists.linux-foundation.org>; Sun,  2 Aug 2020 16:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CC9A884628
 for <iommu@lists.linux-foundation.org>; Sun,  2 Aug 2020 16:38:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eJJ87hsbMw6H for <iommu@lists.linux-foundation.org>;
 Sun,  2 Aug 2020 16:38:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 513B9845D6
 for <iommu@lists.linux-foundation.org>; Sun,  2 Aug 2020 16:38:38 +0000 (UTC)
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D797220759;
 Sun,  2 Aug 2020 16:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596386318;
 bh=o8aZbB2pKDQsqUqKMBDH2F8svHn12mD34Nb+72y2BZg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QgzlknYsb9NiWB8c/Yeh/cISQPrZRFom46AMdT7FrT79j0mzUH6ggsWMbDZWlX4P8
 UyQ3srMeb9iG6KtyQNKoy0bv4eQadT2brjYzvyX1yGh7qES1VdDGGb7RMSiDH9JBdG
 DZDhRIfp4FkpXhluwKfMBKUj7+OCDBbjLlDEZLbY=
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 13/17] x86/setup: simplify initrd relocation and reservation
Date: Sun,  2 Aug 2020 19:35:57 +0300
Message-Id: <20200802163601.8189-14-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200802163601.8189-1-rppt@kernel.org>
References: <20200802163601.8189-1-rppt@kernel.org>
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
 Michal Simek <monstr@monstr.eu>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
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

Currently, initrd image is reserved very early during setup and then it
might be relocated and re-reserved after the initial physical memory
mapping is created. The "late" reservation of memblock verifies that mapped
memory size exceeds the size of initrd, the checks whether the relocation
required and, if yes, relocates inirtd to a new memory allocated from
memblock and frees the old location.

The check for memory size is excessive as memblock allocation will anyway
fail if there is not enough memory. Besides, there is no point to allocate
memory from memblock using memblock_find_in_range() + memblock_reserve()
when there exists memblock_phys_alloc_range() with required functionality.

Remove the redundant check and simplify memblock allocation.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/x86/kernel/setup.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
index a3767e74c758..d8de4053c5e8 100644
--- a/arch/x86/kernel/setup.c
+++ b/arch/x86/kernel/setup.c
@@ -262,16 +262,12 @@ static void __init relocate_initrd(void)
 	u64 area_size     = PAGE_ALIGN(ramdisk_size);
 
 	/* We need to move the initrd down into directly mapped mem */
-	relocated_ramdisk = memblock_find_in_range(0, PFN_PHYS(max_pfn_mapped),
-						   area_size, PAGE_SIZE);
-
+	relocated_ramdisk = memblock_phys_alloc_range(area_size, PAGE_SIZE, 0,
+						      PFN_PHYS(max_pfn_mapped));
 	if (!relocated_ramdisk)
 		panic("Cannot find place for new RAMDISK of size %lld\n",
 		      ramdisk_size);
 
-	/* Note: this includes all the mem currently occupied by
-	   the initrd, we rely on that fact to keep the data intact. */
-	memblock_reserve(relocated_ramdisk, area_size);
 	initrd_start = relocated_ramdisk + PAGE_OFFSET;
 	initrd_end   = initrd_start + ramdisk_size;
 	printk(KERN_INFO "Allocated new RAMDISK: [mem %#010llx-%#010llx]\n",
@@ -298,13 +294,13 @@ static void __init early_reserve_initrd(void)
 
 	memblock_reserve(ramdisk_image, ramdisk_end - ramdisk_image);
 }
+
 static void __init reserve_initrd(void)
 {
 	/* Assume only end is not page aligned */
 	u64 ramdisk_image = get_ramdisk_image();
 	u64 ramdisk_size  = get_ramdisk_size();
 	u64 ramdisk_end   = PAGE_ALIGN(ramdisk_image + ramdisk_size);
-	u64 mapped_size;
 
 	if (!boot_params.hdr.type_of_loader ||
 	    !ramdisk_image || !ramdisk_size)
@@ -312,12 +308,6 @@ static void __init reserve_initrd(void)
 
 	initrd_start = 0;
 
-	mapped_size = memblock_mem_size(max_pfn_mapped);
-	if (ramdisk_size >= (mapped_size>>1))
-		panic("initrd too large to handle, "
-		       "disabling initrd (%lld needed, %lld available)\n",
-		       ramdisk_size, mapped_size>>1);
-
 	printk(KERN_INFO "RAMDISK: [mem %#010llx-%#010llx]\n", ramdisk_image,
 			ramdisk_end - 1);
 
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
