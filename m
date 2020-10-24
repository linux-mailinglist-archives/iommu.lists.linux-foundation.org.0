Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 98983297ED8
	for <lists.iommu@lfdr.de>; Sat, 24 Oct 2020 23:36:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5BCDE86E4E;
	Sat, 24 Oct 2020 21:36:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UaJ6W8MTVILs; Sat, 24 Oct 2020 21:35:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9363586DA3;
	Sat, 24 Oct 2020 21:35:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C3AFC0051;
	Sat, 24 Oct 2020 21:35:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB9F5C0893
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E7CFB86AD7
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J9tfCcjoJXQV for <iommu@lists.linux-foundation.org>;
 Sat, 24 Oct 2020 21:35:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A2E0786A3F
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=xw8zaOeRQ0PU1xVwW5DvZdQHD7uzCjkfoD1bMKNPBpw=; b=Nf+PHswmeNBSVP2YBC76Apqd+l
 gT7BFpXNM4GYFCjeEkSQ7NBhCZLNa1ipyvPdXVYLaQWzaDRGjQ5HlV26dFb9Rg36hzmcmgNiGrUMi
 Z8RqbROdeStx4MJ5jG2VtXnJ9dkNIWtqfYExAVNTzodCIAP8J0fMnM9mA532lZt6UtLJfqcJKAJp+
 2OcCR7qZ4jrUcGMkddeVij01kIX/v0w69MN0rgu00qDYhypW+K2yvpgfaK8dPyYyuKRI8cgC0ykdw
 FxLmmp8DWDct0OXcWtJMsSYTAaVHTrBUeNXmqjT6gKRjT2WEot7lv0+eZmAICyeXIGix9zSc1wTHr
 z1Qh1jBA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWRCT-0008BZ-1u; Sat, 24 Oct 2020 21:35:45 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.93 #3 (Red Hat
 Linux)) id 1kWRCN-001rOb-0e; Sat, 24 Oct 2020 22:35:39 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Subject: [PATCH v3 16/35] x86/kvm: Use msi_msg shadow structs
Date: Sat, 24 Oct 2020 22:35:16 +0100
Message-Id: <20201024213535.443185-17-dwmw2@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201024213535.443185-1-dwmw2@infradead.org>
References: <e6601ff691afb3266e365a91e8b221179daf22c2.camel@infradead.org>
 <20201024213535.443185-1-dwmw2@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-hyperv@vger.kernel.org, kvm <kvm@vger.kernel.org>,
 Dexuan Cui <decui@microsoft.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, maz@misterjones.org,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>
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

From: Thomas Gleixner <tglx@linutronix.de>

Use the bitfields in the x86 shadow structs instead of decomposing the
32bit value with macros.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/irq_comm.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/arch/x86/kvm/irq_comm.c b/arch/x86/kvm/irq_comm.c
index 4aa1c2e00e2a..8a4de3f12820 100644
--- a/arch/x86/kvm/irq_comm.c
+++ b/arch/x86/kvm/irq_comm.c
@@ -16,8 +16,6 @@
 
 #include <trace/events/kvm.h>
 
-#include <asm/msidef.h>
-
 #include "irq.h"
 
 #include "ioapic.h"
@@ -104,22 +102,19 @@ int kvm_irq_delivery_to_apic(struct kvm *kvm, struct kvm_lapic *src,
 void kvm_set_msi_irq(struct kvm *kvm, struct kvm_kernel_irq_routing_entry *e,
 		     struct kvm_lapic_irq *irq)
 {
-	trace_kvm_msi_set_irq(e->msi.address_lo | (kvm->arch.x2apic_format ?
-	                                     (u64)e->msi.address_hi << 32 : 0),
-	                      e->msi.data);
-
-	irq->dest_id = (e->msi.address_lo &
-			MSI_ADDR_DEST_ID_MASK) >> MSI_ADDR_DEST_ID_SHIFT;
-	if (kvm->arch.x2apic_format)
-		irq->dest_id |= MSI_ADDR_EXT_DEST_ID(e->msi.address_hi);
-	irq->vector = (e->msi.data &
-			MSI_DATA_VECTOR_MASK) >> MSI_DATA_VECTOR_SHIFT;
-	irq->dest_mode = kvm_lapic_irq_dest_mode(
-	    !!((1 << MSI_ADDR_DEST_MODE_SHIFT) & e->msi.address_lo));
-	irq->trig_mode = (1 << MSI_DATA_TRIGGER_SHIFT) & e->msi.data;
-	irq->delivery_mode = e->msi.data & 0x700;
-	irq->msi_redir_hint = ((e->msi.address_lo
-		& MSI_ADDR_REDIRECTION_LOWPRI) > 0);
+	struct msi_msg msg = { .address_lo = e->msi.address_lo,
+			       .address_hi = e->msi.address_hi,
+			       .data = e->msi.data };
+
+	trace_kvm_msi_set_irq(msg.address_lo | (kvm->arch.x2apic_format ?
+			      (u64)msg.address_hi << 32 : 0), msg.data);
+
+	irq->dest_id = x86_msi_msg_get_destid(&msg, kvm->arch.x2apic_format);
+	irq->vector = msg.arch_data.vector;
+	irq->dest_mode = kvm_lapic_irq_dest_mode(msg.arch_addr_lo.dest_mode_logical);
+	irq->trig_mode = msg.arch_data.is_level;
+	irq->delivery_mode = msg.arch_data.delivery_mode << 8;
+	irq->msi_redir_hint = msg.arch_addr_lo.redirect_hint;
 	irq->level = 1;
 	irq->shorthand = APIC_DEST_NOSHORT;
 }
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
