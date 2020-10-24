Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF23297EDA
	for <lists.iommu@lfdr.de>; Sat, 24 Oct 2020 23:36:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C851186DE7;
	Sat, 24 Oct 2020 21:36:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kxahPDvGHO8d; Sat, 24 Oct 2020 21:36:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9FBCD86EFE;
	Sat, 24 Oct 2020 21:35:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96B12C0052;
	Sat, 24 Oct 2020 21:35:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AAF6CC0893
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8A91286E66
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IHIP1AFGdE37 for <iommu@lists.linux-foundation.org>;
 Sat, 24 Oct 2020 21:35:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A8A5386DB2
 for <iommu@lists.linux-foundation.org>; Sat, 24 Oct 2020 21:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=sMMy3wXS54uijk4JH5h3J7a4vVaW9RZ2xz4PorGmAdc=; b=V66eUBuWO4rf6hZdw+dIrvBEom
 6ghRQagZ472dGOfBPsSM+j2XG/Npz8Q5rFD6FRcIj0XP5I/rN0GS5Cc/ty2kBdbSZVLJXyCQ355Vz
 80E33MCeXrBP871hJmda8b46XjejL84Qhm3XyUAGMp6lSY3PtZqBSabd2HPdvZrM/qlNlCvXxI7jN
 867hMv150JWpcevvEWqw6dwecZpDT7HzrfaozBsG18H1Sz+GnF+OlkYoT9w4p7QvqVVJg81/VEpYa
 Npx+OZtLDkTIcf1btcw2Z2W7UfcloK0jGCOgo7xT3axgO+P1DZ8ERe/E/N+0CEZR/1Tv3GRP4un9j
 hu20adpA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWRCS-0006HI-P8; Sat, 24 Oct 2020 21:35:46 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.93 #3 (Red Hat
 Linux)) id 1kWRCN-001rPC-9N; Sat, 24 Oct 2020 22:35:39 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Subject: [PATCH v3 25/35] iommu/vt-d: Implement select() method on remapping
 irqdomain
Date: Sat, 24 Oct 2020 22:35:25 +0100
Message-Id: <20201024213535.443185-26-dwmw2@infradead.org>
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

Preparatory for removing irq_remapping_get_irq_domain()

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/iommu/intel/irq_remapping.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/iommu/intel/irq_remapping.c b/drivers/iommu/intel/irq_remapping.c
index 96c84b19940e..b3b079c0b51e 100644
--- a/drivers/iommu/intel/irq_remapping.c
+++ b/drivers/iommu/intel/irq_remapping.c
@@ -1431,7 +1431,20 @@ static void intel_irq_remapping_deactivate(struct irq_domain *domain,
 	modify_irte(&data->irq_2_iommu, &entry);
 }
 
+static int intel_irq_remapping_select(struct irq_domain *d,
+				      struct irq_fwspec *fwspec,
+				      enum irq_domain_bus_token bus_token)
+{
+	if (x86_fwspec_is_ioapic(fwspec))
+		return d == map_ioapic_to_ir(fwspec->param[0]);
+	else if (x86_fwspec_is_hpet(fwspec))
+		return d == map_hpet_to_ir(fwspec->param[0]);
+
+	return 0;
+}
+
 static const struct irq_domain_ops intel_ir_domain_ops = {
+	.select = intel_irq_remapping_select,
 	.alloc = intel_irq_remapping_alloc,
 	.free = intel_irq_remapping_free,
 	.activate = intel_irq_remapping_activate,
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
