Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4240D261552
	for <lists.iommu@lfdr.de>; Tue,  8 Sep 2020 18:48:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EE49A86CF9;
	Tue,  8 Sep 2020 16:48:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fywH+vse8nFY; Tue,  8 Sep 2020 16:48:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 794CD86D18;
	Tue,  8 Sep 2020 16:48:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64A4DC089E;
	Tue,  8 Sep 2020 16:48:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD626C0051
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 16:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A569B20352
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 16:48:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bnQdMrxzBG-V for <iommu@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 16:48:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id B95E522802
 for <iommu@lists.linux-foundation.org>; Tue,  8 Sep 2020 16:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=fgyJ4ZABWJZTj7EJc7LH/kSnQv89OxFbc7jSvV77U8I=; b=oFmX/3NSSOEZg6Vq7bQMcIBLUk
 JWXlC6td7jF2tESzThvQo06B/CWB4gLSJFO1NLu2AzaaJqTYZxJod3allRVzjZg4SAH0SCSMwp848
 k9OWRr6hR2F7La4bbgnTPiCDAglGjzDzt7eJNYX5AEoZxS3aEcZbkkpX7q08ykyc5/YiVeivQYBY+
 /Za4hFEcsoyTiP3Mt/TZ34Yxycs9q0b+K1WWimLplRJxvnG7c0pvdsLtvF4kFosPMUiDUDLCc+nAX
 BDEJlUpYmKIXCHeHxxnUJW2saEFjAhGWPaqucs9SfLKyCdH6BFAk7GIW0YSE9LDZB9jDhoup3Ahi3
 558Ztg1w==;
Received: from [2001:4bb8:184:af1:3dc3:9c83:fc6c:e0f] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFgmv-0001Sv-2X; Tue, 08 Sep 2020 16:48:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 iommu@lists.linux-foundation.org
Subject: [PATCH 08/12] dma-direct: use phys_to_dma_direct in dma_direct_alloc
Date: Tue,  8 Sep 2020 18:47:54 +0200
Message-Id: <20200908164758.3177341-9-hch@lst.de>
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

Replace the currently open code copy.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/direct.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 12e9f5f75dfe4b..57a6e7d7cf8f16 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -240,10 +240,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 			goto out_encrypt_pages;
 	}
 done:
-	if (force_dma_unencrypted(dev))
-		*dma_handle = __phys_to_dma(dev, page_to_phys(page));
-	else
-		*dma_handle = phys_to_dma(dev, page_to_phys(page));
+	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
 	return ret;
 
 out_encrypt_pages:
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
