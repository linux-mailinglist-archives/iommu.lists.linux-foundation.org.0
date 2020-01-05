Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C1102130745
	for <lists.iommu@lfdr.de>; Sun,  5 Jan 2020 11:47:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 787DE864EF;
	Sun,  5 Jan 2020 10:47:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wCXJnU0Zacpj; Sun,  5 Jan 2020 10:47:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 01FF48633B;
	Sun,  5 Jan 2020 10:47:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4155C1D89;
	Sun,  5 Jan 2020 10:47:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DDAE0C0881
 for <iommu@lists.linux-foundation.org>; Sun,  5 Jan 2020 10:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DAB5A85D26
 for <iommu@lists.linux-foundation.org>; Sun,  5 Jan 2020 10:47:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id odGAMjA0n+da for <iommu@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 10:47:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by whitealder.osuosl.org (Postfix) with ESMTP id CEEB485CE2
 for <iommu@lists.linux-foundation.org>; Sun,  5 Jan 2020 10:47:20 +0000 (UTC)
X-UUID: 86d7b78ae4e544b3ad684d7baaf68ab6-20200105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=19qaQnoV6yRHuMfo5UJqrDyTeI5nPaBleiGqUf3+VGg=; 
 b=MITXeOuZAI+sK6fOr2Dos2HEu6uAKDc6YB/rIraiCkq0PhqTVjA+dpjbxJQM5fbD1CtKmmey/l6UftLqntup5rDjuyToxv003iQrvuKJ8BzFdA7QmzTI0tqE7GlF2IY02bSqcNpOlSOH49osjsOUGuptUA6OKIUO2rj5Cmdud1c=;
X-UUID: 86d7b78ae4e544b3ad684d7baaf68ab6-20200105
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 971568944; Sun, 05 Jan 2020 18:47:17 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 Jan 2020 18:46:49 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 5 Jan 2020 18:45:47 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 17/19] iommu/mediatek: Add iova reserved function
Date: Sun, 5 Jan 2020 18:45:21 +0800
Message-ID: <20200105104523.31006-18-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200105104523.31006-1-chao.hao@mediatek.com>
References: <20200105104523.31006-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: Anan Sun <anan.sun@mediatek.com>, devicetree@vger.kernel.org,
 Jun Yan <jun.yan@mediatek.com>, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, Chao Hao <chao.hao@mediatek.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Cui Zhang <zhang.cui@mediatek.com>, linux-arm-kernel@lists.infradead.org
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

For multiple iommu_domains, we need to reserve some iova
regions, so we will add mtk_iommu_resv_iova_region structure.
It includes the start address and size of iova and iommu_resv_type.
Based on the function, we will realize multiple mtk_iommu_domains

Signed-off-by: Anan Sun <anan.sun@mediatek.com>
Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 47 +++++++++++++++++++++++++++++++++++++++
 drivers/iommu/mtk_iommu.h | 12 ++++++++++
 2 files changed, 59 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 9a7f2a388e3e..ac658fa16136 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -691,6 +691,51 @@ static int mtk_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 	return iommu_fwspec_add_ids(dev, args->args, 1);
 }
 
+/* reserve/dir-map iova region */
+static void mtk_iommu_get_resv_regions(struct device *dev,
+				       struct list_head *head)
+{
+	struct mtk_iommu_data *data = dev_iommu_fwspec_get(dev)->iommu_priv;
+	unsigned int i, total_cnt = data->plat_data->resv_cnt;
+	const struct mtk_iommu_resv_iova_region *resv_data;
+	struct iommu_resv_region *region;
+	unsigned long base = 0;
+	size_t size = 0;
+	int prot = IOMMU_WRITE | IOMMU_READ;
+
+	resv_data = data->plat_data->resv_region;
+
+	for (i = 0; i < total_cnt; i++) {
+		size = 0;
+		if (resv_data[i].iova_size) {
+			base = (unsigned long)resv_data[i].iova_base;
+			size = resv_data[i].iova_size;
+		}
+		if (!size)
+			continue;
+
+		region = iommu_alloc_resv_region(base, size, prot,
+						 resv_data[i].type);
+		if (!region)
+			return;
+
+		list_add_tail(&region->list, head);
+
+		dev_dbg(data->dev, "%s iova 0x%x ~ 0x%x\n",
+			(resv_data[i].type == IOMMU_RESV_DIRECT) ? "dm" : "rsv",
+			(unsigned int)base, (unsigned int)(base + size - 1));
+	}
+}
+
+static void mtk_iommu_put_resv_regions(struct device *dev,
+				       struct list_head *head)
+{
+	struct iommu_resv_region *entry, *next;
+
+	list_for_each_entry_safe(entry, next, head, list)
+		kfree(entry);
+}
+
 static const struct iommu_ops mtk_iommu_ops = {
 	.domain_alloc	= mtk_iommu_domain_alloc,
 	.domain_free	= mtk_iommu_domain_free,
@@ -705,6 +750,8 @@ static const struct iommu_ops mtk_iommu_ops = {
 	.remove_device	= mtk_iommu_remove_device,
 	.device_group	= mtk_iommu_device_group,
 	.of_xlate	= mtk_iommu_of_xlate,
+	.get_resv_regions = mtk_iommu_get_resv_regions,
+	.put_resv_regions = mtk_iommu_put_resv_regions,
 	.pgsize_bitmap	= SZ_4K | SZ_64K | SZ_1M | SZ_16M,
 };
 
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index a38b26018abe..7f4d498ec5f6 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -36,6 +36,12 @@ enum mtk_iommu_plat {
 	M4U_MT8183,
 };
 
+struct mtk_iommu_resv_iova_region {
+	dma_addr_t		iova_base;
+	size_t			iova_size;
+	enum iommu_resv_type	type;
+};
+
 /*
  * reserved IOVA Domain for IOMMU users of HW limitation.
  */
@@ -68,6 +74,12 @@ struct mtk_iommu_plat_data {
 	u32                 inv_sel_reg;
 	unsigned char       larbid_remap[2][MTK_LARB_NR_MAX];
 	const struct mtk_domain_data	*dom_data;
+	/*
+	 * reserve/dir-mapping iova region data
+	 * todo: for different reserve needs on multiple iommu domains
+	 */
+	const unsigned int  resv_cnt;
+	const struct mtk_iommu_resv_iova_region *resv_region;
 };
 
 struct mtk_iommu_domain;
-- 
2.18.0
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
