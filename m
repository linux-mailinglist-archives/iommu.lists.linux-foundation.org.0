Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2B226AB3E
	for <lists.iommu@lfdr.de>; Tue, 15 Sep 2020 19:55:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 09E33863F2;
	Tue, 15 Sep 2020 17:55:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C0SdvTUCHFkZ; Tue, 15 Sep 2020 17:55:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3B5B986672;
	Tue, 15 Sep 2020 17:55:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34928C0051;
	Tue, 15 Sep 2020 17:55:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45D4BC0051
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 17:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 414B986A78
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 17:55:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uL8myVMLxX5O for <iommu@lists.linux-foundation.org>;
 Tue, 15 Sep 2020 17:55:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id CF02386A6D
 for <iommu@lists.linux-foundation.org>; Tue, 15 Sep 2020 17:55:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.76,430,1592838000"; d="scan'208";a="57128563"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 16 Sep 2020 02:55:30 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2B3D6400753C;
 Wed, 16 Sep 2020 02:55:28 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Joerg Roedel <joro@8bytes.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] iommu: Kconfig: Update help description for IPMMU_VMSA
 config
Date: Tue, 15 Sep 2020 18:55:23 +0100
Message-Id: <20200915175523.1626-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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

ipmmu-vmsa driver is also used on Renesas RZ/G{1,2} Soc's, update the
description for the IPMMU_VMSA config symbol to reflect this.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2
* Updated commit description as suggested by Geert
* Included RB from Geert
---
 drivers/iommu/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index bef5d75e306b..d8f71bf31786 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -232,7 +232,7 @@ config IPMMU_VMSA
 	select ARM_DMA_USE_IOMMU
 	help
 	  Support for the Renesas VMSA-compatible IPMMU found in the R-Mobile
-	  APE6, R-Car Gen2, and R-Car Gen3 SoCs.
+	  APE6, R-Car Gen{2,3} and RZ/G{1,2} SoCs.
 
 	  If unsure, say N.
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
