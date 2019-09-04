Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A41B5A81F2
	for <lists.iommu@lfdr.de>; Wed,  4 Sep 2019 14:13:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1B21E14CF;
	Wed,  4 Sep 2019 12:13:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 743F014BA
	for <iommu@lists.linux-foundation.org>;
	Wed,  4 Sep 2019 12:13:08 +0000 (UTC)
X-Greylist: delayed 00:05:02 by SQLgrey-1.7.6
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6AC5F756
	for <iommu@lists.linux-foundation.org>;
	Wed,  4 Sep 2019 12:13:07 +0000 (UTC)
Received: from ramsan ([84.194.98.4]) by albert.telenet-ops.be with bizsmtp
	id xQ832000m05gfCL06Q83Ze; Wed, 04 Sep 2019 14:08:04 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1i5U4x-0001ak-IL; Wed, 04 Sep 2019 14:08:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
	(envelope-from <geert@linux-m68k.org>)
	id 1i5U4x-0000Zg-HI; Wed, 04 Sep 2019 14:08:03 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 1/2] iommu/ipmmu-vmsa: Move IMTTBCR_SL0_TWOBIT_* to restore
	sort order
Date: Wed,  4 Sep 2019 14:08:01 +0200
Message-Id: <20190904120802.2163-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904120802.2163-1-geert+renesas@glider.be>
References: <20190904120802.2163-1-geert+renesas@glider.be>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-renesas-soc@vger.kernel.org, iommu@lists.linux-foundation.org,
	Magnus Damm <damm+renesas@opensource.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>
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

Move the recently added IMTTBCR_SL0_TWOBIT_* definitions up, to make
sure all IMTTBCR register bit definitions are sorted by decreasing bit
index.  Add comments to make it clear that they exist on R-Car Gen3
only.

Fixes: c295f504fb5a38ab ("iommu/ipmmu-vmsa: Allow two bit SL0")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/iommu/ipmmu-vmsa.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 76a8ec343d53252e..1baabeaddc9cba1b 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -145,15 +145,14 @@ static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
 #define IMTTBCR_IRGN0_WT		(2 << 8)
 #define IMTTBCR_IRGN0_WB		(3 << 8)
 #define IMTTBCR_IRGN0_MASK		(3 << 8)
+#define IMTTBCR_SL0_TWOBIT_LVL_3	(0 << 6)	/* R-Car Gen3 only */
+#define IMTTBCR_SL0_TWOBIT_LVL_2	(1 << 6)	/* R-Car Gen3 only */
+#define IMTTBCR_SL0_TWOBIT_LVL_1	(2 << 6)	/* R-Car Gen3 only */
 #define IMTTBCR_SL0_LVL_2		(0 << 4)
 #define IMTTBCR_SL0_LVL_1		(1 << 4)
 #define IMTTBCR_TSZ0_MASK		(7 << 0)
 #define IMTTBCR_TSZ0_SHIFT		O
 
-#define IMTTBCR_SL0_TWOBIT_LVL_3	(0 << 6)
-#define IMTTBCR_SL0_TWOBIT_LVL_2	(1 << 6)
-#define IMTTBCR_SL0_TWOBIT_LVL_1	(2 << 6)
-
 #define IMBUSCR				0x000c
 #define IMBUSCR_DVM			(1 << 2)
 #define IMBUSCR_BUSSEL_SYS		(0 << 0)
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
