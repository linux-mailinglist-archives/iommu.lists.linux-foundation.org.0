Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D2C2FDD6
	for <lists.iommu@lfdr.de>; Thu, 30 May 2019 16:32:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1A0283BA8;
	Thu, 30 May 2019 14:32:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7E55B3BA1
	for <iommu@lists.linux-foundation.org>;
	Thu, 30 May 2019 14:19:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6FF696C5
	for <iommu@lists.linux-foundation.org>;
	Thu, 30 May 2019 14:19:55 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 28A251A0650;
	Thu, 30 May 2019 16:19:54 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
	[134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1C93E1A016B;
	Thu, 30 May 2019 16:19:54 +0200 (CEST)
Received: from fsr-ub1864-101.ea.freescale.net
	(fsr-ub1864-101.ea.freescale.net [10.171.82.13])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 883732061C;
	Thu, 30 May 2019 16:19:53 +0200 (CEST)
From: laurentiu.tudor@nxp.com
To: netdev@vger.kernel.org, madalin.bucur@nxp.com, roy.pledge@nxp.com,
	camelia.groza@nxp.com, leoyang.li@nxp.com
Subject: [PATCH v3 1/6] fsl/fman: don't touch liodn base regs reserved on
	non-PAMU SoCs
Date: Thu, 30 May 2019 17:19:46 +0300
Message-Id: <20190530141951.6704-2-laurentiu.tudor@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190530141951.6704-1-laurentiu.tudor@nxp.com>
References: <20190530141951.6704-1-laurentiu.tudor@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-kernel@vger.kernel.org, Joakim.Tjernlund@infinera.com,
	iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
	davem@davemloft.net, linux-arm-kernel@lists.infradead.org
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

From: Laurentiu Tudor <laurentiu.tudor@nxp.com>

liodn base registers are specific to PAMU based NXP systems and on SMMU
based ones are reserved. Don't access them if PAMU is compiled in.

Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
---
 drivers/net/ethernet/freescale/fman/fman.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/fman/fman.c b/drivers/net/ethernet/freescale/fman/fman.c
index e80fedb27cee..cce6636b1763 100644
--- a/drivers/net/ethernet/freescale/fman/fman.c
+++ b/drivers/net/ethernet/freescale/fman/fman.c
@@ -634,6 +634,9 @@ static void set_port_liodn(struct fman *fman, u8 port_id,
 {
 	u32 tmp;
 
+	iowrite32be(liodn_ofst, &fman->bmi_regs->fmbm_spliodn[port_id - 1]);
+	if (!IS_ENABLED(CONFIG_FSL_PAMU))
+		return;
 	/* set LIODN base for this port */
 	tmp = ioread32be(&fman->dma_regs->fmdmplr[port_id / 2]);
 	if (port_id % 2) {
@@ -644,7 +647,6 @@ static void set_port_liodn(struct fman *fman, u8 port_id,
 		tmp |= liodn_base << DMA_LIODN_SHIFT;
 	}
 	iowrite32be(tmp, &fman->dma_regs->fmdmplr[port_id / 2]);
-	iowrite32be(liodn_ofst, &fman->bmi_regs->fmbm_spliodn[port_id - 1]);
 }
 
 static void enable_rams_ecc(struct fman_fpm_regs __iomem *fpm_rg)
@@ -1942,6 +1944,8 @@ static int fman_init(struct fman *fman)
 
 		fman->liodn_offset[i] =
 			ioread32be(&fman->bmi_regs->fmbm_spliodn[i - 1]);
+		if (!IS_ENABLED(CONFIG_FSL_PAMU))
+			continue;
 		liodn_base = ioread32be(&fman->dma_regs->fmdmplr[i / 2]);
 		if (i % 2) {
 			/* FMDM_PLR LSB holds LIODN base for odd ports */
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
