Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CD28521C2AF
	for <lists.iommu@lfdr.de>; Sat, 11 Jul 2020 08:51:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6C1D1897E6;
	Sat, 11 Jul 2020 06:51:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5TBIOFUZx09P; Sat, 11 Jul 2020 06:51:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EB026897E1;
	Sat, 11 Jul 2020 06:51:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6DF1C016F;
	Sat, 11 Jul 2020 06:51:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D07EBC016F
 for <iommu@lists.linux-foundation.org>; Sat, 11 Jul 2020 06:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AAAEC89B14
 for <iommu@lists.linux-foundation.org>; Sat, 11 Jul 2020 06:50:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id auxWLPa5EvjJ for <iommu@lists.linux-foundation.org>;
 Sat, 11 Jul 2020 06:50:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by whitealder.osuosl.org (Postfix) with ESMTP id D369889B00
 for <iommu@lists.linux-foundation.org>; Sat, 11 Jul 2020 06:50:52 +0000 (UTC)
X-UUID: a3193f6f313a4792a0753dd4b784f45a-20200711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=gNQRNZD1REya632s2rzrylnzdw/0mPJPIR69ojonJBA=; 
 b=tHbmJKk94Ouzc0vaSwAVr2W+S59tjg3NVAJrZ9VXu0y9ETorQ/dlZ4OQ+XUEfKNSIVHDouWJ8cUxNXYQlB3NRm08bhuNYdm5Q366AeSkTYZKAWSlmjYT6SL3ie7biVhjOBxH3+uBhNSYvmGIUS/Dg3hjiZzcq8VARDfMbqeYXnA=;
X-UUID: a3193f6f313a4792a0753dd4b784f45a-20200711
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 709149507; Sat, 11 Jul 2020 14:50:50 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Jul 2020 14:50:46 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 11 Jul 2020 14:50:45 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 07/21] iommu/io-pgtable-arm-v7s: Extend PA34 for MediaTek
Date: Sat, 11 Jul 2020 14:48:32 +0800
Message-ID: <20200711064846.16007-8-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200711064846.16007-1-yong.wu@mediatek.com>
References: <20200711064846.16007-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
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
index 01f2a8876808..2830718b9d83 100644
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
 
@@ -754,7 +759,7 @@ static struct io_pgtable *arm_v7s_alloc_pgtable(struct io_pgtable_cfg *cfg,
 	if (cfg->ias > ARM_V7S_ADDR_BITS)
 		return NULL;
 
-	if (cfg->oas > (arm_v7s_is_mtk_enabled(cfg) ? 34 : ARM_V7S_ADDR_BITS))
+	if (cfg->oas > (arm_v7s_is_mtk_enabled(cfg) ? 35 : ARM_V7S_ADDR_BITS))
 		return NULL;
 
 	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_NS |
diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index a8d8a874a209..c3b4d21760ed 100644
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
index 53d53c6c2be9..48d343189e28 100644
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
