Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D231525EED6
	for <lists.iommu@lfdr.de>; Sun,  6 Sep 2020 17:47:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B5B6E85650;
	Sun,  6 Sep 2020 15:47:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cqtpsZmj3Agn; Sun,  6 Sep 2020 15:47:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 084488557E;
	Sun,  6 Sep 2020 15:47:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DC7BFC0051;
	Sun,  6 Sep 2020 15:47:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01117C0051
 for <iommu@lists.linux-foundation.org>; Sun,  6 Sep 2020 15:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EAE23870CF
 for <iommu@lists.linux-foundation.org>; Sun,  6 Sep 2020 15:47:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pfHkK19tiU8p for <iommu@lists.linux-foundation.org>;
 Sun,  6 Sep 2020 15:47:19 +0000 (UTC)
X-Greylist: delayed 00:20:58 by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 35A6D870C8
 for <iommu@lists.linux-foundation.org>; Sun,  6 Sep 2020 15:47:19 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id a26so14721029ejc.2
 for <iommu@lists.linux-foundation.org>; Sun, 06 Sep 2020 08:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rzOHXc1d4k+GJMLhr6jfXTiNep26puRM1VtdB2kOKb0=;
 b=fhe19DSITZ6BPZd78ZKWlr7CcS8NZ6AJvNW7U0n9Z0iEnKSOJyfHYqnWH4VuNphBiW
 ofy6sQZcnvqb7uoPytvE3ALMoWTiGurVYJVMJMqL0OFafGunUn05BNQOUT5rI7YlIwTh
 GPPe4txfILYuOrQIUrnIp50CT+J0N1fSz68g1LkwK6GLLdX3RABSyw4Y64h1SW016y0b
 okri/H/I/IMFcwYSqOVvlJu02AskDj6TBhGIVfeAZK5tAGtcQ/vrHamWgBDzvZJH4cbg
 7JNT9ZnFhcbmmOMK8GptS3e5mpUBNBTvXxr7ZgJnNec713x+ch/rTnvy0TFabJFaJ+B/
 aPAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rzOHXc1d4k+GJMLhr6jfXTiNep26puRM1VtdB2kOKb0=;
 b=huExyewXR/QL8asd6MNHzLB1CkBYQ+mooNx/P5m5xmmMufOlV+m42QffSHfUURGbr/
 LOEbNNBcVHPgzEKd8SmOukYq7XakPhjKLkEEdPGGo8wkJomXDCSDksjFZX8EBoJVHluI
 AaZa9NiPkRIrancN4BLeC38boRu8JVWIMqqEirEB4ChP6TRD+rLX+j0MByN7Qbfjox6+
 VT0KRMv9MTpCD7tkDa0ZGiQgybb+BNl5cy7zcByVurGHjTjRboD9VKMHrwhdhyEXQWxZ
 AfIXq7zfJ8wHcAH43Bz9EfzE1ryt/Zfz+7BitKo+tyWDIjKMCeutiOeLC04gEhShe/D2
 Y/Ow==
X-Gm-Message-State: AOAM531IOXVRa3f/T3wzam3KaoBAglf3bts/lDCIKOShEsXMIq2tZMQ0
 tdke91om/bubyZjQ4tpt5D1RajcKXbr9Tw==
X-Google-Smtp-Source: ABdhPJyl8p21LBzUGs8D2VcvLawqx3pNb5sITCS0B0dwpHTp8fs8DMe+tEasMp/Uhj0QNNnH0r0zVg==
X-Received: by 2002:adf:b784:: with SMTP id s4mr18393368wre.116.1599405573150; 
 Sun, 06 Sep 2020 08:19:33 -0700 (PDT)
Received: from localhost.localdomain (208.19.23.93.rev.sfr.net. [93.23.19.208])
 by smtp.gmail.com with ESMTPSA id a15sm26420646wrn.3.2020.09.06.08.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Sep 2020 08:19:32 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v3 1/3] dt-bindings: iommu: Add binding for MediaTek MT8167
 IOMMU
Date: Sun,  6 Sep 2020 17:19:26 +0200
Message-Id: <20200906151928.881209-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Fabien Parent <fparent@baylibre.com>,
 robh+dt@kernel.org, matthias.bgg@gmail.com
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

This commit adds IOMMU binding documentation and larb port definitions
for the MT8167 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Rob Herring <robh@kernel.org>
---

V3: Added mt8167-larb-port.h file for iommu port definitions
V2: no change

---
 .../bindings/iommu/mediatek,iommu.txt         |  1 +
 include/dt-bindings/memory/mt8167-larb-port.h | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 include/dt-bindings/memory/mt8167-larb-port.h

diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt b/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
index c1ccd8582eb2..f7a348f48e0d 100644
--- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
@@ -61,6 +61,7 @@ Required properties:
 	"mediatek,mt6779-m4u" for mt6779 which uses generation two m4u HW.
 	"mediatek,mt7623-m4u", "mediatek,mt2701-m4u" for mt7623 which uses
 						     generation one m4u HW.
+	"mediatek,mt8167-m4u" for mt8167 which uses generation two m4u HW.
 	"mediatek,mt8173-m4u" for mt8173 which uses generation two m4u HW.
 	"mediatek,mt8183-m4u" for mt8183 which uses generation two m4u HW.
 - reg : m4u register base and size.
diff --git a/include/dt-bindings/memory/mt8167-larb-port.h b/include/dt-bindings/memory/mt8167-larb-port.h
new file mode 100644
index 000000000000..4dd44d1037a7
--- /dev/null
+++ b/include/dt-bindings/memory/mt8167-larb-port.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 BayLibre, SAS
+ * Author: Fabien Parent <fparent@baylibre.com>
+ */
+#ifndef __DTS_IOMMU_PORT_MT8167_H
+#define __DTS_IOMMU_PORT_MT8167_H
+
+#define MTK_M4U_ID(larb, port)		(((larb) << 5) | (port))
+
+#define M4U_LARB0_ID			0
+#define M4U_LARB1_ID			1
+#define M4U_LARB2_ID			2
+
+/* larb0 */
+#define M4U_PORT_DISP_OVL0		MTK_M4U_ID(M4U_LARB0_ID, 0)
+#define M4U_PORT_DISP_RDMA0		MTK_M4U_ID(M4U_LARB0_ID, 1)
+#define M4U_PORT_DISP_WDMA0		MTK_M4U_ID(M4U_LARB0_ID, 2)
+#define M4U_PORT_DISP_RDMA1		MTK_M4U_ID(M4U_LARB0_ID, 3)
+#define M4U_PORT_MDP_RDMA		MTK_M4U_ID(M4U_LARB0_ID, 4)
+#define M4U_PORT_MDP_WDMA		MTK_M4U_ID(M4U_LARB0_ID, 5)
+#define M4U_PORT_MDP_WROT		MTK_M4U_ID(M4U_LARB0_ID, 6)
+#define M4U_PORT_DISP_FAKE		MTK_M4U_ID(M4U_LARB0_ID, 7)
+
+/* IMG larb1*/
+#define M4U_PORT_CAM_IMGO		MTK_M4U_ID(M4U_LARB1_ID, 0)
+#define M4U_PORT_CAM_IMG2O		MTK_M4U_ID(M4U_LARB1_ID, 1)
+#define M4U_PORT_CAM_LSCI		MTK_M4U_ID(M4U_LARB1_ID, 2)
+#define M4U_PORT_CAM_ESFKO		MTK_M4U_ID(M4U_LARB1_ID, 3)
+#define M4U_PORT_CAM_AAO		MTK_M4U_ID(M4U_LARB1_ID, 4)
+#define M4U_PORT_VENC_REC		MTK_M4U_ID(M4U_LARB1_ID, 5)
+#define M4U_PORT_VENC_BSDMA		MTK_M4U_ID(M4U_LARB1_ID, 6)
+#define M4U_PORT_VENC_RD_COMV		MTK_M4U_ID(M4U_LARB1_ID, 7)
+#define M4U_PORT_CAM_IMGI		MTK_M4U_ID(M4U_LARB1_ID, 8)
+#define M4U_PORT_VENC_CUR_LUMA		MTK_M4U_ID(M4U_LARB1_ID, 9)
+#define M4U_PORT_VENC_CUR_CHROMA	MTK_M4U_ID(M4U_LARB1_ID, 10)
+#define M4U_PORT_VENC_REF_LUMA		MTK_M4U_ID(M4U_LARB1_ID, 11)
+#define M4U_PORT_VENC_REF_CHROMA	MTK_M4U_ID(M4U_LARB1_ID, 12)
+
+/* VDEC larb2*/
+#define M4U_PORT_HW_VDEC_MC_EXT		MTK_M4U_ID(M4U_LARB2_ID, 0)
+#define M4U_PORT_HW_VDEC_PP_EXT		MTK_M4U_ID(M4U_LARB2_ID, 1)
+#define M4U_PORT_HW_VDEC_VLD_EXT	MTK_M4U_ID(M4U_LARB2_ID, 2)
+#define M4U_PORT_HW_VDEC_AVC_MV_EXT	MTK_M4U_ID(M4U_LARB2_ID, 3)
+#define M4U_PORT_HW_VDEC_PRED_RD_EXT	MTK_M4U_ID(M4U_LARB2_ID, 4)
+#define M4U_PORT_HW_VDEC_PRED_WR_EXT	MTK_M4U_ID(M4U_LARB2_ID, 5)
+#define M4U_PORT_HW_VDEC_PPWRAP_EXT	MTK_M4U_ID(M4U_LARB2_ID, 6)
+
+#endif
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
