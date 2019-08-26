Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D59BC9D0B7
	for <lists.iommu@lfdr.de>; Mon, 26 Aug 2019 15:34:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 801FD15C4;
	Mon, 26 Aug 2019 13:34:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 374F615BA
	for <iommu@lists.linux-foundation.org>;
	Mon, 26 Aug 2019 13:32:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8AB3E1FB
	for <iommu@lists.linux-foundation.org>;
	Mon, 26 Aug 2019 13:32:30 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 5EFA913FC29889333CDC;
	Mon, 26 Aug 2019 21:32:27 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS401-HUB.china.huawei.com
	(10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Mon, 26 Aug 2019
	21:32:20 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <digetx@gmail.com>, <mchehab@kernel.org>, <gregkh@linuxfoundation.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<robin.murphy@arm.com>, <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: staging: tegra-vde: Disable building with COMPILE_TEST
Date: Mon, 26 Aug 2019 21:31:40 +0800
Message-ID: <20190826133140.13456-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: devel@driverdev.osuosl.org, YueHaibing <yuehaibing@huawei.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	linux-tegra@vger.kernel.org, linux-media@vger.kernel.org
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

If COMPILE_TEST is y and IOMMU_SUPPORT is n, selecting TEGRA_VDE
to m will set IOMMU_IOVA to m, this fails the building of
TEGRA_HOST1X and DRM_TEGRA which is y like this:

drivers/gpu/host1x/cdma.o: In function `host1x_cdma_init':
cdma.c:(.text+0x66c): undefined reference to `alloc_iova'
cdma.c:(.text+0x698): undefined reference to `__free_iova'

drivers/gpu/drm/tegra/drm.o: In function `tegra_drm_unload':
drm.c:(.text+0xeb0): undefined reference to `put_iova_domain'
drm.c:(.text+0xeb4): undefined reference to `iova_cache_put'

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 6b2265975239 ("media: staging: tegra-vde: Fix build error")
Fixes: b301f8de1925 ("media: staging: media: tegra-vde: Add IOMMU support")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/staging/media/tegra-vde/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/tegra-vde/Kconfig b/drivers/staging/media/tegra-vde/Kconfig
index ba49ea5..a41d30c 100644
--- a/drivers/staging/media/tegra-vde/Kconfig
+++ b/drivers/staging/media/tegra-vde/Kconfig
@@ -1,9 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 config TEGRA_VDE
 	tristate "NVIDIA Tegra Video Decoder Engine driver"
-	depends on ARCH_TEGRA || COMPILE_TEST
+	depends on ARCH_TEGRA
 	select DMA_SHARED_BUFFER
-	select IOMMU_IOVA if (IOMMU_SUPPORT || COMPILE_TEST)
+	select IOMMU_IOVA if IOMMU_SUPPORT
 	select SRAM
 	help
 	    Say Y here to enable support for the NVIDIA Tegra video decoder
-- 
2.7.4


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
