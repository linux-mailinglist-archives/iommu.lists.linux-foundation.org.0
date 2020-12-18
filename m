Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A4FE62DE00A
	for <lists.iommu@lfdr.de>; Fri, 18 Dec 2020 09:44:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 65F6A87865;
	Fri, 18 Dec 2020 08:44:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GfUlZOzehaCU; Fri, 18 Dec 2020 08:44:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B5D0B875EA;
	Fri, 18 Dec 2020 08:44:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9322AC0893;
	Fri, 18 Dec 2020 08:44:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EEBDEC0893
 for <iommu@lists.linux-foundation.org>; Fri, 18 Dec 2020 08:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E6F512E10E
 for <iommu@lists.linux-foundation.org>; Fri, 18 Dec 2020 08:44:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id goa2H3yb-ceG for <iommu@lists.linux-foundation.org>;
 Fri, 18 Dec 2020 08:44:15 +0000 (UTC)
X-Greylist: delayed 00:05:03 by SQLgrey-1.7.6
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 by silver.osuosl.org (Postfix) with ESMTPS id D58152E103
 for <iommu@lists.linux-foundation.org>; Fri, 18 Dec 2020 08:44:14 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608281054; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=KTUphJmvon2mltyw0OoY02nZ5K7J0Ceqc5udY/Pam+Q=;
 b=OMnqgAv1EPSSguP0kbnRAAgt6zlvC1j1RiHMxW4BOOft5bCT83UoCXj7IDz4Yz/STLRALyCA
 nrN0x18u8wercwBjK36ydb/SS38uuhfnhLJIY9px01jJ9yMK48KPx9UCU0AIoBnp2RtBVoTE
 rmSk5tPEVbA0mtRM+XSlhnpRjko=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5fdc6aab031793dcb42d6238 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Dec 2020 08:39:07
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A8694C43469; Fri, 18 Dec 2020 08:39:07 +0000 (UTC)
Received: from isaacm-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: isaacm)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 322ACC433CA;
 Fri, 18 Dec 2020 08:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 322ACC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=isaacm@codeaurora.org
From: "Isaac J. Manjarres" <isaacm@codeaurora.org>
To: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] iommu/io-pgtable: Prepare for modularization
Date: Fri, 18 Dec 2020 00:38:41 -0800
Message-Id: <1608280722-19841-3-git-send-email-isaacm@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608280722-19841-1-git-send-email-isaacm@codeaurora.org>
References: <1608280722-19841-1-git-send-email-isaacm@codeaurora.org>
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>, kernel-team@android.com,
 pdaly@codeaurora.org, will@kernel.org, robin.murphy@arm.com,
 pratikp@codeaurora.org
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

The io-pgtable source file uses the #ifdef preprocessor macro
to construct the io_pgtable_init_table structure. However,
the #ifdef macro evaluates to true if the config it is testing
is set to y. This is not ideal when the configs that the
io-pgtable code checks for can be m, so use IS_ENABLED() instead.
Also, add the GPL v2 module license to the io-pgtable source file.

Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
---
 drivers/iommu/io-pgtable.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/io-pgtable.c b/drivers/iommu/io-pgtable.c
index 94394c8..867ecb4 100644
--- a/drivers/iommu/io-pgtable.c
+++ b/drivers/iommu/io-pgtable.c
@@ -10,18 +10,19 @@
 #include <linux/bug.h>
 #include <linux/io-pgtable.h>
 #include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/types.h>
 
 static const struct io_pgtable_init_fns *
 io_pgtable_init_table[IO_PGTABLE_NUM_FMTS] = {
-#ifdef CONFIG_IOMMU_IO_PGTABLE_LPAE
+#if IS_ENABLED(CONFIG_IOMMU_IO_PGTABLE_LPAE)
 	[ARM_32_LPAE_S1] = &io_pgtable_arm_32_lpae_s1_init_fns,
 	[ARM_32_LPAE_S2] = &io_pgtable_arm_32_lpae_s2_init_fns,
 	[ARM_64_LPAE_S1] = &io_pgtable_arm_64_lpae_s1_init_fns,
 	[ARM_64_LPAE_S2] = &io_pgtable_arm_64_lpae_s2_init_fns,
 	[ARM_MALI_LPAE] = &io_pgtable_arm_mali_lpae_init_fns,
 #endif
-#ifdef CONFIG_IOMMU_IO_PGTABLE_ARMV7S
+#if IS_ENABLED(CONFIG_IOMMU_IO_PGTABLE_ARMV7S)
 	[ARM_V7S] = &io_pgtable_arm_v7s_init_fns,
 #endif
 };
@@ -68,3 +69,5 @@ void free_io_pgtable_ops(struct io_pgtable_ops *ops)
 	io_pgtable_init_table[iop->fmt]->free(iop);
 }
 EXPORT_SYMBOL_GPL(free_io_pgtable_ops);
+
+MODULE_LICENSE("GPL v2");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
