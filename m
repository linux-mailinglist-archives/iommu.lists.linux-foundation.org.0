Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4373EB0C6
	for <lists.iommu@lfdr.de>; Fri, 13 Aug 2021 08:56:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E06DB401CD;
	Fri, 13 Aug 2021 06:56:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h9lQ5YAkDCTt; Fri, 13 Aug 2021 06:56:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D5634403AE;
	Fri, 13 Aug 2021 06:56:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 962AFC0022;
	Fri, 13 Aug 2021 06:56:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 19468C000E
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 06:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE8CF60BAD
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 06:56:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MAl6iP26Hcgr for <iommu@lists.linux-foundation.org>;
 Fri, 13 Aug 2021 06:56:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E8C960778
 for <iommu@lists.linux-foundation.org>; Fri, 13 Aug 2021 06:56:03 +0000 (UTC)
X-UUID: b9537abd3f4c4c06b0be6fba6c2e13e7-20210813
X-UUID: b9537abd3f4c4c06b0be6fba6c2e13e7-20210813
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 612864669; Fri, 13 Aug 2021 14:56:01 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 Aug 2021 14:55:59 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Aug 2021 14:55:58 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 18/29] iommu/mediatek: Add PCIe support
Date: Fri, 13 Aug 2021 14:53:13 +0800
Message-ID: <20210813065324.29220-19-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210813065324.29220-1-yong.wu@mediatek.com>
References: <20210813065324.29220-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, chao.hao@mediatek.com,
 anan.sun@mediatek.com, linux-arm-kernel@lists.infradead.org
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

Currently the code for of_iommu_configure_dev_id is like this:

static int of_iommu_configure_dev_id(struct device_node *master_np,
                                     struct device *dev,
                                     const u32 *id)
{
       struct of_phandle_args iommu_spec = { .args_count = 1 };

       err = of_map_id(master_np, *id, "iommu-map",
                       "iommu-map-mask", &iommu_spec.np,
                       iommu_spec.args);
...
}

It supports only one id output. BUT our PCIe HW has two ID(one is for
writing, the other is for reading). I'm not sure if we should change
of_map_id to support output MAX_PHANDLE_ARGS.

Here add the solution in ourselve drivers. If it's pcie case, enable one
more bit.

Not all infra iommu support PCIe, thus add a PCIe support flag here.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 45b34f4e99fb..b7a31f3a1bcf 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -21,6 +21,7 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
+#include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
@@ -133,6 +134,7 @@
 #define MTK_IOMMU_TYPE_MM		(0x0 << 13)
 #define MTK_IOMMU_TYPE_INFRA		(0x1 << 13)
 #define MTK_IOMMU_TYPE_MASK		(0x3 << 13)
+#define IFA_IOMMU_PCIe_SUPPORT		BIT(15)
 
 #define MTK_IOMMU_HAS_FLAG(pdata, _x)	(!!(((pdata)->flags) & (_x)))
 
@@ -409,8 +411,12 @@ static int mtk_iommu_config(struct mtk_iommu_data *data, struct device *dev,
 				larb_mmu->mmu &= ~MTK_SMI_MMU_EN(portid);
 		} else if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_INFRA)) {
 			peri_mmuen_msk = BIT(portid);
-			peri_mmuen = enable ? peri_mmuen_msk : 0;
 
+			/* PCIdev has only one output id, enable the next writing bit for PCIe */
+			if (dev_is_pci(dev))
+				peri_mmuen_msk |= BIT(portid + 1);
+
+			peri_mmuen = enable ? peri_mmuen_msk : 0;
 			ret = regmap_update_bits(data->pericfg, PERICFG_IOMMU_1,
 						 peri_mmuen_msk, peri_mmuen);
 			if (ret)
@@ -996,6 +1002,15 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 		ret = component_master_add_with_match(dev, &mtk_iommu_com_ops, match);
 		if (ret)
 			goto out_bus_set_null;
+	} else if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_INFRA) &&
+		   MTK_IOMMU_HAS_FLAG(data->plat_data, IFA_IOMMU_PCIe_SUPPORT)) {
+		#ifdef CONFIG_PCI
+		if (!iommu_present(&pci_bus_type)) {
+			ret = bus_set_iommu(&pci_bus_type, &mtk_iommu_ops);
+			if (ret) /* PCIe fail don't affect platform_bus. */
+				goto out_list_del;
+		}
+		#endif
 	}
 	return ret;
 
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
