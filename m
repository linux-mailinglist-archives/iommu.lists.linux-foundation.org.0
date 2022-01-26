Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2464849CC3D
	for <lists.iommu@lfdr.de>; Wed, 26 Jan 2022 15:23:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8350441640;
	Wed, 26 Jan 2022 14:23:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dw_gVU48u8-U; Wed, 26 Jan 2022 14:23:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 781BE41637;
	Wed, 26 Jan 2022 14:23:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 48505C007A;
	Wed, 26 Jan 2022 14:23:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45626C002D
 for <iommu@lists.linux-foundation.org>; Wed, 26 Jan 2022 14:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CD21607A3
 for <iommu@lists.linux-foundation.org>; Wed, 26 Jan 2022 14:23:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linutronix.de header.b="ybzPGcND";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=linutronix.de header.b="H1ZP0kFp"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tJ596tjoexHj for <iommu@lists.linux-foundation.org>;
 Wed, 26 Jan 2022 14:23:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41BB660709
 for <iommu@lists.linux-foundation.org>; Wed, 26 Jan 2022 14:23:47 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1643207023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+CxIM7gkfrEm7eO1fyq/strbAVIOXS0ekTc8dUnrpF0=;
 b=ybzPGcND97KBsVfpTfzoFKgMBSYICtgzJR3VssTC4UfKw/WqEAbRx9+Wb+F208QG4x+uQv
 yq17vYFZGT6L8qLq333jHFZcmMJ0iruHW3tx2m1yzwatsgJ/qwMP0VRSj4I1YbdPlXZ46e
 FwEGs0qoWkFxBVqTb+AJlsFKjBEGhPyGXc15giGM0i9/8XZPhLOaFCmU+XCwl4SUc3rRnj
 0h1FgXc3vBwYU+MzZlHgenXv2stCwggdJCJQRTrFFSSFLstfIaBiO2niFAHoTYR2adFldj
 0l7wz9SuCbBx061RJoE9eY52UJKEu64+sDgVY/tgDPYdTClon1h7IWFEJXktGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1643207023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+CxIM7gkfrEm7eO1fyq/strbAVIOXS0ekTc8dUnrpF0=;
 b=H1ZP0kFpKfbPGDtTuXUT/DzclpXzWXcuuT3aal34j2J/tEf3i685PKVMCMDcXqj7GcDTIu
 v6BM1D1XRV/6gmAQ==
To: Fenghua Yu <fenghua.yu@intel.com>
Subject: Re: [PATCH v2 05/11] iommu/sva: Assign a PASID to mm on PASID
 allocation and free it on mm exit
In-Reply-To: <YfAUutQhqS6ejUFU@otcwcpicx3.sc.intel.com>
References: <20211217220136.2762116-1-fenghua.yu@intel.com>
 <20211217220136.2762116-6-fenghua.yu@intel.com> <87ee4w6g1n.ffs@tglx>
 <87bl006fdb.ffs@tglx> <Ye8RmmKpJT8brmDE@otcwcpicx3.sc.intel.com>
 <878rv46eg3.ffs@tglx> <YfAUutQhqS6ejUFU@otcwcpicx3.sc.intel.com>
Date: Wed, 26 Jan 2022 15:23:42 +0100
Message-ID: <87k0em4lu9.ffs@tglx>
MIME-Version: 1.0
Cc: Ravi V Shankar <ravi.v.shankar@intel.com>, Tony Luck <tony.luck@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>
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

On Tue, Jan 25 2022 at 07:18, Fenghua Yu wrote:
> On Mon, Jan 24, 2022 at 09:55:56PM +0100, Thomas Gleixner wrote:
>  /**
>   * ioasid_put - Release a reference to an ioasid
>   * @ioasid: the ID to remove

which in turn makes ioasid_put() a misnomer and the whole refcounting of
the ioasid a pointless exercise.

While looking at ioasid_put() usage I tripped over the following UAF
issue:

--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -4817,8 +4817,10 @@ static int aux_domain_add_dev(struct dma
 	auxiliary_unlink_device(domain, dev);
 link_failed:
 	spin_unlock_irqrestore(&device_domain_lock, flags);
-	if (list_empty(&domain->subdevices) && domain->default_pasid > 0)
+	if (list_empty(&domain->subdevices) && domain->default_pasid > 0) {
 		ioasid_put(domain->default_pasid);
+		domain->default_pasid = INVALID_IOASID;
+	}
 
 	return ret;
 }
@@ -4847,8 +4849,10 @@ static void aux_domain_remove_dev(struct
 
 	spin_unlock_irqrestore(&device_domain_lock, flags);
 
-	if (list_empty(&domain->subdevices) && domain->default_pasid > 0)
+	if (list_empty(&domain->subdevices) && domain->default_pasid > 0) {
 		ioasid_put(domain->default_pasid);
+		domain->default_pasid = INVALID_IOASID;
+	}
 }
 
 static int prepare_domain_attach_device(struct iommu_domain *domain,

Vs. ioasid_put() I think we should fold the following:

--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -4818,7 +4818,7 @@ static int aux_domain_add_dev(struct dma
 link_failed:
 	spin_unlock_irqrestore(&device_domain_lock, flags);
 	if (list_empty(&domain->subdevices) && domain->default_pasid > 0) {
-		ioasid_put(domain->default_pasid);
+		ioasid_free(domain->default_pasid);
 		domain->default_pasid = INVALID_IOASID;
 	}
 
@@ -4850,7 +4850,7 @@ static void aux_domain_remove_dev(struct
 	spin_unlock_irqrestore(&device_domain_lock, flags);
 
 	if (list_empty(&domain->subdevices) && domain->default_pasid > 0) {
-		ioasid_put(domain->default_pasid);
+		ioasid_free(domain->default_pasid);
 		domain->default_pasid = INVALID_IOASID;
 	}
 }
--- a/drivers/iommu/ioasid.c
+++ b/drivers/iommu/ioasid.c
@@ -2,7 +2,7 @@
 /*
  * I/O Address Space ID allocator. There is one global IOASID space, split into
  * subsets. Users create a subset with DECLARE_IOASID_SET, then allocate and
- * free IOASIDs with ioasid_alloc and ioasid_put.
+ * free IOASIDs with ioasid_alloc() and ioasid_free().
  */
 #include <linux/ioasid.h>
 #include <linux/module.h>
@@ -15,7 +15,6 @@ struct ioasid_data {
 	struct ioasid_set *set;
 	void *private;
 	struct rcu_head rcu;
-	refcount_t refs;
 };
 
 /*
@@ -315,7 +314,6 @@ ioasid_t ioasid_alloc(struct ioasid_set
 
 	data->set = set;
 	data->private = private;
-	refcount_set(&data->refs, 1);
 
 	/*
 	 * Custom allocator needs allocator data to perform platform specific
@@ -348,17 +346,11 @@ ioasid_t ioasid_alloc(struct ioasid_set
 EXPORT_SYMBOL_GPL(ioasid_alloc);
 
 /**
- * ioasid_put - Release a reference to an ioasid
+ * ioasid_free - Free an ioasid
  * @ioasid: the ID to remove
- *
- * Put a reference to the IOASID, free it when the number of references drops to
- * zero.
- *
- * Return: %true if the IOASID was freed, %false otherwise.
  */
-bool ioasid_put(ioasid_t ioasid)
+void ioasid_free(ioasid_t ioasid)
 {
-	bool free = false;
 	struct ioasid_data *ioasid_data;
 
 	spin_lock(&ioasid_allocator_lock);
@@ -368,10 +360,6 @@ bool ioasid_put(ioasid_t ioasid)
 		goto exit_unlock;
 	}
 
-	free = refcount_dec_and_test(&ioasid_data->refs);
-	if (!free)
-		goto exit_unlock;
-
 	active_allocator->ops->free(ioasid, active_allocator->ops->pdata);
 	/* Custom allocator needs additional steps to free the xa element */
 	if (active_allocator->flags & IOASID_ALLOCATOR_CUSTOM) {
@@ -381,9 +369,8 @@ bool ioasid_put(ioasid_t ioasid)
 
 exit_unlock:
 	spin_unlock(&ioasid_allocator_lock);
-	return free;
 }
-EXPORT_SYMBOL_GPL(ioasid_put);
+EXPORT_SYMBOL_GPL(ioasid_free);
 
 /**
  * ioasid_find - Find IOASID data
--- a/include/linux/ioasid.h
+++ b/include/linux/ioasid.h
@@ -34,7 +34,7 @@ struct ioasid_allocator_ops {
 #if IS_ENABLED(CONFIG_IOASID)
 ioasid_t ioasid_alloc(struct ioasid_set *set, ioasid_t min, ioasid_t max,
 		      void *private);
-bool ioasid_put(ioasid_t ioasid);
+void ioasid_free(ioasid_t ioasid);
 void *ioasid_find(struct ioasid_set *set, ioasid_t ioasid,
 		  bool (*getter)(void *));
 int ioasid_register_allocator(struct ioasid_allocator_ops *allocator);
@@ -52,10 +52,7 @@ static inline ioasid_t ioasid_alloc(stru
 	return INVALID_IOASID;
 }
 
-static inline bool ioasid_put(ioasid_t ioasid)
-{
-	return false;
-}
+static inline void ioasid_free(ioasid_t ioasid) { }
 
 static inline void *ioasid_find(struct ioasid_set *set, ioasid_t ioasid,
 				bool (*getter)(void *))
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -423,7 +423,7 @@ static inline void mm_pasid_set(struct m
 static inline void mm_pasid_drop(struct mm_struct *mm)
 {
 	if (pasid_valid(mm->pasid)) {
-		ioasid_put(mm->pasid);
+		ioasid_free(mm->pasid);
 		mm->pasid = INVALID_IOASID;
 	}
 }
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
