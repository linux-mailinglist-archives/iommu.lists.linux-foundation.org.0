Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD3C3B8CA8
	for <lists.iommu@lfdr.de>; Thu,  1 Jul 2021 05:31:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64BFE402CF;
	Thu,  1 Jul 2021 03:31:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7fa0c0K4MVQW; Thu,  1 Jul 2021 03:31:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5D29640277;
	Thu,  1 Jul 2021 03:31:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2FB50C000E;
	Thu,  1 Jul 2021 03:31:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4DC3DC000E
 for <iommu@lists.linux-foundation.org>; Thu,  1 Jul 2021 03:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26597415C6
 for <iommu@lists.linux-foundation.org>; Thu,  1 Jul 2021 03:31:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=chromium.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XH7HwoxC2q2s for <iommu@lists.linux-foundation.org>;
 Thu,  1 Jul 2021 03:31:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B5877415C5
 for <iommu@lists.linux-foundation.org>; Thu,  1 Jul 2021 03:31:37 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 p17-20020a17090b0111b02901723ab8d11fso3083736pjz.1
 for <iommu@lists.linux-foundation.org>; Wed, 30 Jun 2021 20:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=msZY6pO+uLvRbTqbuVyF3DQrdahNkZ8jVvJDp5dVU3s=;
 b=DYKvQ6hZpOoZDvD8UDMBrBXvj+pxsgmW3L8DgiIrg3yjTPzheEaj2URbWltPbYnlhF
 cMbju10ohY2XQOMER+ugw4oHnlLdwvVG1Ow1DrqtNOgJgfu4ogeqLcklLzYVttd179wQ
 VUzghQin/AzmkWCJde+c8VruTozdzCzrHQC8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=msZY6pO+uLvRbTqbuVyF3DQrdahNkZ8jVvJDp5dVU3s=;
 b=CeXiKwAjhtiPx/IL1oNfDIuyw1DvDtkL5+bb4mt+Cf1AUlCFsC+u6D6RX+LO9/GMxN
 7BAXj4cob7q4LsHR3XG8MThjSALUEXVC9pTxUl+Hg3KFUzxOeakmlHZBP0NyxvS7F7VF
 A+HVRRmU6G4cP7Tq+w3Jo6w773mGerQA/L2shPZ4lhxGqq07aPI7CG6wEjGTMUkLUNGD
 FMHiX6y1fcVLNDzzx+GErhKMKhCQCHFzSVYqwIaATkvN7rqCR8yhU6z0zKuljZpooxp7
 o5j0xQeILH6E6zHUa5HasHN5zNShE8KHPfLZWkltFkfyKoazlLRJ84SjRplalrpfmTA6
 BI7A==
X-Gm-Message-State: AOAM533JfpWmU7P3DANkNaNmyXgkq9OB4fogb0L2qIrybLtoaeM8l9H/
 1z7F0f3lnFx4ShgiRYr1WeI3Sw==
X-Google-Smtp-Source: ABdhPJyanoqZrCB0SBzIK5zDm2qE63p7f/l1im/uldvXoZUM091XEExr7njiU/Wrt3I965MfX2PXvw==
X-Received: by 2002:a17:902:8484:b029:101:7016:fb7b with SMTP id
 c4-20020a1709028484b02901017016fb7bmr34305896plo.23.1625110297157; 
 Wed, 30 Jun 2021 20:31:37 -0700 (PDT)
Received: from localhost ([2401:fa00:95:205:9ab6:fd5:daf0:6742])
 by smtp.gmail.com with UTF8SMTPSA id y7sm24143599pfy.153.2021.06.30.20.31.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 20:31:36 -0700 (PDT)
From: Claire Chang <tientzu@chromium.org>
To: konrad.wilk@oracle.com, hch@lst.de, m.szyprowski@samsung.com,
 robin.murphy@arm.com, Will Deacon <will@kernel.org>, sstabellini@kernel.org
Subject: [PATCH v4] swiotlb: fix implicit debugfs declarations
Date: Thu,  1 Jul 2021 11:31:30 +0800
Message-Id: <20210701033130.82308-1-tientzu@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
Cc: Nicolas Boichat <drinkcat@chromium.org>, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Claire Chang <tientzu@chromium.org>
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

Factor out the debugfs bits from rmem_swiotlb_device_init() into a separate
rmem_swiotlb_debugfs_init() to fix the implicit debugfs declarations.

Fixes: 461021875c50 ("swiotlb: Add restricted DMA pool initialization")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Claire Chang <tientzu@chromium.org>
---
 kernel/dma/swiotlb.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 0ffbaae9fba2..b7f76bca89bf 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -712,6 +712,21 @@ late_initcall(swiotlb_create_default_debugfs);
 #endif
 
 #ifdef CONFIG_DMA_RESTRICTED_POOL
+
+#ifdef CONFIG_DEBUG_FS
+static void rmem_swiotlb_debugfs_init(struct reserved_mem *rmem)
+{
+	struct io_tlb_mem *mem = rmem->priv;
+
+	mem->debugfs = debugfs_create_dir(rmem->name, debugfs_dir);
+	swiotlb_create_debugfs_files(mem);
+}
+#else
+static void rmem_swiotlb_debugfs_init(struct reserved_mem *rmem)
+{
+}
+#endif
+
 struct page *swiotlb_alloc(struct device *dev, size_t size)
 {
 	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
@@ -766,11 +781,7 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 
 		rmem->priv = mem;
 
-		if (IS_ENABLED(CONFIG_DEBUG_FS)) {
-			mem->debugfs =
-				debugfs_create_dir(rmem->name, debugfs_dir);
-			swiotlb_create_debugfs_files(mem);
-		}
+		rmem_swiotlb_debugfs_init(rmem);
 	}
 
 	dev->dma_io_tlb_mem = mem;
-- 
2.32.0.93.g670b81a890-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
