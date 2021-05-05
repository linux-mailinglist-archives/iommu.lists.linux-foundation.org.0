Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCA1373FFF
	for <lists.iommu@lfdr.de>; Wed,  5 May 2021 18:33:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F310405D2;
	Wed,  5 May 2021 16:33:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ObAD3orqYX-k; Wed,  5 May 2021 16:33:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 054B7405CC;
	Wed,  5 May 2021 16:33:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5C29C0001;
	Wed,  5 May 2021 16:33:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25355C0001
 for <iommu@lists.linux-foundation.org>; Wed,  5 May 2021 16:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1387D404B3
 for <iommu@lists.linux-foundation.org>; Wed,  5 May 2021 16:33:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oiuMf93RD9tW for <iommu@lists.linux-foundation.org>;
 Wed,  5 May 2021 16:33:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0F8ED40192
 for <iommu@lists.linux-foundation.org>; Wed,  5 May 2021 16:33:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 685FD61440;
 Wed,  5 May 2021 16:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232390;
 bh=TI/NkKvomSev1pw5roJMP0GXP1lACqMo9lIpHZd1S0M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=afLHsdnlUMT+nUpMvaLNWf7SOH6UCyeR27YHzJmQ1o5USjezWGbIne7lDQjGlZR16
 g2zEALbvP751NQINp8Ozmik7/roV9He4oKoosO94jaSxd1LEXKl91BA+kGXjlzir3N
 NUDwuqe7MSMN2wPAARXiuF5zXG0a/NhP3v7WLYuVa/MvyX48n22+MTyAsUDkeeoMZc
 z70PkPXKd/lEz+9we5WNp+iOZabGs/VjI8ez75p1dLhmcDPqJ3Cm73+9KfClJ/Od2e
 tnMeb9zSHeieQthCURwtNndmUabCsS5Q+SUODavld+ZH5W0qgHvoaoQb0hvDnkitoG
 ZTlHX5lu0fW7g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 075/116] Revert "iommu/amd: Fix performance
 counter initialization"
Date: Wed,  5 May 2021 12:30:43 -0400
Message-Id: <20210505163125.3460440-75-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163125.3460440-1-sashal@kernel.org>
References: <20210505163125.3460440-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Joerg Roedel <jroedel@suse.de>, David Coe <david.coe@live.co.uk>,
 Alexander Monakov <amonakov@ispras.ru>, iommu@lists.linux-foundation.org,
 Shuah Khan <skhan@linuxfoundation.org>, Tj <ml.linux@elloe.vision>
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

From: Paul Menzel <pmenzel@molgen.mpg.de>

[ Upstream commit 715601e4e36903a653cd4294dfd3ed0019101991 ]

This reverts commit 6778ff5b21bd8e78c8bd547fd66437cf2657fd9b.

The original commit tries to address an issue, where PMC power-gating
causing the IOMMU PMC pre-init test to fail on certain desktop/mobile
platforms where the power-gating is normally enabled.

There have been several reports that the workaround still does not
guarantee to work, and can add up to 100 ms (on the worst case)
to the boot process on certain platforms such as the MSI B350M MORTAR
with AMD Ryzen 3 2200G.

Therefore, revert this commit as a prelude to removing the pre-init
test.

Link: https://lore.kernel.org/linux-iommu/alpine.LNX.3.20.13.2006030935570.3181@monopod.intra.ispras.ru/
Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=201753
Cc: Tj (Elloe Linux) <ml.linux@elloe.vision>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Alexander Monakov <amonakov@ispras.ru>
Cc: David Coe <david.coe@live.co.uk>
Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Link: https://lore.kernel.org/r/20210409085848.3908-2-suravee.suthikulpanit@amd.com
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/amd/init.c | 45 ++++++++++------------------------------
 1 file changed, 11 insertions(+), 34 deletions(-)

diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index 321f5906e6ed..648cdfd03074 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -12,7 +12,6 @@
 #include <linux/acpi.h>
 #include <linux/list.h>
 #include <linux/bitmap.h>
-#include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/syscore_ops.h>
 #include <linux/interrupt.h>
@@ -257,8 +256,6 @@ static enum iommu_init_state init_state = IOMMU_START_STATE;
 static int amd_iommu_enable_interrupts(void);
 static int __init iommu_go_to_state(enum iommu_init_state state);
 static void init_device_table_dma(void);
-static int iommu_pc_get_set_reg(struct amd_iommu *iommu, u8 bank, u8 cntr,
-				u8 fxn, u64 *value, bool is_write);
 
 static bool amd_iommu_pre_enabled = true;
 
@@ -1717,11 +1714,13 @@ static int __init init_iommu_all(struct acpi_table_header *table)
 	return 0;
 }
 
-static void __init init_iommu_perf_ctr(struct amd_iommu *iommu)
+static int iommu_pc_get_set_reg(struct amd_iommu *iommu, u8 bank, u8 cntr,
+				u8 fxn, u64 *value, bool is_write);
+
+static void init_iommu_perf_ctr(struct amd_iommu *iommu)
 {
-	int retry;
 	struct pci_dev *pdev = iommu->dev;
-	u64 val = 0xabcd, val2 = 0, save_reg, save_src;
+	u64 val = 0xabcd, val2 = 0, save_reg = 0;
 
 	if (!iommu_feature(iommu, FEATURE_PC))
 		return;
@@ -1729,39 +1728,17 @@ static void __init init_iommu_perf_ctr(struct amd_iommu *iommu)
 	amd_iommu_pc_present = true;
 
 	/* save the value to restore, if writable */
-	if (iommu_pc_get_set_reg(iommu, 0, 0, 0, &save_reg, false) ||
-	    iommu_pc_get_set_reg(iommu, 0, 0, 8, &save_src, false))
-		goto pc_false;
-
-	/*
-	 * Disable power gating by programing the performance counter
-	 * source to 20 (i.e. counts the reads and writes from/to IOMMU
-	 * Reserved Register [MMIO Offset 1FF8h] that are ignored.),
-	 * which never get incremented during this init phase.
-	 * (Note: The event is also deprecated.)
-	 */
-	val = 20;
-	if (iommu_pc_get_set_reg(iommu, 0, 0, 8, &val, true))
+	if (iommu_pc_get_set_reg(iommu, 0, 0, 0, &save_reg, false))
 		goto pc_false;
 
 	/* Check if the performance counters can be written to */
-	val = 0xabcd;
-	for (retry = 5; retry; retry--) {
-		if (iommu_pc_get_set_reg(iommu, 0, 0, 0, &val, true) ||
-		    iommu_pc_get_set_reg(iommu, 0, 0, 0, &val2, false) ||
-		    val2)
-			break;
-
-		/* Wait about 20 msec for power gating to disable and retry. */
-		msleep(20);
-	}
-
-	/* restore */
-	if (iommu_pc_get_set_reg(iommu, 0, 0, 0, &save_reg, true) ||
-	    iommu_pc_get_set_reg(iommu, 0, 0, 8, &save_src, true))
+	if ((iommu_pc_get_set_reg(iommu, 0, 0, 0, &val, true)) ||
+	    (iommu_pc_get_set_reg(iommu, 0, 0, 0, &val2, false)) ||
+	    (val != val2))
 		goto pc_false;
 
-	if (val != val2)
+	/* restore */
+	if (iommu_pc_get_set_reg(iommu, 0, 0, 0, &save_reg, true))
 		goto pc_false;
 
 	pci_info(pdev, "IOMMU performance counters supported\n");
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
