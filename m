Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1BE1D9184
	for <lists.iommu@lfdr.de>; Tue, 19 May 2020 09:59:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E218F86055;
	Tue, 19 May 2020 07:59:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P2z_CofaUQhF; Tue, 19 May 2020 07:59:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7EA3286053;
	Tue, 19 May 2020 07:59:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62687C0176;
	Tue, 19 May 2020 07:59:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF0C5C0176
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 07:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D7B1A86988
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 07:59:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xr2Jt1ODu6ym for <iommu@lists.linux-foundation.org>;
 Tue, 19 May 2020 07:59:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by whitealder.osuosl.org (Postfix) with ESMTP id 946B78695F
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 07:59:30 +0000 (UTC)
X-UUID: 5ab7367314fd44e0be8b3a793f877c4b-20200519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=w56DMjDW1t+pDgMar7ZfMyyYyD5Y5aJwVP9f2+U7Tvo=; 
 b=MEp/XMglaALKsIoR4lbn83uU3/HuXt85jXLY912EdZmZpetgtZmwteERT4RtoGzpt/5W5n4tpVrFdtRk14rsAe9iH6h0oiQjV6HwBVUGaKS54NcGd9OISXs+SytrmXZr1RUPP5t8cL6Q2KtZgwwlujimzyZLsVsYZRsTZfytdSo=;
X-UUID: 5ab7367314fd44e0be8b3a793f877c4b-20200519
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1663039014; Tue, 19 May 2020 15:59:27 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 May 2020 15:59:25 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 19 May 2020 15:59:24 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH] iommu/mediatek-v1: Fix a build warning for a unused variable
 'data'
Date: Tue, 19 May 2020 15:57:44 +0800
Message-ID: <1589875064-662-1-git-send-email-yong.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com, srv_heupstream@mediatek.com,
 Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
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

This patch fixes a build warning:
drivers/iommu/mtk_iommu_v1.c: In function 'mtk_iommu_release_device':
>> drivers/iommu/mtk_iommu_v1.c:467:25: warning: variable 'data' set but
>> not used [-Wunused-but-set-variable]
467 |  struct mtk_iommu_data *data;
|                         ^~~~

It's reported at:
https://lore.kernel.org/linux-iommu/202005191458.gY38V8bU%25lkp@intel.com/T/#u

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/mtk_iommu_v1.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index f353b07..c9d79cf 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -469,12 +469,10 @@ static void mtk_iommu_probe_finalize(struct device *dev)
 static void mtk_iommu_release_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct mtk_iommu_data *data;
 
 	if (!fwspec || fwspec->ops != &mtk_iommu_ops)
 		return;
 
-	data = dev_iommu_priv_get(dev);
 	iommu_fwspec_free(dev);
 }
 
-- 
1.9.1
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
