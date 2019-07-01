Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CB92B3A2
	for <lists.iommu@lfdr.de>; Mon, 27 May 2019 13:53:40 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 48BE81847;
	Mon, 27 May 2019 11:53:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EEA3F1824
	for <iommu@lists.linux-foundation.org>;
	Mon, 27 May 2019 11:53:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4E05D879
	for <iommu@lists.linux-foundation.org>;
	Mon, 27 May 2019 11:53:01 +0000 (UTC)
Received: from ramsan ([84.194.111.163]) by laurent.telenet-ops.be with bizsmtp
	id HPsy2000T3XaVaC01PsyfV; Mon, 27 May 2019 13:52:59 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1hVEBW-0001O4-E6; Mon, 27 May 2019 13:52:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1hVEBW-0000aq-D8; Mon, 27 May 2019 13:52:58 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Joerg Roedel <joro@8bytes.org>,
	Magnus Damm <damm+renesas@opensource.se>
Subject: [PATCH v4 2/6] iommu/ipmmu-vmsa: Prepare to handle 40-bit error
	addresses
Date: Mon, 27 May 2019 13:52:49 +0200
Message-Id: <20190527115253.2114-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190527115253.2114-1-geert+renesas@glider.be>
References: <20190527115253.2114-1-geert+renesas@glider.be>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-renesas-soc@vger.kernel.org, iommu@lists.linux-foundation.org,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>
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

On R-Car Gen3, the faulting virtual address is a 40-bit address, and
comprised of two registers.  Read the upper address part, and combine
both parts, when running on a 64-bit system.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
Apart from this, the driver doesn't support 40-bit IOVA addresses yet.

v4:
  - Add Reviewed-by, Tested-by,

v3:
  - Add Reviewed-by,

v2:
  - Merge IMEAR/IMELAR.
---
 drivers/iommu/ipmmu-vmsa.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 9f2b781e20a0eba6..f2061bd1dc7b8852 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -186,7 +186,8 @@ static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
 #define IMMAIR_ATTR_IDX_WBRWA		1
 #define IMMAIR_ATTR_IDX_DEV		2
 
-#define IMEAR				0x0030
+#define IMELAR				0x0030	/* IMEAR on R-Car Gen2 */
+#define IMEUAR				0x0034	/* R-Car Gen3 only */
 
 #define IMPCTR				0x0200
 #define IMPSTR				0x0208
@@ -522,14 +523,16 @@ static irqreturn_t ipmmu_domain_irq(struct ipmmu_vmsa_domain *domain)
 {
 	const u32 err_mask = IMSTR_MHIT | IMSTR_ABORT | IMSTR_PF | IMSTR_TF;
 	struct ipmmu_vmsa_device *mmu = domain->mmu;
+	unsigned long iova;
 	u32 status;
-	u32 iova;
 
 	status = ipmmu_ctx_read_root(domain, IMSTR);
 	if (!(status & err_mask))
 		return IRQ_NONE;
 
-	iova = ipmmu_ctx_read_root(domain, IMEAR);
+	iova = ipmmu_ctx_read_root(domain, IMELAR);
+	if (IS_ENABLED(CONFIG_64BIT))
+		iova |= (u64)ipmmu_ctx_read_root(domain, IMEUAR) << 32;
 
 	/*
 	 * Clear the error status flags. Unlike traditional interrupt flag
@@ -541,10 +544,10 @@ static irqreturn_t ipmmu_domain_irq(struct ipmmu_vmsa_domain *domain)
 
 	/* Log fatal errors. */
 	if (status & IMSTR_MHIT)
-		dev_err_ratelimited(mmu->dev, "Multiple TLB hits @0x%08x\n",
+		dev_err_ratelimited(mmu->dev, "Multiple TLB hits @0x%lx\n",
 				    iova);
 	if (status & IMSTR_ABORT)
-		dev_err_ratelimited(mmu->dev, "Page Table Walk Abort @0x%08x\n",
+		dev_err_ratelimited(mmu->dev, "Page Table Walk Abort @0x%lx\n",
 				    iova);
 
 	if (!(status & (IMSTR_PF | IMSTR_TF)))
@@ -560,7 +563,7 @@ static irqreturn_t ipmmu_domain_irq(struct ipmmu_vmsa_domain *domain)
 		return IRQ_HANDLED;
 
 	dev_err_ratelimited(mmu->dev,
-			    "Unhandled fault: status 0x%08x iova 0x%08x\n",
+			    "Unhandled fault: status 0x%08x iova 0x%lx\n",
 			    status, iova);
 
 	return IRQ_HANDLED;
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
