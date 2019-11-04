Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1B5EDF22
	for <lists.iommu@lfdr.de>; Mon,  4 Nov 2019 12:53:36 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0C9D3F2D;
	Mon,  4 Nov 2019 11:53:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 155BFEFE
	for <iommu@lists.linux-foundation.org>;
	Mon,  4 Nov 2019 11:53:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 2350589E
	for <iommu@lists.linux-foundation.org>;
	Mon,  4 Nov 2019 11:53:12 +0000 (UTC)
X-UUID: 389f272d9fca41c590d071427f2bfb53-20191104
X-UUID: 389f272d9fca41c590d071427f2bfb53-20191104
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
	mailgw02.mediatek.com (envelope-from <chao.hao@mediatek.com>)
	(Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
	with ESMTP id 26719724; Mon, 04 Nov 2019 19:53:10 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
	mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server
	(TLS) id 15.0.1395.4; Mon, 4 Nov 2019 19:53:08 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
	(172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
	Transport; Mon, 4 Nov 2019 19:53:05 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
	Brugger <matthias.bgg@gmail.com>
Subject: [RESEND,
	PATCH 10/13] iommu/mediatek: Remove mtk_iommu_get_m4u_data api
Date: Mon, 4 Nov 2019 19:52:35 +0800
Message-ID: <20191104115238.2394-11-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191104115238.2394-1-chao.hao@mediatek.com>
References: <20191104115238.2394-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,MAY_BE_FORGED,
	UNPARSEABLE_RELAY autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Anan Sun <anan.sun@mediatek.com>, devicetree@vger.kernel.org,
	Cui Zhang <cui.zhang@mediatek.com>,
	Jun Yan <jun.yan@mediatek.com>, wsd_upstream@mediatek.com,
	linux-kernel@vger.kernel.org, Chao Hao <chao.hao@mediatek.com>,
	iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
	Miles Chen <miles.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org,
	Guangming Cao <guangming.cao@mediatek.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Based on previous modifications in the patchset, A mtk_iommu_data
structure represent a iommu, we will add mtk_iommu_data to mtk_iommu_domain
to show the iommu which mtk_iommu_domain belongs to, so we can get
mtk_iommu_data by mtk_iommu_domain, don't use to "mtk_iommu_get_m4u_data"
any more.

Besides, there is a small SW adjustment, we will move alloc iommu_group
into "create_iommu_group"

Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 74 +++++++++++++++++++--------------------
 1 file changed, 37 insertions(+), 37 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 42fad1cf73f3..8c06d2a793a7 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -121,6 +121,7 @@ struct mtk_iommu_domain {
 	u32				id;
 	struct iommu_domain		domain;
 	struct iommu_group		*group;
+	struct mtk_iommu_data		*data;
 	struct list_head		list;
 };
 
@@ -168,23 +169,6 @@ static LIST_HEAD(m4ulist);	/* List all the M4U HWs */
 
 #define for_each_m4u(data)	list_for_each_entry(data, &m4ulist, list)
 
-/*
- * There may be 1 or 2 M4U HWs, But we always expect they are in the same domain
- * for the performance.
- *
- * Here always return the mtk_iommu_data of the first probed M4U where the
- * iommu domain information is recorded.
- */
-static struct mtk_iommu_data *mtk_iommu_get_m4u_data(void)
-{
-	struct mtk_iommu_data *data;
-
-	for_each_m4u(data)
-		return data;
-
-	return NULL;
-}
-
 static u32 get_domain_id(struct mtk_iommu_data *data, u32 portid)
 {
 	u32 dom_id = 0;
@@ -403,6 +387,27 @@ static void mtk_iommu_config(struct mtk_iommu_data *data,
 	}
 }
 
+static struct iommu_group *create_iommu_group(struct mtk_iommu_data *data,
+					      struct device *dev)
+{
+	struct mtk_iommu_pgtable *pgtable = mtk_iommu_get_pgtable();
+
+	/* Prepare for allocate mtk_iommu_domain */
+	data->m4u_group = mtk_iommu_get_group(dev);
+	if (!data->m4u_group) {
+		data->m4u_group = iommu_group_alloc();
+		if (IS_ERR(data->m4u_group))
+			dev_err(dev, "Failed to allocate M4U IOMMU group\n");
+	} else {
+		iommu_group_ref_get(data->m4u_group);
+	}
+
+	/* save the latest init device */
+	pgtable->init_dev = dev;
+
+	return data->m4u_group;
+}
+
 static struct mtk_iommu_pgtable *create_pgtable(struct mtk_iommu_data *data)
 {
 	struct mtk_iommu_pgtable *pgtable;
@@ -468,7 +473,7 @@ static int mtk_iommu_attach_pgtable(struct mtk_iommu_data *data,
 static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
 {
 	struct mtk_iommu_pgtable *pgtable = mtk_iommu_get_pgtable();
-	struct mtk_iommu_data *data = mtk_iommu_get_m4u_data();
+	struct mtk_iommu_data *data;
 	struct mtk_iommu_domain *dom;
 	struct device *dev;
 
@@ -477,6 +482,7 @@ static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
 
 	if (pgtable) {
 		dev = pgtable->init_dev;
+		data = dev_iommu_fwspec_get(dev)->iommu_priv;
 		if (!data->m4u_group) {
 			pr_err("%s, find m4u_group failed\n", __func__);
 			return NULL;
@@ -497,6 +503,7 @@ static struct iommu_domain *mtk_iommu_domain_alloc(unsigned type)
 	if (dom->id >= data->plat_data->dom_cnt)
 		goto  put_dma_cookie;
 
+	dom->data = data;
 	dom->group = data->m4u_group;
 	/* Update our support page sizes bitmap */
 	dom->domain.pgsize_bitmap = pgtable->cfg.pgsize_bitmap;
@@ -554,7 +561,8 @@ static int mtk_iommu_map(struct iommu_domain *domain, unsigned long iova,
 			 phys_addr_t paddr, size_t size, int prot)
 {
 	struct mtk_iommu_pgtable *pgtable = mtk_iommu_get_pgtable();
-	struct mtk_iommu_data *data = mtk_iommu_get_m4u_data();
+	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
+	struct mtk_iommu_data *data = dom->data;
 
 	/* The "4GB mode" M4U physically can not use the lower remap of Dram. */
 	if (data->enable_4GB)
@@ -575,27 +583,30 @@ static size_t mtk_iommu_unmap(struct iommu_domain *domain,
 
 static void mtk_iommu_flush_iotlb_all(struct iommu_domain *domain)
 {
-	mtk_iommu_tlb_flush_all(mtk_iommu_get_m4u_data());
+	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
+
+	mtk_iommu_tlb_flush_all(dom->data);
 }
 
 static void mtk_iommu_iotlb_sync(struct iommu_domain *domain,
 				 struct iommu_iotlb_gather *gather)
 {
-	struct mtk_iommu_data *data = mtk_iommu_get_m4u_data();
+	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
 	size_t length = gather->end - gather->start;
 
 	if (gather->start == ULONG_MAX)
 		return;
 
 	mtk_iommu_tlb_flush_range_sync(gather->start, length, gather->pgsize,
-				       data);
+				       dom->data);
 }
 
 static phys_addr_t mtk_iommu_iova_to_phys(struct iommu_domain *domain,
 					  dma_addr_t iova)
 {
 	struct mtk_iommu_pgtable *pgtable = mtk_iommu_get_pgtable();
-	struct mtk_iommu_data *data = mtk_iommu_get_m4u_data();
+	struct mtk_iommu_domain *dom = to_mtk_domain(domain);
+	struct mtk_iommu_data *data = dom->data;
 	phys_addr_t pa;
 
 	pa = pgtable->iop->iova_to_phys(pgtable->iop, iova);
@@ -642,7 +653,7 @@ static void mtk_iommu_remove_device(struct device *dev)
 
 static struct iommu_group *mtk_iommu_device_group(struct device *dev)
 {
-	struct mtk_iommu_data *data = mtk_iommu_get_m4u_data();
+	struct mtk_iommu_data *data = dev->iommu_fwspec->iommu_priv;
 	struct mtk_iommu_pgtable *pgtable;
 	int ret = 0;
 
@@ -658,20 +669,9 @@ static struct iommu_group *mtk_iommu_device_group(struct device *dev)
 		}
 	}
 
-	/* All the client devices are in the same m4u iommu-group */
-	data->m4u_group = mtk_iommu_get_group(dev);
-	if (!data->m4u_group) {
-		data->m4u_group = iommu_group_alloc();
-		if (IS_ERR(data->m4u_group))
-			dev_err(dev, "Failed to allocate M4U IOMMU group\n");
-	} else {
-		iommu_group_ref_get(data->m4u_group);
-	}
+	dev_info(data->dev, "%s, init data:%d\n", __func__, data->m4u_id);
 
-	/* save the latest init device */
-	pgtable->init_dev = dev;
-
-	return data->m4u_group;
+	return create_iommu_group(data, dev);
 }
 
 static int mtk_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
