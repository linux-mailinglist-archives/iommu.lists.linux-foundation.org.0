Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 697C93E54C5
	for <lists.iommu@lfdr.de>; Tue, 10 Aug 2021 10:09:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C527640146;
	Tue, 10 Aug 2021 08:09:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0UcRriI8my3F; Tue, 10 Aug 2021 08:09:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CA43B40121;
	Tue, 10 Aug 2021 08:09:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B17B4C001F;
	Tue, 10 Aug 2021 08:09:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CDC82C000E
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 08:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE934401B4
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 08:09:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zuzwo8wsMvQC for <iommu@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 08:09:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6941B403AA
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 08:09:35 +0000 (UTC)
X-UUID: d19785ffb2154aa7b60ca584f1cb7e3f-20210810
X-UUID: d19785ffb2154aa7b60ca584f1cb7e3f-20210810
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1123762852; Tue, 10 Aug 2021 16:09:31 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 16:09:29 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 10 Aug 2021 16:09:28 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 02/13] dt-bindings: memory: mediatek: Add mt8195 smi sub
 common
Date: Tue, 10 Aug 2021 16:08:48 +0800
Message-ID: <20210810080859.29511-3-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210810080859.29511-1-yong.wu@mediatek.com>
References: <20210810080859.29511-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org, yi.kuo@mediatek.com,
 srv_heupstream@mediatek.com, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 anthony.huang@mediatek.com, ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Ikjoon Jang <ikjn@chromium.org>,
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

Add the binding for smi-sub-common. The SMI block diagram like this:

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
its smi-common. meanwhile the sub-common only has one gals clock.

Additionally, add a new property "mediatek,smi_sub_common" for this
sub-common, this is needed in the IOMMU driver in which we create a device
link between smi-common and the IOMMU device. If we add the smi-sub-common
here, the IOMMU driver still need to find the smi-common device. thus,
add this bool property to indicate if it is sub-common.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
change note:
a. change mediatek, smi type from phandle-array to phandle from Rob.
b. Add a new bool property (mediatek,smi_sub_common) to indicate this is
   smi-sub-common. the reason is as above.
---
 .../mediatek,smi-common.yaml                  | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
index 602592b6c3f5..26bb9903864b 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
@@ -38,6 +38,7 @@ properties:
           - mediatek,mt8192-smi-common
           - mediatek,mt8195-smi-common-vdo
           - mediatek,mt8195-smi-common-vpp
+          - mediatek,mt8195-smi-sub-common
 
       - description: for mt7623
         items:
@@ -67,6 +68,14 @@ properties:
     minItems: 2
     maxItems: 4
 
+  mediatek,smi:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: a phandle to the smi-common node above. Only for sub-common.
+
+  mediatek,smi_sub_common:
+    type: boolean
+    description: Indicate if this is smi-sub-common.
+
 required:
   - compatible
   - reg
@@ -93,6 +102,27 @@ allOf:
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
+        - mediatek,smi_sub_common
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
