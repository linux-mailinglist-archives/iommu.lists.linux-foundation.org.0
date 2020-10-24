Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C45297EE0
	for <lists.iommu@lfdr.de>; Sat, 24 Oct 2020 23:36:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 22AE686AE6;
	Sat, 24 Oct 2020 21:36:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sH9-5IbTRmY6; Sat, 24 Oct 2020 21:36:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AAC6486A7C;
	Sat, 24 Oct 2020 21:36:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94309C0052;
	Sat, 24 Oct 2020 21:36:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD7E0C0052
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7E30086EC0
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SavTGwLOh-_t for <iommu@lists.linux-foundation.org>;
 Sat, 24 Oct 2020 21:35:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2D00486DA3
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=DBXQeOdNuSbK9uNqJUHpNvc0pB1QrhBTIryIhIif25g=; b=CgD2OtSg5phvJF0lzasncrO8uK
 xA3V4sVprblWZiPp63cQPaMPcYuLnJGTih31/fVNFD1rH+tIIRwvVaPEG1LvZ5nllrQ4EcQpOvLUR
 ceZy7a+JEuxUda0Q4m+WCpk78ZgOvQoDs9GnJfNdjUKuD9aJebLjkCl9LjpzBP9/T4wdJGePVbaJW
 dg/UhMqKHT287Dbnj1d5E8ewf+s8+XRKjlEk5khlLpraUmK+PIjYTuEtCu3EoKK0tPU6hkrzdQ62U
 RP58JV+MMOm6BNkIvg2mqE0h6s9X9HcC4qZnFzePZ1PXXfLyOKwsbhETxfoepVki0OSGjBjBZIFj+
 Wge9wkrw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWRCS-0006HH-Ne; Sat, 24 Oct 2020 21:35:47 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.93 #3 (Red Hat
 Linux)) id 1kWRCN-001rP8-8j; Sat, 24 Oct 2020 22:35:39 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Subject: [PATCH v3 24/35] iommu/amd: Implement select() method on remapping
 irqdomain
Date: Sat, 24 Oct 2020 22:35:24 +0100
Message-Id: <20201024213535.443185-25-dwmw2@infradead.org>
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

Preparatory change to remove irq_remapping_get_irq_domain().

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/iommu/amd/iommu.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 9744cdbefd88..31b22244e9c2 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3882,7 +3882,26 @@ static void irq_remapping_deactivate(struct irq_domain *domain,
 					    irte_info->index);
 }
 
+static int irq_remapping_select(struct irq_domain *d, struct irq_fwspec *fwspec,
+				enum irq_domain_bus_token bus_token)
+{
+	struct amd_iommu *iommu;
+	int devid = -1;
+
+	if (x86_fwspec_is_ioapic(fwspec))
+		devid = get_ioapic_devid(fwspec->param[0]);
+	else if (x86_fwspec_is_hpet(fwspec))
+		devid = get_hpet_devid(fwspec->param[0]);
+
+	if (devid < 0)
+		return 0;
+
+	iommu = amd_iommu_rlookup_table[devid];
+	return iommu && iommu->ir_domain == d;
+}
+
 static const struct irq_domain_ops amd_ir_domain_ops = {
+	.select = irq_remapping_select,
 	.alloc = irq_remapping_alloc,
 	.free = irq_remapping_free,
 	.activate = irq_remapping_activate,
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
