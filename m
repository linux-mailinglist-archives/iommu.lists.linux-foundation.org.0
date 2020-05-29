Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BE91E88A5
	for <lists.iommu@lfdr.de>; Fri, 29 May 2020 22:11:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AA73187589;
	Fri, 29 May 2020 20:11:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pVOd9pOFOVdf; Fri, 29 May 2020 20:11:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B27E8875CD;
	Fri, 29 May 2020 20:11:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 976DAC0891;
	Fri, 29 May 2020 20:11:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2CF1FC016F
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 20:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 100BE25EA4
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 20:11:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kox32Cbeos5c for <iommu@lists.linux-foundation.org>;
 Fri, 29 May 2020 20:11:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.45])
 by silver.osuosl.org (Postfix) with ESMTP id 005C320392
 for <iommu@lists.linux-foundation.org>; Fri, 29 May 2020 20:11:08 +0000 (UTC)
Received: from localhost.localdomain (unknown [46.188.10.168])
 by mail.ispras.ru (Postfix) with ESMTPSA id 3BDC8CD461;
 Fri, 29 May 2020 23:11:06 +0300 (MSK)
From: Alexander Monakov <amonakov@ispras.ru>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] iommu/amd: Fix event counter availability check
Date: Fri, 29 May 2020 23:07:38 +0300
Message-Id: <20200529200738.1923-1-amonakov@ispras.ru>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: Alexander Monakov <amonakov@ispras.ru>, iommu@lists.linux-foundation.org
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

The driver performs an extra check if the IOMMU's capabilities advertise
presence of performance counters: it verifies that counters are writable
by writing a hard-coded value to a counter and testing that reading that
counter gives back the same value.

Unfortunately it does so quite early, even before pci_enable_device is
called for the IOMMU, i.e. when accessing its MMIO space is not
guaranteed to work. On Ryzen 4500U CPU, this actually breaks the test:
the driver assumes the counters are not writable, and disables the
functionality.

Moving init_iommu_perf_ctr just after iommu_flush_all_caches resolves
the issue. This is the earliest point in amd_iommu_init_pci where the
call succeeds on my laptop.

Signed-off-by: Alexander Monakov <amonakov@ispras.ru>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Cc: iommu@lists.linux-foundation.org
---

PS. I'm seeing another hiccup with IOMMU probing on my system:
pci 0000:00:00.2: can't derive routing for PCI INT A
pci 0000:00:00.2: PCI INT A: not connected

Hopefully I can figure it out, but I'd appreciate hints.

 drivers/iommu/amd_iommu_init.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/amd_iommu_init.c b/drivers/iommu/amd_iommu_init.c
index 5b81fd16f5fa..1b7ec6b6a282 100644
--- a/drivers/iommu/amd_iommu_init.c
+++ b/drivers/iommu/amd_iommu_init.c
@@ -1788,8 +1788,6 @@ static int __init iommu_init_pci(struct amd_iommu *iommu)
 	if (iommu->cap & (1UL << IOMMU_CAP_NPCACHE))
 		amd_iommu_np_cache = true;
 
-	init_iommu_perf_ctr(iommu);
-
 	if (is_rd890_iommu(iommu->dev)) {
 		int i, j;
 
@@ -1891,8 +1889,10 @@ static int __init amd_iommu_init_pci(void)
 
 	init_device_table_dma();
 
-	for_each_iommu(iommu)
+	for_each_iommu(iommu) {
 		iommu_flush_all_caches(iommu);
+		init_iommu_perf_ctr(iommu);
+	}
 
 	if (!ret)
 		print_iommu_info();

base-commit: 75caf310d16cc5e2f851c048cd597f5437013368
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
