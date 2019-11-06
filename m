Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A908FF0C20
	for <lists.iommu@lfdr.de>; Wed,  6 Nov 2019 03:36:11 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 832B3E4F;
	Wed,  6 Nov 2019 02:35:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8D7EEE3B
	for <iommu@lists.linux-foundation.org>;
	Wed,  6 Nov 2019 02:35:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
	[210.160.252.171])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id CC2D98A9
	for <iommu@lists.linux-foundation.org>;
	Wed,  6 Nov 2019 02:35:53 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,272,1569250800"; d="scan'208";a="30937063"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
	by relmlie5.idc.renesas.com with ESMTP; 06 Nov 2019 11:35:50 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id A80CD4181863;
	Wed,  6 Nov 2019 11:35:50 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: joro@8bytes.org
Subject: [PATCH v3 5/6] iommu/ipmmu-vmsa: Add helper functions for "uTLB"
	registers
Date: Wed,  6 Nov 2019 11:35:49 +0900
Message-Id: <1573007750-16611-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573007750-16611-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1573007750-16611-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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

Since we will have changed memory mapping of the IPMMU in the future,
This patch adds helper functions ipmmu_utlb_reg() and
ipmmu_imu{asid,ctr}_write() for "uTLB" registers. No behavior change.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/iommu/ipmmu-vmsa.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 8e2ca1c..82da486 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -230,6 +230,23 @@ static void ipmmu_ctx_write_all(struct ipmmu_vmsa_domain *domain,
 	ipmmu_ctx_write(domain->mmu->root, domain->context_id, reg, data);
 }
 
+static u32 ipmmu_utlb_reg(struct ipmmu_vmsa_device *mmu, unsigned int reg)
+{
+	return reg;
+}
+
+static void ipmmu_imuasid_write(struct ipmmu_vmsa_device *mmu,
+				unsigned int utlb, u32 data)
+{
+	ipmmu_write(mmu, ipmmu_utlb_reg(mmu, IMUASID(utlb)), data);
+}
+
+static void ipmmu_imuctr_write(struct ipmmu_vmsa_device *mmu,
+			       unsigned int utlb, u32 data)
+{
+	ipmmu_write(mmu, ipmmu_utlb_reg(mmu, IMUCTR(utlb)), data);
+}
+
 /* -----------------------------------------------------------------------------
  * TLB and microTLB Management
  */
@@ -275,11 +292,10 @@ static void ipmmu_utlb_enable(struct ipmmu_vmsa_domain *domain,
 	 */
 
 	/* TODO: What should we set the ASID to ? */
-	ipmmu_write(mmu, IMUASID(utlb), 0);
+	ipmmu_imuasid_write(mmu, utlb, 0);
 	/* TODO: Do we need to flush the microTLB ? */
-	ipmmu_write(mmu, IMUCTR(utlb),
-		    IMUCTR_TTSEL_MMU(domain->context_id) | IMUCTR_FLUSH |
-		    IMUCTR_MMUEN);
+	ipmmu_imuctr_write(mmu, utlb, IMUCTR_TTSEL_MMU(domain->context_id) |
+				      IMUCTR_FLUSH | IMUCTR_MMUEN);
 	mmu->utlb_ctx[utlb] = domain->context_id;
 }
 
@@ -291,7 +307,7 @@ static void ipmmu_utlb_disable(struct ipmmu_vmsa_domain *domain,
 {
 	struct ipmmu_vmsa_device *mmu = domain->mmu;
 
-	ipmmu_write(mmu, IMUCTR(utlb), 0);
+	ipmmu_imuctr_write(mmu, utlb, 0);
 	mmu->utlb_ctx[utlb] = IPMMU_CTX_INVALID;
 }
 
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
