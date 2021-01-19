Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E262FB57A
	for <lists.iommu@lfdr.de>; Tue, 19 Jan 2021 11:52:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5888686DC6;
	Tue, 19 Jan 2021 10:52:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UcIJ8+UcjIUF; Tue, 19 Jan 2021 10:52:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 71B1F86CB6;
	Tue, 19 Jan 2021 10:52:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53323C013A;
	Tue, 19 Jan 2021 10:52:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BFAC1C013A
 for <iommu@lists.linux-foundation.org>; Tue, 19 Jan 2021 10:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7EF48203D9
 for <iommu@lists.linux-foundation.org>; Tue, 19 Jan 2021 10:52:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fb1ueZ84zWLK for <iommu@lists.linux-foundation.org>;
 Tue, 19 Jan 2021 10:52:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by silver.osuosl.org (Postfix) with ESMTP id 60DC1203CC
 for <iommu@lists.linux-foundation.org>; Tue, 19 Jan 2021 10:52:19 +0000 (UTC)
X-UUID: 1c0459e7f3e74769ab96e65bd18a00f9-20210119
X-UUID: 1c0459e7f3e74769ab96e65bd18a00f9-20210119
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 168070190; Tue, 19 Jan 2021 18:52:15 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 Jan 2021 18:52:13 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 19 Jan 2021 18:52:13 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2] of/device: Update dma_range_map only when dev has valid
 dma-ranges
Date: Tue, 19 Jan 2021 18:52:03 +0800
Message-ID: <20210119105203.15530-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>,
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

The commit e0d072782c73 ("dma-mapping: introduce DMA range map,
supplanting dma_pfn_offset") always update dma_range_map even though it was
already set, like in the sunxi_mbus driver. the issue is reported at [1].
This patch avoid this(Updating it only when dev has valid dma-ranges).

Meanwhile, dma_range_map contains the devices' dma_ranges information,
This patch moves dma_range_map before of_iommu_configure. The iommu
driver may need to know the dma_address requirements of its iommu
consumer devices.

[1] https://lore.kernel.org/linux-arm-kernel/5c7946f3-b56e-da00-a750-be097c7ceb32@arm.com/

CC: Rob Herring <robh+dt@kernel.org>
CC: Frank Rowand <frowand.list@gmail.com>
Fixes: e0d072782c73 ("dma-mapping: introduce DMA range map, supplanting dma_pfn_offset"),
Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 drivers/of/device.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index aedfaaafd3e7..1122daa8e273 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -162,9 +162,11 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
 	mask = DMA_BIT_MASK(ilog2(end) + 1);
 	dev->coherent_dma_mask &= mask;
 	*dev->dma_mask &= mask;
-	/* ...but only set bus limit if we found valid dma-ranges earlier */
-	if (!ret)
+	/* ...but only set bus limit and range map if we found valid dma-ranges earlier */
+	if (!ret) {
 		dev->bus_dma_limit = end;
+		dev->dma_range_map = map;
+	}
 
 	coherent = of_dma_is_coherent(np);
 	dev_dbg(dev, "device is%sdma coherent\n",
@@ -172,6 +174,9 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
 
 	iommu = of_iommu_configure(dev, np, id);
 	if (PTR_ERR(iommu) == -EPROBE_DEFER) {
+		/* Don't touch range map if it wasn't set from a valid dma-ranges */
+		if (!ret)
+			dev->dma_range_map = NULL;
 		kfree(map);
 		return -EPROBE_DEFER;
 	}
@@ -181,7 +186,6 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
 
 	arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
 
-	dev->dma_range_map = map;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(of_dma_configure_id);
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
