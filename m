Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0F527F68C
	for <lists.iommu@lfdr.de>; Thu,  1 Oct 2020 02:13:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 42E5384496;
	Thu,  1 Oct 2020 00:13:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zq8QV95cwwmY; Thu,  1 Oct 2020 00:13:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 65EE88443E;
	Thu,  1 Oct 2020 00:13:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 516AAC0051;
	Thu,  1 Oct 2020 00:13:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87F83C016F
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 10:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 77A6484083
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 10:28:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id srk79CCalitP for <iommu@lists.linux-foundation.org>;
 Wed, 30 Sep 2020 10:28:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B9F1283742
 for <iommu@lists.linux-foundation.org>; Wed, 30 Sep 2020 10:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1601461707; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=N6zScjoElk/0srLgAKNsWnU8nZwt1zHmH6tZPRQ7bWI=;
 b=xrn918b6QUwV0Chrk0RERJfYJpld+15JXoCeobawiOBLshA//FWE0Bvic+Mbci2smNkCEY
 RsE0w0tk3D8LWoenvOQ8PX+TYXavZ+ODuW9pborHEiCHh3d67C9F90wlk9M0FTJR1viY2o
 ly+O+gQjnSuLmdrzXNGtRLmnwKz78H8=
From: Paul Cercueil <paul@crapouillou.net>
To: Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH] cma: decrease CMA_ALIGNMENT lower limit to 2
Date: Wed, 30 Sep 2020 12:28:21 +0200
Message-Id: <20200930102821.26421-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 01 Oct 2020 00:13:37 +0000
Cc: Paul Cercueil <paul@crapouillou.net>, iommu@lists.linux-foundation.org,
 od@zcrc.me, linux-kernel@vger.kernel.org
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

On an embedded system with a tiny (1 MiB) CMA area for video memory, and
a simple enough video pipeline, we can decrease the CMA_ALIGNMENT by a
factor of 2 to avoid wasting memory, as all the allocations for video
buffers will be of the exact same size (dictated by the size of the
screen).

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 kernel/dma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 847a9d1fa634..f15e782e19ca 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -162,7 +162,7 @@ endchoice
 
 config CMA_ALIGNMENT
 	int "Maximum PAGE_SIZE order of alignment for contiguous buffers"
-	range 4 12
+	range 2 12
 	default 8
 	help
 	  DMA mapping framework by default aligns all buffers to the smallest
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
