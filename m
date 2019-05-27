Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D010D2B3A0
	for <lists.iommu@lfdr.de>; Mon, 27 May 2019 13:53:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B000F1845;
	Mon, 27 May 2019 11:53:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B44501824
	for <iommu@lists.linux-foundation.org>;
	Mon, 27 May 2019 11:53:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0B04E826
	for <iommu@lists.linux-foundation.org>;
	Mon, 27 May 2019 11:53:00 +0000 (UTC)
Received: from ramsan ([84.194.111.163]) by albert.telenet-ops.be with bizsmtp
	id HPsy2000P3XaVaC06PsyAU; Mon, 27 May 2019 13:52:59 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1hVEBW-0001O6-El; Mon, 27 May 2019 13:52:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1hVEBW-0000au-Dr; Mon, 27 May 2019 13:52:58 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Joerg Roedel <joro@8bytes.org>,
	Magnus Damm <damm+renesas@opensource.se>
Subject: [PATCH v4 3/6] iommu/ipmmu-vmsa: Make IPMMU_CTX_MAX unsigned
Date: Mon, 27 May 2019 13:52:50 +0200
Message-Id: <20190527115253.2114-4-geert+renesas@glider.be>
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

Make the IPMMU_CTX_MAX constant unsigned, to match the type of
ipmmu_features.number_of_contexts.

This allows to use plain min() instead of type-casting min_t().

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v4:
  - Add Reviewed-by, Tested-by,

v3:
  - Add Reviewed-by,

v2:
  - Add Reviewed-by.
---
 drivers/iommu/ipmmu-vmsa.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index f2061bd1dc7b8852..87acf86f295fac0d 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -36,7 +36,7 @@
 #define arm_iommu_detach_device(...)	do {} while (0)
 #endif
 
-#define IPMMU_CTX_MAX 8
+#define IPMMU_CTX_MAX 8U
 
 struct ipmmu_features {
 	bool use_ns_alias_offset;
@@ -1060,8 +1060,7 @@ static int ipmmu_probe(struct platform_device *pdev)
 	if (mmu->features->use_ns_alias_offset)
 		mmu->base += IM_NS_ALIAS_OFFSET;
 
-	mmu->num_ctx = min_t(unsigned int, IPMMU_CTX_MAX,
-			     mmu->features->number_of_contexts);
+	mmu->num_ctx = min(IPMMU_CTX_MAX, mmu->features->number_of_contexts);
 
 	irq = platform_get_irq(pdev, 0);
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
