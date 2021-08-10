Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D9C3DB15F
	for <lists.iommu@lfdr.de>; Fri, 30 Jul 2021 04:53:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85A8D406A9;
	Fri, 30 Jul 2021 02:53:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9629cxhfeoec; Fri, 30 Jul 2021 02:53:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 8DB5F406B1;
	Fri, 30 Jul 2021 02:53:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5DFEEC000E;
	Fri, 30 Jul 2021 02:53:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD894C000E
 for <iommu@lists.linux-foundation.org>; Fri, 30 Jul 2021 02:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A99B7605D2
 for <iommu@lists.linux-foundation.org>; Fri, 30 Jul 2021 02:53:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LIH4kM1Ef8hE for <iommu@lists.linux-foundation.org>;
 Fri, 30 Jul 2021 02:53:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD2D360620
 for <iommu@lists.linux-foundation.org>; Fri, 30 Jul 2021 02:53:30 +0000 (UTC)
X-UUID: 57878119c16b4be6b327136db865f85d-20210730
X-UUID: 57878119c16b4be6b327136db865f85d-20210730
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 643913909; Fri, 30 Jul 2021 10:53:24 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Jul 2021 10:53:23 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 30 Jul 2021 10:53:16 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>, David Airlie <airlied@linux.ie>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v7 00/12] Clean up "mediatek,larb"
Date: Fri, 30 Jul 2021 10:52:26 +0800
Message-ID: <20210730025238.22456-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
Cc: Xia Jiang <xia.jiang@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, anthony.huang@mediatek.com,
 youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>,
 Evan Green <evgreen@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Wunderlich <frank-w@public-files.de>, yi.kuo@mediatek.com,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 ming-fan.chen@mediatek.com, Tiffany Lin <tiffany.lin@mediatek.com>,
 anan.sun@mediatek.com, srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Daniel Vetter <daniel@ffwll.ch>, Robin Murphy <robin.murphy@arm.com>
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

MediaTek IOMMU block diagram always like below:

        M4U
         |
    smi-common
         |
  -------------
  |         |  ...
  |         |
larb1     larb2
  |         |
vdec       venc

All the consumer connect with smi-larb, then connect with smi-common.

When the consumer works, it should enable the smi-larb's power which also
need enable the smi-common's power firstly.

Thus, Firstly, use the device link connect the consumer and the
smi-larbs. then add device link between the smi-larb and smi-common.

After adding the device_link, then "mediatek,larb" property can be removed.
the iommu consumer don't need call the mtk_smi_larb_get/put to enable
the power and clock of smi-larb and smi-common.

Base on v5.14-rc1, and a jpeg[1] and mdp[2] patchset.

[1] https://lore.kernel.org/linux-mediatek/20210702102304.3346429-1-hsinyi@chromium.org/
[2] https://lore.kernel.org/linux-mediatek/20210709022324.1607884-1-eizan@chromium.org/

Change notes:
v7: 1) Fix a arm32 boot fail issue. reported from Frank.
    2) Add a return fail in the mtk drm. suggested by Dafna.

v6: https://lore.kernel.org/linux-mediatek/20210714025626.5528-1-yong.wu@mediatek.com/
    1) rebase on v5.14-rc1.
    2) Fix the issue commented in v5 from Dafna and Hsin-Yi.
    3) Remove the patches about using pm_runtime_resume_and_get since they have
       already been merged by other patches.

v5: https://lore.kernel.org/linux-mediatek/20210410091128.31823-1-yong.wu@mediatek.com/
    1) Base v5.12-rc2.
    2) Remove changing the mtk-iommu to module_platform_driver patch, It have already been a
    independent patch.

v4: https://lore.kernel.org/linux-mediatek/1590826218-23653-1-git-send-email-yong.wu@mediatek.com/ 
    base on v5.7-rc1.
  1) Move drm PM patch before smi patchs.
  2) Change builtin_platform_driver to module_platform_driver since we may need
     build as module.
  3) Rebase many patchset as above.

v3: https://lore.kernel.org/linux-iommu/1567503456-24725-1-git-send-email-yong.wu@mediatek.com/
    1) rebase on v5.3-rc1 and the latest mt8183 patchset.
    2) Use device_is_bound to check whether the driver is ready from Matthias.    
    3) Add DL_FLAG_STATELESS flag when calling device_link_add and explain the
   reason in the commit message[3/14].
    4) Add a display patch[12/14] into this series. otherwise it may affect
   display HW fastlogo even though it don't happen in mt8183.
   
v2: https://lore.kernel.org/linux-iommu/1560171313-28299-1-git-send-email-yong.wu@mediatek.com/
   1) rebase on v5.2-rc1.
   2) Move adding device_link between the consumer and smi-larb into
iommu_add_device from Robin.
   3) add DL_FLAG_AUTOREMOVE_CONSUMER even though the smi is built-in from Evan.
   4) Remove the shutdown callback in iommu.   

v1: https://lore.kernel.org/linux-iommu/1546318276-18993-1-git-send-email-yong.wu@mediatek.com/

Yong Wu (11):
  dt-binding: mediatek: Get rid of mediatek,larb for multimedia HW
  iommu/mediatek-v1: Free the existed fwspec if the master dev already
    has
  iommu/mediatek: Add probe_defer for smi-larb
  iommu/mediatek: Add device_link between the consumer and the larb
    devices
  media: mtk-jpeg: Get rid of mtk_smi_larb_get/put
  media: mtk-mdp: Get rid of mtk_smi_larb_get/put
  drm/mediatek: Get rid of mtk_smi_larb_get/put
  media: mtk-vcodec: Get rid of mtk_smi_larb_get/put
  memory: mtk-smi: Get rid of mtk_smi_larb_get/put
  arm: dts: mediatek: Get rid of mediatek,larb for MM nodes
  arm64: dts: mediatek: Get rid of mediatek,larb for MM nodes

Yongqiang Niu (1):
  drm/mediatek: Add pm runtime support for ovl and rdma

 .../display/mediatek/mediatek,disp.txt        |  9 ----
 .../bindings/media/mediatek-jpeg-decoder.yaml |  9 ----
 .../bindings/media/mediatek-jpeg-encoder.yaml |  9 ----
 .../bindings/media/mediatek-mdp.txt           |  8 ----
 .../bindings/media/mediatek-vcodec.txt        |  4 --
 arch/arm/boot/dts/mt2701.dtsi                 |  2 -
 arch/arm/boot/dts/mt7623n.dtsi                |  5 --
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      | 16 -------
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  6 ---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  9 +++-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |  9 +++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       | 15 +++---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   | 36 +--------------
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |  1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  5 +-
 drivers/iommu/mtk_iommu.c                     | 24 +++++++++-
 drivers/iommu/mtk_iommu_v1.c                  | 31 ++++++++++++-
 .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 45 +-----------------
 .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  2 -
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 46 +------------------
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 -
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  1 -
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 37 ++-------------
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 --
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  1 -
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 44 ++----------------
 drivers/memory/mtk-smi.c                      | 14 ------
 include/soc/mediatek/smi.h                    | 20 --------
 28 files changed, 92 insertions(+), 321 deletions(-)

-- 
2.18.0


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
