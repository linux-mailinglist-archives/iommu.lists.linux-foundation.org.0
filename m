Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 934F12132FE
	for <lists.iommu@lfdr.de>; Fri,  3 Jul 2020 06:43:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 53DE787C4B;
	Fri,  3 Jul 2020 04:43:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ulfUyZIGbjLa; Fri,  3 Jul 2020 04:43:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E6F5087C70;
	Fri,  3 Jul 2020 04:43:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD29FC0733;
	Fri,  3 Jul 2020 04:43:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB709C0733
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jul 2020 04:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DADC388CA0
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jul 2020 04:43:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WOLZshBfphs1 for <iommu@lists.linux-foundation.org>;
 Fri,  3 Jul 2020 04:43:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3695988C9E
 for <iommu@lists.linux-foundation.org>; Fri,  3 Jul 2020 04:43:05 +0000 (UTC)
X-UUID: 943d89eda33948a7b1818c5d62fca207-20200703
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=63JZsqC6w//8CgJm6fa1lmJ7QHbUUzma+Qf01H5Anv8=; 
 b=g1LCJS5Hv65yo6qlxb3DZbY3KvRXZz7eG9No9UCo/gg0JdjjzSmTesHfoHBbNTcTa8vbpI0aM/u3qWzxxxbe+K+vmlZt45yKbiNLkP6HBCRGtUQJi2nNr+mMY1wBh1dOX+nEDDOIJTT8CWfWa+SnEdD//hhsznE8x5EJHCNhhmk=;
X-UUID: 943d89eda33948a7b1818c5d62fca207-20200703
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw01.mediatek.com (envelope-from <chao.hao@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 2087207907; Fri, 03 Jul 2020 12:43:01 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Jul 2020 12:42:53 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Jul 2020 12:42:49 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6 09/10] iommu/mediatek: Modify MMU_CTRL register setting
Date: Fri, 3 Jul 2020 12:41:26 +0800
Message-ID: <20200703044127.27438-10-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200703044127.27438-1-chao.hao@mediatek.com>
References: <20200703044127.27438-1-chao.hao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, FY Yang <fy.yang@mediatek.com>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Chao Hao <chao.hao@mediatek.com>, iommu@lists.linux-foundation.org,
 TH Yang <th.yang@mediatek.com>, linux-mediatek@lists.infradead.org,
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

The MMU_CTRL register of MT8173 is different from other SoCs.
The in_order_wr_en is bit[9] which is zero by default.
Other SoCs have the vitcim_tlb_en feature mapped to bit[12].
This bit is set to one by default. We need to preserve the bit
when setting F_MMU_TF_PROT_TO_PROGRAM_ADDR as otherwise the
bit will be cleared and IOMMU performance will drop.

Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Yong Wu <yong.wu@mediatek.com>
Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index e71003037ffa..a816030d00f1 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -555,11 +555,13 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 		return ret;
 	}
 
-	if (data->plat_data->m4u_plat == M4U_MT8173)
+	if (data->plat_data->m4u_plat == M4U_MT8173) {
 		regval = F_MMU_PREFETCH_RT_REPLACE_MOD |
 			 F_MMU_TF_PROT_TO_PROGRAM_ADDR_MT8173;
-	else
-		regval = F_MMU_TF_PROT_TO_PROGRAM_ADDR;
+	} else {
+		regval = readl_relaxed(data->base + REG_MMU_CTRL_REG);
+		regval |= F_MMU_TF_PROT_TO_PROGRAM_ADDR;
+	}
 	writel_relaxed(regval, data->base + REG_MMU_CTRL_REG);
 
 	regval = F_L2_MULIT_HIT_EN |
-- 
2.18.0
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
