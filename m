Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB9EAC535
	for <lists.iommu@lfdr.de>; Sat,  7 Sep 2019 09:43:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8C47C10A8;
	Sat,  7 Sep 2019 07:43:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C0FCCCD1
	for <iommu@lists.linux-foundation.org>;
	Sat,  7 Sep 2019 07:43:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5337589B
	for <iommu@lists.linux-foundation.org>;
	Sat,  7 Sep 2019 07:43:33 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
	x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
	by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id
	18406123-1500050 for multiple; Sat, 07 Sep 2019 08:43:13 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: intel-gfx@list.freedesktop.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH] iommu/intel: Declare Broadwell igfx dmar support snafu
Date: Sat,  7 Sep 2019 08:43:01 +0100
Message-Id: <20190907074301.18893-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Martin Peres <martin.peres@linux.intel.com>,
	Chris Wilson <chris@chris-wilson.co.uk>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Despite the widespread and complete failure of Broadwell integrated
graphics when DMAR is enabled, known over the years, we have never been
able to root cause the issue. Instead, we let the failure undermine our
confidence in the iommu system itself when we should be pushing for it to
be always enabled. Quirk away Broadwell and remove the rotten apple.

References: https://bugs.freedesktop.org/show_bug.cgi?id=89360
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Martin Peres <martin.peres@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>
---
 drivers/iommu/intel-iommu.c | 44 +++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 43f667379a37..c4fb1ddea4dd 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -5637,20 +5637,46 @@ const struct iommu_ops intel_iommu_ops = {
 	.pgsize_bitmap		= INTEL_IOMMU_PGSIZES,
 };
 
-static void quirk_iommu_g4x_gfx(struct pci_dev *dev)
+static void quirk_iommu_igfx(struct pci_dev *dev)
 {
-	/* G4x/GM45 integrated gfx dmar support is totally busted. */
 	pci_info(dev, "Disabling IOMMU for graphics on this chipset\n");
 	dmar_map_gfx = 0;
 }
 
-DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x2a40, quirk_iommu_g4x_gfx);
-DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x2e00, quirk_iommu_g4x_gfx);
-DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x2e10, quirk_iommu_g4x_gfx);
-DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x2e20, quirk_iommu_g4x_gfx);
-DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x2e30, quirk_iommu_g4x_gfx);
-DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x2e40, quirk_iommu_g4x_gfx);
-DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x2e90, quirk_iommu_g4x_gfx);
+/* G4x/GM45 integrated gfx dmar support is totally busted. */
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x2a40, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x2e00, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x2e10, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x2e20, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x2e30, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x2e40, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x2e90, quirk_iommu_igfx);
+
+/* Broadwell igfx malfunctions with dmar */
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x1606, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x160B, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x160E, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x1602, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x160A, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x160D, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x1616, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x161B, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x161E, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x1612, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x161A, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x161D, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x1626, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x162B, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x162E, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x1622, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x162A, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x162D, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x1636, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x163B, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x163E, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x1632, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x163A, quirk_iommu_igfx);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x163D, quirk_iommu_igfx);
 
 static void quirk_iommu_rwbf(struct pci_dev *dev)
 {
-- 
2.23.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
