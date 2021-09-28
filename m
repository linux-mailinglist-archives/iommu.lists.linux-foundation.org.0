Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEAD41BA19
	for <lists.iommu@lfdr.de>; Wed, 29 Sep 2021 00:18:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39A784040E;
	Tue, 28 Sep 2021 22:18:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pb9EdRkcjkZR; Tue, 28 Sep 2021 22:18:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 972CF40306;
	Tue, 28 Sep 2021 22:18:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E217C000D;
	Tue, 28 Sep 2021 22:18:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ED2FFC000D
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 22:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C917840108
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 22:18:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jo5LpN7YGzo7 for <iommu@lists.linux-foundation.org>;
 Tue, 28 Sep 2021 22:18:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0BCEB40609
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 22:18:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3652A6134F;
 Tue, 28 Sep 2021 22:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632867506;
 bh=5J0hY9xgoHquzGvQlOV+Av63MmjnlOGF9TMY09r5wos=;
 h=Date:From:To:Cc:Subject:From;
 b=jSwtgiY9ALwoZuiz/OECPEXHzc3u6igBwRmJzenKUw1kaa1Ghok+oOPeCejks9fQ0
 6nGlXJeQAFn9u8GBzntySvne7RNmGNi1/2kJbUK3++P2QTE6f7qWlVur/j/xFnSMLW
 WsABrnrouI3JaFKfJxgywqFsf0indPGsf97gis4e+0k6zkhUPgt6Ztc7o6bl4p9EEg
 k/cZWSKsQFZetYLscriMHKS4t2K820opsTd8dQMCEsh7klKZF5tfFqx7bwKVDosRI8
 YWJ2x6kxWxSkJXqPpth/4xuuUt4uZ5OzQGYTvtUcrK97JlJ93cUo3UDgpr6rumRvma
 vz+2QVCq8esHg==
Date: Tue, 28 Sep 2021 17:22:29 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Subject: [PATCH][next] iommu/dma: Use kvcalloc() instead of kvzalloc()
Message-ID: <20210928222229.GA280355@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
Cc: iommu@lists.linux-foundation.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>
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

Use 2-factor argument form kvcalloc() instead of kvzalloc().

Link: https://github.com/KSPP/linux/issues/162
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/iommu/dma-iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 896bea04c347..18c6edbe5fbf 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -616,7 +616,7 @@ static struct page **__iommu_dma_alloc_pages(struct device *dev,
 	if (!order_mask)
 		return NULL;
 
-	pages = kvzalloc(count * sizeof(*pages), GFP_KERNEL);
+	pages = kvcalloc(count, sizeof(*pages), GFP_KERNEL);
 	if (!pages)
 		return NULL;
 
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
