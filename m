Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A2AD7456
	for <lists.iommu@lfdr.de>; Tue, 15 Oct 2019 13:12:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9E184C75;
	Tue, 15 Oct 2019 11:12:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EB498C6F
	for <iommu@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 11:12:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
	[210.160.252.171])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 67FDC88E
	for <iommu@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 11:12:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,299,1566831600"; d="scan'208";a="29145957"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
	by relmlie5.idc.renesas.com with ESMTP; 15 Oct 2019 20:12:00 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 847F14208692;
	Tue, 15 Oct 2019 20:12:00 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: joro@8bytes.org
Subject: [PATCH v2 3/6] iommu/ipmmu-vmsa: Add helper functions for MMU
	"context" registers
Date: Tue, 15 Oct 2019 20:11:57 +0900
Message-Id: <1571137920-15314-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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

Since we will have changed memory mapping of the IPMMU in the future,
This patch adds helper functions ipmmu_ctx_{reg,read,write}()
for MMU "context" registers. No behavior change.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/iommu/ipmmu-vmsa.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 35aae24..c60b31d 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -190,29 +190,43 @@ static void ipmmu_write(struct ipmmu_vmsa_device *mmu, unsigned int offset,
 	iowrite32(data, mmu->base + offset);
 }
 
+static unsigned int ipmmu_ctx_reg(struct ipmmu_vmsa_device *mmu,
+				  unsigned int context_id, unsigned int reg)
+{
+	return context_id * IM_CTX_SIZE + reg;
+}
+
+static u32 ipmmu_ctx_read(struct ipmmu_vmsa_device *mmu,
+			  unsigned int context_id, unsigned int reg)
+{
+	return ipmmu_read(mmu, ipmmu_ctx_reg(mmu, context_id, reg));
+}
+
+static void ipmmu_ctx_write(struct ipmmu_vmsa_device *mmu,
+			    unsigned int context_id, unsigned int reg, u32 data)
+{
+	ipmmu_write(mmu, ipmmu_ctx_reg(mmu, context_id, reg), data);
+}
+
 static u32 ipmmu_ctx_read_root(struct ipmmu_vmsa_domain *domain,
 			       unsigned int reg)
 {
-	return ipmmu_read(domain->mmu->root,
-			  domain->context_id * IM_CTX_SIZE + reg);
+	return ipmmu_ctx_read(domain->mmu->root, domain->context_id, reg);
 }
 
 static void ipmmu_ctx_write_root(struct ipmmu_vmsa_domain *domain,
 				 unsigned int reg, u32 data)
 {
-	ipmmu_write(domain->mmu->root,
-		    domain->context_id * IM_CTX_SIZE + reg, data);
+	ipmmu_ctx_write(domain->mmu->root, domain->context_id, reg, data);
 }
 
 static void ipmmu_ctx_write_all(struct ipmmu_vmsa_domain *domain,
 				unsigned int reg, u32 data)
 {
 	if (domain->mmu != domain->mmu->root)
-		ipmmu_write(domain->mmu,
-			    domain->context_id * IM_CTX_SIZE + reg, data);
+		ipmmu_ctx_write(domain->mmu, domain->context_id, reg, data);
 
-	ipmmu_write(domain->mmu->root,
-		    domain->context_id * IM_CTX_SIZE + reg, data);
+	ipmmu_ctx_write(domain->mmu->root, domain->context_id, reg, data);
 }
 
 /* -----------------------------------------------------------------------------
@@ -911,7 +925,7 @@ static void ipmmu_device_reset(struct ipmmu_vmsa_device *mmu)
 
 	/* Disable all contexts. */
 	for (i = 0; i < mmu->num_ctx; ++i)
-		ipmmu_write(mmu, i * IM_CTX_SIZE + IMCTR, 0);
+		ipmmu_ctx_write(mmu, i, IMCTR, 0);
 }
 
 static const struct ipmmu_features ipmmu_features_default = {
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
