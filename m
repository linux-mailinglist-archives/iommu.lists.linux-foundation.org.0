Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D10145F8C9
	for <lists.iommu@lfdr.de>; Sat, 27 Nov 2021 02:22:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9330282ED1;
	Sat, 27 Nov 2021 01:22:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m9RH0iOK8Pq5; Sat, 27 Nov 2021 01:22:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C166F82F03;
	Sat, 27 Nov 2021 01:22:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D63C5C0040;
	Sat, 27 Nov 2021 01:22:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2AE16C000A
 for <iommu@lists.linux-foundation.org>; Sat, 27 Nov 2021 01:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14C1740593
 for <iommu@lists.linux-foundation.org>; Sat, 27 Nov 2021 01:22:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linutronix.de header.b="JGOm47tn";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=linutronix.de header.b="UhZekJ9B"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LxgTwCLhgJ-D for <iommu@lists.linux-foundation.org>;
 Sat, 27 Nov 2021 01:22:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 509B24040B
 for <iommu@lists.linux-foundation.org>; Sat, 27 Nov 2021 01:22:10 +0000 (UTC)
Message-ID: <20211126230525.829661122@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637976128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=nmKGryDQWbwyJR1CDEm4vqqjiZhUfRsqcakAQiYvOSs=;
 b=JGOm47tns3WIQurWuZElgoG4P8v1MW+VLwPpBPk6lQPUMHT3XAE9OtE1X49fD4W+VKV2xp
 JDEBF+Lkj5LTi/9TPjeXUcVqMzpU6qXamEvLVlFJ+kXzjzFh0XLwTURcicEXZIx5L9g8xR
 6qN4xWvv9azttaYPjdrHp4VzBNlxbiIpnYE2ZL7vcMTkyiFTgodAJqNgtjlyymLezHB44G
 fidwbqpgE/qnaciDVe2mr7dk8HGRdyEJUXhDxEoj4BJi723GAEbuiAOYnHfHLHpaB9OXcN
 w5KFLNCyRyEDqsOQNFSIxggGbjorVDAlfkwDxO96DW+znu0LH3sNOzYNomAw9g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637976128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=nmKGryDQWbwyJR1CDEm4vqqjiZhUfRsqcakAQiYvOSs=;
 b=UhZekJ9BZ5VQt+1pbavJdoCuDWDBEA8s9fALid5ZX84NVREKpInffD7HYpVnmD8FX+kC6z
 GBkHz+gHybNEefBw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 32/37] perf/smmuv3: Use msi_get_virq()
References: <20211126224100.303046749@linutronix.de>
MIME-Version: 1.0
Date: Sat, 27 Nov 2021 02:22:08 +0100 (CET)
Cc: Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
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

Let the core code fiddle with the MSI descriptor retrieval.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/perf/arm_smmuv3_pmu.c |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

--- a/drivers/perf/arm_smmuv3_pmu.c
+++ b/drivers/perf/arm_smmuv3_pmu.c
@@ -684,7 +684,6 @@ static void smmu_pmu_write_msi_msg(struc
 
 static void smmu_pmu_setup_msi(struct smmu_pmu *pmu)
 {
-	struct msi_desc *desc;
 	struct device *dev = pmu->dev;
 	int ret;
 
@@ -701,9 +700,7 @@ static void smmu_pmu_setup_msi(struct sm
 		return;
 	}
 
-	desc = first_msi_entry(dev);
-	if (desc)
-		pmu->irq = desc->irq;
+	pmu->irq = msi_get_virq(dev, 0);
 
 	/* Add callback to free MSIs on teardown */
 	devm_add_action(dev, smmu_pmu_free_msis, dev);

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
