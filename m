Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD51297EE8
	for <lists.iommu@lfdr.de>; Sat, 24 Oct 2020 23:36:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 147A986AD7;
	Sat, 24 Oct 2020 21:36:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iuXzmaj0nUVt; Sat, 24 Oct 2020 21:36:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4C65486A7C;
	Sat, 24 Oct 2020 21:36:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 45718C0051;
	Sat, 24 Oct 2020 21:36:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34C2CC0051
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E38C923039
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B+1ZymBNxxNF for <iommu@lists.linux-foundation.org>;
 Sat, 24 Oct 2020 21:35:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id 1CF7723077
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=rRBPjTVV0ZOTPMxFXL1DflibnJyEB+1NPLg1fUvp6iE=; b=LV5fmz/vx1aIK0Lx5EwSFNH0MJ
 sA3O/ZDA11TTMkM3LsNOQkdLE32BK/BHninErmYL2GLGx3J8QTnBvhGeNhQElbJWiQjM+9UGihbQH
 NSa6EJAy6n81Epvb74tBCYecakcu4DVzgwqam0Tr5FLKRJ4XU3gcIi5e7YsWnYXbnyuM9ZfNT8xAj
 Er7Hrg3cC6gSe4QcNPgTu55+P5bYXLVo5+kND3YY/QtN9TAtdyRV7Tuwkl3uwFzx0/IWubS9YTprj
 RE1ztyYK8Pw5Z7V9qf1djFHVdy0ZxEaSHvNN3AKoY2KvmQ2mDAjVqjhHzfrmvh6Mdw5YECnRfPRPk
 cPLVNAxg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWRCS-0006HL-Tw; Sat, 24 Oct 2020 21:35:47 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.93 #3 (Red Hat
 Linux)) id 1kWRCN-001rPW-DE; Sat, 24 Oct 2020 22:35:39 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Subject: [PATCH v3 30/35] iommu/vt-d: Simplify intel_irq_remapping_select()
Date: Sat, 24 Oct 2020 22:35:30 +0100
Message-Id: <20201024213535.443185-31-dwmw2@infradead.org>
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

From: David Woodhouse <dwmw@amazon.co.uk>

Now that the old get_irq_domain() method has gone, consolidate on just the
map_XXX_to_iommu() functions.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/iommu/intel/irq_remapping.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/intel/irq_remapping.c b/drivers/iommu/intel/irq_remapping.c
index bca44015bc1d..aeffda92b10b 100644
--- a/drivers/iommu/intel/irq_remapping.c
+++ b/drivers/iommu/intel/irq_remapping.c
@@ -203,13 +203,13 @@ static int modify_irte(struct irq_2_iommu *irq_iommu,
 	return rc;
 }
 
-static struct irq_domain *map_hpet_to_ir(u8 hpet_id)
+static struct intel_iommu *map_hpet_to_iommu(u8 hpet_id)
 {
 	int i;
 
 	for (i = 0; i < MAX_HPET_TBS; i++) {
 		if (ir_hpet[i].id == hpet_id && ir_hpet[i].iommu)
-			return ir_hpet[i].iommu->ir_domain;
+			return ir_hpet[i].iommu;
 	}
 	return NULL;
 }
@@ -225,13 +225,6 @@ static struct intel_iommu *map_ioapic_to_iommu(int apic)
 	return NULL;
 }
 
-static struct irq_domain *map_ioapic_to_ir(int apic)
-{
-	struct intel_iommu *iommu = map_ioapic_to_iommu(apic);
-
-	return iommu ? iommu->ir_domain : NULL;
-}
-
 static struct irq_domain *map_dev_to_ir(struct pci_dev *dev)
 {
 	struct dmar_drhd_unit *drhd = dmar_find_matched_drhd_unit(dev);
@@ -1418,12 +1411,14 @@ static int intel_irq_remapping_select(struct irq_domain *d,
 				      struct irq_fwspec *fwspec,
 				      enum irq_domain_bus_token bus_token)
 {
+	struct intel_iommu *iommu = NULL;
+
 	if (x86_fwspec_is_ioapic(fwspec))
-		return d == map_ioapic_to_ir(fwspec->param[0]);
+		iommu = map_ioapic_to_iommu(fwspec->param[0]);
 	else if (x86_fwspec_is_hpet(fwspec))
-		return d == map_hpet_to_ir(fwspec->param[0]);
+		iommu = map_hpet_to_iommu(fwspec->param[0]);
 
-	return 0;
+	return iommu && d == iommu->ir_domain;
 }
 
 static const struct irq_domain_ops intel_ir_domain_ops = {
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
