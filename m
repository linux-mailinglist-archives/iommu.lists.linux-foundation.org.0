Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 902CE454FA8
	for <lists.iommu@lfdr.de>; Wed, 17 Nov 2021 22:54:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17703405D2;
	Wed, 17 Nov 2021 21:54:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id znWWhkvoS85P; Wed, 17 Nov 2021 21:54:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 98CF9404C1;
	Wed, 17 Nov 2021 21:54:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B428EC0039;
	Wed, 17 Nov 2021 21:54:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5285FC002F
 for <iommu@lists.linux-foundation.org>; Wed, 17 Nov 2021 21:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3984D60A8A
 for <iommu@lists.linux-foundation.org>; Wed, 17 Nov 2021 21:54:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=deltatee.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LAcVvpfxA5FC for <iommu@lists.linux-foundation.org>;
 Wed, 17 Nov 2021 21:54:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ale.deltatee.com (ale.deltatee.com [204.191.154.188])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B8B760A83
 for <iommu@lists.linux-foundation.org>; Wed, 17 Nov 2021 21:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Cc:To:From:content-disposition;
 bh=lVFs012FiYfAIteDPcswFBDVkI4GWpBL3gjXvYfdIeM=; b=GppN5m7z3WB0EpXi+ZraKJV/CS
 ZpaD/UdGV63gZkSTqxrX+PcM1/Vcl17gzDqAZdzEYJuoFcJCDSRcFE2SP+YS5GMtrKDCoKSw18rjg
 JITKEZUYuR35cvZVAdgoOc4A38gUsCcQE3rjHyyFPvIaEIyBGeyzLdZW1akL/yFC9pGlMrQNXlpPr
 jTYR2deXIrTxeuXAl1+jO9mZGMH3Dyk1vFaKo0pBFxMbKh2FhUcym2k12XmMKtD21IHXBbBN8sxEU
 JALEElFfCVLOk6c/JiAmhyuxYibtkSJ2lX4XChYIUS+pV3Lh8HNraGTDdq335YfzDmZcju2vjWYrj
 Z2ynp7nw==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <gunthorp@deltatee.com>)
 id 1mnSsr-000Zo6-Ir; Wed, 17 Nov 2021 14:54:27 -0700
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim
 4.94.2) (envelope-from <gunthorp@deltatee.com>)
 id 1mnSsj-0000zA-0h; Wed, 17 Nov 2021 14:54:17 -0700
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org
Date: Wed, 17 Nov 2021 14:53:55 -0700
Message-Id: <20211117215410.3695-9-logang@deltatee.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211117215410.3695-1-logang@deltatee.com>
References: <20211117215410.3695-1-logang@deltatee.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, sbates@raithlin.com, hch@lst.de,
 jgg@ziepe.ca, christian.koenig@amd.com, ddutile@redhat.com,
 willy@infradead.org, daniel.vetter@ffwll.ch, jason@jlekstrand.net,
 dave.hansen@linux.intel.com, helgaas@kernel.org, dan.j.williams@intel.com,
 andrzej.jakowski@intel.com, dave.b.minturn@intel.com, jianxin.xiong@intel.com,
 ira.weiny@intel.com, robin.murphy@arm.com, martin.oliveira@eideticom.com,
 ckulkarnilinux@gmail.com, logang@deltatee.com, jhubbard@nvidia.com,
 jgg@nvidia.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH v4 08/23] dma-mapping: add flags to dma_map_ops to indicate
 PCI P2PDMA support
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Cc: Minturn Dave B <dave.b.minturn@intel.com>,
 Martin Oliveira <martin.oliveira@eideticom.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Ira Weiny <ira.weiny@intel.com>,
 John Hubbard <jhubbard@nvidia.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Robin Murphy <robin.murphy@arm.com>, Matthew Wilcox <willy@infradead.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Logan Gunthorpe <logang@deltatee.com>,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bjorn Helgaas <helgaas@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Stephen Bates <sbates@raithlin.com>,
 Jakowski Andrzej <andrzej.jakowski@intel.com>, Christoph Hellwig <hch@lst.de>,
 Xiong Jianxin <jianxin.xiong@intel.com>
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

Add a flags member to the dma_map_ops structure with one flag to
indicate support for PCI P2PDMA.

Also, add a helper to check if a device supports PCI P2PDMA.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 include/linux/dma-map-ops.h | 10 ++++++++++
 include/linux/dma-mapping.h |  5 +++++
 kernel/dma/mapping.c        | 18 ++++++++++++++++++
 3 files changed, 33 insertions(+)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 752f91e5eb5d..4d4161d58ce0 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -11,7 +11,17 @@
 
 struct cma;
 
+/*
+ * Values for struct dma_map_ops.flags:
+ *
+ * DMA_F_PCI_P2PDMA_SUPPORTED: Indicates the dma_map_ops implementation can
+ * handle PCI P2PDMA pages in the map_sg/unmap_sg operation.
+ */
+#define DMA_F_PCI_P2PDMA_SUPPORTED     (1 << 0)
+
 struct dma_map_ops {
+	unsigned int flags;
+
 	void *(*alloc)(struct device *dev, size_t size,
 			dma_addr_t *dma_handle, gfp_t gfp,
 			unsigned long attrs);
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index dca2b1355bb1..f7c61b2b4b5e 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -140,6 +140,7 @@ int dma_mmap_attrs(struct device *dev, struct vm_area_struct *vma,
 		unsigned long attrs);
 bool dma_can_mmap(struct device *dev);
 int dma_supported(struct device *dev, u64 mask);
+bool dma_pci_p2pdma_supported(struct device *dev);
 int dma_set_mask(struct device *dev, u64 mask);
 int dma_set_coherent_mask(struct device *dev, u64 mask);
 u64 dma_get_required_mask(struct device *dev);
@@ -250,6 +251,10 @@ static inline int dma_supported(struct device *dev, u64 mask)
 {
 	return 0;
 }
+static inline bool dma_pci_p2pdma_supported(struct device *dev)
+{
+	return false;
+}
 static inline int dma_set_mask(struct device *dev, u64 mask)
 {
 	return -EIO;
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index c056a1468189..74858326ef94 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -724,6 +724,24 @@ int dma_supported(struct device *dev, u64 mask)
 }
 EXPORT_SYMBOL(dma_supported);
 
+bool dma_pci_p2pdma_supported(struct device *dev)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+
+	/* if ops is not set, dma direct will be used which supports P2PDMA */
+	if (!ops)
+		return true;
+
+	/*
+	 * Note: dma_ops_bypass is not checked here because P2PDMA should
+	 * not be used with dma mapping ops that do not have support even
+	 * if the specific device is bypassing them.
+	 */
+
+	return ops->flags & DMA_F_PCI_P2PDMA_SUPPORTED;
+}
+EXPORT_SYMBOL_GPL(dma_pci_p2pdma_supported);
+
 #ifdef CONFIG_ARCH_HAS_DMA_SET_MASK
 void arch_dma_set_mask(struct device *dev, u64 mask);
 #else
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
