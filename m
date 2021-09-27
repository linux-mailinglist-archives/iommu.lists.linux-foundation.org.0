Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D0460419405
	for <lists.iommu@lfdr.de>; Mon, 27 Sep 2021 14:19:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D6AF401D6;
	Mon, 27 Sep 2021 12:19:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uegCHYeWtDcG; Mon, 27 Sep 2021 12:19:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6DBE74048F;
	Mon, 27 Sep 2021 12:19:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20EB8C0022;
	Mon, 27 Sep 2021 12:19:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A478C000D
 for <iommu@lists.linux-foundation.org>; Mon, 27 Sep 2021 12:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FAFF801DD
 for <iommu@lists.linux-foundation.org>; Mon, 27 Sep 2021 12:19:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1XgJ1g1NggsC for <iommu@lists.linux-foundation.org>;
 Mon, 27 Sep 2021 12:19:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3BCC81846
 for <iommu@lists.linux-foundation.org>; Mon, 27 Sep 2021 12:19:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C105F6103B;
 Mon, 27 Sep 2021 12:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632745142;
 bh=F9/Tr9COtm4Stj4bhDIokvzMkSf99FLpUsv9Um0t5FI=;
 h=From:To:Cc:Subject:Date:From;
 b=iQ1cVnEtOm5m5/2kAdPUnsn+F/m6UMiVUTNVuuJVHQzqfCTB37Wh92MSJMucsKtLS
 hE6EEfH26Y7f55flpw2XxZbTXZOaSqx5aWlljUGX/puBub5sCl6FwV6KHrALTMS0fj
 fXJcasgF8W/8SdTAezOjWsJAoAYktTuihAPRjRFtFdXLoXXkfgGk3Sgu1u/jaHthW5
 2L+vEP9AaPWCp8njdVAzDZLerxAtaI/Cv5lOJ4OTkc1gIyZiiuNgwrdLQCd4QP6O89
 3HeumoPYO5S/iEZyMKOr9XjdjDictDEY86eIyVDUKsZ2B+AZKZPoYfjJRhaeLjgBbJ
 5JrGQXrIaY2Fg==
From: Arnd Bergmann <arnd@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] iommu/mediatek: fix out-of-range warning with clang
Date: Mon, 27 Sep 2021 14:18:44 +0200
Message-Id: <20210927121857.941160-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Cc: Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
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

From: Arnd Bergmann <arnd@arndb.de>

clang-14 notices that a comparison is never true when
CONFIG_PHYS_ADDR_T_64BIT is disabled:

drivers/iommu/mtk_iommu.c:553:34: error: result of comparison of constant 5368709120 with expression of type 'phys_addr_t' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
        if (dom->data->enable_4GB && pa >= MTK_IOMMU_4GB_MODE_REMAP_BASE)
                                     ~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Add an explicit check for the type of the variable to skip the check
and the warning in that case.

Fixes: b4dad40e4f35 ("iommu/mediatek: Adjust the PA for the 4GB Mode")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/iommu/mtk_iommu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index d837adfd1da5..25b834104790 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -550,7 +550,9 @@ static phys_addr_t mtk_iommu_iova_to_phys(struct iommu_domain *domain,
 	phys_addr_t pa;
 
 	pa = dom->iop->iova_to_phys(dom->iop, iova);
-	if (dom->data->enable_4GB && pa >= MTK_IOMMU_4GB_MODE_REMAP_BASE)
+	if (IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT) &&
+	    dom->data->enable_4GB &&
+	    pa >= MTK_IOMMU_4GB_MODE_REMAP_BASE)
 		pa &= ~BIT_ULL(32);
 
 	return pa;
-- 
2.29.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
