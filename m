Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E49C2551D9
	for <lists.iommu@lfdr.de>; Fri, 28 Aug 2020 02:12:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BC6E2204F6;
	Fri, 28 Aug 2020 00:12:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wjKxqYaLRCDV; Fri, 28 Aug 2020 00:12:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4EBD1204EF;
	Fri, 28 Aug 2020 00:12:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 284F9C0891;
	Fri, 28 Aug 2020 00:12:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3949BC0051
 for <iommu@lists.linux-foundation.org>; Fri, 28 Aug 2020 00:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 224498788B
 for <iommu@lists.linux-foundation.org>; Fri, 28 Aug 2020 00:11:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c2IXmBolxrWd for <iommu@lists.linux-foundation.org>;
 Fri, 28 Aug 2020 00:11:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8390087823
 for <iommu@lists.linux-foundation.org>; Fri, 28 Aug 2020 00:11:58 +0000 (UTC)
IronPort-SDR: siNPajksMaRcnh96S3amE58IEKJj+DcuOCGOhymDd6pWaLLf9lT7Pm9yBtVhk/6MjnPt+hITtT
 BtlDtaG6BDxw==
X-IronPort-AV: E=McAfee;i="6000,8403,9726"; a="218136485"
X-IronPort-AV: E=Sophos;i="5.76,361,1592895600"; d="scan'208";a="218136485"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2020 17:11:57 -0700
IronPort-SDR: ybI/oXaQ2PUZ0qV1ZjpRekPtQQQPXEoQH27Pygw74hyi84IhJpPkE1fVn5LximRNLX051N7PrG
 pgMbzkg4UdiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,361,1592895600"; d="scan'208";a="500306728"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by fmsmga006.fm.intel.com with ESMTP; 27 Aug 2020 17:11:55 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v3 1/1] iommu/vt-d: Serialize IOMMU GCMD register modifications
Date: Fri, 28 Aug 2020 08:06:15 +0800
Message-Id: <20200828000615.8281-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
 iommu@lists.linux-foundation.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

The VT-d spec requires (10.4.4 Global Command Register, GCMD_REG General
Description) that:

If multiple control fields in this register need to be modified, software
must serialize the modifications through multiple writes to this register.

However, in irq_remapping.c, modifications of IRE and CFI are done in one
write. We need to do two separate writes with STS checking after each. It
also checks the status register before writing command register to avoid
unnecessary register write.

Fixes: af8d102f999a4 ("x86/intel/irq_remapping: Clean up x2apic opt-out security warning mess")
Cc: Andy Lutomirski <luto@amacapital.net>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Ashok Raj <ashok.raj@intel.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/irq_remapping.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

Change log:
v1->v2:
  - v1 posted here
    https://lore.kernel.org/linux-iommu/20200826025825.2322-1-baolu.lu@linux.intel.com/
  - Add status check before disabling CFI (Kevin)
v2->v3:
  - v2 posted here
    https://lore.kernel.org/linux-iommu/20200827042513.30292-1-baolu.lu@linux.intel.com/
  - Remove unnecessary register read (Kevin)

diff --git a/drivers/iommu/intel/irq_remapping.c b/drivers/iommu/intel/irq_remapping.c
index 9564d23d094f..a91dd997d268 100644
--- a/drivers/iommu/intel/irq_remapping.c
+++ b/drivers/iommu/intel/irq_remapping.c
@@ -507,12 +507,18 @@ static void iommu_enable_irq_remapping(struct intel_iommu *iommu)
 
 	/* Enable interrupt-remapping */
 	iommu->gcmd |= DMA_GCMD_IRE;
-	iommu->gcmd &= ~DMA_GCMD_CFI;  /* Block compatibility-format MSIs */
 	writel(iommu->gcmd, iommu->reg + DMAR_GCMD_REG);
-
 	IOMMU_WAIT_OP(iommu, DMAR_GSTS_REG,
 		      readl, (sts & DMA_GSTS_IRES), sts);
 
+	/* Block compatibility-format MSIs */
+	if (sts & DMA_GSTS_CFIS) {
+		iommu->gcmd &= ~DMA_GCMD_CFI;
+		writel(iommu->gcmd, iommu->reg + DMAR_GCMD_REG);
+		IOMMU_WAIT_OP(iommu, DMAR_GSTS_REG,
+			      readl, !(sts & DMA_GSTS_CFIS), sts);
+	}
+
 	/*
 	 * With CFI clear in the Global Command register, we should be
 	 * protected from dangerous (i.e. compatibility) interrupts
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
