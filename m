Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C8427E21B
	for <lists.iommu@lfdr.de>; Wed, 30 Sep 2020 09:09:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 572BA86850;
	Wed, 30 Sep 2020 07:09:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jYn78EFyfmyD; Wed, 30 Sep 2020 07:09:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D242C86838;
	Wed, 30 Sep 2020 07:09:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD8B4C0051;
	Wed, 30 Sep 2020 07:09:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68E58C0051
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 07:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5742F86843
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 07:09:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LU+Uwm6Xn888 for <iommu@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 07:09:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7EF5381D76
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 07:09:03 +0000 (UTC)
X-UUID: e8f46f3a15d74819bfaa31bb8ed33291-20200930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=u2nLowWb9320Nhqe4Te3XyjuUyh2p45gZPSNv8O11x4=; 
 b=EZAW6Jatb+I+lVXOYq613sFllezZhg7GYFOmkfyYl/MR/DT8554+l7A/3Z5hxSuJqTJjYMeYjGMavPgOjShqG+K7knwFAXG3JrlCmAdqEcEH7YBZw7qzydoFCaH6gMVYxT512HH3WtgYg1DnitEpxmCThiTCCj6ZHn8d5YBOBWQ=;
X-UUID: e8f46f3a15d74819bfaa31bb8ed33291-20200930
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1805677688; Wed, 30 Sep 2020 15:09:00 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 15:08:52 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Sep 2020 15:08:53 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>
Subject: [PATCH v3 09/24] iommu/io-pgtable-arm-v7s: Extend PA34 for MediaTek
Date: Wed, 30 Sep 2020 15:06:32 +0800
Message-ID: <20200930070647.10188-10-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200930070647.10188-1-yong.wu@mediatek.com>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, kernel-team@android.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Greg Kroah-Hartman <gregkh@google.com>, linux-arm-kernel@lists.infradead.org
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

MediaTek extend the bit5 in lvl1 and lvl2 descriptor as PA34.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/io-pgtable-arm-v7s.c | 9 +++++++--
 drivers/iommu/mtk_iommu.c          | 2 +-
 include/linux/io-pgtable.h         | 4 ++--
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index 4c9d8dccfc5a..a3b3e9147b8d 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -112,9 +112,10 @@
 #define ARM_V7S_TEX_MASK		0x7
 #define ARM_V7S_ATTR_TEX(val)		(((val) & ARM_V7S_TEX_MASK) << ARM_V7S_TEX_SHIFT)
 
-/* MediaTek extend the two bits for PA 32bit/33bit */
+/* MediaTek extend the bits below for PA 32bit/33bit/34bit */
 #define ARM_V7S_ATTR_MTK_PA_BIT32	BIT(9)
 #define ARM_V7S_ATTR_MTK_PA_BIT33	BIT(4)
+#define ARM_V7S_ATTR_MTK_PA_BIT34	BIT(5)
 
 /* *well, except for TEX on level 2 large pages, of course :( */
 #define ARM_V7S_CONT_PAGE_TEX_SHIFT	6
@@ -194,6 +195,8 @@ static arm_v7s_iopte paddr_to_iopte(phys_addr_t paddr, int lvl,
 		pte |= ARM_V7S_ATTR_MTK_PA_BIT32;
 	if (paddr & BIT_ULL(33))
 		pte |= ARM_V7S_ATTR_MTK_PA_BIT33;
+	if (paddr & BIT_ULL(34))
+		pte |= ARM_V7S_ATTR_MTK_PA_BIT34;
 	return pte;
 }
 
@@ -218,6 +221,8 @@ static phys_addr_t iopte_to_paddr(arm_v7s_iopte pte, int lvl,
 		paddr |= BIT_ULL(32);
 	if (pte & ARM_V7S_ATTR_MTK_PA_BIT33)
 		paddr |= BIT_ULL(33);
+	if (pte & ARM_V7S_ATTR_MTK_PA_BIT34)
+		paddr |= BIT_ULL(34);
 	return paddr;
 }
 
@@ -753,7 +758,7 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 	if (cfg->ias > ARM_V7S_ADDR_BITS)
 		return NULL;
 
-	if (cfg->oas > (arm_v7s_is_mtk_enabled(cfg) ? 34 : ARM_V7S_ADDR_BITS))
+	if (cfg->oas > (arm_v7s_is_mtk_enabled(cfg) ? 35 : ARM_V7S_ADDR_BITS))
 		return NULL;
 
 	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index fd8322ee4980..f6a2e3eb59d2 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -317,7 +317,7 @@ static int mtk_iommu_domain_finalise(struct mtk_iommu_domain *dom)
 			IO_PGTABLE_QUIRK_ARM_MTK_EXT,
 		.pgsize_bitmap = mtk_iommu_ops.pgsize_bitmap,
 		.ias = 32,
-		.oas = 34,
+		.oas = 35,
 		.tlb = &mtk_iommu_flush_ops,
 		.iommu_dev = data->dev,
 	};
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 23285ba645db..8c9a889d8df9 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -77,8 +77,8 @@ struct io_pgtable_cfg {
 	 *	TLB maintenance when mapping as well as when unmapping.
 	 *
 	 * IO_PGTABLE_QUIRK_ARM_MTK_EXT: (ARM v7s format) MediaTek IOMMUs extend
-	 *	to support up to 34 bits PA where the bit32 and bit33 are
-	 *	encoded in the bit9 and bit4 of the PTE respectively.
+	 *	to support up to 35 bits PA where the bit32, bit33 and bit34 are
+	 *	encoded in the bit9, bit4 and bit5 of the PTE respectively.
 	 *
 	 * IO_PGTABLE_QUIRK_NON_STRICT: Skip issuing synchronous leaf TLBIs
 	 *	on unmap, for DMA domains using the flush queue mechanism for
-- 
2.18.0
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
