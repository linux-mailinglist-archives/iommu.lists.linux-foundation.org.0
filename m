Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE9C1D3035
	for <lists.iommu@lfdr.de>; Thu, 14 May 2020 14:46:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 60034888D4;
	Thu, 14 May 2020 12:46:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cV3kN2pJwbZC; Thu, 14 May 2020 12:46:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 63E0988900;
	Thu, 14 May 2020 12:46:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5115EC0890;
	Thu, 14 May 2020 12:46:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3D55C0178
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 12:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AE8FB89575
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 12:46:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G1ENWX4FphMK for <iommu@lists.linux-foundation.org>;
 Thu, 14 May 2020 12:46:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3BAF78955A
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 12:46:25 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id AD2E5273; Thu, 14 May 2020 14:46:22 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 2/2] iommu/sun50i: Use __GFP_ZERO instead of memset()
Date: Thu, 14 May 2020 14:46:21 +0200
Message-Id: <20200514124621.25999-2-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200514124621.25999-1-joro@8bytes.org>
References: <20200514124621.25999-1-joro@8bytes.org>
Cc: jroedel@suse.de, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, linux-arm-kernel@lists.infradead.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

From: Joerg Roedel <jroedel@suse.de>

Allocate zeroed memory so there is no need to memset it to 0 in the
driver.

Cc: Maxime Ripard <maxime@cerno.tech>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/sun50i-iommu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index a52f52eff7c8..9c763d4a8e2a 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -616,11 +616,10 @@ static struct iommu_domain *sun50i_iommu_domain_alloc(unsigned type)
 	    iommu_get_dma_cookie(&sun50i_domain->domain))
 		goto err_free_domain;
 
-	sun50i_domain->dt = (u32 *)__get_free_pages(GFP_KERNEL,
+	sun50i_domain->dt = (u32 *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
 						    get_order(DT_SIZE));
 	if (!sun50i_domain->dt)
 		goto err_put_cookie;
-	memset(sun50i_domain->dt, 0, DT_SIZE);
 
 	refcount_set(&sun50i_domain->refcnt, 1);
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
