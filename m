Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C69A297ED7
	for <lists.iommu@lfdr.de>; Sat, 24 Oct 2020 23:36:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E8EB62305A;
	Sat, 24 Oct 2020 21:35:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id carW8VhuuuDd; Sat, 24 Oct 2020 21:35:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9390622EE6;
	Sat, 24 Oct 2020 21:35:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76CC5C0051;
	Sat, 24 Oct 2020 21:35:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AB89FC0893
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 861C486DA1
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hbQ6F6-TNGLu for <iommu@lists.linux-foundation.org>;
 Sat, 24 Oct 2020 21:35:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9F31F8638E
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=NLhFJTTd2ekmHJlOdAESXZniD9dUaevnRbr1BsqATkw=; b=EF70KwaycpmQNfTAJyGTT6ea73
 XgryeUoCCTaDnb1gpRuIKEzO2AAlDAfGT2IEEqPYXvaMewHo2FK1R8c1GMRn6r2+HjBGg/xF9aMHl
 4PjjR5qksLMfMSdKWeqXNnZv3c+8lJX7kthPhpVYalFRa5U/HOcQyaZIEDH6Stmk27vF7ffWnGdW2
 SJ3YTtF47hHuIb/CEomSchlOESARDYQkvHd8FVvHWiTHViLRnstOyld5KBtcq15CF/QXS28oxzO+G
 uAek7hy0+OvPEJZsLacPMoo/fa5YUxycFOZIVnp11Sq3kzxGiJG85U4FT7tn4O2X2fz1rkSMq84EP
 48QKSK1A==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWRCT-0008BY-0B; Sat, 24 Oct 2020 21:35:45 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.93 #3 (Red Hat
 Linux)) id 1kWRCM-001rOT-VA; Sat, 24 Oct 2020 22:35:38 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Subject: [PATCH v3 14/35] iommu/amd: Use msi_msg shadow structs
Date: Sat, 24 Oct 2020 22:35:14 +0100
Message-Id: <20201024213535.443185-15-dwmw2@infradead.org>
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

Get rid of the macro mess and use the shadow structs for the x86 specific
MSI message format. Convert the intcapxt setup to use named bitfields as
well while touching it anyway.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 drivers/iommu/amd/init.c  | 46 ++++++++++++++++++++++-----------------
 drivers/iommu/amd/iommu.c | 14 +++++++-----
 2 files changed, 35 insertions(+), 25 deletions(-)

diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index 82e4af8f09bb..263670d36fed 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -23,7 +23,6 @@
 #include <asm/pci-direct.h>
 #include <asm/iommu.h>
 #include <asm/apic.h>
-#include <asm/msidef.h>
 #include <asm/gart.h>
 #include <asm/x86_init.h>
 #include <asm/iommu_table.h>
@@ -1966,10 +1965,16 @@ static int iommu_setup_msi(struct amd_iommu *iommu)
 	return 0;
 }
 
-#define XT_INT_DEST_MODE(x)	(((x) & 0x1ULL) << 2)
-#define XT_INT_DEST_LO(x)	(((x) & 0xFFFFFFULL) << 8)
-#define XT_INT_VEC(x)		(((x) & 0xFFULL) << 32)
-#define XT_INT_DEST_HI(x)	((((x) >> 24) & 0xFFULL) << 56)
+union intcapxt {
+	u64	capxt;
+	u64	reserved_0		:  2,
+		dest_mode_logical	:  1,
+		reserved_1		:  5,
+		destid_0_23		: 24,
+		vector			:  8,
+		reserved_2		: 16,
+		destid_24_31		:  8;
+} __attribute__ ((packed));
 
 /*
  * Setup the IntCapXT registers with interrupt routing information
@@ -1978,28 +1983,29 @@ static int iommu_setup_msi(struct amd_iommu *iommu)
  */
 static void iommu_update_intcapxt(struct amd_iommu *iommu)
 {
-	u64 val;
-	u32 addr_lo = readl(iommu->mmio_base + MMIO_MSI_ADDR_LO_OFFSET);
-	u32 addr_hi = readl(iommu->mmio_base + MMIO_MSI_ADDR_HI_OFFSET);
-	u32 data    = readl(iommu->mmio_base + MMIO_MSI_DATA_OFFSET);
-	bool dm     = (addr_lo >> MSI_ADDR_DEST_MODE_SHIFT) & 0x1;
-	u32 dest    = ((addr_lo >> MSI_ADDR_DEST_ID_SHIFT) & 0xFF);
+	struct msi_msg msg;
+	union intcapxt xt;
+	u32 destid;
 
-	if (x2apic_enabled())
-		dest |= MSI_ADDR_EXT_DEST_ID(addr_hi);
+	msg.address_lo = readl(iommu->mmio_base + MMIO_MSI_ADDR_LO_OFFSET);
+	msg.address_hi = readl(iommu->mmio_base + MMIO_MSI_ADDR_HI_OFFSET);
+	msg.data = readl(iommu->mmio_base + MMIO_MSI_DATA_OFFSET);
 
-	val = XT_INT_VEC(data & 0xFF) |
-	      XT_INT_DEST_MODE(dm) |
-	      XT_INT_DEST_LO(dest) |
-	      XT_INT_DEST_HI(dest);
+	destid = x86_msi_msg_get_destid(&msg, x2apic_enabled());
+
+	xt.capxt = 0ULL;
+	xt.dest_mode_logical = msg.arch_data.dest_mode_logical;
+	xt.vector = msg.arch_data.vector;
+	xt.destid_0_23 = destid & GENMASK(23, 0);
+	xt.destid_24_31 = destid >> 24;
 
 	/**
 	 * Current IOMMU implemtation uses the same IRQ for all
 	 * 3 IOMMU interrupts.
 	 */
-	writeq(val, iommu->mmio_base + MMIO_INTCAPXT_EVT_OFFSET);
-	writeq(val, iommu->mmio_base + MMIO_INTCAPXT_PPR_OFFSET);
-	writeq(val, iommu->mmio_base + MMIO_INTCAPXT_GALOG_OFFSET);
+	writeq(xt.capxt, iommu->mmio_base + MMIO_INTCAPXT_EVT_OFFSET);
+	writeq(xt.capxt, iommu->mmio_base + MMIO_INTCAPXT_PPR_OFFSET);
+	writeq(xt.capxt, iommu->mmio_base + MMIO_INTCAPXT_GALOG_OFFSET);
 }
 
 static void _irq_notifier_notify(struct irq_affinity_notify *notify,
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index d7f0c8908602..473de0920b64 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -35,7 +35,6 @@
 #include <asm/io_apic.h>
 #include <asm/apic.h>
 #include <asm/hw_irq.h>
-#include <asm/msidef.h>
 #include <asm/proto.h>
 #include <asm/iommu.h>
 #include <asm/gart.h>
@@ -3656,13 +3655,20 @@ struct irq_remap_ops amd_iommu_irq_ops = {
 	.get_irq_domain		= get_irq_domain,
 };
 
+static void fill_msi_msg(struct msi_msg *msg, u32 index)
+{
+	msg->data = index;
+	msg->address_lo = 0;
+	msg->arch_addr_lo.base_address = X86_MSI_BASE_ADDRESS_LOW;
+	msg->address_hi = X86_MSI_BASE_ADDRESS_HIGH;
+}
+
 static void irq_remapping_prepare_irte(struct amd_ir_data *data,
 				       struct irq_cfg *irq_cfg,
 				       struct irq_alloc_info *info,
 				       int devid, int index, int sub_handle)
 {
 	struct irq_2_irte *irte_info = &data->irq_2_irte;
-	struct msi_msg *msg = &data->msi_entry;
 	struct IO_APIC_route_entry *entry;
 	struct amd_iommu *iommu = amd_iommu_rlookup_table[devid];
 
@@ -3693,9 +3699,7 @@ static void irq_remapping_prepare_irte(struct amd_ir_data *data,
 	case X86_IRQ_ALLOC_TYPE_HPET:
 	case X86_IRQ_ALLOC_TYPE_PCI_MSI:
 	case X86_IRQ_ALLOC_TYPE_PCI_MSIX:
-		msg->address_hi = MSI_ADDR_BASE_HI;
-		msg->address_lo = MSI_ADDR_BASE_LO;
-		msg->data = irte_info->index;
+		fill_msi_msg(&data->msi_entry, irte_info->index);
 		break;
 
 	default:
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
