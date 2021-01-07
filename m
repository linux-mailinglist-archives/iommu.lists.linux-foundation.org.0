Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB922ECF9E
	for <lists.iommu@lfdr.de>; Thu,  7 Jan 2021 13:29:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 33A40866FB;
	Thu,  7 Jan 2021 12:29:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 63UVGAxgOkNQ; Thu,  7 Jan 2021 12:29:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C8AE985329;
	Thu,  7 Jan 2021 12:29:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B54B2C013A;
	Thu,  7 Jan 2021 12:29:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB8B4C013A
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jan 2021 12:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C2210233B0
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jan 2021 12:29:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pGr6+2Is2brZ for <iommu@lists.linux-foundation.org>;
 Thu,  7 Jan 2021 12:29:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by silver.osuosl.org (Postfix) with ESMTP id 17465232FA
 for <iommu@lists.linux-foundation.org>; Thu,  7 Jan 2021 12:29:30 +0000 (UTC)
X-UUID: f07051edf40443598b4c94e3d7b09d30-20210107
X-UUID: f07051edf40443598b4c94e3d7b09d30-20210107
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2
 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 265079323; Thu, 07 Jan 2021 20:29:24 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Jan 2021 20:29:22 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Jan 2021 20:29:21 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin
 Murphy <robin.murphy@arm.com>
Subject: [PATCH v4 0/7] MediaTek IOMMU improve tlb flush performance in
 map/unmap
Date: Thu, 7 Jan 2021 20:29:02 +0800
Message-ID: <20210107122909.16317-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 David Laight <David.Laight@ACULAB.COM>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@google.com>, kernel-team@android.com,
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

This patchset is to improve tlb flushing performance in iommu_map/unmap
for MediaTek IOMMU.

For iommu_map, currently MediaTek IOMMU use IO_PGTABLE_QUIRK_TLBI_ON_MAP
to do tlb_flush for each a memory chunk. this is so unnecessary. we could
improve it by tlb flushing one time at the end of iommu_map.

For iommu_unmap, currently we have already improve this performance by
gather. But the current gather should take care its granule size. if the
granule size is different, it will do tlb flush and gather again. Our HW
don't care about granule size. thus I gather the range in our file.

After this patchset, we could achieve only tlb flushing once in iommu_map
and iommu_unmap.

Regardless of sg, for each a segment, I did a simple test:
  
  size = 20 * SZ_1M;
  /* the worst case, all are 4k mapping. */
  ret = iommu_map(domain, 0x5bb02000, 0x123f1000, size, IOMMU_READ);
  iommu_unmap(domain, 0x5bb02000, size);

This is the comparing time(unit is us):
              original-time  after-improve
   map-20M    59943           2347
   unmap-20M  264             36

This patchset also flush tlb once in the iommu_map_sg case.

patch [1/7][2/7][3/7] are for map while the others are for unmap.

change note:
v4: a. base on v5.11-rc1.
    b. Add a little helper _iommu_map.
    c. Fix a build fail for tegra-gart.c. I didn't notice there is another place
    call gart_iommu_sync_map.
    d. Switch gather->end to the read end address("start + end - 1").
    
v3: https://lore.kernel.org/linux-iommu/20201216103607.23050-1-yong.wu@mediatek.com/#r
    Refactor the unmap flow suggested by Robin.
     
v2: https://lore.kernel.org/linux-iommu/20201119061836.15238-1-yong.wu@mediatek.com/
    Refactor all the code.
    base on v5.10-rc1.

Yong Wu (7):
  iommu: Move iotlb_sync_map out from __iommu_map
  iommu: Add iova and size as parameters in iotlb_sync_map
  iommu/mediatek: Add iotlb_sync_map to sync whole the iova range
  iommu: Switch gather->end to the inclusive end
  iommu/io-pgtable: Allow io_pgtable_tlb ops optional
  iommu/mediatek: Gather iova in iommu_unmap to achieve tlb sync once
  iommu/mediatek: Remove the tlb-ops for v7s

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  2 +-
 drivers/iommu/iommu.c                       | 23 +++++++---
 drivers/iommu/mtk_iommu.c                   | 47 +++++++++------------
 drivers/iommu/tegra-gart.c                  |  7 ++-
 include/linux/io-pgtable.h                  |  8 ++--
 include/linux/iommu.h                       |  7 +--
 6 files changed, 52 insertions(+), 42 deletions(-)

-- 
2.18.0


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
