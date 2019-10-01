Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AC854C3F5F
	for <lists.iommu@lfdr.de>; Tue,  1 Oct 2019 20:06:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8942A1198;
	Tue,  1 Oct 2019 18:06:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D9200115B
	for <iommu@lists.linux-foundation.org>;
	Tue,  1 Oct 2019 18:06:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
	[195.130.132.51])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4BED68A0
	for <iommu@lists.linux-foundation.org>;
	Tue,  1 Oct 2019 18:06:26 +0000 (UTC)
Received: from ramsan ([84.194.98.4]) by baptiste.telenet-ops.be with bizsmtp
	id 8J6P2100H05gfCL01J6Pmp; Tue, 01 Oct 2019 20:06:25 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1iFMXX-0008KX-7p; Tue, 01 Oct 2019 20:06:23 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1iFMXX-0000Dl-5H; Tue, 01 Oct 2019 20:06:23 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH] iommu/ipmmu-vmsa: Only call platform_get_irq() when interrupt
	is mandatory
Date: Tue,  1 Oct 2019 20:06:22 +0200
Message-Id: <20191001180622.806-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SUBJ_OBFU_PUNCT_FEW autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
	linux-renesas-soc@vger.kernel.org, iommu@lists.linux-foundation.org
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

As platform_get_irq() now prints an error when the interrupt does not
exist, calling it gratuitously causes scary messages like:

    ipmmu-vmsa e6740000.mmu: IRQ index 0 not found

Fix this by moving the call to platform_get_irq() down, where the
existence of the interrupt is mandatory.

Fixes: 7723f4c5ecdb8d83 ("driver core: platform: Add an error message to platform_get_irq*()")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This is a fix for v5.4-rc1.
---
 drivers/iommu/ipmmu-vmsa.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 9da8309f71708f21..237103465b824c51 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -1086,8 +1086,6 @@ static int ipmmu_probe(struct platform_device *pdev)
 
 	mmu->num_ctx = min(IPMMU_CTX_MAX, mmu->features->number_of_contexts);
 
-	irq = platform_get_irq(pdev, 0);
-
 	/*
 	 * Determine if this IPMMU instance is a root device by checking for
 	 * the lack of has_cache_leaf_nodes flag or renesas,ipmmu-main property.
@@ -1106,6 +1104,7 @@ static int ipmmu_probe(struct platform_device *pdev)
 
 	/* Root devices have mandatory IRQs */
 	if (ipmmu_is_root(mmu)) {
+		irq = platform_get_irq(pdev, 0);
 		if (irq < 0) {
 			dev_err(&pdev->dev, "no IRQ found\n");
 			return irq;
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
