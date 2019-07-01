Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE2435B07
	for <lists.iommu@lfdr.de>; Wed,  5 Jun 2019 13:16:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B1184C5D;
	Wed,  5 Jun 2019 11:16:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AFED3B8E
	for <iommu@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 11:16:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
	[210.160.252.171])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 068546D6
	for <iommu@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 11:16:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,550,1549897200"; d="scan'208";a="17883868"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
	by relmlie5.idc.renesas.com with ESMTP; 05 Jun 2019 20:16:52 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id A1E9C41BD76A;
	Wed,  5 Jun 2019 20:16:52 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com, hch@lst.de,
	m.szyprowski@samsung.com, robin.murphy@arm.com, joro@8bytes.org
Subject: [RFC PATCH v5 1/8] dma-mapping: add a device driver helper for iova
	contiguous
Date: Wed,  5 Jun 2019 20:11:47 +0900
Message-Id: <1559733114-4221-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559733114-4221-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1559733114-4221-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-renesas-soc@vger.kernel.org, iommu@lists.linux-foundation.org,
	linux-mmc@vger.kernel.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

This API can set a flag whether a device requires iova contiguous
strictly.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 include/linux/device.h      |  1 +
 include/linux/dma-mapping.h | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index e85264f..a33d611 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -752,6 +752,7 @@ struct device_dma_parameters {
 	 */
 	unsigned int max_segment_size;
 	unsigned long segment_boundary_mask;
+	bool iova_contiguous;
 };
 
 /**
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 6309a72..cdb4e75 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -729,6 +729,22 @@ static inline int dma_set_seg_boundary(struct device *dev, unsigned long mask)
 	return -EIO;
 }
 
+static inline int dma_get_iova_contiguous(struct device *dev)
+{
+	if (dev->dma_parms)
+		return dev->dma_parms->iova_contiguous;
+	return false;
+}
+
+static inline int dma_set_iova_contiguous(struct device *dev, bool contiguous)
+{
+	if (dev->dma_parms) {
+		dev->dma_parms->iova_contiguous = contiguous;
+		return 0;
+	}
+	return -EIO;
+}
+
 #ifndef dma_max_pfn
 static inline unsigned long dma_max_pfn(struct device *dev)
 {
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
