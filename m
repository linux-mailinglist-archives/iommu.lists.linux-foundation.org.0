Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C2E374001
	for <lists.iommu@lfdr.de>; Wed,  5 May 2021 18:33:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FEB883E16;
	Wed,  5 May 2021 16:33:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xzX-rgcclUdw; Wed,  5 May 2021 16:33:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CF0883E10;
	Wed,  5 May 2021 16:33:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BB89C0001;
	Wed,  5 May 2021 16:33:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 21DADC0024
 for <iommu@lists.linux-foundation.org>; Wed,  5 May 2021 16:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02AA360A6E
 for <iommu@lists.linux-foundation.org>; Wed,  5 May 2021 16:33:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5GrqRoxNaPxj for <iommu@lists.linux-foundation.org>;
 Wed,  5 May 2021 16:33:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DEF1B60804
 for <iommu@lists.linux-foundation.org>; Wed,  5 May 2021 16:33:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2867361438;
 Wed,  5 May 2021 16:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232392;
 bh=k7BYsjVDX28HkILI3v2n5y6yPJGjgPrpZVVERGHEIQw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Psk7pdnbLGCQ+Y21vp7rvX6lRB9FMt6nsxnadNr+tixOu2g+SmWhHw+TcTmv8nW87
 sxzz569OwgT91PI+VYa0clax+veuhhIsQIEVHoj1yrWEwXh9MWLWSn4JhfMgJ9gbgp
 CAL6K0ogZMzYSeWH3oHfQ8UTZPfoNgs0y5jIL8WVf2V1PuWjQQnEAmVTz4fxcXv1q4
 jVzfycqYoyMQthAf4obcJIpwhfKNzrSHKuYeOkpFRySshGK6DA2pC1wSWJDvrZKHbG
 jI6YD/wIRVOfu+g5AzkFeYIobzN6GYugnBjcT9egBXNnh1xml/SWIbrzbE7Zwk5N4M
 RdyxK9UamGbQA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 076/116] iommu/amd: Remove performance counter
 pre-initialization test
Date: Wed,  5 May 2021 12:30:44 -0400
Message-Id: <20210505163125.3460440-76-sashal@kernel.org>
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

From: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>

[ Upstream commit 994d6608efe4a4c8834bdc5014c86f4bc6aceea6 ]

In early AMD desktop/mobile platforms (during 2013), when the IOMMU
Performance Counter (PMC) support was first introduced in
commit 30861ddc9cca ("perf/x86/amd: Add IOMMU Performance Counter
resource management"), there was a HW bug where the counters could not
be accessed. The result was reading of the counter always return zero.

At the time, the suggested workaround was to add a test logic prior
to initializing the PMC feature to check if the counters can be programmed
and read back the same value. This has been working fine until the more
recent desktop/mobile platforms start enabling power gating for the PMC,
which prevents access to the counters. This results in the PMC support
being disabled unnecesarily.

Unfortunatly, there is no documentation of since which generation
of hardware the original PMC HW bug was fixed. Although, it was fixed
soon after the first introduction of the PMC. Base on this, we assume
that the buggy platforms are less likely to be in used, and it should
be relatively safe to remove this legacy logic.

Link: https://lore.kernel.org/linux-iommu/alpine.LNX.3.20.13.2006030935570.3181@monopod.intra.ispras.ru/
Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=201753
Cc: Tj (Elloe Linux) <ml.linux@elloe.vision>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Alexander Monakov <amonakov@ispras.ru>
Cc: David Coe <david.coe@live.co.uk>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>
Signed-off-by: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Tested-by: Shuah Khan <skhan@linuxfoundation.org>
Link: https://lore.kernel.org/r/20210409085848.3908-3-suravee.suthikulpanit@amd.com
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/amd/init.c | 24 +-----------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index 648cdfd03074..247cdda5d683 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -1714,33 +1714,16 @@ static int __init init_iommu_all(struct acpi_table_header *table)
 	return 0;
 }
 
-static int iommu_pc_get_set_reg(struct amd_iommu *iommu, u8 bank, u8 cntr,
-				u8 fxn, u64 *value, bool is_write);
-
 static void init_iommu_perf_ctr(struct amd_iommu *iommu)
 {
+	u64 val;
 	struct pci_dev *pdev = iommu->dev;
-	u64 val = 0xabcd, val2 = 0, save_reg = 0;
 
 	if (!iommu_feature(iommu, FEATURE_PC))
 		return;
 
 	amd_iommu_pc_present = true;
 
-	/* save the value to restore, if writable */
-	if (iommu_pc_get_set_reg(iommu, 0, 0, 0, &save_reg, false))
-		goto pc_false;
-
-	/* Check if the performance counters can be written to */
-	if ((iommu_pc_get_set_reg(iommu, 0, 0, 0, &val, true)) ||
-	    (iommu_pc_get_set_reg(iommu, 0, 0, 0, &val2, false)) ||
-	    (val != val2))
-		goto pc_false;
-
-	/* restore */
-	if (iommu_pc_get_set_reg(iommu, 0, 0, 0, &save_reg, true))
-		goto pc_false;
-
 	pci_info(pdev, "IOMMU performance counters supported\n");
 
 	val = readl(iommu->mmio_base + MMIO_CNTR_CONF_OFFSET);
@@ -1748,11 +1731,6 @@ static void init_iommu_perf_ctr(struct amd_iommu *iommu)
 	iommu->max_counters = (u8) ((val >> 7) & 0xf);
 
 	return;
-
-pc_false:
-	pci_err(pdev, "Unable to read/write to IOMMU perf counter.\n");
-	amd_iommu_pc_present = false;
-	return;
 }
 
 static ssize_t amd_iommu_show_cap(struct device *dev,
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
