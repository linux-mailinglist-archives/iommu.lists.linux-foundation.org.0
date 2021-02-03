Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4042C30DC07
	for <lists.iommu@lfdr.de>; Wed,  3 Feb 2021 14:59:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A9AFC2043C;
	Wed,  3 Feb 2021 13:59:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 80z5oImv9Q4I; Wed,  3 Feb 2021 13:59:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9A69A2037E;
	Wed,  3 Feb 2021 13:59:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7BF2BC013A;
	Wed,  3 Feb 2021 13:59:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4A91C013A
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 13:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AA6CE85F15
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 13:59:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZT5tUBFTE_wM for <iommu@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 13:59:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CFAA485F05
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 13:59:41 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1l7Igz-0001Ml-6C; Wed, 03 Feb 2021 13:59:37 +0000
From: Colin King <colin.king@canonical.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Anan sun <anan.sun@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Chao Hao <chao.hao@mediatek.com>, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH][next] iommu/mediatek: Fix unsigned domid comparison with less
 than zero
Date: Wed,  3 Feb 2021 13:59:36 +0000
Message-Id: <20210203135936.23016-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

From: Colin Ian King <colin.king@canonical.com>

Currently the check for domid < 0 is always false because domid
is unsigned.  Fix this by making it signed.

Addresses-CoverityL ("Unsigned comparison against 0")
Fixes: ab1d5281a62b ("iommu/mediatek: Add iova reserved function")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/iommu/mtk_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 0ad14a7604b1..823d719945b2 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -640,7 +640,7 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
 				       struct list_head *head)
 {
 	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
-	unsigned int domid = mtk_iommu_get_domain_id(dev, data->plat_data), i;
+	int domid = mtk_iommu_get_domain_id(dev, data->plat_data), i;
 	const struct mtk_iommu_iova_region *resv, *curdom;
 	struct iommu_resv_region *region;
 	int prot = IOMMU_WRITE | IOMMU_READ;
-- 
2.29.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
