Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FD52DBEB5
	for <lists.iommu@lfdr.de>; Wed, 16 Dec 2020 11:36:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5AE7285E7D;
	Wed, 16 Dec 2020 10:36:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZozAbQOq1-fJ; Wed, 16 Dec 2020 10:36:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DB84485F4E;
	Wed, 16 Dec 2020 10:36:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C4A6BC013B;
	Wed, 16 Dec 2020 10:36:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CBEE2C013B
 for <iommu@lists.linux-foundation.org>; Wed, 16 Dec 2020 10:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BA54385E7D
 for <iommu@lists.linux-foundation.org>; Wed, 16 Dec 2020 10:36:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tUOEEoa6IKbV for <iommu@lists.linux-foundation.org>;
 Wed, 16 Dec 2020 10:36:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EB8CD85D8E
 for <iommu@lists.linux-foundation.org>; Wed, 16 Dec 2020 10:36:39 +0000 (UTC)
X-UUID: 1a25c411904149898cff33a0774e6e54-20201216
X-UUID: 1a25c411904149898cff33a0774e6e54-20201216
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 634094253; Wed, 16 Dec 2020 18:36:35 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 18:36:32 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Dec 2020 18:36:31 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin
 Murphy <robin.murphy@arm.com>
Subject: [PATCH v3 2/7] iommu: Add iova and size as parameters in
 iotlb_sync_map
Date: Wed, 16 Dec 2020 18:36:02 +0800
Message-ID: <20201216103607.23050-3-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201216103607.23050-1-yong.wu@mediatek.com>
References: <20201216103607.23050-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@google.com>, kernel-team@android.com,
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

iotlb_sync_map allow IOMMU drivers tlb sync after completing the whole
mapping. This patch adds iova and size as the parameters in it. then the
IOMMU driver could flush tlb with the whole range once after iova mapping
to improve performance.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/iommu.c      | 6 +++---
 drivers/iommu/tegra-gart.c | 3 ++-
 include/linux/iommu.h      | 3 ++-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index decef851fa3a..df87c8e825f7 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2425,7 +2425,7 @@ int iommu_map(struct iommu_domain *domain, unsigned long iova,
 	might_sleep();
 	ret = __iommu_map(domain, iova, paddr, size, prot, GFP_KERNEL);
 	if (ret == 0 && ops->iotlb_sync_map)
-		ops->iotlb_sync_map(domain);
+		ops->iotlb_sync_map(domain, iova, size);
 
 	return ret;
 }
@@ -2439,7 +2439,7 @@ int iommu_map_atomic(struct iommu_domain *domain, unsigned long iova,
 
 	ret = __iommu_map(domain, iova, paddr, size, prot, GFP_ATOMIC);
 	if (ret == 0 && ops->iotlb_sync_map)
-		ops->iotlb_sync_map(domain);
+		ops->iotlb_sync_map(domain, iova, size);
 
 	return ret;
 }
@@ -2557,7 +2557,7 @@ static size_t __iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
 	}
 
 	if (ops->iotlb_sync_map)
-		ops->iotlb_sync_map(domain);
+		ops->iotlb_sync_map(domain, iova, mapped);
 	return mapped;
 
 out_err:
diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
index fac720273889..d15d13a98ed1 100644
--- a/drivers/iommu/tegra-gart.c
+++ b/drivers/iommu/tegra-gart.c
@@ -261,7 +261,8 @@ static int gart_iommu_of_xlate(struct device *dev,
 	return 0;
 }
 
-static void gart_iommu_sync_map(struct iommu_domain *domain)
+static void gart_iommu_sync_map(struct iommu_domain *domain, unsigned long iova,
+				size_t size)
 {
 	FLUSH_GART_REGS(gart_handle);
 }
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index b95a6f8db6ff..794d4085edd3 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -244,7 +244,8 @@ struct iommu_ops {
 	size_t (*unmap)(struct iommu_domain *domain, unsigned long iova,
 		     size_t size, struct iommu_iotlb_gather *iotlb_gather);
 	void (*flush_iotlb_all)(struct iommu_domain *domain);
-	void (*iotlb_sync_map)(struct iommu_domain *domain);
+	void (*iotlb_sync_map)(struct iommu_domain *domain, unsigned long iova,
+			       size_t size);
 	void (*iotlb_sync)(struct iommu_domain *domain,
 			   struct iommu_iotlb_gather *iotlb_gather);
 	phys_addr_t (*iova_to_phys)(struct iommu_domain *domain, dma_addr_t iova);
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
