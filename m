Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 235F83EEBCF
	for <lists.iommu@lfdr.de>; Tue, 17 Aug 2021 13:35:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E75640350;
	Tue, 17 Aug 2021 11:35:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mfKTOmRfF8V0; Tue, 17 Aug 2021 11:35:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 82228401CE;
	Tue, 17 Aug 2021 11:35:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E2F5C000E;
	Tue, 17 Aug 2021 11:35:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7DF2C000E
 for <iommu@lists.linux-foundation.org>; Tue, 17 Aug 2021 11:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E07A280EAC
 for <iommu@lists.linux-foundation.org>; Tue, 17 Aug 2021 11:35:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lnf-bCmz5Qju for <iommu@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 11:35:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1020580EA0
 for <iommu@lists.linux-foundation.org>; Tue, 17 Aug 2021 11:35:05 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Gppq51S8Sz871y;
 Tue, 17 Aug 2021 19:34:57 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 17 Aug 2021 19:35:03 +0800
Received: from thunder-town.china.huawei.com (10.174.178.242) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 17 Aug 2021 19:35:03 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Joerg
 Roedel" <joro@8bytes.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, iommu
 <iommu@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] iommu/arm-smmu-v3: Simplify useless instructions in
 arm_smmu_cmdq_build_cmd()
Date: Tue, 17 Aug 2021 19:34:50 +0800
Message-ID: <20210817113450.2026-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.178.242]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
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

Although the parameter 'cmd' is always passed by a local array variable,
and only this function modifies it, the compiler does not know this. The
compiler almost always reads the value of cmd[i] from memory rather than
directly using the value cached in the register. This generates many
useless instruction operations and affects the performance to some extent.

To guide the compiler for proper optimization, 'cmd' is defined as a local
array variable, marked as register, and copied to the output parameter at
a time when the function is returned.

The optimization effect can be viewed by running the "size arm-smmu-v3.o"
command.

Before:
   text    data     bss     dec     hex
  27602    1348      56   29006    714e

After:
   text    data     bss     dec     hex
  27402    1348      56   28806    7086

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index d76bbbde558b776..50a9db5bac466c7 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -233,11 +233,19 @@ static int queue_remove_raw(struct arm_smmu_queue *q, u64 *ent)
 	return 0;
 }
 
+#define arm_smmu_cmdq_copy_cmd(dst, src)	\
+	do {					\
+		dst[0] = src[0];		\
+		dst[1] = src[1];		\
+	} while (0)
+
 /* High-level queue accessors */
-static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
+static int arm_smmu_cmdq_build_cmd(u64 *out_cmd, struct arm_smmu_cmdq_ent *ent)
 {
-	memset(cmd, 0, 1 << CMDQ_ENT_SZ_SHIFT);
-	cmd[0] |= FIELD_PREP(CMDQ_0_OP, ent->opcode);
+	register u64 cmd[CMDQ_ENT_DWORDS];
+
+	cmd[0] = FIELD_PREP(CMDQ_0_OP, ent->opcode);
+	cmd[1] = 0;
 
 	switch (ent->opcode) {
 	case CMDQ_OP_TLBI_EL2_ALL:
@@ -309,6 +317,7 @@ static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
 		case PRI_RESP_SUCC:
 			break;
 		default:
+			arm_smmu_cmdq_copy_cmd(out_cmd, cmd);
 			return -EINVAL;
 		}
 		cmd[1] |= FIELD_PREP(CMDQ_PRI_1_RESP, ent->pri.resp);
@@ -329,9 +338,12 @@ static int arm_smmu_cmdq_build_cmd(u64 *cmd, struct arm_smmu_cmdq_ent *ent)
 		cmd[0] |= FIELD_PREP(CMDQ_SYNC_0_MSIATTR, ARM_SMMU_MEMATTR_OIWB);
 		break;
 	default:
+		arm_smmu_cmdq_copy_cmd(out_cmd, cmd);
 		return -ENOENT;
 	}
 
+	arm_smmu_cmdq_copy_cmd(out_cmd, cmd);
+
 	return 0;
 }
 
-- 
2.26.0.106.g9fadedd

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
