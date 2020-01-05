Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E57C130729
	for <lists.iommu@lfdr.de>; Sun,  5 Jan 2020 11:46:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BC08A85CE2;
	Sun,  5 Jan 2020 10:46:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H3mblu50bPNP; Sun,  5 Jan 2020 10:46:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9487585CC7;
	Sun,  5 Jan 2020 10:46:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76E6CC1D8B;
	Sun,  5 Jan 2020 10:46:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41A43C1D84
 for <iommu@lists.linux-foundation.org>; Sun,  5 Jan 2020 10:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 226AD85CC7
 for <iommu@lists.linux-foundation.org>; Sun,  5 Jan 2020 10:46:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vLAbKOTTdIl5 for <iommu@lists.linux-foundation.org>;
 Sun,  5 Jan 2020 10:46:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8DC2D85209
 for <iommu@lists.linux-foundation.org>; Sun,  5 Jan 2020 10:46:36 +0000 (UTC)
X-UUID: 5338576dd763456d810138b6743bd429-20200105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=WZ/umlXOyPHUYCRi2U9EvlX0wVfU8S8+Ftnq58VNe5M=; 
 b=Ww6JLIeodifH780mh1kn6g0ShhkKaZ9N7wOg/1n6rCumMsiSmbUd3ApICeVbbTevMGEg28fnWlszyfZ26PZmDx/2p4VFJHoUk5xpKsicHNgXB9Pm9CZiTtHHqeotjqAdqQIgXvF7Qr2jWjChlCJoZeIgUJs860ClYWI448JGoWs=;
X-UUID: 5338576dd763456d810138b6743bd429-20200105
Received: from mtkcas09.mediatek.inc [(172.21.101.178)] by
 mailgw01.mediatek.com (envelope-from <chao.hao@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 866995537; Sun, 05 Jan 2020 18:46:31 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 Jan 2020 18:46:05 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 5 Jan 2020 18:45:01 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 02/19] iommu/mediatek: Add m4u1_mask to distinguish m4u_id
Date: Sun, 5 Jan 2020 18:45:06 +0800
Message-ID: <20200105104523.31006-3-chao.hao@mediatek.com>
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

For some platforms(ex: later mt6779), it maybe have two IOMMUs,
so we can add m4u_mask variable to distinguish it by different
smi_larb id

Signed-off-by: Chao Hao <chao.hao@mediatek.com>
---
 drivers/iommu/mtk_iommu.c | 3 +++
 drivers/iommu/mtk_iommu.h | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 6fc1f5ecf91e..09192edef1f7 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -678,6 +678,9 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 		}
 		data->larb_imu[id].dev = &plarbdev->dev;
 
+		if (data->plat_data->m4u1_mask == (1 << id))
+			data->m4u_id = 1;
+
 		component_match_add_release(dev, &match, release_of,
 					    compare_of, larbnode);
 	}
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index ea949a324e33..b4bd76548615 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -42,6 +42,7 @@ struct mtk_iommu_plat_data {
 	bool                has_bclk;
 	bool                has_vld_pa_rng;
 	bool                reset_axi;
+	u32                 m4u1_mask;
 	unsigned char       larbid_remap[MTK_LARB_NR_MAX];
 };
 
@@ -59,6 +60,7 @@ struct mtk_iommu_data {
 	bool                            enable_4GB;
 	spinlock_t			tlb_lock; /* lock for tlb range flush */
 
+	u32				m4u_id;
 	struct iommu_device		iommu;
 	const struct mtk_iommu_plat_data *plat_data;
 
-- 
2.18.0
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
