Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A93F1F11CD
	for <lists.iommu@lfdr.de>; Mon,  8 Jun 2020 05:39:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1D00B85BF2;
	Mon,  8 Jun 2020 03:39:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zaa1s3kQ2Dkz; Mon,  8 Jun 2020 03:39:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0C4BC85621;
	Mon,  8 Jun 2020 03:39:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 030BAC016F;
	Mon,  8 Jun 2020 03:39:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B4F4C07FF
 for <iommu@lists.linux-foundation.org>; Mon,  8 Jun 2020 03:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 37ECC87D56
 for <iommu@lists.linux-foundation.org>; Mon,  8 Jun 2020 03:39:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hhqYBpX1Lw8t for <iommu@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 03:39:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from out30-130.freemail.mail.aliyun.com
 (out30-130.freemail.mail.aliyun.com [115.124.30.130])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B573E87CB8
 for <iommu@lists.linux-foundation.org>; Mon,  8 Jun 2020 03:39:09 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R211e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e07484;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=20; SR=0;
 TI=SMTPD_---0U-sW8OL_1591587543; 
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0U-sW8OL_1591587543) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 08 Jun 2020 11:39:03 +0800
From: Baolin Wang <baolin.wang@linux.alibaba.com>
To: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, agross@kernel.org,
 bjorn.andersson@linaro.org, matthias.bgg@gmail.com, robdclark@gmail.com,
 robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 0/2] Some improvements for iommu
Date: Mon,  8 Jun 2020 11:38:39 +0800
Message-Id: <cover.1591587029.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, baolin.wang@linux.alibaba.com,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi,

The first patch masks some functions as static, and the second patch
changes to use the gfp parameter from iommu_ops->map() to allocate
ARM page pages. Any comments are welcome. Thanks.

Baolin Wang (2):
  iommu: Mark __iommu_map/__iommu_map_sg as static
  iommu: Add gfp parameter to io_pgtable_ops->map()

 drivers/gpu/drm/panfrost/panfrost_mmu.c |  2 +-
 drivers/iommu/arm-smmu-v3.c             |  2 +-
 drivers/iommu/arm-smmu.c                |  2 +-
 drivers/iommu/io-pgtable-arm-v7s.c      | 10 +++++-----
 drivers/iommu/io-pgtable-arm.c          | 10 +++++-----
 drivers/iommu/iommu.c                   | 10 +++++-----
 drivers/iommu/ipmmu-vmsa.c              |  2 +-
 drivers/iommu/msm_iommu.c               |  2 +-
 drivers/iommu/mtk_iommu.c               |  2 +-
 drivers/iommu/qcom_iommu.c              |  2 +-
 include/linux/io-pgtable.h              |  2 +-
 11 files changed, 23 insertions(+), 23 deletions(-)

-- 
1.8.3.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
