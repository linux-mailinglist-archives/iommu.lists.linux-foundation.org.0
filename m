Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8152D2AF0C2
	for <lists.iommu@lfdr.de>; Wed, 11 Nov 2020 13:38:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 345E88754B;
	Wed, 11 Nov 2020 12:38:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zO9WUURNd7nh; Wed, 11 Nov 2020 12:38:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8E5D487528;
	Wed, 11 Nov 2020 12:38:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6EBEAC1AD6;
	Wed, 11 Nov 2020 12:38:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E15DC016F
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 12:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 49A9D8754B
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 12:38:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2z50SAOpfD3D for <iommu@lists.linux-foundation.org>;
 Wed, 11 Nov 2020 12:38:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by hemlock.osuosl.org (Postfix) with ESMTP id 10C5F87528
 for <iommu@lists.linux-foundation.org>; Wed, 11 Nov 2020 12:38:50 +0000 (UTC)
X-UUID: 18d1958a1676446c89e447b786e8e8f6-20201111
X-UUID: 18d1958a1676446c89e447b786e8e8f6-20201111
Received: from mtkcas08.mediatek.inc [(172.21.101.126)] by
 mailgw02.mediatek.com (envelope-from <yong.wu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 336089553; Wed, 11 Nov 2020 20:38:45 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Nov 2020 20:38:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 Nov 2020 20:38:42 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v4 00/24] MT8192 IOMMU support
Date: Wed, 11 Nov 2020 20:38:14 +0800
Message-ID: <20201111123838.15682-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, kernel-team@android.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>, anan.sun@mediatek.com,
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

This patch mainly adds support for mt8192 Multimedia IOMMU and SMI.

mt8192 also is MTK IOMMU gen2 which uses ARM Short-Descriptor translation
table format. The M4U-SMI HW diagram is as below:

                          EMI
                           |
                          M4U
                           |
                      ------------
                       SMI Common
                      ------------
                           |
  +-------+------+------+----------------------+-------+
  |       |      |      |       ......         |       |
  |       |      |      |                      |       |
larb0   larb1  larb2  larb4     ......      larb19   larb20
disp0   disp1   mdp    vdec                   IPE      IPE

All the connections are HW fixed, SW can NOT adjust it.

Comparing with the preview SoC, this patchset mainly adds two new functions:
a) add iova 34 bits support.
b) add multi domains support since several HW has the special iova
region requirement.

change note:
v4: a) rebase on v5.10-rc1
    b) Move the smi part to a independent patchset.
    c) Improve v7s code from Robin and Will.
    d) Add a mediatek iommu entry patch in MAINTAINERS.

v3: https://lore.kernel.org/linux-iommu/20200930070647.10188-1-yong.wu@mediatek.com/
  a) Fix DT schema issue commented from Rob.
  b) Fix a v7s issue. Use "_lvl" instead of "_l" in the macro(ARM_V7S_PTES_PER_LVL) since 
  it is called in ARM_V7S_LVL_IDX which has already used "_l".
  c) Fix a PM suspend issue: Avoid pm suspend in pm runtime case.

v2: https://lore.kernel.org/linux-iommu/20200905080920.13396-1-yong.wu@mediatek.com/
  a) Convert IOMMU/SMI dt-binding to DT schema.
  b) Fix some comment from Pi-Hsun and Nicolas. like use
  generic_iommu_put_resv_regions.
  c) Reword some comment, like add how to use domain-id.

v1: https://lore.kernel.org/linux-iommu/20200711064846.16007-1-yong.wu@mediatek.com/

Yong Wu (24):
  dt-bindings: iommu: mediatek: Convert IOMMU to DT schema
  dt-bindings: memory: mediatek: Add a common larb-port header file
  dt-bindings: memory: mediatek: Extend LARB_NR_MAX to 32
  dt-bindings: memory: mediatek: Add domain definition
  dt-bindings: mediatek: Add binding for mt8192 IOMMU
  iommu/mediatek: Use the common mtk-smi-larb-port.h
  iommu/io-pgtable-arm-v7s: Use ias to check the valid iova in unmap
  iommu/io-pgtable-arm-v7s: Extend PA34 for MediaTek
  iommu/io-pgtable-arm-v7s: Clear LVL_SHIFT/BITS macro instead of the
    formula
  iommu/io-pgtable-arm-v7s: Add cfg as a param in some macros
  iommu/io-pgtable-arm-v7s: Quad lvl1 pgtable for MediaTek
  iommu/mediatek: Move hw_init into attach_device
  iommu/mediatek: Add device link for smi-common and m4u
  iommu/mediatek: Add pm runtime callback
  iommu/mediatek: Add power-domain operation
  iommu/mediatek: Add iova reserved function
  iommu/mediatek: Add single domain
  iommu/mediatek: Support master use iova over 32bit
  iommu/mediatek: Support up to 34bit iova in tlb flush
  iommu/mediatek: Support report iova 34bit translation fault in ISR
  iommu/mediatek: Add support for multi domain
  iommu/mediatek: Adjust the structure
  iommu/mediatek: Add mt8192 support
  MAINTAINERS: Add entry for MediaTek IOMMU

 .../bindings/iommu/mediatek,iommu.txt         | 105 -------
 .../bindings/iommu/mediatek,iommu.yaml        | 183 ++++++++++++
 MAINTAINERS                                   |   9 +
 drivers/iommu/io-pgtable-arm-v7s.c            |  56 ++--
 drivers/iommu/mtk_iommu.c                     | 271 +++++++++++++++---
 drivers/iommu/mtk_iommu.h                     |  11 +-
 drivers/memory/mtk-smi.c                      |   8 +
 include/dt-bindings/memory/mt2712-larb-port.h |   2 +-
 include/dt-bindings/memory/mt6779-larb-port.h |   2 +-
 include/dt-bindings/memory/mt8167-larb-port.h |   2 +-
 include/dt-bindings/memory/mt8173-larb-port.h |   2 +-
 include/dt-bindings/memory/mt8183-larb-port.h |   2 +-
 include/dt-bindings/memory/mt8192-larb-port.h | 240 ++++++++++++++++
 .../dt-bindings/memory/mtk-smi-larb-port.h    |  22 ++
 include/linux/io-pgtable.h                    |   4 +-
 include/soc/mediatek/smi.h                    |   3 +-
 16 files changed, 735 insertions(+), 187 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
 create mode 100644 Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
 create mode 100644 include/dt-bindings/memory/mt8192-larb-port.h
 create mode 100644 include/dt-bindings/memory/mtk-smi-larb-port.h

-- 
2.18.0


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
