Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 548A012AB72
	for <lists.iommu@lfdr.de>; Thu, 26 Dec 2019 10:57:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 85BB88426E;
	Thu, 26 Dec 2019 09:57:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mOD6Wm9HpPD9; Thu, 26 Dec 2019 09:57:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7469C8409C;
	Thu, 26 Dec 2019 09:57:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5FB8DC1D87;
	Thu, 26 Dec 2019 09:57:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3BC3FC0881
 for <iommu@lists.linux-foundation.org>; Thu, 26 Dec 2019 09:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 22DE884BE5
 for <iommu@lists.linux-foundation.org>; Thu, 26 Dec 2019 09:57:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Yd6NUUawpqu for <iommu@lists.linux-foundation.org>;
 Thu, 26 Dec 2019 09:57:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from condef-06.nifty.com (condef-06.nifty.com [202.248.20.71])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BF90C84B2D
 for <iommu@lists.linux-foundation.org>; Thu, 26 Dec 2019 09:57:18 +0000 (UTC)
Received: from conuserg-10.nifty.com ([10.126.8.73])by condef-06.nifty.com
 with ESMTP id xBQ9qP3i031294
 for <iommu@lists.linux-foundation.org>; Thu, 26 Dec 2019 18:52:25 +0900
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id xBQ9pgNY023812;
 Thu, 26 Dec 2019 18:51:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com xBQ9pgNY023812
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1577353904;
 bh=ZLGd9Sa7OALWrLmeWhKg0zq7ZvRRBITnevotAyP+VUY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oMWsgAD7R/WJ2a2AIefVtYY9nZ9TdqVt884C1haeLpabCj7Fd2Xf4zuc3jhuQk30K
 yjjIxwdEdN2KbihzBeV7tl0m0LqoCaihEX/dETE7W/li8pQqaH85rnWM/s+ojNu2Xz
 203MHgdB5eUJBhu9KvHsOKMuWvmQ7KzJycDHx6Fzg7evPmc34l0qY1TdGdVdZvXCrF
 /aIGwh8lWfh1dMQyXw5GDKKywIecYr1hq+0y47ELlRUPnsV5Ty+IeHMdCDzOb0qgDp
 LZU34q1ozlbJdJvz++YtUNDTbHztD+AQXSZQ6cKTSxj0w0CkMes0JrI31FZaQCIb9s
 5syvPjmEpHsVA==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org
Subject: [PATCH 2/2] iommu/arm-smmu-v3: simplify parse_driver_options()
Date: Thu, 26 Dec 2019 18:51:41 +0900
Message-Id: <20191226095141.30352-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191226095141.30352-1-yamada.masahiro@socionext.com>
References: <20191226095141.30352-1-yamada.masahiro@socionext.com>
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

Using ARRAY_SIZE() instead of the sentinel is slightly simpler, IMHO.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/iommu/arm-smmu-v3.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index ed9933960370..b27489b7f9d8 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -676,7 +676,6 @@ struct arm_smmu_option_prop {
 static const struct arm_smmu_option_prop arm_smmu_options[] = {
 	{ ARM_SMMU_OPT_SKIP_PREFETCH, "hisilicon,broken-prefetch-cmd" },
 	{ ARM_SMMU_OPT_PAGE0_REGS_ONLY, "cavium,cn9900-broken-page1-regspace"},
-	{ 0, NULL},
 };
 
 static inline void __iomem *arm_smmu_page1_fixup(unsigned long offset,
@@ -696,16 +695,16 @@ static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
 
 static void parse_driver_options(struct arm_smmu_device *smmu)
 {
-	int i = 0;
+	int i;
 
-	do {
+	for (i = 0; i < ARRAY_SIZE(arm_smmu_options); i++) {
 		if (of_property_read_bool(smmu->dev->of_node,
 						arm_smmu_options[i].prop)) {
 			smmu->options |= arm_smmu_options[i].opt;
 			dev_notice(smmu->dev, "option %s\n",
 				arm_smmu_options[i].prop);
 		}
-	} while (arm_smmu_options[++i].opt);
+	};
 }
 
 /* Low-level queue manipulation functions */
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
