Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C4795ED9A8
	for <lists.iommu@lfdr.de>; Mon,  4 Nov 2019 08:01:30 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2A311B49;
	Mon,  4 Nov 2019 07:01:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 415D4B1F
	for <iommu@lists.linux-foundation.org>;
	Mon,  4 Nov 2019 07:01:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id F2FB967F
	for <iommu@lists.linux-foundation.org>;
	Mon,  4 Nov 2019 07:01:22 +0000 (UTC)
X-UUID: d24b734281444918b8fb31d13f0c5550-20191104
X-UUID: d24b734281444918b8fb31d13f0c5550-20191104
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
	with ESMTP id 870836612; Mon, 04 Nov 2019 15:01:18 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
	mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server
	(TLS) id 15.0.1395.4; Mon, 4 Nov 2019 15:01:15 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
	(172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
	Transport; Mon, 4 Nov 2019 15:01:14 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will.deacon@arm.com>
Subject: [PATCH v5 0/7] Improve tlb range flush
Date: Mon, 4 Nov 2019 15:01:01 +0800
Message-ID: <1572850868-22315-1-git-send-email-yong.wu@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,MAY_BE_FORGED,
	UNPARSEABLE_RELAY autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
	Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
	srv_heupstream@mediatek.com, chao.hao@mediatek.com,
	edison.hsieh@mediatek.com, linux-kernel@vger.kernel.org,
	Evan Green <evgreen@chromium.org>,
	Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
	linux-mediatek@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

This patchset mainly fixes a tlb flush timeout issue and use the new
iommu_gather to re-implement the tlb flush flow. and several clean up
patches about the tlb_flush.

change note:

v5: No code change. Only update the commit message of the last patch[7/7]
    suggested from Tomasz in the internal review.

v4: https://lore.kernel.org/linux-iommu/1571196792-12382-1-git-send-email-yong.wu@mediatek.com/#t
    1. Add a new tlb_lock for tlb operations.
    2. Delete the pgtlock.
    3. Remove the "writel" patch.

v3: https://lore.kernel.org/linux-iommu/1571035101-4213-1-git-send-email-yong.wu@mediatek.com/T/#t
   1. Use the gather to implement the tlb_flush suggested from Tomasz.
   2. add some clean up patches.

v2:
https://lore.kernel.org/linux-iommu/1570627143-29441-1-git-send-email-yong.wu@mediatek.com/T/#t
   1. rebase on v5.4-rc1
   2. only split to several patches.

v1:
https://lore.kernel.org/linux-iommu/CAAFQd5C3U7pZo4SSUJ52Q7E+0FaUoORQFbQC5RhCHBhi=NFYTw@mail.gmail.com/T/#t

Yong Wu (7):
  iommu/mediatek: Correct the flush_iotlb_all callback
  iommu/mediatek: Add a new tlb_lock for tlb_flush
  iommu/mediatek: Use gather to achieve the tlb range flush
  iommu/mediatek: Delete the leaf in the tlb_flush
  iommu/mediatek: Move the tlb_sync into tlb_flush
  iommu/mediatek: Get rid of the pgtlock
  iommu/mediatek: Reduce the tlb flush timeout value

 drivers/iommu/mtk_iommu.c | 88 +++++++++++++++--------------------------------
 drivers/iommu/mtk_iommu.h |  2 +-
 2 files changed, 29 insertions(+), 61 deletions(-)

-- 
1.9.1 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
