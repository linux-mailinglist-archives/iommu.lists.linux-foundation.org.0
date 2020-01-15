Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1106713B80C
	for <lists.iommu@lfdr.de>; Wed, 15 Jan 2020 04:05:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B621720504;
	Wed, 15 Jan 2020 03:05:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GSl2F1U+TeRg; Wed, 15 Jan 2020 03:05:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E8FC020506;
	Wed, 15 Jan 2020 03:05:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7A61C077D;
	Wed, 15 Jan 2020 03:05:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3101C077D
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jan 2020 03:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DF5E21FFC1
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jan 2020 03:05:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tv6Bhexfsk0T for <iommu@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 03:05:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by silver.osuosl.org (Postfix) with ESMTPS id 65799204CC
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jan 2020 03:05:26 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Jan 2020 19:05:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,321,1574150400"; d="scan'208";a="219138448"
Received: from unknown (HELO allen-box.sh.intel.com) ([10.239.159.138])
 by fmsmga007.fm.intel.com with ESMTP; 14 Jan 2020 19:05:25 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 3/5] iommu/vt-d: Add RMRR base and end addresses sanity check
Date: Wed, 15 Jan 2020 11:03:57 +0800
Message-Id: <20200115030359.13471-4-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115030359.13471-1-baolu.lu@linux.intel.com>
References: <20200115030359.13471-1-baolu.lu@linux.intel.com>
Cc: iommu@lists.linux-foundation.org, Barret Rhoden <brho@google.com>
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

From: Barret Rhoden <brho@google.com>

The VT-d spec specifies requirements for the RMRR entries base and
end (called 'Limit' in the docs) addresses.

This commit will cause the DMAR processing to mark the firmware as
tainted if any RMRR entries that do not meet these requirements.

Signed-off-by: Barret Rhoden <brho@google.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel-iommu.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 0505731b9e47..c6843642f462 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -4454,13 +4454,24 @@ static void __init init_iommu_pm_ops(void)
 static inline void init_iommu_pm_ops(void) {}
 #endif	/* CONFIG_PM */
 
+static int rmrr_sanity_check(struct acpi_dmar_reserved_memory *rmrr)
+{
+	if (!IS_ALIGNED(rmrr->base_address, PAGE_SIZE) ||
+	    !IS_ALIGNED(rmrr->end_address + 1, PAGE_SIZE) ||
+	    rmrr->end_address <= rmrr->base_address ||
+	    arch_rmrr_sanity_check(rmrr))
+		return -EINVAL;
+
+	return 0;
+}
+
 int __init dmar_parse_one_rmrr(struct acpi_dmar_header *header, void *arg)
 {
 	struct acpi_dmar_reserved_memory *rmrr;
 	struct dmar_rmrr_unit *rmrru;
 
 	rmrr = (struct acpi_dmar_reserved_memory *)header;
-	if (arch_rmrr_sanity_check(rmrr))
+	if (rmrr_sanity_check(rmrr))
 		WARN_TAINT(1, TAINT_FIRMWARE_WORKAROUND,
 			   "Your BIOS is broken; bad RMRR [%#018Lx-%#018Lx]\n"
 			   "BIOS vendor: %s; Ver: %s; Product Version: %s\n",
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
