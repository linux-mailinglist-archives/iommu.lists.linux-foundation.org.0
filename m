Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 352142D3CBC
	for <lists.iommu@lfdr.de>; Wed,  9 Dec 2020 09:04:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DEA8B8761F;
	Wed,  9 Dec 2020 08:04:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Dgn6UZ6WduL; Wed,  9 Dec 2020 08:04:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B6BBF877CD;
	Wed,  9 Dec 2020 08:04:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E7CBC0FA7;
	Wed,  9 Dec 2020 08:04:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F15A6C013B
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 08:04:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E76D587793
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 08:04:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uvXDrx5e4aYf for <iommu@lists.linux-foundation.org>;
 Wed,  9 Dec 2020 08:04:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by hemlock.osuosl.org (Postfix) with ESMTP id 175988761F
 for <iommu@lists.linux-foundation.org>; Wed,  9 Dec 2020 08:04:21 +0000 (UTC)
X-UUID: 2391bc00c6084333b17a2c7388b4a11e-20201209
X-UUID: 2391bc00c6084333b17a2c7388b4a11e-20201209
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1424266130; Wed, 09 Dec 2020 16:04:18 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 16:04:17 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Dec 2020 16:04:16 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v5 19/27] iommu/mediatek: Add iova reserved function
Date: Wed, 9 Dec 2020 16:00:54 +0800
Message-ID: <20201209080102.26626-20-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201209080102.26626-1-yong.wu@mediatek.com>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>, anan.sun@mediatek.com,
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

For multiple iommu_domains, we need to reserve some iova regions. Take a
example, If the default iova region is 0 ~ 4G, but the 0x4000_0000 ~
0x43ff_ffff is only for the special CCU0 domain. Thus we should exclude
this region for the default iova region.

This patch adds iova reserved flow. It's a preparing patch for supporting
multi-domain.

Signed-off-by: Anan sun <anan.sun@mediatek.com>
Signed-off-by: Chao Hao <chao.hao@mediatek.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 28 ++++++++++++++++++++++++++++
 drivers/iommu/mtk_iommu.h |  5 +++++
 2 files changed, 33 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 0e9c03cbab32..6a909efc984f 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -157,6 +157,11 @@ static LIST_HEAD(m4ulist);	/* List all the M4U HWs */
 
 #define for_each_m4u(data)	list_for_each_entry(data, &m4ulist, list)
 
+struct mtk_iommu_iova_region {
+	dma_addr_t		iova_base;
+	unsigned long long	size;
+};
+
 /*
  * There may be 1 or 2 M4U HWs, But we always expect they are in the same domain
  * for the performance.
@@ -553,6 +558,27 @@ static int mtk_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 	return iommu_fwspec_add_ids(dev, args->args, 1);
 }
 
+static void mtk_iommu_get_resv_regions(struct device *dev,
+				       struct list_head *head)
+{
+	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
+	const struct mtk_iommu_iova_region *resv;
+	struct iommu_resv_region *region;
+	int prot = IOMMU_WRITE | IOMMU_READ;
+	unsigned int i;
+
+	for (i = 0; i < data->plat_data->iova_region_nr; i++) {
+		resv = data->plat_data->iova_region + i;
+
+		region = iommu_alloc_resv_region(resv->iova_base, resv->size,
+						 prot, IOMMU_RESV_RESERVED);
+		if (!region)
+			return;
+
+		list_add_tail(&region->list, head);
+	}
+}
+
 static const struct iommu_ops mtk_iommu_ops = {
 	.domain_alloc	= mtk_iommu_domain_alloc,
 	.domain_free	= mtk_iommu_domain_free,
@@ -567,6 +593,8 @@ static const struct iommu_ops mtk_iommu_ops = {
 	.release_device	= mtk_iommu_release_device,
 	.device_group	= mtk_iommu_device_group,
 	.of_xlate	= mtk_iommu_of_xlate,
+	.get_resv_regions = mtk_iommu_get_resv_regions,
+	.put_resv_regions = generic_iommu_put_resv_regions,
 	.pgsize_bitmap	= SZ_4K | SZ_64K | SZ_1M | SZ_16M,
 };
 
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index 5e03a029c4dc..e867cd3aeeac 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -45,10 +45,15 @@ enum mtk_iommu_plat {
 	M4U_MT8183,
 };
 
+struct mtk_iommu_iova_region;
+
 struct mtk_iommu_plat_data {
 	enum mtk_iommu_plat m4u_plat;
 	u32                 flags;
 	u32                 inv_sel_reg;
+
+	unsigned int        iova_region_nr;
+	const struct mtk_iommu_iova_region   *iova_region;
 	unsigned char       larbid_remap[MTK_LARB_COM_MAX][MTK_LARB_SUBCOM_MAX];
 };
 
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
