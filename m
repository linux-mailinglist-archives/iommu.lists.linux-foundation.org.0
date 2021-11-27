Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DFB45F83A
	for <lists.iommu@lfdr.de>; Sat, 27 Nov 2021 02:21:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F74D40579;
	Sat, 27 Nov 2021 01:21:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nHsxtKeao5UT; Sat, 27 Nov 2021 01:20:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4F52440583;
	Sat, 27 Nov 2021 01:20:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23C73C000A;
	Sat, 27 Nov 2021 01:20:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B090C001C
 for <iommu@lists.linux-foundation.org>; Sat, 27 Nov 2021 01:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 176DE61C11
 for <iommu@lists.linux-foundation.org>; Sat, 27 Nov 2021 01:20:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linutronix.de header.b="qcphe6he";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=linutronix.de header.b="rxtvy30S"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JdIj_RmlHS1c for <iommu@lists.linux-foundation.org>;
 Sat, 27 Nov 2021 01:20:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75E9261C13
 for <iommu@lists.linux-foundation.org>; Sat, 27 Nov 2021 01:20:55 +0000 (UTC)
Message-ID: <20211126230525.660206325@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637976053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=jDw77Q4/ltoMqqyOm7bRFWOUZ2wme/igWfBiXxqo04E=;
 b=qcphe6heJuFhgeduvF2Reuv4MsRdWQoJvg2SS3EklVbtfQMCfMHepnA6aswHZvdCNm95JM
 ZJCqv8yvfhWXCo7kpdm0VoADVoyFe16/31gccfBww5+RFExnu8gp0atniaD79Qi3vDjbQM
 B5gEnUCbG7Qa7lbqxJ0yxhbiq2ncMH6xYARq59W2DoqThjv7anXdD9w7J/3Wlv23hDx8Yz
 toD0JJ62PtZRlhLFza6PCjm1YqhAqE6ewJ1sJP2ky4RQBZWSsTJMQv4c9KXKUsUPpmDJtm
 2sBBQv12zQ1ocJDsjCrFoBod+HNM+8Kj49KY0bhQYTebAv0oebDz+XXdkGUDnQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637976053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=jDw77Q4/ltoMqqyOm7bRFWOUZ2wme/igWfBiXxqo04E=;
 b=rxtvy30SOfVqYPnNL8Cg8Y3TzkF1flw2TNQolZOnFfTQrmh4C6E16aqDKf5J1vmsXVOdd6
 srt6OU8S/yzbHDCQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 29/37] PCI/MSI: Use __msi_get_virq() in pci_get_vector()
References: <20211126224100.303046749@linutronix.de>
MIME-Version: 1.0
Date: Sat, 27 Nov 2021 02:20:53 +0100 (CET)
Cc: Nishanth Menon <nm@ti.com>, Mark Rutland <mark.rutland@arm.com>,
 Stuart Yoder <stuyoder@gmail.com>, linux-pci@vger.kernel.org,
 Will Deacon <will@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Marc Zygnier <maz@kernel.org>, x86@kernel.org, Sinan Kaya <okaya@kernel.org>,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <helgaas@kernel.org>,
 Megha Dey <megha.dey@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Tero Kristo <kristo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org
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

Use __msi_get_vector() and handle the return values to be compatible.

No functional change intended.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi/msi.c |   25 +++++--------------------
 1 file changed, 5 insertions(+), 20 deletions(-)

--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -1023,28 +1023,13 @@ EXPORT_SYMBOL(pci_free_irq_vectors);
  */
 int pci_irq_vector(struct pci_dev *dev, unsigned int nr)
 {
-	if (dev->msix_enabled) {
-		struct msi_desc *entry;
+	int irq = __msi_get_virq(&dev->dev, nr);
 
-		for_each_pci_msi_entry(entry, dev) {
-			if (entry->msi_index == nr)
-				return entry->irq;
-		}
-		WARN_ON_ONCE(1);
-		return -EINVAL;
+	switch (irq) {
+	case -ENODEV: return !nr ? dev->irq : -EINVAL;
+	case -ENOENT: return -EINVAL;
 	}
-
-	if (dev->msi_enabled) {
-		struct msi_desc *entry = first_pci_msi_entry(dev);
-
-		if (WARN_ON_ONCE(nr >= entry->nvec_used))
-			return -EINVAL;
-	} else {
-		if (WARN_ON_ONCE(nr > 0))
-			return -EINVAL;
-	}
-
-	return dev->irq + nr;
+	return irq;
 }
 EXPORT_SYMBOL(pci_irq_vector);
 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
