Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFEE12AB76
	for <lists.iommu@lfdr.de>; Thu, 26 Dec 2019 10:58:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 60A73849D8;
	Thu, 26 Dec 2019 09:58:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EMVOPtYaoP4n; Thu, 26 Dec 2019 09:58:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B470684836;
	Thu, 26 Dec 2019 09:58:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9003C1D87;
	Thu, 26 Dec 2019 09:58:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ED58EC0881
 for <iommu@lists.linux-foundation.org>; Thu, 26 Dec 2019 09:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D75AF8147D
 for <iommu@lists.linux-foundation.org>; Thu, 26 Dec 2019 09:58:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eswDAl-rcmQ2 for <iommu@lists.linux-foundation.org>;
 Thu, 26 Dec 2019 09:58:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from condef-01.nifty.com (condef-01.nifty.com [202.248.20.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DE22681F63
 for <iommu@lists.linux-foundation.org>; Thu, 26 Dec 2019 09:58:36 +0000 (UTC)
Received: from conuserg-10.nifty.com ([10.126.8.73])by condef-01.nifty.com
 with ESMTP id xBQ9qRUi006695
 for <iommu@lists.linux-foundation.org>; Thu, 26 Dec 2019 18:52:27 +0900
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id xBQ9pgNX023812;
 Thu, 26 Dec 2019 18:51:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com xBQ9pgNX023812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1577353903;
 bh=KClukxXTuW2tcSXVjPl9rnA5IKVgOInZKdTbkuEgVBI=;
 h=From:To:Cc:Subject:Date:From;
 b=2o6yuETICqz9vX34gn+bLy7yHs1FXSLjOereBev9RZcIhz7gBRb1dmSPm2V5TGAOd
 dcKNftgZq5cr5rypWcQwqb86ymf7sj43vJq9WIcFvRZIcrz+RvlRRQgk2jiT3yd6pr
 tbOtHzNjczGhX5lopVT87iMfEPkHVK+lScN3+wpMXy6s4IafhVEEcXABXCVyYHaeph
 w4oKI+eRzTcZRpp5GATb1PDHNl0SSHhgDGUO56YObn60LMo0VuFrCnv3DUtzgbu030
 gqHxr+/Bpmhhr9gHbAxLH+tzOp0P3FTtTUOV7NWVVYRr+J7YlU1EaLyjizoSu8elmv
 4eqrco172Ex0g==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org
Subject: [PATCH 1/2] iommu/arm-smmu-v3: constify arm_smmu_options[]
Date: Thu, 26 Dec 2019 18:51:40 +0900
Message-Id: <20191226095141.30352-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kernel@vger.kernel.org
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

This is a read-only array.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/iommu/arm-smmu-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index b463599559d2..ed9933960370 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -673,7 +673,7 @@ struct arm_smmu_option_prop {
 	const char *prop;
 };
 
-static struct arm_smmu_option_prop arm_smmu_options[] = {
+static const struct arm_smmu_option_prop arm_smmu_options[] = {
 	{ ARM_SMMU_OPT_SKIP_PREFETCH, "hisilicon,broken-prefetch-cmd" },
 	{ ARM_SMMU_OPT_PAGE0_REGS_ONLY, "cavium,cn9900-broken-page1-regspace"},
 	{ 0, NULL},
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
