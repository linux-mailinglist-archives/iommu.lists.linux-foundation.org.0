Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9432B2839CD
	for <lists.iommu@lfdr.de>; Mon,  5 Oct 2020 17:29:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 471618669E;
	Mon,  5 Oct 2020 15:29:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kKE3zvNx+NEP; Mon,  5 Oct 2020 15:29:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9EF2F866D9;
	Mon,  5 Oct 2020 15:29:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C54CC0891;
	Mon,  5 Oct 2020 15:29:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51A5CC0051
 for <iommu@lists.linux-foundation.org>; Mon,  5 Oct 2020 15:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4A87F870CD
 for <iommu@lists.linux-foundation.org>; Mon,  5 Oct 2020 15:29:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tITEJq5yvM4k for <iommu@lists.linux-foundation.org>;
 Mon,  5 Oct 2020 15:28:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9D268870C6
 for <iommu@lists.linux-foundation.org>; Mon,  5 Oct 2020 15:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=3FOmkBv1Wgvw1BuIqjWYCJkYC/NtwagU3klyZLVG2gg=; b=P1LxG0wbD3/7CtYqpT441k6Feg
 2TnfQrJUH2NRjIonGGT2+YU74UZ7gPl/NZyfdDKv4Wh7IaNkyEGQezbGle/gunBL98p1G5HTzjbpf
 QBSRJjlLz795xq+qrRxbo+cYklF7U/DzMW+4mXDvtqUiv5slS6BYSoEHfOpdG4TCaT3U63Lw9QdmB
 jYwiGrKodX/Kdu+dA/m3QRLTBSi7QTV534mdlwCltL+KB7O5sCpWgkEXbLL16XOpdngNC7ihmeZPv
 LXv6oEm85zzuJ0C4975UvEWikRUqC1RThNch2/iI1OCNqlM4cdmj++fV/85B8f95H2MPlJSYzNXm0
 jyJYc8nw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPSQ4-0001mJ-PD; Mon, 05 Oct 2020 15:28:57 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.93 #3 (Red Hat
 Linux)) id 1kPSQ4-0045QV-Ag; Mon, 05 Oct 2020 16:28:56 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Subject: [PATCH 05/13] genirq: Prepare for default affinity to be passed to
 __irq_alloc_descs()
Date: Mon,  5 Oct 2020 16:28:48 +0100
Message-Id: <20201005152856.974112-5-dwmw2@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201005152856.974112-1-dwmw2@infradead.org>
References: <77e64f977f559412f62b467fd062d051ea288f14.camel@infradead.org>
 <20201005152856.974112-1-dwmw2@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 iommu <iommu@lists.linux-foundation.org>, linux-hyperv@vger.kernel.org,
 kvm <kvm@vger.kernel.org>
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

From: David Woodhouse <dwmw@amazon.co.uk>

Instead of plugging in irq_default_affinity at the lowest level in
desc_smp_init() if the caller didn't specify an affinity for this
specific IRQ in its array, allow the default affinity to be passed
down from __irq_alloc_descs() instead.

This is in preparation for irq domains having their own default (and
indeed maximum) affinities.

An alternative possibility would have been to make the caller allocate
an entire array of struct irq_affinity_desc for the allocation, but
that's a lot nastier than simply passing in an additional const cpumask.

This commit has no visible API change outside static functions in
irqdesc.c for now; the actual change will come later.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 include/linux/interrupt.h |  2 ++
 kernel/irq/irqdesc.c      | 21 +++++++++++++--------
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index f9aee3538461..cd0ff293486a 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -364,6 +364,8 @@ unsigned int irq_calc_affinity_vectors(unsigned int minvec, unsigned int maxvec,
 
 #else /* CONFIG_SMP */
 
+#define irq_default_affinity (NULL)
+
 static inline int irq_set_affinity(unsigned int irq, const struct cpumask *m)
 {
 	return -EINVAL;
diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 1a7723604399..4ac91b9fc618 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -81,8 +81,6 @@ static int alloc_masks(struct irq_desc *desc, int node)
 static void desc_smp_init(struct irq_desc *desc, int node,
 			  const struct cpumask *affinity)
 {
-	if (!affinity)
-		affinity = irq_default_affinity;
 	cpumask_copy(desc->irq_common_data.affinity, affinity);
 
 #ifdef CONFIG_GENERIC_PENDING_IRQ
@@ -465,12 +463,16 @@ static void free_desc(unsigned int irq)
 
 static int alloc_descs(unsigned int start, unsigned int cnt, int node,
 		       const struct irq_affinity_desc *affinity,
+		       const struct cpumask *default_affinity,
 		       struct module *owner)
 {
 	struct irq_desc *desc;
 	int i;
 
 	/* Validate affinity mask(s) */
+	if (!default_affinity || cpumask_empty(default_affinity))
+		return -EINVAL;
+
 	if (affinity) {
 		for (i = 0; i < cnt; i++) {
 			if (cpumask_empty(&affinity[i].mask))
@@ -479,7 +481,7 @@ static int alloc_descs(unsigned int start, unsigned int cnt, int node,
 	}
 
 	for (i = 0; i < cnt; i++) {
-		const struct cpumask *mask = NULL;
+		const struct cpumask *mask = default_affinity;
 		unsigned int flags = 0;
 
 		if (affinity) {
@@ -488,10 +490,10 @@ static int alloc_descs(unsigned int start, unsigned int cnt, int node,
 					IRQD_MANAGED_SHUTDOWN;
 			}
 			mask = &affinity->mask;
-			node = cpu_to_node(cpumask_first(mask));
 			affinity++;
 		}
 
+		node = cpu_to_node(cpumask_first(mask));
 		desc = alloc_desc(start + i, node, flags, mask, owner);
 		if (!desc)
 			goto err;
@@ -538,7 +540,7 @@ int __init early_irq_init(void)
 		nr_irqs = initcnt;
 
 	for (i = 0; i < initcnt; i++) {
-		desc = alloc_desc(i, node, 0, NULL, NULL);
+		desc = alloc_desc(i, node, 0, irq_default_affinity, NULL);
 		set_bit(i, allocated_irqs);
 		irq_insert_desc(i, desc);
 	}
@@ -573,7 +575,8 @@ int __init early_irq_init(void)
 		raw_spin_lock_init(&desc[i].lock);
 		lockdep_set_class(&desc[i].lock, &irq_desc_lock_class);
 		mutex_init(&desc[i].request_mutex);
-		desc_set_defaults(i, &desc[i], node, NULL, NULL);
+		desc_set_defaults(i, &desc[i], node, irq_default_affinity,
+				  NULL);
 	}
 	return arch_early_irq_init();
 }
@@ -590,12 +593,14 @@ static void free_desc(unsigned int irq)
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&desc->lock, flags);
-	desc_set_defaults(irq, desc, irq_desc_get_node(desc), NULL, NULL);
+	desc_set_defaults(irq, desc, irq_desc_get_node(desc),
+			  irq_default_affinity, NULL);
 	raw_spin_unlock_irqrestore(&desc->lock, flags);
 }
 
 static inline int alloc_descs(unsigned int start, unsigned int cnt, int node,
 			      const struct irq_affinity_desc *affinity,
+			      const struct cpumask *default_affinity,
 			      struct module *owner)
 {
 	u32 i;
@@ -803,7 +808,7 @@ __irq_alloc_descs(int irq, unsigned int from, unsigned int cnt, int node,
 		if (ret)
 			goto unlock;
 	}
-	ret = alloc_descs(start, cnt, node, affinity, owner);
+	ret = alloc_descs(start, cnt, node, affinity, irq_default_affinity, owner);
 unlock:
 	mutex_unlock(&sparse_irq_lock);
 	return ret;
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
