Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AA977297EEB
	for <lists.iommu@lfdr.de>; Sat, 24 Oct 2020 23:36:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3D9BF8738C;
	Sat, 24 Oct 2020 21:36:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8GdIlsyho7fQ; Sat, 24 Oct 2020 21:36:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 925D085829;
	Sat, 24 Oct 2020 21:36:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76E7AC0052;
	Sat, 24 Oct 2020 21:36:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D7CAC0052
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2BE1B23039
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NU4+beTV-IkG for <iommu@lists.linux-foundation.org>;
 Sat, 24 Oct 2020 21:35:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id A40E42305A
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=tXaDtA8AlDHiJo6CID7MBLTJkVhL6ZWrEjYFDhbVSOc=; b=jZBsmV1Z+bZLBc+Bv0OcQk1yef
 CKmEMas2B7A5j3beajSBIcV3jUI8nv06JyRiKITWOjYMlyKmHV7yfctYhASQLYyYtjpv7GvSqjgTd
 2XPp9rtOnNrgqMz9HJI0N+J4bdHxClCzP3uWonEY3zD+/gamBIaj+rWRtbYZ+8N8J2PpOaLTGzenR
 nC7PH4cfSTCUeZKQi7q4xZBvDGUlAe+HZiOC7eDamrdwzSfrnqS2u+CQtJKXsrFt8npaAoOYI4fnr
 qU2sCYEYBteXJi9yGKTr2CDmD/JBPsQMR9rUO1G9yv/jyuQFiKpDoEhWtDRY1PcKj+EhH6P0aVwjz
 PeEYAtRA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWRCS-0006HB-Cl; Sat, 24 Oct 2020 21:35:46 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.93 #3 (Red Hat
 Linux)) id 1kWRCM-001rOP-UR; Sat, 24 Oct 2020 22:35:38 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Subject: [PATCH v3 13/35] iommu/intel: Use msi_msg shadow structs
Date: Sat, 24 Oct 2020 22:35:13 +0100
Message-Id: <20201024213535.443185-14-dwmw2@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201024213535.443185-1-dwmw2@infradead.org>
References: <e6601ff691afb3266e365a91e8b221179daf22c2.camel@infradead.org>
 <20201024213535.443185-1-dwmw2@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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

Use the bitfields in the x86 shadow struct to compose the MSI message.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 drivers/iommu/intel/irq_remapping.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/intel/irq_remapping.c b/drivers/iommu/intel/irq_remapping.c
index 5628d43b795e..30269b738fa5 100644
--- a/drivers/iommu/intel/irq_remapping.c
+++ b/drivers/iommu/intel/irq_remapping.c
@@ -20,7 +20,6 @@
 #include <asm/cpu.h>
 #include <asm/irq_remapping.h>
 #include <asm/pci-direct.h>
-#include <asm/msidef.h>
 
 #include "../irq_remapping.h"
 
@@ -1260,6 +1259,21 @@ static struct irq_chip intel_ir_chip = {
 	.irq_set_vcpu_affinity	= intel_ir_set_vcpu_affinity,
 };
 
+static void fill_msi_msg(struct msi_msg *msg, u32 index, u32 subhandle)
+{
+	memset(msg, 0, sizeof(*msg));
+
+	msg->arch_addr_lo.dmar_base_address = X86_MSI_BASE_ADDRESS_LOW;
+	msg->arch_addr_lo.dmar_subhandle_valid = true;
+	msg->arch_addr_lo.dmar_format = true;
+	msg->arch_addr_lo.dmar_index_0_14 = index & 0x7FFF;
+	msg->arch_addr_lo.dmar_index_15 = !!(index & 0x8000);
+
+	msg->address_hi = X86_MSI_BASE_ADDRESS_HIGH;
+
+	msg->arch_data.dmar_subhandle = subhandle;
+}
+
 static void intel_irq_remapping_prepare_irte(struct intel_ir_data *data,
 					     struct irq_cfg *irq_cfg,
 					     struct irq_alloc_info *info,
@@ -1267,7 +1281,6 @@ static void intel_irq_remapping_prepare_irte(struct intel_ir_data *data,
 {
 	struct IR_IO_APIC_route_entry *entry;
 	struct irte *irte = &data->irte_entry;
-	struct msi_msg *msg = &data->msi_entry;
 
 	prepare_irte(irte, irq_cfg->vector, irq_cfg->dest_apicid);
 	switch (info->type) {
@@ -1308,12 +1321,7 @@ static void intel_irq_remapping_prepare_irte(struct intel_ir_data *data,
 		else
 			set_msi_sid(irte, msi_desc_to_pci_dev(info->desc));
 
-		msg->address_hi = MSI_ADDR_BASE_HI;
-		msg->data = sub_handle;
-		msg->address_lo = MSI_ADDR_BASE_LO | MSI_ADDR_IR_EXT_INT |
-				  MSI_ADDR_IR_SHV |
-				  MSI_ADDR_IR_INDEX1(index) |
-				  MSI_ADDR_IR_INDEX2(index);
+		fill_msi_msg(&data->msi_entry, index, sub_handle);
 		break;
 
 	default:
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
