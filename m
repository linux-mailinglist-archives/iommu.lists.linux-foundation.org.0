Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B25BE1FF81C
	for <lists.iommu@lfdr.de>; Thu, 18 Jun 2020 17:52:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5EC2D87C20;
	Thu, 18 Jun 2020 15:52:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UmkBw2YCfl4H; Thu, 18 Jun 2020 15:52:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2E2C787C19;
	Thu, 18 Jun 2020 15:52:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 278A0C088C;
	Thu, 18 Jun 2020 15:52:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0CD8FC016E
 for <iommu@lists.linux-foundation.org>; Thu, 18 Jun 2020 15:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D9D7E24E91
 for <iommu@lists.linux-foundation.org>; Thu, 18 Jun 2020 15:52:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8206PSfnJced for <iommu@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 15:52:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 6B97720502
 for <iommu@lists.linux-foundation.org>; Thu, 18 Jun 2020 15:52:45 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id n24so6972646ejd.0
 for <iommu@lists.linux-foundation.org>; Thu, 18 Jun 2020 08:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tNsKKlZrMS7qavcUPxigtHJpxuII47BMB2PD7LPqYhM=;
 b=qKis8+0zz9FpJJzO2PcVBzxN7h/KVSGahqjTo3rC/34bBhNsoWpi6DqOiFkJFrgcXw
 PWN4tPDht0f3kfRBr6KB4nLmSlDlX+REPkX1b57yDdX2jzIFFYyGSZK2/cg3NmCt7Cr2
 yPL7/xQjFWTj9g2yUHgLHO3sPtQu6A2NoTG9flk5EjnjRekGXMA4Xp8C3ClPIkQoKt3a
 8eSPbkQPV1DxwCylidi3u8x7X+PSNNwhd2TVUoCUhvNrLmS4kwWv70lYMXihoOmXlX+6
 erobYWDFdNqg3HdBh17QtQaswTrMhad1LxNT5/v8Uph4G7Olvb71xPiHyDHjvF68bx2X
 jvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tNsKKlZrMS7qavcUPxigtHJpxuII47BMB2PD7LPqYhM=;
 b=uRY9z4VCWmbKn4atd8exhcvWyuxefvEx1yP34+w44LHLv9lpqJ0zQOj7NeXt1aIQBD
 rSoT3+A1ou94FfjMDsV1dggDKwiADLHCi8kbC1AHyP09957D2yBHFE2hw/FA3rRSfjwB
 ceOn4Eqzr/Ctl8G8b8ZNUHYR1znqT6mPqr/be+GvPrkwlwwHVyHCbAUa+rJuJoK+SxpT
 ErERIOPUHpfx+/nrDrRtZqT70BNMXdDdPNMjeUaX5q0TreBPNKDAdUw+kPn6WNhAJ7UB
 6NyoQ8mycCJ/qrhAAeK5yw/KAxw6uHRB+GaR9VdDlJ5O1lztUwH6ZrrXTieRzQgSTegI
 i75A==
X-Gm-Message-State: AOAM531i2uECvgWG1cGjeuKNfEXMMkistdBQaYc/MWC41y8bzwL3QdC/
 PFj4E4+FEvbJSOgoiDzz4z1VzsaoS4D54g==
X-Google-Smtp-Source: ABdhPJwMTz6VrTL+YpR+VUTsW2WpdHUrvHPd0nxeIDXU3aORNj7p14GXmHBByZRwRDr/GjFSjYh2ZQ==
X-Received: by 2002:a17:906:4a03:: with SMTP id
 w3mr4472232eju.154.1592495563380; 
 Thu, 18 Jun 2020 08:52:43 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id 63sm2402267edy.8.2020.06.18.08.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 08:52:42 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Subject: [PATCH v8 04/12] arm64: mm: Pin down ASIDs for sharing mm with devices
Date: Thu, 18 Jun 2020 17:51:17 +0200
Message-Id: <20200618155125.1548969-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200618155125.1548969-1-jean-philippe@linaro.org>
References: <20200618155125.1548969-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: fenghua.yu@intel.com, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 catalin.marinas@arm.com, robin.murphy@arm.com, hch@infradead.org,
 zhengxiang9@huawei.com, zhangfei.gao@linaro.org, will@kernel.org
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

To enable address space sharing with the IOMMU, introduce mm_context_get()
and mm_context_put(), that pin down a context and ensure that it will keep
its ASID after a rollover. Export the symbols to let the modular SMMUv3
driver use them.

Pinning is necessary because a device constantly needs a valid ASID,
unlike tasks that only require one when running. Without pinning, we would
need to notify the IOMMU when we're about to use a new ASID for a task,
and it would get complicated when a new task is assigned a shared ASID.
Consider the following scenario with no ASID pinned:

1. Task t1 is running on CPUx with shared ASID (gen=1, asid=1)
2. Task t2 is scheduled on CPUx, gets ASID (1, 2)
3. Task tn is scheduled on CPUy, a rollover occurs, tn gets ASID (2, 1)
   We would now have to immediately generate a new ASID for t1, notify
   the IOMMU, and finally enable task tn. We are holding the lock during
   all that time, since we can't afford having another CPU trigger a
   rollover. The IOMMU issues invalidation commands that can take tens of
   milliseconds.

It gets needlessly complicated. All we wanted to do was schedule task tn,
that has no business with the IOMMU. By letting the IOMMU pin tasks when
needed, we avoid stalling the slow path, and let the pinning fail when
we're out of shareable ASIDs.

After a rollover, the allocator expects at least one ASID to be available
in addition to the reserved ones (one per CPU). So (NR_ASIDS - NR_CPUS -
1) is the maximum number of ASIDs that can be shared with the IOMMU.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 arch/arm64/include/asm/mmu.h         |  1 +
 arch/arm64/include/asm/mmu_context.h | 11 +++-
 arch/arm64/mm/context.c              | 95 +++++++++++++++++++++++++++-
 3 files changed, 104 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
index 68140fdd89d6b..bbdd291e31d59 100644
--- a/arch/arm64/include/asm/mmu.h
+++ b/arch/arm64/include/asm/mmu.h
@@ -19,6 +19,7 @@
 
 typedef struct {
 	atomic64_t	id;
+	unsigned long	pinned;
 	void		*vdso;
 	unsigned long	flags;
 } mm_context_t;
diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
index b0bd9b55594c5..7b0e0f6cb7e87 100644
--- a/arch/arm64/include/asm/mmu_context.h
+++ b/arch/arm64/include/asm/mmu_context.h
@@ -177,7 +177,13 @@ static inline void cpu_replace_ttbr1(pgd_t *pgdp)
 #define destroy_context(mm)		do { } while(0)
 void check_and_switch_context(struct mm_struct *mm, unsigned int cpu);
 
-#define init_new_context(tsk,mm)	({ atomic64_set(&(mm)->context.id, 0); 0; })
+static inline int
+init_new_context(struct task_struct *tsk, struct mm_struct *mm)
+{
+	atomic64_set(&mm->context.id, 0);
+	mm->context.pinned = 0;
+	return 0;
+}
 
 #ifdef CONFIG_ARM64_SW_TTBR0_PAN
 static inline void update_saved_ttbr0(struct task_struct *tsk,
@@ -250,6 +256,9 @@ switch_mm(struct mm_struct *prev, struct mm_struct *next,
 void verify_cpu_asid_bits(void);
 void post_ttbr_update_workaround(void);
 
+unsigned long mm_context_get(struct mm_struct *mm);
+void mm_context_put(struct mm_struct *mm);
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* !__ASM_MMU_CONTEXT_H */
diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
index d702d60e64dab..d0ddd413f5645 100644
--- a/arch/arm64/mm/context.c
+++ b/arch/arm64/mm/context.c
@@ -27,6 +27,10 @@ static DEFINE_PER_CPU(atomic64_t, active_asids);
 static DEFINE_PER_CPU(u64, reserved_asids);
 static cpumask_t tlb_flush_pending;
 
+static unsigned long max_pinned_asids;
+static unsigned long nr_pinned_asids;
+static unsigned long *pinned_asid_map;
+
 #define ASID_MASK		(~GENMASK(asid_bits - 1, 0))
 #define ASID_FIRST_VERSION	(1UL << asid_bits)
 
@@ -74,6 +78,9 @@ void verify_cpu_asid_bits(void)
 
 static void set_kpti_asid_bits(void)
 {
+	unsigned int k;
+	u8 *dst = (u8 *)asid_map;
+	u8 *src = (u8 *)pinned_asid_map;
 	unsigned int len = BITS_TO_LONGS(NUM_USER_ASIDS) * sizeof(unsigned long);
 	/*
 	 * In case of KPTI kernel/user ASIDs are allocated in
@@ -81,7 +88,8 @@ static void set_kpti_asid_bits(void)
 	 * is set, then the ASID will map only userspace. Thus
 	 * mark even as reserved for kernel.
 	 */
-	memset(asid_map, 0xaa, len);
+	for (k = 0; k < len; k++)
+		dst[k] = src[k] | 0xaa;
 }
 
 static void set_reserved_asid_bits(void)
@@ -89,7 +97,7 @@ static void set_reserved_asid_bits(void)
 	if (arm64_kernel_unmapped_at_el0())
 		set_kpti_asid_bits();
 	else
-		bitmap_clear(asid_map, 0, NUM_USER_ASIDS);
+		bitmap_copy(asid_map, pinned_asid_map, NUM_USER_ASIDS);
 }
 
 #define asid_gen_match(asid) \
@@ -165,6 +173,14 @@ static u64 new_context(struct mm_struct *mm)
 		if (check_update_reserved_asid(asid, newasid))
 			return newasid;
 
+		/*
+		 * If it is pinned, we can keep using it. Note that reserved
+		 * takes priority, because even if it is also pinned, we need to
+		 * update the generation into the reserved_asids.
+		 */
+		if (mm->context.pinned)
+			return newasid;
+
 		/*
 		 * We had a valid ASID in a previous life, so try to re-use
 		 * it if possible.
@@ -254,6 +270,68 @@ void check_and_switch_context(struct mm_struct *mm, unsigned int cpu)
 		cpu_switch_mm(mm->pgd, mm);
 }
 
+unsigned long mm_context_get(struct mm_struct *mm)
+{
+	unsigned long flags;
+	u64 asid;
+
+	raw_spin_lock_irqsave(&cpu_asid_lock, flags);
+
+	asid = atomic64_read(&mm->context.id);
+
+	if (mm->context.pinned) {
+		mm->context.pinned++;
+		asid &= ~ASID_MASK;
+		goto out_unlock;
+	}
+
+	if (nr_pinned_asids >= max_pinned_asids) {
+		asid = 0;
+		goto out_unlock;
+	}
+
+	if (!asid_gen_match(asid)) {
+		/*
+		 * We went through one or more rollover since that ASID was
+		 * used. Ensure that it is still valid, or generate a new one.
+		 */
+		asid = new_context(mm);
+		atomic64_set(&mm->context.id, asid);
+	}
+
+	asid &= ~ASID_MASK;
+
+	nr_pinned_asids++;
+	__set_bit(asid2idx(asid), pinned_asid_map);
+	mm->context.pinned++;
+
+out_unlock:
+	raw_spin_unlock_irqrestore(&cpu_asid_lock, flags);
+
+	/* Set the equivalent of USER_ASID_BIT */
+	if (asid && IS_ENABLED(CONFIG_UNMAP_KERNEL_AT_EL0))
+		asid |= 1;
+
+	return asid;
+}
+EXPORT_SYMBOL_GPL(mm_context_get);
+
+void mm_context_put(struct mm_struct *mm)
+{
+	unsigned long flags;
+	u64 asid = atomic64_read(&mm->context.id) & ~ASID_MASK;
+
+	raw_spin_lock_irqsave(&cpu_asid_lock, flags);
+
+	if (--mm->context.pinned == 0) {
+		__clear_bit(asid2idx(asid), pinned_asid_map);
+		nr_pinned_asids--;
+	}
+
+	raw_spin_unlock_irqrestore(&cpu_asid_lock, flags);
+}
+EXPORT_SYMBOL_GPL(mm_context_put);
+
 /* Errata workaround post TTBRx_EL1 update. */
 asmlinkage void post_ttbr_update_workaround(void)
 {
@@ -303,6 +381,13 @@ static int asids_update_limit(void)
 	WARN_ON(num_available_asids - 1 <= num_possible_cpus());
 	pr_info("ASID allocator initialised with %lu entries\n",
 		num_available_asids);
+
+	/*
+	 * We assume that an ASID is always available after a rollover. This
+	 * means that even if all CPUs have a reserved ASID, there still is at
+	 * least one slot available in the asid map.
+	 */
+	max_pinned_asids = num_available_asids - num_possible_cpus() - 2;
 	return 0;
 }
 arch_initcall(asids_update_limit);
@@ -317,6 +402,12 @@ static int asids_init(void)
 		panic("Failed to allocate bitmap for %lu ASIDs\n",
 		      NUM_USER_ASIDS);
 
+	pinned_asid_map = kcalloc(BITS_TO_LONGS(NUM_USER_ASIDS),
+				  sizeof(*pinned_asid_map), GFP_KERNEL);
+	if (!pinned_asid_map)
+		panic("Failed to allocate pinned ASID bitmap\n");
+	nr_pinned_asids = 0;
+
 	/*
 	 * We cannot call set_reserved_asid_bits() here because CPU
 	 * caps are not finalized yet, so it is safer to assume KPTI
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
