Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EF11227E242
	for <lists.iommu@lfdr.de>; Wed, 30 Sep 2020 09:10:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8F946871AC;
	Wed, 30 Sep 2020 07:10:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8t2qXdml5b-0; Wed, 30 Sep 2020 07:10:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 021FE871DE;
	Wed, 30 Sep 2020 07:10:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E2E0FC0051;
	Wed, 30 Sep 2020 07:10:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D1FCC0051
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 07:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4912586792
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 07:10:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DVhMf97QIKBM for <iommu@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 07:10:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6DD988683F
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 07:10:53 +0000 (UTC)
X-UUID: 738073c326bb4aebba436f60e779267f-20200930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Ui4GWpIpEZeEo5yFuSRb2UvikryR+dwUjLl+SOuaZaI=; 
 b=MU8xJXcQDmw6SBf2HliXfHXco5FDrdUA6A65X1N1qV3ZNUmuNXwh25qepKf294MhaPIZMDSgy+hsPXz8N/XqXtvYY+lG6HcUGnfXJEYda4/omcxiuTnf3ZWwyIAW9UwhYb1TEELYfMvBCJZAaRS2lSbbxKebWlqUUd8N++v4Xis=;
X-UUID: 738073c326bb4aebba436f60e779267f-20200930
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 906972227; Wed, 30 Sep 2020 15:10:52 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 15:10:52 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Sep 2020 15:10:50 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>
Subject: [PATCH v3 19/24] iommu/mediatek: Support up to 34bit iova in tlb flush
Date: Wed, 30 Sep 2020 15:06:42 +0800
Message-ID: <20200930070647.10188-20-yong.wu@mediatek.com>
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

If the iova is 34bit, the iova[32][33] is the bit0/1 in the tlb flush
register. Add a new macro for this.

there is a minor change unrelated with this patch. it also use the new
macro.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 2f26a8242428..a2e519c86ce9 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -125,6 +125,9 @@ static const struct iommu_ops mtk_iommu_ops;
 
 static int mtk_iommu_hw_init(const struct mtk_iommu_data *data);
 
+#define MTK_IOMMU_ADDR(addr) ({unsigned long _addr = addr; \
+			      (lower_32_bits(_addr) | upper_32_bits(_addr)); })
+
 /*
  * In M4U 4GB mode, the physical address is remapped as below:
  *
@@ -213,8 +216,9 @@ static void mtk_iommu_tlb_flush_range_sync(unsigned long iova, size_t size,
 		writel_relaxed(F_INVLD_EN1 | F_INVLD_EN0,
 			       data->base + data->plat_data->inv_sel_reg);
 
-		writel_relaxed(iova, data->base + REG_MMU_INVLD_START_A);
-		writel_relaxed(iova + size - 1,
+		writel_relaxed(MTK_IOMMU_ADDR(iova),
+			       data->base + REG_MMU_INVLD_START_A);
+		writel_relaxed(MTK_IOMMU_ADDR(iova + size - 1),
 			       data->base + REG_MMU_INVLD_END_A);
 		writel_relaxed(F_MMU_INV_RANGE,
 			       data->base + REG_MMU_INVALIDATE);
@@ -634,8 +638,7 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 	if (data->plat_data->m4u_plat == M4U_MT8173)
 		regval = (data->protect_base >> 1) | (data->enable_4GB << 31);
 	else
-		regval = lower_32_bits(data->protect_base) |
-			 upper_32_bits(data->protect_base);
+		regval = MTK_IOMMU_ADDR(data->protect_base);
 	writel_relaxed(regval, data->base + REG_MMU_IVRP_PADDR);
 
 	if (data->enable_4GB &&
-- 
2.18.0
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
