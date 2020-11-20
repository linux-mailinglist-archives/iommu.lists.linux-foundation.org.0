Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B42B2BA56A
	for <lists.iommu@lfdr.de>; Fri, 20 Nov 2020 10:07:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 90C8C2DFF8;
	Fri, 20 Nov 2020 09:07:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jtJcDTBIMiG3; Fri, 20 Nov 2020 09:07:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7857A2DEC9;
	Fri, 20 Nov 2020 09:07:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4AC7CC0891;
	Fri, 20 Nov 2020 09:07:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1E720C0891
 for <iommu@lists.linux-foundation.org>; Fri, 20 Nov 2020 09:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1233F86B60
 for <iommu@lists.linux-foundation.org>; Fri, 20 Nov 2020 09:07:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tknLYsINlCer for <iommu@lists.linux-foundation.org>;
 Fri, 20 Nov 2020 09:07:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5E99F86916
 for <iommu@lists.linux-foundation.org>; Fri, 20 Nov 2020 09:07:16 +0000 (UTC)
X-UUID: d44ab65c4cb644f39c8bfc2208586de6-20201120
X-UUID: d44ab65c4cb644f39c8bfc2208586de6-20201120
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1967541814; Fri, 20 Nov 2020 17:07:12 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Nov 2020 17:07:11 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Nov 2020 17:07:10 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin
 Murphy <robin.murphy@arm.com>
Subject: [PATCH] iommu: Improve the performance for direct_mapping
Date: Fri, 20 Nov 2020 17:06:28 +0800
Message-ID: <20201120090628.6566-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
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

Currently direct_mapping always use the smallest pgsize which is SZ_4K
normally to mapping. This is unnecessary. we could gather the size, and
call iommu_map then, iommu_map could decide how to map better with the
just right pgsize.

From the original comment, we should take care overlap, otherwise,
iommu_map may return -EEXIST. In this overlap case, we should map the
previous region before overlap firstly. then map the left part.

Each a iommu device will call this direct_mapping when its iommu
initialize, This patch is effective to improve the boot/initialization
time especially while it only needs level 1 mapping.

Signed-off-by: Anan Sun <anan.sun@mediatek.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/iommu.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index df87c8e825f7..854a8fcb928d 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -737,6 +737,7 @@ static int iommu_create_device_direct_mappings(struct iommu_group *group,
 	/* We need to consider overlapping regions for different devices */
 	list_for_each_entry(entry, &mappings, list) {
 		dma_addr_t start, end, addr;
+		size_t unmapped_sz = 0;
 
 		if (domain->ops->apply_resv_region)
 			domain->ops->apply_resv_region(dev, domain, entry);
@@ -752,10 +753,25 @@ static int iommu_create_device_direct_mappings(struct iommu_group *group,
 			phys_addr_t phys_addr;
 
 			phys_addr = iommu_iova_to_phys(domain, addr);
-			if (phys_addr)
+			if (phys_addr == 0) {
+				unmapped_sz += pg_size; /* Gather the size. */
 				continue;
+			}
 
-			ret = iommu_map(domain, addr, addr, pg_size, entry->prot);
+			if (unmapped_sz) {
+				/* Map the region before the overlap. */
+				ret = iommu_map(domain, start, start,
+						unmapped_sz, entry->prot);
+				if (ret)
+					goto out;
+				start += unmapped_sz;
+				unmapped_sz = 0;
+			}
+			start += pg_size;
+		}
+		if (unmapped_sz) {
+			ret = iommu_map(domain, start, start, unmapped_sz,
+					entry->prot);
 			if (ret)
 				goto out;
 		}
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
