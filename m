Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFE1297ED1
	for <lists.iommu@lfdr.de>; Sat, 24 Oct 2020 23:35:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A517386A78;
	Sat, 24 Oct 2020 21:35:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7JHRHff5ySip; Sat, 24 Oct 2020 21:35:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AE87D86A86;
	Sat, 24 Oct 2020 21:35:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95411C0893;
	Sat, 24 Oct 2020 21:35:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 468C5C0051
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7C69A8749A
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CDl40eGUlQjx for <iommu@lists.linux-foundation.org>;
 Sat, 24 Oct 2020 21:35:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 28D3E8735D
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=FRrY6MEJjYQP0r1yTo24lr6Wep/KFRGuH0gs6Z6h+gY=; b=PZwehCifxy9oGFTZsoyQQWPMYW
 8hb65XgYDurnOCry9q5zsfSfbrDyDCVvd07vdLC3J3JY4UljdzSro5qDGrPEw5zHaTAh6xSwkBFN+
 q9fioKpvL0dHrnPEYh/uQ1lBhmmSG/idC7EMKvAF3TCZ6CMiMqiYRwRKz4AzH1GgcGqejG5NFOH6B
 6+XoFDQhkn3INBMHT9jAjDJwLMDk8ZYJGHw9t/j49lky+GQV4qGDHmp5Rd+NwDNIaEDtPDskC0HY5
 w4PGqsg8SVMzS+sFz81PdyYR3f8TNOTayiMYP1n0IwS92nJS2nepoqIQ2RZF8JVDvcQCtwasERJYm
 R0t4B0zw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWRCT-0008Be-Cn; Sat, 24 Oct 2020 21:35:45 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.93 #3 (Red Hat
 Linux)) id 1kWRCN-001rPO-Bh; Sat, 24 Oct 2020 22:35:39 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Subject: [PATCH v3 28/35] x86/ioapic: Use irq_find_matching_fwspec() to find
 remapping irqdomain
Date: Sat, 24 Oct 2020 22:35:28 +0100
Message-Id: <20201024213535.443185-29-dwmw2@infradead.org>
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

From: David Woodhouse <dwmw@amazon.co.uk>

All possible parent domains have a select method now. Make use of it.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/kernel/apic/io_apic.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kernel/apic/io_apic.c b/arch/x86/kernel/apic/io_apic.c
index ea983da1a57f..443d2c9086b9 100644
--- a/arch/x86/kernel/apic/io_apic.c
+++ b/arch/x86/kernel/apic/io_apic.c
@@ -2320,36 +2320,37 @@ static inline void __init check_timer(void)
 
 static int mp_irqdomain_create(int ioapic)
 {
-	struct irq_alloc_info info;
 	struct irq_domain *parent;
 	int hwirqs = mp_ioapic_pin_count(ioapic);
 	struct ioapic *ip = &ioapics[ioapic];
 	struct ioapic_domain_cfg *cfg = &ip->irqdomain_cfg;
 	struct mp_ioapic_gsi *gsi_cfg = mp_ioapic_gsi_routing(ioapic);
 	struct fwnode_handle *fn;
-	char *name = "IO-APIC";
+	struct irq_fwspec fwspec;
 
 	if (cfg->type == IOAPIC_DOMAIN_INVALID)
 		return 0;
 
-	init_irq_alloc_info(&info, NULL);
-	info.type = X86_IRQ_ALLOC_TYPE_IOAPIC_GET_PARENT;
-	info.devid = mpc_ioapic_id(ioapic);
-	parent = irq_remapping_get_irq_domain(&info);
-	if (!parent)
-		parent = x86_vector_domain;
-	else
-		name = "IO-APIC-IR";
-
 	/* Handle device tree enumerated APICs proper */
 	if (cfg->dev) {
 		fn = of_node_to_fwnode(cfg->dev);
 	} else {
-		fn = irq_domain_alloc_named_id_fwnode(name, ioapic);
+		fn = irq_domain_alloc_named_id_fwnode("IO-APIC", ioapic);
 		if (!fn)
 			return -ENOMEM;
 	}
 
+	fwspec.fwnode = fn;
+	fwspec.param_count = 1;
+	fwspec.param[0] = ioapic;
+
+	parent = irq_find_matching_fwspec(&fwspec, DOMAIN_BUS_ANY);
+	if (!parent) {
+		if (!cfg->dev)
+			irq_domain_free_fwnode(fn);
+		return -ENODEV;
+	}
+
 	ip->irqdomain = irq_domain_create_linear(fn, hwirqs, cfg->ops,
 						 (void *)(long)ioapic);
 
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
