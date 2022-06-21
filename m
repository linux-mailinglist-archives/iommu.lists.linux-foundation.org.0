Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B9155359F
	for <lists.iommu@lfdr.de>; Tue, 21 Jun 2022 17:14:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FD926077D;
	Tue, 21 Jun 2022 15:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FD926077D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8oHCRAMU1fuC; Tue, 21 Jun 2022 15:14:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id AD90160D87;
	Tue, 21 Jun 2022 15:14:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD90160D87
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B2F8C0081;
	Tue, 21 Jun 2022 15:14:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F272FC002D
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jun 2022 15:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC93D418D7
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jun 2022 15:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC93D418D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kpB8Tllqkshe for <iommu@lists.linux-foundation.org>;
 Tue, 21 Jun 2022 15:14:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C1E4418D2
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C1E4418D2
 for <iommu@lists.linux-foundation.org>; Tue, 21 Jun 2022 15:14:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1E8D165C;
 Tue, 21 Jun 2022 08:14:35 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com
 [10.1.196.40])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DA8B13F66F;
 Tue, 21 Jun 2022 08:14:34 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH 0/3] iommu: More internal ops cleanup
Date: Tue, 21 Jun 2022 16:14:24 +0100
Message-Id: <cover.1655822151.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.36.1.dirty
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

Hi all,

Here are a few more thematically-related patches from my develompent
stack that don't depend on the rest, so may as well get some exposure
sooner rather than later.

Thanks,
Robin.


Robin Murphy (3):
  iommu: Use dev_iommu_ops() for probe_finalize
  iommu: Make .release_device optional
  iommu: Clean up release_device checks

 drivers/iommu/apple-dart.c                  |  3 ---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  8 +-------
 drivers/iommu/arm/arm-smmu/arm-smmu.c       | 14 +++-----------
 drivers/iommu/arm/arm-smmu/qcom_iommu.c     | 11 -----------
 drivers/iommu/exynos-iommu.c                |  3 ---
 drivers/iommu/fsl_pamu_domain.c             |  5 -----
 drivers/iommu/iommu.c                       |  9 ++++++---
 drivers/iommu/msm_iommu.c                   |  5 -----
 drivers/iommu/mtk_iommu.c                   |  5 -----
 drivers/iommu/mtk_iommu_v1.c                |  5 -----
 drivers/iommu/sprd-iommu.c                  | 11 -----------
 drivers/iommu/sun50i-iommu.c                |  3 ---
 drivers/iommu/tegra-gart.c                  |  5 -----
 drivers/iommu/tegra-smmu.c                  |  3 ---
 drivers/iommu/virtio-iommu.c                |  8 +-------
 15 files changed, 11 insertions(+), 87 deletions(-)

-- 
2.36.1.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
