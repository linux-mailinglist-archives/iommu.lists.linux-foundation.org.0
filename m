Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA1C261557
	for <lists.iommu@lfdr.de>; Tue,  8 Sep 2020 18:48:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 836E38739E;
	Tue,  8 Sep 2020 16:48:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dA9FeHC-ugMY; Tue,  8 Sep 2020 16:48:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 313B28739A;
	Tue,  8 Sep 2020 16:48:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16143C0052;
	Tue,  8 Sep 2020 16:48:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1EDE0C0051
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 16:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0E3D285FED
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 16:48:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YAe4zdxtjTUN for <iommu@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 16:48:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7DE6885B6F
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 16:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=qqLaTPZucw5oDcARbFfOdxVBbFJKkf1DfCLZzjkn6K0=; b=QOaAUIFrVFFBjMiPtBwShGGSii
 AfLQaagJtB8aVjJw7OhF/Ht9ngdo/gAEWUZUrTiEDBn5xZqgk3w8MSBaImeDG9le0FkFftx+M/b88
 qssTqDexo3PO80Q3S7qztIKVdBmgkb/baXG9Av7oUJf/02ZCS2Lvw+L7VqIqAALTlNALU4Pfft2Ve
 RFt4zfGcQp9UNTeuOAC0r9EQciwD+CL2DHdEZsveYr5VD9UoSn+f2I21TZ19GLqfRy8JQCans4QVs
 v2wwDl1U6SNwJDAsoMj1LV5zwhr6oyQSFPXRATwoHHL5F0x1X/BjmCvsw2pOhy/FthSuwoOzN6uO9
 wc+KTwuA==;
Received: from [2001:4bb8:184:af1:3dc3:9c83:fc6c:e0f] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFgmq-0001Ry-1W; Tue, 08 Sep 2020 16:48:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 iommu@lists.linux-foundation.org
Subject: [PATCH 04/12] dma-mapping: fix DMA_OPS dependencies
Date: Tue,  8 Sep 2020 18:47:50 +0200
Message-Id: <20200908164758.3177341-5-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200908164758.3177341-1-hch@lst.de>
References: <20200908164758.3177341-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
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

Driver that select DMA_OPS need to depend on HAS_DMA support to
work.  The vop driver was missing that dependency, so add it, and also
add a nother depends in DMA_OPS itself.  That won't fix the issue due
to how the Kconfig dependencies work, but at least produce a warning
about unmet dependencies.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/misc/mic/Kconfig | 1 +
 kernel/dma/Kconfig       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/misc/mic/Kconfig b/drivers/misc/mic/Kconfig
index b9bb086785db48..8a7c2c5711d5f4 100644
--- a/drivers/misc/mic/Kconfig
+++ b/drivers/misc/mic/Kconfig
@@ -35,6 +35,7 @@ config SCIF_BUS
 
 config VOP_BUS
 	tristate "VOP Bus Driver"
+	depends on HAS_DMA
 	select DMA_OPS
 	help
 	  This option is selected by any driver which registers a
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 0ddfb5510fe45f..e7b801649f6574 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -9,6 +9,7 @@ config HAS_DMA
 	default y
 
 config DMA_OPS
+	depends on HAS_DMA
 	bool
 
 #
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
