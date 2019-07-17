Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 992FA6B69B
	for <lists.iommu@lfdr.de>; Wed, 17 Jul 2019 08:26:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D781BAE0;
	Wed, 17 Jul 2019 06:26:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9CBDAC03
	for <iommu@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 06:26:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 57C6312E
	for <iommu@lists.linux-foundation.org>;
	Wed, 17 Jul 2019 06:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=V10uEz0zWFZ63sIz9VJWmuEfwUxz9f6GOpX0SGJmq3k=;
	b=H+rObaLkaOf7mg1iUpKwHTvO5y
	8nUdnb5L2v6HXJNISb2ZuVZhIsuCG4IgOd9NRP1Eyo1A/taHfQcABuxLHjdap9bWXyijCKGOi8Uoq
	MRRCdIWZ22tyFC5InEjdPx6+8QZ9pqylyjb092b3C5nYFMvY4GoT9cvnmjThEmHH2jiAUbkJR8iwr
	4bKT8+yD1Pu+3I+JBqM50wbepIodG5xVIXg1DFAO/7Gi5qu5Uo4OcgXTKPjnqUOlmOdyPd8kpkX1D
	+sA1BUMdOuMEslmpK+diC57qfUhjgNNKSbNPxc0PLK4TAXnGuL8u/QvhE0hvTSnbWW2cUOF/df7ZV
	7TcDX+ow==;
Received: from [213.208.157.38] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hndOP-0003ma-Pe; Wed, 17 Jul 2019 06:26:22 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 1/2] dma-mapping: add a dma_addressing_limited helper
Date: Wed, 17 Jul 2019 08:26:14 +0200
Message-Id: <20190717062615.10569-2-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190717062615.10569-1-hch@lst.de>
References: <20190717062615.10569-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_MED,
	RCVD_IN_SBL_CSS autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linux-kernel@vger.kernel.org
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

This helper returns if the device has issues addressing all present
memory in the system.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/dma-mapping.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 8d13e28a8e07..e11b115dd0e4 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -679,6 +679,20 @@ static inline int dma_coerce_mask_and_coherent(struct device *dev, u64 mask)
 	return dma_set_mask_and_coherent(dev, mask);
 }
 
+/**
+ * dma_addressing_limited - return if the device is addressing limited
+ * @dev:	device to check
+ *
+ * Return %true if the devices DMA mask is too small to address all memory in
+ * the system, else %false.  Lack of addressing bits is the prime reason for
+ * bounce buffering, but might not be the only one.
+ */
+static inline bool dma_addressing_limited(struct device *dev)
+{
+	return min_not_zero(*dev->dma_mask, dev->bus_dma_mask) <
+		dma_get_required_mask(dev);
+}
+
 #ifdef CONFIG_ARCH_HAS_SETUP_DMA_OPS
 void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 		const struct iommu_ops *iommu, bool coherent);
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
