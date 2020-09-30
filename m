Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA3227E20F
	for <lists.iommu@lfdr.de>; Wed, 30 Sep 2020 09:08:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6668186103;
	Wed, 30 Sep 2020 07:08:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1iW99D7fHeEv; Wed, 30 Sep 2020 07:08:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E0B0385F2F;
	Wed, 30 Sep 2020 07:08:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4C3AC0051;
	Wed, 30 Sep 2020 07:08:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D920DC0051
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 07:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C7E0E86822
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 07:08:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qJLdXFL4N07O for <iommu@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 07:08:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by whitealder.osuosl.org (Postfix) with ESMTP id 33411867AE
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 07:08:16 +0000 (UTC)
X-UUID: 8f8a059023584fd5871d139da49238f4-20200930
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=axtHnh7qKvv1KMMgmnGRSN/KcSTs8AdXhfI9O+e7IvY=; 
 b=A4xDjLPje7yMZ29HFTNKHE8JDYvaizpz8Z6OUz2x2RJMdaooy6HM948P3AAaIOlCVV03j+qtWL3LR3TPL9YxY5TysaS0j7kdBzhVlIWEEoydEvO2lLjoILxhCtQlAXxmtM4a8T1VHckrzsOVJMHvFTZNBeDyV6KuDamioL0bwFI=;
X-UUID: 8f8a059023584fd5871d139da49238f4-20200930
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1473144545; Wed, 30 Sep 2020 15:08:14 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 15:08:05 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Sep 2020 15:08:06 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>
Subject: [PATCH v3 05/24] dt-bindings: memory: mediatek: Add domain definition
Date: Wed, 30 Sep 2020 15:06:28 +0800
Message-ID: <20200930070647.10188-6-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200930070647.10188-1-yong.wu@mediatek.com>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: E7D6746DA1C6BD03377D3E4B8E29DEB562679DA890B32B4FB83C13859582B8F32000:8
X-MTK: N
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, kernel-team@android.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Greg Kroah-Hartman <gregkh@google.com>, linux-arm-kernel@lists.infradead.org
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

In the latest SoC, there are several HW IP require a sepecial iova
range, mainly CCU and VPU has this requirement. Take CCU as a example,
CCU require its iova locate in the range(0x4000_0000 ~ 0x43ff_ffff).

In this patch we add a domain definition for the special port. In the
example of CCU, If we preassign CCU port in domain1, then iommu driver
will prepare a independent iommu domain of the special iova range for it,
then the iova got from dma_alloc_attrs(ccu-dev) will locate in its special
range.

This is a preparing patch for multi-domain support.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 include/dt-bindings/memory/mtk-smi-larb-port.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/memory/mtk-smi-larb-port.h b/include/dt-bindings/memory/mtk-smi-larb-port.h
index f4d8e3aed0bc..d00f5de8438b 100644
--- a/include/dt-bindings/memory/mtk-smi-larb-port.h
+++ b/include/dt-bindings/memory/mtk-smi-larb-port.h
@@ -7,9 +7,16 @@
 #define __DTS_MTK_IOMMU_PORT_H_
 
 #define MTK_LARB_NR_MAX			32
+#define MTK_M4U_DOM_NR_MAX		8
+
+#define MTK_M4U_DOM_ID(domid, larb, port)	\
+	(((domid) & 0x7) << 16 | (((larb) & 0x1f) << 5) | ((port) & 0x1f))
+
+/* The default dom id is 0. */
+#define MTK_M4U_ID(larb, port)		MTK_M4U_DOM_ID(0, larb, port)
 
-#define MTK_M4U_ID(larb, port)		(((larb) << 5) | (port))
 #define MTK_M4U_TO_LARB(id)		(((id) >> 5) & 0x1f)
 #define MTK_M4U_TO_PORT(id)		((id) & 0x1f)
+#define MTK_M4U_TO_DOM(id)		(((id) >> 16) & 0x7)
 
 #endif
-- 
2.18.0
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
