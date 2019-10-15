Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A61D7452
	for <lists.iommu@lfdr.de>; Tue, 15 Oct 2019 13:12:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4F289B7D;
	Tue, 15 Oct 2019 11:12:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 97219B7D
	for <iommu@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 11:12:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
	[210.160.252.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id F26966D6
	for <iommu@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 11:12:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,299,1566831600"; d="scan'208";a="28928925"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
	by relmlie6.idc.renesas.com with ESMTP; 15 Oct 2019 20:12:00 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 78AC4420786F;
	Tue, 15 Oct 2019 20:12:00 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: joro@8bytes.org
Subject: [PATCH v2 2/6] iommu/ipmmu-vmsa: tidyup register definitions
Date: Tue, 15 Oct 2019 20:11:56 +0900
Message-Id: <1571137920-15314-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571137920-15314-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1571137920-15314-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-renesas-soc@vger.kernel.org, iommu@lists.linux-foundation.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

To support different registers memory mapping hardware easily
in the future, this patch tidies up the register definitions
as below:
 - Add comments to state to which SoCs or SoC families they apply
 - Add categories about MMU "context" and uTLB registers

No change behavior.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/iommu/ipmmu-vmsa.c | 58 ++++++++++++++++++++++++----------------------
 1 file changed, 30 insertions(+), 28 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 89d2a5f..35aae24 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -101,47 +101,49 @@ static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
 
 #define IM_CTX_SIZE			0x40
 
-#define IMCTR				0x0000
-#define IMCTR_INTEN			(1 << 2)
-#define IMCTR_FLUSH			(1 << 1)
-#define IMCTR_MMUEN			(1 << 0)
-
-#define IMTTBCR				0x0008
-#define IMTTBCR_EAE			(1 << 31)
+/* MMU "context" registers */
+#define IMCTR				0x0000		/* R-Car Gen2/3 */
+#define IMCTR_INTEN			(1 << 2)	/* R-Car Gen2/3 */
+#define IMCTR_FLUSH			(1 << 1)	/* R-Car Gen2/3 */
+#define IMCTR_MMUEN			(1 << 0)	/* R-Car Gen2/3 */
+
+#define IMTTBCR				0x0008		/* R-Car Gen2/3 */
+#define IMTTBCR_EAE			(1 << 31)	/* R-Car Gen2/3 */
 #define IMTTBCR_SH0_INNER_SHAREABLE	(3 << 12)	/* R-Car Gen2 only */
 #define IMTTBCR_ORGN0_WB_WA		(1 << 10)	/* R-Car Gen2 only */
 #define IMTTBCR_IRGN0_WB_WA		(1 << 8)	/* R-Car Gen2 only */
 #define IMTTBCR_SL0_TWOBIT_LVL_1	(2 << 6)	/* R-Car Gen3 only */
-#define IMTTBCR_SL0_LVL_1		(1 << 4)
+#define IMTTBCR_SL0_LVL_1		(1 << 4)	/* R-Car Gen2 only */
 
-#define IMBUSCR				0x000c
-#define IMBUSCR_DVM			(1 << 2)
-#define IMBUSCR_BUSSEL_MASK		(3 << 0)
+#define IMBUSCR				0x000c		/* R-Car Gen2 only */
+#define IMBUSCR_DVM			(1 << 2)	/* R-Car Gen2 only */
+#define IMBUSCR_BUSSEL_MASK		(3 << 0)	/* R-Car Gen2 only */
 
-#define IMTTLBR0			0x0010
-#define IMTTUBR0			0x0014
+#define IMTTLBR0			0x0010		/* R-Car Gen2/3 */
+#define IMTTUBR0			0x0014		/* R-Car Gen2/3 */
 
-#define IMSTR				0x0020
-#define IMSTR_MHIT			(1 << 4)
-#define IMSTR_ABORT			(1 << 2)
-#define IMSTR_PF			(1 << 1)
-#define IMSTR_TF			(1 << 0)
+#define IMSTR				0x0020		/* R-Car Gen2/3 */
+#define IMSTR_MHIT			(1 << 4)	/* R-Car Gen2/3 */
+#define IMSTR_ABORT			(1 << 2)	/* R-Car Gen2/3 */
+#define IMSTR_PF			(1 << 1)	/* R-Car Gen2/3 */
+#define IMSTR_TF			(1 << 0)	/* R-Car Gen2/3 */
 
-#define IMMAIR0				0x0028
+#define IMMAIR0				0x0028		/* R-Car Gen2/3 */
 
-#define IMELAR				0x0030	/* IMEAR on R-Car Gen2 */
-#define IMEUAR				0x0034	/* R-Car Gen3 only */
+#define IMELAR				0x0030		/* R-Car Gen2/3, IMEAR on R-Car Gen2 */
+#define IMEUAR				0x0034		/* R-Car Gen3 only */
 
+/* uTLB registers */
 #define IMUCTR(n)			((n) < 32 ? IMUCTR0(n) : IMUCTR32(n))
-#define IMUCTR0(n)			(0x0300 + ((n) * 16))
-#define IMUCTR32(n)			(0x0600 + (((n) - 32) * 16))
-#define IMUCTR_TTSEL_MMU(n)		((n) << 4)
-#define IMUCTR_FLUSH			(1 << 1)
-#define IMUCTR_MMUEN			(1 << 0)
+#define IMUCTR0(n)			(0x0300 + ((n) * 16))		/* R-Car Gen2/3 */
+#define IMUCTR32(n)			(0x0600 + (((n) - 32) * 16))	/* R-Car Gen3 only */
+#define IMUCTR_TTSEL_MMU(n)		((n) << 4)	/* R-Car Gen2/3 */
+#define IMUCTR_FLUSH			(1 << 1)	/* R-Car Gen2/3 */
+#define IMUCTR_MMUEN			(1 << 0)	/* R-Car Gen2/3 */
 
 #define IMUASID(n)			((n) < 32 ? IMUASID0(n) : IMUASID32(n))
-#define IMUASID0(n)			(0x0308 + ((n) * 16))
-#define IMUASID32(n)			(0x0608 + (((n) - 32) * 16))
+#define IMUASID0(n)			(0x0308 + ((n) * 16))		/* R-Car Gen2/3 */
+#define IMUASID32(n)			(0x0608 + (((n) - 32) * 16))	/* R-Car Gen3 only */
 
 /* -----------------------------------------------------------------------------
  * Root device handling
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
