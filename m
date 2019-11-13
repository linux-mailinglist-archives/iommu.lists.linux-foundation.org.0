Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 333CEFAB15
	for <lists.iommu@lfdr.de>; Wed, 13 Nov 2019 08:36:58 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 08DA0F5A;
	Wed, 13 Nov 2019 07:35:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 18DBEF2B
	for <iommu@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 07:35:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C7810CF
	for <iommu@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 07:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qJw0HxSkIoIFEkf7WM3bUYPvzs7FxAE5RM8jYHNlEqQ=;
	b=iLeojNqJ3HqaCp3W2+oIHEc7zK
	zjuU6aDvqgA0YPhfEqpomJvBsaskrtjBgiI8JfgvbxH6g1a7cxjdwfHH5gOnC6qtH9bZ1ZendDia+
	jLWcvyOOA/I/XKCfGXKAtJQZ5YmdxyQnz8k9tsbXeM5esYFzNftG53TQjo6os8bzdbVsxx8eiu+RN
	5EEY1pxuaDTzO3AtjXLvsJHB5ZHBrlvP3nOMI3i5s3aW9za6q3wxKGNvhdA02K8NalH/VHv1+Ic9k
	q1rtolDteo5JqY3buRZpHQXXrqaz1TxcNRVOVvD1ZBLY3PUeULv1D9tC8jwi/xSBUOhCTANiKgEwK
	6kkXVCrw==;
Received: from [2001:4bb8:180:3806:c70:4a89:bc61:5] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUnBt-00006y-GA; Wed, 13 Nov 2019 07:35:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
	iommu@lists.linux-foundation.org, Russell King <linux@armlinux.org.uk>
Subject: [PATCH 3/3] powerpc: remove support for NULL dev in __phys_to_dma /
	__dma_to_phys
Date: Wed, 13 Nov 2019 08:35:39 +0100
Message-Id: <20191113073539.9660-4-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113073539.9660-1-hch@lst.de>
References: <20191113073539.9660-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
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

Support for calling the DMA API functions without a valid device pointer
was removed a while ago, so remove the stale support for that from the
powerpc __phys_to_dma / __dma_to_phys helpers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/include/asm/dma-direct.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/include/asm/dma-direct.h b/arch/powerpc/include/asm/dma-direct.h
index e29e8a236b8d..abc154d784b0 100644
--- a/arch/powerpc/include/asm/dma-direct.h
+++ b/arch/powerpc/include/asm/dma-direct.h
@@ -4,15 +4,11 @@
 
 static inline dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
 {
-	if (!dev)
-		return paddr + PCI_DRAM_OFFSET;
 	return paddr + dev->archdata.dma_offset;
 }
 
 static inline phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t daddr)
 {
-	if (!dev)
-		return daddr - PCI_DRAM_OFFSET;
 	return daddr - dev->archdata.dma_offset;
 }
 #endif /* ASM_POWERPC_DMA_DIRECT_H */
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
