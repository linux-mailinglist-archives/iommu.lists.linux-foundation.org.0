Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDD03A998A
	for <lists.iommu@lfdr.de>; Wed, 16 Jun 2021 13:49:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6911A83BA0;
	Wed, 16 Jun 2021 11:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rlMF8OIkGemh; Wed, 16 Jun 2021 11:49:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8916C83B8E;
	Wed, 16 Jun 2021 11:49:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6FAECC000B;
	Wed, 16 Jun 2021 11:49:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9932C000B
 for <iommu@lists.linux-foundation.org>; Wed, 16 Jun 2021 11:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7C2C4042A
 for <iommu@lists.linux-foundation.org>; Wed, 16 Jun 2021 11:49:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bxwcsir9vvZK for <iommu@lists.linux-foundation.org>;
 Wed, 16 Jun 2021 11:49:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E89864045B
 for <iommu@lists.linux-foundation.org>; Wed, 16 Jun 2021 11:49:25 +0000 (UTC)
X-UUID: c3582cda440a4b91921dbf6692de4044-20210616
X-UUID: c3582cda440a4b91921dbf6692de4044-20210616
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 600057304; Wed, 16 Jun 2021 19:44:19 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 19:44:17 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Jun 2021 19:44:16 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 2/9] dt-bindings: memory: mediatek: Add mt8195 smi sub common
Date: Wed, 16 Jun 2021 19:43:39 +0800
Message-ID: <20210616114346.18812-3-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210616114346.18812-1-yong.wu@mediatek.com>
References: <20210616114346.18812-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com, srv_heupstream@mediatek.com,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, anthony.huang@mediatek.com,
 ming-fan.chen@mediatek.com, yi.kuo@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

This patch adds the binding for smi-sub-common. The SMI block diagram
like this:

        IOMMU
         |  |
      smi-common
  ------------------
  |      ....      |
 larb0           larb7   <-max is 8

The smi-common connects with smi-larb and IOMMU. The maximum larbs number
that connects with a smi-common is 8. If the engines number is over 8,
sometimes we use a smi-sub-common which is nearly same with smi-common.
It supports up to 8 input and 1 output(smi-common has 2 output)

Something like:

        IOMMU
         |  |
      smi-common
  ---------------------
  |      |          ...
larb0  sub-common   ...   <-max is 8
      -----------
       |    |    ...   <-max is 8 too.
     larb2 larb5

We don't need extra SW setting for smi-sub-common, only the sub-common has
special clocks need to enable when the engines access dram.

If it is sub-common, it should have a "mediatek,smi" phandle to point to
its smi-common. also, the sub-common only has one gals clock.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 .../mediatek,smi-common.yaml                  | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
index 6317025bd203..11515afdfb2e 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
@@ -38,6 +38,7 @@ properties:
           - mediatek,mt8192-smi-common
           - mediatek,mt8195-smi-common-vdo
           - mediatek,mt8195-smi-common-vpp
+          - mediatek,mt8195-smi-sub-common
 
       - description: for mt7623
         items:
@@ -69,6 +70,10 @@ properties:
     minItems: 2
     maxItems: 4
 
+  mediatek,smi:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: a phandle to the smi-common node above. Only for sub-common.
+
 required:
   - compatible
   - reg
@@ -95,6 +100,26 @@ allOf:
             - const: smi
             - const: async
 
+  - if:  # only for sub common
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8195-smi-sub-common
+    then:
+      required:
+        - mediatek,smi
+      properties:
+        clock:
+          items:
+            minItems: 3
+            maxItems: 3
+        clock-names:
+          items:
+            - const: apb
+            - const: smi
+            - const: gals0
+
   - if:  # for gen2 HW that have gals
       properties:
         compatible:
-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
