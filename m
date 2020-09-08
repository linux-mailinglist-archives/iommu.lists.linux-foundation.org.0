Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FA02614E0
	for <lists.iommu@lfdr.de>; Tue,  8 Sep 2020 18:40:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7519E86CAC;
	Tue,  8 Sep 2020 16:40:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sDlUpvG5iz13; Tue,  8 Sep 2020 16:40:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DE7F886C88;
	Tue,  8 Sep 2020 16:40:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D771CC0052;
	Tue,  8 Sep 2020 16:40:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F520C0051
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 16:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3278A2E0FF
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 16:40:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id umM+z4hNeA-i for <iommu@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 16:40:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id E8D8E2C35C
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 16:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=M9/bxRR5TN4zu+8Vr7BPBwiOMWYowH/6FNnPnvmKqx4=; b=X7/i0B6Y8qEiQCwLtOELvqGaCC
 4eiAa0XDLysimZFySFSMf+jIzuqAlxPt1ylZKzA8jFdPLjJcAuhNBJLSE7gb6eNjJ6cR7K702Ba8F
 NVPUFSBLKqndOCowPSfs+Y3c+HhLidzmm1p25eXLlW2baJRvlByKsyTerDZc7+/UDLx6FbwGQsyi5
 c3+qOLEQQtdJ5TSP1bqzm9fTrCgUdSulpEbAQ0VeP52JQQyB68LtoB2E2yp+0JtWLQrshvkDRwG4f
 uahJ2EHlILwo85FLdmMVetukQ/dRW5YJuSVXjDJKdGYY68Tyty1FN1/pps5NTyuYOhL96REMI3llj
 s9a0+ShQ==;
Received: from [2001:4bb8:184:af1:3dc3:9c83:fc6c:e0f] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFgf4-0000rj-0i; Tue, 08 Sep 2020 16:40:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 1/2] dma-mapping: remove the dma_dummy_ops export
Date: Tue,  8 Sep 2020 18:39:58 +0200
Message-Id: <20200908163959.3177173-2-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200908163959.3177173-1-hch@lst.de>
References: <20200908163959.3177173-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Robin Murphy <robin.murphy@arm.com>
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

dma_dummy_ops is only used by the ACPI code, which can't be modular.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/dummy.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/dma/dummy.c b/kernel/dma/dummy.c
index 05607642c888d9..6974b1bd7d0b88 100644
--- a/kernel/dma/dummy.c
+++ b/kernel/dma/dummy.c
@@ -36,4 +36,3 @@ const struct dma_map_ops dma_dummy_ops = {
 	.map_sg                 = dma_dummy_map_sg,
 	.dma_supported          = dma_dummy_supported,
 };
-EXPORT_SYMBOL(dma_dummy_ops);
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
