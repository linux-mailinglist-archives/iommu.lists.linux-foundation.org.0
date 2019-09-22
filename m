Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBADBA417
	for <lists.iommu@lfdr.de>; Sun, 22 Sep 2019 20:54:12 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2ADF7AE0;
	Sun, 22 Sep 2019 18:54:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 85C712F
	for <iommu@lists.linux-foundation.org>;
	Sun, 22 Sep 2019 18:54:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 00809102
	for <iommu@lists.linux-foundation.org>;
	Sun, 22 Sep 2019 18:54:08 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 10C7A2190F;
	Sun, 22 Sep 2019 18:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569178447;
	bh=q1F/PL9JH2Pgit/X0ETfmM9LtIBLM1x7XmdLoELO7aU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WVpcbu2h3/2JnxOr2FGRYvEgoufs57LZORnKtdBD5Py1MZktynxsrupTWmnN6B5iI
	qT+NBVP+mXzZVACSmyyVMPlPeNqDbj9SaYOlW/6P5Au8QCk/RVJKCinU9Lmdxtk2BV
	ZFD0xZ6lVmCu54r/kJZIxuByrftk/D0pEW3kdD3g=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 179/185] iommu/amd: Override wrong IVRS IOAPIC on
	Raven Ridge systems
Date: Sun, 22 Sep 2019 14:49:17 -0400
Message-Id: <20190922184924.32534-179-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190922184924.32534-1-sashal@kernel.org>
References: <20190922184924.32534-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, iommu@lists.linux-foundation.org,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	kbuild test robot <lkp@intel.com>, Joerg Roedel <jroedel@suse.de>
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

From: Kai-Heng Feng <kai.heng.feng@canonical.com>

[ Upstream commit 93d051550ee02eaff9a2541d825605a7bd778027 ]

Raven Ridge systems may have malfunction touchpad or hang at boot if
incorrect IVRS IOAPIC is provided by BIOS.

Users already found correct "ivrs_ioapic=" values, let's put them inside
kernel to workaround buggy BIOS.

BugLink: https://bugs.launchpad.net/bugs/1795292
BugLink: https://bugs.launchpad.net/bugs/1837688
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/Makefile           |  2 +-
 drivers/iommu/amd_iommu.h        | 14 +++++
 drivers/iommu/amd_iommu_init.c   |  5 +-
 drivers/iommu/amd_iommu_quirks.c | 92 ++++++++++++++++++++++++++++++++
 4 files changed, 111 insertions(+), 2 deletions(-)
 create mode 100644 drivers/iommu/amd_iommu.h
 create mode 100644 drivers/iommu/amd_iommu_quirks.c

diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
index 8c71a15e986b5..826a5bbe0d09b 100644
--- a/drivers/iommu/Makefile
+++ b/drivers/iommu/Makefile
@@ -10,7 +10,7 @@ obj-$(CONFIG_IOMMU_IO_PGTABLE_LPAE) += io-pgtable-arm.o
 obj-$(CONFIG_IOMMU_IOVA) += iova.o
 obj-$(CONFIG_OF_IOMMU)	+= of_iommu.o
 obj-$(CONFIG_MSM_IOMMU) += msm_iommu.o
-obj-$(CONFIG_AMD_IOMMU) += amd_iommu.o amd_iommu_init.o
+obj-$(CONFIG_AMD_IOMMU) += amd_iommu.o amd_iommu_init.o amd_iommu_quirks.o
 obj-$(CONFIG_AMD_IOMMU_DEBUGFS) += amd_iommu_debugfs.o
 obj-$(CONFIG_AMD_IOMMU_V2) += amd_iommu_v2.o
 obj-$(CONFIG_ARM_SMMU) += arm-smmu.o
diff --git a/drivers/iommu/amd_iommu.h b/drivers/iommu/amd_iommu.h
new file mode 100644
index 0000000000000..12d540d9b59b0
--- /dev/null
+++ b/drivers/iommu/amd_iommu.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef AMD_IOMMU_H
+#define AMD_IOMMU_H
+
+int __init add_special_device(u8 type, u8 id, u16 *devid, bool cmd_line);
+
+#ifdef CONFIG_DMI
+void amd_iommu_apply_ivrs_quirks(void);
+#else
+static void amd_iommu_apply_ivrs_quirks(void) { }
+#endif
+
+#endif
diff --git a/drivers/iommu/amd_iommu_init.c b/drivers/iommu/amd_iommu_init.c
index 07d84dbab564e..6469f51282427 100644
--- a/drivers/iommu/amd_iommu_init.c
+++ b/drivers/iommu/amd_iommu_init.c
@@ -30,6 +30,7 @@
 #include <asm/irq_remapping.h>
 
 #include <linux/crash_dump.h>
+#include "amd_iommu.h"
 #include "amd_iommu_proto.h"
 #include "amd_iommu_types.h"
 #include "irq_remapping.h"
@@ -997,7 +998,7 @@ static void __init set_dev_entry_from_acpi(struct amd_iommu *iommu,
 	set_iommu_for_device(iommu, devid);
 }
 
-static int __init add_special_device(u8 type, u8 id, u16 *devid, bool cmd_line)
+int __init add_special_device(u8 type, u8 id, u16 *devid, bool cmd_line)
 {
 	struct devid_map *entry;
 	struct list_head *list;
@@ -1148,6 +1149,8 @@ static int __init init_iommu_from_acpi(struct amd_iommu *iommu,
 	if (ret)
 		return ret;
 
+	amd_iommu_apply_ivrs_quirks();
+
 	/*
 	 * First save the recommended feature enable bits from ACPI
 	 */
diff --git a/drivers/iommu/amd_iommu_quirks.c b/drivers/iommu/amd_iommu_quirks.c
new file mode 100644
index 0000000000000..c235f79b7a200
--- /dev/null
+++ b/drivers/iommu/amd_iommu_quirks.c
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/*
+ * Quirks for AMD IOMMU
+ *
+ * Copyright (C) 2019 Kai-Heng Feng <kai.heng.feng@canonical.com>
+ */
+
+#ifdef CONFIG_DMI
+#include <linux/dmi.h>
+
+#include "amd_iommu.h"
+
+#define IVHD_SPECIAL_IOAPIC		1
+
+struct ivrs_quirk_entry {
+	u8 id;
+	u16 devid;
+};
+
+enum {
+	DELL_INSPIRON_7375 = 0,
+	DELL_LATITUDE_5495,
+	LENOVO_IDEAPAD_330S_15ARR,
+};
+
+static const struct ivrs_quirk_entry ivrs_ioapic_quirks[][3] __initconst = {
+	/* ivrs_ioapic[4]=00:14.0 ivrs_ioapic[5]=00:00.2 */
+	[DELL_INSPIRON_7375] = {
+		{ .id = 4, .devid = 0xa0 },
+		{ .id = 5, .devid = 0x2 },
+		{}
+	},
+	/* ivrs_ioapic[4]=00:14.0 */
+	[DELL_LATITUDE_5495] = {
+		{ .id = 4, .devid = 0xa0 },
+		{}
+	},
+	/* ivrs_ioapic[32]=00:14.0 */
+	[LENOVO_IDEAPAD_330S_15ARR] = {
+		{ .id = 32, .devid = 0xa0 },
+		{}
+	},
+	{}
+};
+
+static int __init ivrs_ioapic_quirk_cb(const struct dmi_system_id *d)
+{
+	const struct ivrs_quirk_entry *i;
+
+	for (i = d->driver_data; i->id != 0 && i->devid != 0; i++)
+		add_special_device(IVHD_SPECIAL_IOAPIC, i->id, (u16 *)&i->devid, 0);
+
+	return 0;
+}
+
+static const struct dmi_system_id ivrs_quirks[] __initconst = {
+	{
+		.callback = ivrs_ioapic_quirk_cb,
+		.ident = "Dell Inspiron 7375",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 7375"),
+		},
+		.driver_data = (void *)&ivrs_ioapic_quirks[DELL_INSPIRON_7375],
+	},
+	{
+		.callback = ivrs_ioapic_quirk_cb,
+		.ident = "Dell Latitude 5495",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude 5495"),
+		},
+		.driver_data = (void *)&ivrs_ioapic_quirks[DELL_LATITUDE_5495],
+	},
+	{
+		.callback = ivrs_ioapic_quirk_cb,
+		.ident = "Lenovo ideapad 330S-15ARR",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "81FB"),
+		},
+		.driver_data = (void *)&ivrs_ioapic_quirks[LENOVO_IDEAPAD_330S_15ARR],
+	},
+	{}
+};
+
+void __init amd_iommu_apply_ivrs_quirks(void)
+{
+	dmi_check_system(ivrs_quirks);
+}
+#endif
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
