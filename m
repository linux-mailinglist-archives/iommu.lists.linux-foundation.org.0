Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9CC28C9D3
	for <lists.iommu@lfdr.de>; Tue, 13 Oct 2020 10:12:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 660DC2E0FD;
	Tue, 13 Oct 2020 08:12:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JwqJdrLfaa-V; Tue, 13 Oct 2020 08:12:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4DCE32E0F2;
	Tue, 13 Oct 2020 08:12:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2332FC0051;
	Tue, 13 Oct 2020 08:12:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2DA1BC07FF
 for <iommu@lists.linux-foundation.org>; Tue, 13 Oct 2020 08:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 187AA2E0ED
 for <iommu@lists.linux-foundation.org>; Tue, 13 Oct 2020 08:12:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hb62-BojR+lg for <iommu@lists.linux-foundation.org>;
 Tue, 13 Oct 2020 08:12:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id 8C52A2026D
 for <iommu@lists.linux-foundation.org>; Tue, 13 Oct 2020 08:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=EY8UHzC6+5/iDJsfDzabkl6LPehqG3ZtEqYxa4ewh6o=; b=Q+cMUieQWgDbWqlRk6eSdi2Goq
 w4opBNGckPwtNox/hjjkpzSKduFWkniiM62a9BNOz3omxqd7LmwuhvMMfKHhmvneRc2Y7q9Emk3IJ
 Gpq790hBMJOcSHeWvqDUp6HKrwkJkMcJT1o7eaiQDcZiqt+B82cdLbRHNpwwyVPibK/LszJfwbTKQ
 RCo0fhNtVRokIeFP3g5qGTj+LK/1pbZUHMuGcyAbofjzW7kGsyI4LiIGfsuUxJtL+/m8pJBLGeHLc
 3e/mg0uhAKUDX5nzK7YFhfi+ZDgKDC4BJPfudyanlNWmGHWWF0s1GHbq/BJDAE68MXZX36ehTaI/X
 CMZ69h8A==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSFPM-0006fO-Qj; Tue, 13 Oct 2020 08:12:01 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.93 #3 (Red Hat
 Linux)) id 1kSFPM-006XXM-CG; Tue, 13 Oct 2020 09:11:44 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Subject: [PATCH 1/9] genirq/irqdomain: Implement get_name() method on irqchip
 fwnodes
Date: Tue, 13 Oct 2020 09:11:31 +0100
Message-Id: <20201013081139.1558200-2-dwmw2@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201013081139.1558200-1-dwmw2@infradead.org>
References: <0de733f6384874d68afba2606119d0d9b1e8b34e.camel@infradead.org>
 <20201013081139.1558200-1-dwmw2@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-hyperv@vger.kernel.org, kvm <kvm@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 maz@misterjones.org, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>
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

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 kernel/irq/irqdomain.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index 76cd7ebd1178..6440f97c412e 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -42,7 +42,16 @@ static inline void debugfs_add_domain_dir(struct irq_domain *d) { }
 static inline void debugfs_remove_domain_dir(struct irq_domain *d) { }
 #endif
 
-const struct fwnode_operations irqchip_fwnode_ops;
+static const char *irqchip_fwnode_get_name(const struct fwnode_handle *fwnode)
+{
+	struct irqchip_fwid *fwid = container_of(fwnode, struct irqchip_fwid, fwnode);
+
+	return fwid->name;
+}
+
+const struct fwnode_operations irqchip_fwnode_ops = {
+	.get_name = irqchip_fwnode_get_name,
+};
 EXPORT_SYMBOL_GPL(irqchip_fwnode_ops);
 
 /**
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
