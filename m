Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 374C7360C19
	for <lists.iommu@lfdr.de>; Thu, 15 Apr 2021 16:44:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B33B0414D8;
	Thu, 15 Apr 2021 14:44:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XYAiUwKMOQsX; Thu, 15 Apr 2021 14:44:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA31440FAF;
	Thu, 15 Apr 2021 14:44:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86EEBC0014;
	Thu, 15 Apr 2021 14:44:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54B01C000C
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 14:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 810A583E9A
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 14:44:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LfHZAf6yx-oJ for <iommu@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 14:44:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B518784698
 for <iommu@lists.linux-foundation.org>; Thu, 15 Apr 2021 14:44:47 +0000 (UTC)
Received: from lemmy.home.8bytes.org (p549adcf6.dip0.t-ipconnect.de
 [84.154.220.246])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by theia.8bytes.org (Postfix) with ESMTPSA id 5EB9415C;
 Thu, 15 Apr 2021 16:44:45 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH] iommu/fsl-pamu: Fix uninitialized variable warning
Date: Thu, 15 Apr 2021 16:44:42 +0200
Message-Id: <20210415144442.25103-1-joro@8bytes.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Cc: Joerg Roedel <jroedel@suse.de>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
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

From: Joerg Roedel <jroedel@suse.de>

The variable 'i' in the function update_liodn_stash() is not
initialized and only used in a debug printk(). So it has no
meaning at all, remove it.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/fsl_pamu_domain.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index 32944d67baa4..0ac781186dbd 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -57,14 +57,13 @@ static int __init iommu_init_mempool(void)
 static int update_liodn_stash(int liodn, struct fsl_dma_domain *dma_domain,
 			      u32 val)
 {
-	int ret = 0, i;
+	int ret = 0;
 	unsigned long flags;
 
 	spin_lock_irqsave(&iommu_lock, flags);
 	ret = pamu_update_paace_stash(liodn, val);
 	if (ret) {
-		pr_debug("Failed to update SPAACE %d field for liodn %d\n ",
-			 i, liodn);
+		pr_debug("Failed to update SPAACE for liodn %d\n ", liodn);
 		spin_unlock_irqrestore(&iommu_lock, flags);
 		return ret;
 	}
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
