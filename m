Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B78C297ECA
	for <lists.iommu@lfdr.de>; Sat, 24 Oct 2020 23:35:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5657D87462;
	Sat, 24 Oct 2020 21:35:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yDNtULpEe3F6; Sat, 24 Oct 2020 21:35:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E5AED874C5;
	Sat, 24 Oct 2020 21:35:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CD3CDC1AD8;
	Sat, 24 Oct 2020 21:35:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2B41C0051
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A984086DDD
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ctNNNQK6ifoU for <iommu@lists.linux-foundation.org>;
 Sat, 24 Oct 2020 21:35:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C2A1786396
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=wH4zdtlPHtTRbohjSTH2M3pmJlqwW7kIz3LA78TDQsk=; b=Yd7ssv37MjMjvm3OvFGzbUq3ou
 Wa3CF0IG2EsibDDUnPHsHtBHRoSCa0rx/QXBDjnpOB3dmZOYJrDFYzYyKHwu+h13ak23/v5KuQzGa
 1H0aARvn4DVv7Y6Go7nWXD5b6TkpL/m+/3a89kLR5qk/WpWRR1qpIo1rNm9KvQfa7Gp3ahUzWGB4p
 ADSyE7EGROV8etSXyYtIv6PhffqRO3Iv69zTZoYpt9PMTWXZrIpcBwAX0ZnTou8uMHHjPP5EWuni6
 i9gl8FTtQSmfItae3DSdDfUlajoW/wt3hEUJhq/g+e/SxRBCT8fwaJFuT6HHx14iivCaceyvMEk6m
 VShFODEw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWRCS-0006HC-EX; Sat, 24 Oct 2020 21:35:46 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.93 #3 (Red Hat
 Linux)) id 1kWRCM-001rOX-W7; Sat, 24 Oct 2020 22:35:38 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Subject: [PATCH v3 15/35] PCI: vmd: Use msi_msg shadow structs
Date: Sat, 24 Oct 2020 22:35:15 +0100
Message-Id: <20201024213535.443185-16-dwmw2@infradead.org>
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

Use the x86 shadow structs in msi_msg instead of the macros.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 drivers/pci/controller/vmd.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
index aa1b12bac9a1..72de3c6f644e 100644
--- a/drivers/pci/controller/vmd.c
+++ b/drivers/pci/controller/vmd.c
@@ -18,7 +18,6 @@
 #include <asm/irqdomain.h>
 #include <asm/device.h>
 #include <asm/msi.h>
-#include <asm/msidef.h>
 
 #define VMD_CFGBAR	0
 #define VMD_MEMBAR1	2
@@ -131,10 +130,10 @@ static void vmd_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 	struct vmd_irq_list *irq = vmdirq->irq;
 	struct vmd_dev *vmd = irq_data_get_irq_handler_data(data);
 
-	msg->address_hi = MSI_ADDR_BASE_HI;
-	msg->address_lo = MSI_ADDR_BASE_LO |
-			  MSI_ADDR_DEST_ID(index_from_irqs(vmd, irq));
-	msg->data = 0;
+	memset(&msg, 0, sizeof(*msg);
+	msg->address_hi = X86_MSI_BASE_ADDRESS_HIGH;
+	msg->arch_addr_lo.base_address = X86_MSI_BASE_ADDRESS_LOW;
+	msg->arch_addr_lo.destid_0_7 = index_from_irqs(vmd, irq);
 }
 
 /*
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
