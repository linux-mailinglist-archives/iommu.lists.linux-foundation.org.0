Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A94702BE
	for <lists.iommu@lfdr.de>; Mon, 22 Jul 2019 16:55:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 007AACD3;
	Mon, 22 Jul 2019 14:55:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5CAB7C21;
	Mon, 22 Jul 2019 14:55:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1993E775;
	Mon, 22 Jul 2019 14:55:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ADBC5308FE9A;
	Mon, 22 Jul 2019 14:55:21 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2BFB060A9F;
	Mon, 22 Jul 2019 14:55:18 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, hch@lst.de,
	m.szyprowski@samsung.com, robin.murphy@arm.com, mst@redhat.com,
	jasowang@redhat.com, virtualization@lists.linux-foundation.org,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dma-mapping: Protect dma_addressing_limited against NULL
	dma_mask
Date: Mon, 22 Jul 2019 16:55:08 +0200
Message-Id: <20190722145509.1284-2-eric.auger@redhat.com>
In-Reply-To: <20190722145509.1284-1-eric.auger@redhat.com>
References: <20190722145509.1284-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Mon, 22 Jul 2019 14:55:21 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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

dma_addressing_limited() should not be called on a device with
a NULL dma_mask. If this occurs let's WARN_ON_ONCE and immediately
return. Existing call sites are updated separately.

Fixes: b866455423e0 ("dma-mapping: add a dma_addressing_limited helper")
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v1 -> v2:
- add a WARN_ON_ONCE()
- reword the commit message
---
 include/linux/dma-mapping.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index e11b115dd0e4..ef0cf9537abc 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -689,8 +689,9 @@ static inline int dma_coerce_mask_and_coherent(struct device *dev, u64 mask)
  */
 static inline bool dma_addressing_limited(struct device *dev)
 {
-	return min_not_zero(*dev->dma_mask, dev->bus_dma_mask) <
-		dma_get_required_mask(dev);
+	return WARN_ON_ONCE(!dev->dma_mask) ? false :
+		min_not_zero(*dev->dma_mask, dev->bus_dma_mask) <
+			dma_get_required_mask(dev);
 }
 
 #ifdef CONFIG_ARCH_HAS_SETUP_DMA_OPS
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
