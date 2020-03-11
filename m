Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D48BF181D2E
	for <lists.iommu@lfdr.de>; Wed, 11 Mar 2020 17:07:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3A103203C9;
	Wed, 11 Mar 2020 16:07:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BayODldWZe+k; Wed, 11 Mar 2020 16:07:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 3B89D20C41;
	Wed, 11 Mar 2020 16:07:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22ADDC0177;
	Wed, 11 Mar 2020 16:07:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A244BC0177
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 16:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9005487FA1
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 16:07:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BfRqIoLH2jww for <iommu@lists.linux-foundation.org>;
 Wed, 11 Mar 2020 16:07:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 193E9876CF
 for <iommu@lists.linux-foundation.org>; Wed, 11 Mar 2020 16:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=65ZSUL0dKbJAKyYRgWo0UNHaxeezpoOi3//F5OsJs7c=; b=UbTco4Xe3oMNx9xr0T5vn+uY88
 x/iyP5VlO01hiwneGgA0fNHl46oBY5s5eADKJSkTOmQMTtX6dLw4Z53zeNbxRFohTiiEMwiNyU0G/
 kJ8J6Xndp2mmejZF8Br1cTlT8456Hfpl+iTQuvCalLFF6lUivG6DEGdcdxyQYGGXemnfCTgnZWFMV
 Pk3aPv9bVVxUKJ+fvSpzJIMSzhjqu+kVqEHiNxzzr4qv5Vvp1ogCUnOvEerqVXmU+gIJwadhTG1h3
 mCMbAmY7CJ8eoEiiRDOC76bchnN9+xqqtYHcTosy0YgffOBSTwWyQLJXi3yrlL4/A2DLK3M/Qo8ti
 sj7aKUcw==;
Received: from [2001:4bb8:184:5cad:8026:d98c:a056:3e33] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC3t5-0007VI-CA; Wed, 11 Mar 2020 16:07:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: torvalds@linux-foundation.org,
	gregkh@linuxfoundation.org
Subject: [PATCH] device core: fix dma_mask handling in
 platform_device_register_full
Date: Wed, 11 Mar 2020 17:07:10 +0100
Message-Id: <20200311160710.376090-1-hch@lst.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: aros@gmx.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org
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

Ever since the generic platform device code started allocating DMA masks
itself the code to allocate and leak a private DMA mask in
platform_device_register_full has been superflous.  More so the fact that
it unconditionally frees the DMA mask allocation in the failure path
can lead to slab corruption if the function fails later on for a device
where it didn't allocate the mask.  Just remove the offending code.

Fixes: cdfee5623290 ("driver core: initialize a default DMA mask for platform device")
Reported-by: Artem S. Tashkinov <aros@gmx.com>
Tested-by: Artem S. Tashkinov <aros@gmx.com>
---
 drivers/base/platform.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 7fa654f1288b..47d3e6187a1c 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -662,19 +662,6 @@ struct platform_device *platform_device_register_full(
 	pdev->dev.of_node_reused = pdevinfo->of_node_reused;
 
 	if (pdevinfo->dma_mask) {
-		/*
-		 * This memory isn't freed when the device is put,
-		 * I don't have a nice idea for that though.  Conceptually
-		 * dma_mask in struct device should not be a pointer.
-		 * See http://thread.gmane.org/gmane.linux.kernel.pci/9081
-		 */
-		pdev->dev.dma_mask =
-			kmalloc(sizeof(*pdev->dev.dma_mask), GFP_KERNEL);
-		if (!pdev->dev.dma_mask)
-			goto err;
-
-		kmemleak_ignore(pdev->dev.dma_mask);
-
 		*pdev->dev.dma_mask = pdevinfo->dma_mask;
 		pdev->dev.coherent_dma_mask = pdevinfo->dma_mask;
 	}
@@ -700,7 +687,6 @@ struct platform_device *platform_device_register_full(
 	if (ret) {
 err:
 		ACPI_COMPANION_SET(&pdev->dev, NULL);
-		kfree(pdev->dev.dma_mask);
 		platform_device_put(pdev);
 		return ERR_PTR(ret);
 	}
-- 
2.24.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
