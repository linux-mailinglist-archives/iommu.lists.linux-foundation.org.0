Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 897B54F7867
	for <lists.iommu@lfdr.de>; Thu,  7 Apr 2022 09:57:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 165FE60F1B;
	Thu,  7 Apr 2022 07:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Go65K7anbQY2; Thu,  7 Apr 2022 07:57:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 957E760E2B;
	Thu,  7 Apr 2022 07:57:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7137CC0082;
	Thu,  7 Apr 2022 07:57:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78DB3C0012
 for <iommu@lists.linux-foundation.org>; Thu,  7 Apr 2022 07:57:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74B2360F1B
 for <iommu@lists.linux-foundation.org>; Thu,  7 Apr 2022 07:57:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M98mZsfW_GtC for <iommu@lists.linux-foundation.org>;
 Thu,  7 Apr 2022 07:57:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61B9960E2B
 for <iommu@lists.linux-foundation.org>; Thu,  7 Apr 2022 07:57:49 +0000 (UTC)
X-UUID: abdb417e55d041e598eb976acc6d18b9-20220407
X-UUID: abdb417e55d041e598eb976acc6d18b9-20220407
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1256304001; Thu, 07 Apr 2022 15:57:40 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 7 Apr 2022 15:57:38 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Apr 2022 15:57:35 +0800
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>
Subject: [PATCH v6 00/34] MT8195 IOMMU SUPPORT
Date: Thu, 7 Apr 2022 15:56:52 +0800
Message-ID: <20220407075726.17771-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 chengci.xu@mediatek.com, xueqi.zhang@mediatek.com,
 linux-kernel@vger.kernel.org, libo.kang@mediatek.com,
 yen-chang.chen@mediatek.com, iommu@lists.linux-foundation.org,
 yf.wang@mediatek.com, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, mingyuan.ma@mediatek.com,
 linux-arm-kernel@lists.infradead.org, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>
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
From: Yong Wu via iommu <iommu@lists.linux-foundation.org>
Reply-To: Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

This patchset adds MT8195 iommu support.

MT8195 have 3 IOMMU HWs. 2 IOMMU HW is for multimedia, and 1 IOMMU HW is
for infra-master, like PCIe/USB.

About the 2 MM IOMMU HW, something like this:

        IOMMU(VDO)          IOMMU(VPP)
           |                   |
      SMI_COMMON(VDO)      SMI_COMMON(VPP)
      ---------------     ----------------
      |      |   ...      |      |     ...
    larb0 larb2  ...    larb1 larb3    ...

these two MM IOMMU HW share a pgtable.

About the INFRA IOMMU, it don't have larbs, the master connects the iommu
directly. It use a independent pgtable.

Also, mt8195 IOMMU bank supports. Normally the IOMMU register size only
is 0x1000. In this IOMMU HW, the register size is 5 * 0x1000. each 0x1000
is a bank. the banks' register look like this:
     ----------------------------------------
     |bank0  | bank1 | bank2 | bank3 | bank4|
     ----------------------------------------
     |global |
     |control|         null
     |regs   |
     -----------------------------------------
     |bank   |bank   |bank   |bank   |bank   |
     |regs   |regs   |regs   |regs   |regs   |
     |       |       |       |       |       |
     -----------------------------------------
All the banks share some global control registers, and each bank have its
special bank registers, like pgtable base register, tlb operation registers,
the fault status registers.
 
In mt8195, we enable this bank feature for infra iommu, We put PCIe in bank0
and USB in bank4. they have independent pgtable.

Change note:
v6: Rebase on v5.18-rc1.

v5: https://lore.kernel.org/linux-iommu/20220217113453.13658-1-yong.wu@mediatek.com
   1) Base on next-20220216
   2) Remove a patch for kmalloc for protect buffer. keep the kzalloc for it.
   3) minor fix from AngeloGioacchino, like rename the error label name
   (data_unlock to err_unlock).
   Note, keep the TODO for component compare_of[26/34].

v4: https://lore.kernel.org/linux-iommu/20220125085634.17972-1-yong.wu@mediatek.com/
   1) Base on v5.16-rc1
   2) Base on tlb logic 2 patchset, some patches in v3 has already gone
   through that patchset.
   3) Due to the unreadable union for v1/v2(comment in 26/33 of v3), I
   separate mtk_iommu_data for v1 and v2 totally, then remove mtk_iommu.h.
   please see patch[26/35][27/35].
   4) add two mutex for the internal data. patch[6/35][7/35].
   5) add a new flag PM_CLK_AO.

v3: https://lore.kernel.org/linux-mediatek/20210923115840.17813-1-yong.wu@mediatek.com/
    1) base on v5.15-rc1
    2) Adjust devlink with smi-common, not use the property(sub-sommon).
    3) Adjust tlb_flush_all flow,
       a) Fix tlb_flush_all only is supported in bank0.
       b) add tlb-flush-all in the resume callback.
       c) remove the pm status checking in tlb-flush-all.
       The reason are showed in the commit message.
    4) Allow IOMMU_DOMAIN_UNMANAGED since PCIe VFIO use that.
    5) Fix a clk warning and a null abort when unbind the iommu driver.

v2: https://lore.kernel.org/linux-mediatek/20210813065324.29220-1-yong.wu@mediatek.com/
    1) Base on v5.14-rc1.
    2) Fix build fail for arm32.
    3) Fix dt-binding issue from Rob.
    4) Fix the bank issue when tlb flush. v1 always use bank->base.
    5) adjust devlink with smi-common since the node may be smi-sub-common.
    6) other changes: like reword some commit message(removing many
       "This patch..."); seperate serveral patches.

v1: https://lore.kernel.org/linux-mediatek/20210630023504.18177-1-yong.wu@mediatek.com/
    Base on v5.13-rc1

Yong Wu (34):
  dt-bindings: mediatek: mt8195: Add binding for MM IOMMU
  dt-bindings: mediatek: mt8195: Add binding for infra IOMMU
  iommu/mediatek: Fix 2 HW sharing pgtable issue
  iommu/mediatek: Add list_del in mtk_iommu_remove
  iommu/mediatek: Remove clk_disable in mtk_iommu_remove
  iommu/mediatek: Add mutex for m4u_group and m4u_dom in data
  iommu/mediatek: Add mutex for data in the mtk_iommu_domain
  iommu/mediatek: Adapt sharing and non-sharing pgtable case
  iommu/mediatek: Add 12G~16G support for multi domains
  iommu/mediatek: Add a flag DCM_DISABLE
  iommu/mediatek: Add a flag NON_STD_AXI
  iommu/mediatek: Remove the granule in the tlb flush
  iommu/mediatek: Always enable output PA over 32bits in isr
  iommu/mediatek: Add SUB_COMMON_3BITS flag
  iommu/mediatek: Add IOMMU_TYPE flag
  iommu/mediatek: Contain MM IOMMU flow with the MM TYPE
  iommu/mediatek: Adjust device link when it is sub-common
  iommu/mediatek: Allow IOMMU_DOMAIN_UNMANAGED for PCIe VFIO
  iommu/mediatek: Add a PM_CLK_AO flag for infra iommu
  iommu/mediatek: Add infra iommu support
  iommu/mediatek: Add PCIe support
  iommu/mediatek: Add mt8195 support
  iommu/mediatek: Only adjust code about register base
  iommu/mediatek: Just move code position in hw_init
  iommu/mediatek: Separate mtk_iommu_data for v1 and v2
  iommu/mediatek: Remove mtk_iommu.h
  iommu/mediatek-v1: Just rename mtk_iommu to mtk_iommu_v1
  iommu/mediatek: Add mtk_iommu_bank_data structure
  iommu/mediatek: Initialise bank HW for each a bank
  iommu/mediatek: Change the domid to iova_region_id
  iommu/mediatek: Get the proper bankid for multi banks
  iommu/mediatek: Initialise/Remove for multi bank dev
  iommu/mediatek: Backup/restore regsiters for multi banks
  iommu/mediatek: mt8195: Enable multi banks for infra iommu

 .../bindings/iommu/mediatek,iommu.yaml        |  20 +-
 drivers/iommu/mtk_iommu.c                     | 955 +++++++++++++-----
 drivers/iommu/mtk_iommu.h                     | 101 --
 drivers/iommu/mtk_iommu_v1.c                  | 235 +++--
 .../dt-bindings/memory/mt8195-memory-port.h   | 408 ++++++++
 include/dt-bindings/memory/mtk-memory-port.h  |   2 +
 6 files changed, 1244 insertions(+), 477 deletions(-)
 delete mode 100644 drivers/iommu/mtk_iommu.h
 create mode 100644 include/dt-bindings/memory/mt8195-memory-port.h

-- 
2.18.0


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
