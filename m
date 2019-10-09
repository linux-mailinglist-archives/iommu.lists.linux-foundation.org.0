Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EC8D09BE
	for <lists.iommu@lfdr.de>; Wed,  9 Oct 2019 10:27:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DE825C11;
	Wed,  9 Oct 2019 08:26:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7BA71C11
	for <iommu@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 08:26:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
	[210.160.252.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id B0C7B14D
	for <iommu@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 08:26:51 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,273,1566831600"; d="scan'208";a="28451940"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
	by relmlie6.idc.renesas.com with ESMTP; 09 Oct 2019 17:26:50 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4376C41A46EC;
	Wed,  9 Oct 2019 17:26:50 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: joro@8bytes.org
Subject: [PATCH 1/3] iommu/ipmmu-vmsa: Remove some unused register declarations
Date: Wed,  9 Oct 2019 17:26:47 +0900
Message-Id: <1570609609-1332-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570609609-1332-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1570609609-1332-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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
in the future, this patch removes some unused register
declarations.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/iommu/ipmmu-vmsa.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 9da8309..dd554c2 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -104,8 +104,6 @@ static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
 #define IMCTR				0x0000
 #define IMCTR_TRE			(1 << 17)
 #define IMCTR_AFE			(1 << 16)
-#define IMCTR_RTSEL_MASK		(3 << 4)
-#define IMCTR_RTSEL_SHIFT		4
 #define IMCTR_TREN			(1 << 3)
 #define IMCTR_INTEN			(1 << 2)
 #define IMCTR_FLUSH			(1 << 1)
@@ -115,7 +113,6 @@ static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
 
 #define IMTTBCR				0x0008
 #define IMTTBCR_EAE			(1 << 31)
-#define IMTTBCR_PMB			(1 << 30)
 #define IMTTBCR_SH1_NON_SHAREABLE	(0 << 28)	/* R-Car Gen2 only */
 #define IMTTBCR_SH1_OUTER_SHAREABLE	(2 << 28)	/* R-Car Gen2 only */
 #define IMTTBCR_SH1_INNER_SHAREABLE	(3 << 28)	/* R-Car Gen2 only */
@@ -193,12 +190,6 @@ static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
 #define IMELAR				0x0030	/* IMEAR on R-Car Gen2 */
 #define IMEUAR				0x0034	/* R-Car Gen3 only */
 
-#define IMPCTR				0x0200
-#define IMPSTR				0x0208
-#define IMPEAR				0x020c
-#define IMPMBA(n)			(0x0280 + ((n) * 4))
-#define IMPMBD(n)			(0x02c0 + ((n) * 4))
-
 #define IMUCTR(n)			((n) < 32 ? IMUCTR0(n) : IMUCTR32(n))
 #define IMUCTR0(n)			(0x0300 + ((n) * 16))
 #define IMUCTR32(n)			(0x0600 + (((n) - 32) * 16))
@@ -206,8 +197,6 @@ static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
 #define IMUCTR_FIXADD_MASK		(0xff << 16)
 #define IMUCTR_FIXADD_SHIFT		16
 #define IMUCTR_TTSEL_MMU(n)		((n) << 4)
-#define IMUCTR_TTSEL_PMB		(8 << 4)
-#define IMUCTR_TTSEL_MASK		(15 << 4)
 #define IMUCTR_FLUSH			(1 << 1)
 #define IMUCTR_MMUEN			(1 << 0)
 
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
