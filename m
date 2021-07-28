Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 789D83D9281
	for <lists.iommu@lfdr.de>; Wed, 28 Jul 2021 17:59:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA1C6401FD;
	Wed, 28 Jul 2021 15:59:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WlfNRTHe-Cgp; Wed, 28 Jul 2021 15:59:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 97DBA4023F;
	Wed, 28 Jul 2021 15:59:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C298C0022;
	Wed, 28 Jul 2021 15:59:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46023C000E
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 15:59:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27BC6839BF
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 15:59:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Po4tDusf-0az for <iommu@lists.linux-foundation.org>;
 Wed, 28 Jul 2021 15:59:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 887D383A0A
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 15:59:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE4BC106F;
 Wed, 28 Jul 2021 08:59:15 -0700 (PDT)
Received: from 010265703453.arm.com (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1D2923F70D;
 Wed, 28 Jul 2021 08:59:13 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH v2 06/24] iommu/ipmmu-vmsa: Drop IOVA cookie management
Date: Wed, 28 Jul 2021 16:58:27 +0100
Message-Id: <dff09fefdb89fe5b8a09a2884eb3c34d95343681.1627468309.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627468308.git.robin.murphy@arm.com>
References: <cover.1627468308.git.robin.murphy@arm.com>
MIME-Version: 1.0
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dianders@chromium.org, iommu@lists.linux-foundation.org,
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

The core code bakes its own cookies now.

CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/ipmmu-vmsa.c | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 51ea6f00db2f..31252268f0d0 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -564,10 +564,13 @@ static irqreturn_t ipmmu_irq(int irq, void *dev)
  * IOMMU Operations
  */
 
-static struct iommu_domain *__ipmmu_domain_alloc(unsigned type)
+static struct iommu_domain *ipmmu_domain_alloc(unsigned type)
 {
 	struct ipmmu_vmsa_domain *domain;
 
+	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
+		return NULL;
+
 	domain = kzalloc(sizeof(*domain), GFP_KERNEL);
 	if (!domain)
 		return NULL;
@@ -577,27 +580,6 @@ static struct iommu_domain *__ipmmu_domain_alloc(unsigned type)
 	return &domain->io_domain;
 }
 
-static struct iommu_domain *ipmmu_domain_alloc(unsigned type)
-{
-	struct iommu_domain *io_domain = NULL;
-
-	switch (type) {
-	case IOMMU_DOMAIN_UNMANAGED:
-		io_domain = __ipmmu_domain_alloc(type);
-		break;
-
-	case IOMMU_DOMAIN_DMA:
-		io_domain = __ipmmu_domain_alloc(type);
-		if (io_domain && iommu_get_dma_cookie(io_domain)) {
-			kfree(io_domain);
-			io_domain = NULL;
-		}
-		break;
-	}
-
-	return io_domain;
-}
-
 static void ipmmu_domain_free(struct iommu_domain *io_domain)
 {
 	struct ipmmu_vmsa_domain *domain = to_vmsa_domain(io_domain);
@@ -606,7 +588,6 @@ static void ipmmu_domain_free(struct iommu_domain *io_domain)
 	 * Free the domain resources. We assume that all devices have already
 	 * been detached.
 	 */
-	iommu_put_dma_cookie(io_domain);
 	ipmmu_domain_destroy_context(domain);
 	free_io_pgtable_ops(domain->iop);
 	kfree(domain);
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
