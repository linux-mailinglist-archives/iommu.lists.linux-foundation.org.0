Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 018B029F316
	for <lists.iommu@lfdr.de>; Thu, 29 Oct 2020 18:26:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9E59686A00;
	Thu, 29 Oct 2020 17:26:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h7+PVYr3FjVe; Thu, 29 Oct 2020 17:26:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7510A86C18;
	Thu, 29 Oct 2020 17:26:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5933EC0893;
	Thu, 29 Oct 2020 17:26:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06D5AC0893
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 17:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EA51E86C34
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 17:26:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HlOEPgv74sQV for <iommu@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 17:26:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6607A86C1E
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 17:26:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 06388AD18;
 Thu, 29 Oct 2020 17:26:03 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: robh+dt@kernel.org, catalin.marinas@arm.com, hch@lst.de, ardb@kernel.org,
 linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v5 4/7] of: unittest: Add test for of_dma_get_max_cpu_address()
Date: Thu, 29 Oct 2020 18:25:47 +0100
Message-Id: <20201029172550.3523-5-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201029172550.3523-1-nsaenzjulienne@suse.de>
References: <20201029172550.3523-1-nsaenzjulienne@suse.de>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, will@kernel.org,
 jeremy.linton@arm.com, iommu@lists.linux-foundation.org,
 linux-rpi-kernel@lists.infradead.org, guohanjun@huawei.com,
 robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org
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

Introduce a test for of_dma_get_max_cup_address(), it uses the same DT
data as the rest of dma-ranges unit tests.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Reviewed-by: Rob Herring <robh@kernel.org>

---
Changes since v3:
 - Remove HAS_DMA guards

 drivers/of/unittest.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 06cc988faf78..b9a4d047a95e 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -869,6 +869,23 @@ static void __init of_unittest_changeset(void)
 #endif
 }
 
+static void __init of_unittest_dma_get_max_cpu_address(void)
+{
+	struct device_node *np;
+	phys_addr_t cpu_addr;
+
+	np = of_find_node_by_path("/testcase-data/address-tests");
+	if (!np) {
+		pr_err("missing testcase data\n");
+		return;
+	}
+
+	cpu_addr = of_dma_get_max_cpu_address(np);
+	unittest(cpu_addr == 0x50000000,
+		 "of_dma_get_max_cpu_address: wrong CPU addr %pad (expecting %x)\n",
+		 &cpu_addr, 0x50000000);
+}
+
 static void __init of_unittest_dma_ranges_one(const char *path,
 		u64 expect_dma_addr, u64 expect_paddr)
 {
@@ -3266,6 +3283,7 @@ static int __init of_unittest(void)
 	of_unittest_changeset();
 	of_unittest_parse_interrupts();
 	of_unittest_parse_interrupts_extended();
+	of_unittest_dma_get_max_cpu_address();
 	of_unittest_parse_dma_ranges();
 	of_unittest_pci_dma_ranges();
 	of_unittest_match_node();
-- 
2.29.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
