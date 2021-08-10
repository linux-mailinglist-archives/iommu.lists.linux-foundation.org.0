Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B7C3E54BE
	for <lists.iommu@lfdr.de>; Tue, 10 Aug 2021 10:09:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D11360614;
	Tue, 10 Aug 2021 08:09:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HmcFR-ybQNH0; Tue, 10 Aug 2021 08:09:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 82A9A60618;
	Tue, 10 Aug 2021 08:09:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 515BDC000E;
	Tue, 10 Aug 2021 08:09:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9EC95C000E
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 08:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7ADD781919
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 08:09:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9PShS0Vr5hq5 for <iommu@lists.linux-foundation.org>;
 Tue, 10 Aug 2021 08:09:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E995B832D1
 for <iommu@lists.linux-foundation.org>; Tue, 10 Aug 2021 08:09:15 +0000 (UTC)
X-UUID: 53b6c6ec88234b69b482cd65c786915a-20210810
X-UUID: 53b6c6ec88234b69b482cd65c786915a-20210810
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 143540492; Tue, 10 Aug 2021 16:09:09 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 16:09:08 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 10 Aug 2021 16:09:07 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 00/13] MT8195 SMI support
Date: Tue, 10 Aug 2021 16:08:46 +0800
Message-ID: <20210810080859.29511-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
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

This patchset mainly adds SMI support for mt8195.

Comparing with the previous version, add two new functions:
a) add smi sub common
b) add initial setting for smi-common and smi-larb.

Change note:
v3:1) In the dt-binding:
       a. Change mediatek,smi type from phandle-array to phandle from Rob.
       b. Add a new bool property (mediatek,smi_sub_common)
          to indicate if this is smi-sub-common.
   2) Change the clock using bulk parting.
      keep the smi-common's has_gals flag. more strict.
   3) More comment about larb initial setting.
   4) Add a maintain patch
       
v2: https://lore.kernel.org/linux-mediatek/20210715121209.31024-1-yong.wu@mediatek.com/
    rebase on v5.14-rc1
    1) Adjust clk_bulk flow: use devm_clk_bulk_get for necessary clocks.
    2) Add two new little patches:
       a) use devm_platform_ioremap_resource
       b) Add error handle for smi_probe

v1: https://lore.kernel.org/linux-mediatek/20210616114346.18812-1-yong.wu@mediatek.com/

Yong Wu (13):
  dt-bindings: memory: mediatek: Add mt8195 smi binding
  dt-bindings: memory: mediatek: Add mt8195 smi sub common
  memory: mtk-smi: Use clk_bulk clock ops
  memory: mtk-smi: Rename smi_gen to smi_type
  memory: mtk-smi: Adjust some code position
  memory: mtk-smi: Add error handle for smi_probe
  memory: mtk-smi: Add device link for smi-sub-common
  memory: mtk-smi: Add clocks for smi-sub-common
  memory: mtk-smi: Use devm_platform_ioremap_resource
  memory: mtk-smi: mt8195: Add smi support
  memory: mtk-smi: mt8195: Add initial setting for smi-common
  memory: mtk-smi: mt8195: Add initial setting for smi-larb
  MAINTAINERS: Add entry for MediaTek SMI

 .../mediatek,smi-common.yaml                  |  36 +-
 .../memory-controllers/mediatek,smi-larb.yaml |   3 +
 MAINTAINERS                                   |   8 +
 drivers/memory/mtk-smi.c                      | 596 ++++++++++--------
 4 files changed, 395 insertions(+), 248 deletions(-)

-- 
2.18.0


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
