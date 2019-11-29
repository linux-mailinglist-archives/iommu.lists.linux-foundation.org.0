Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCA110D6E8
	for <lists.iommu@lfdr.de>; Fri, 29 Nov 2019 15:22:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 39A1285FEF;
	Fri, 29 Nov 2019 14:22:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id psz_RyG2x61V; Fri, 29 Nov 2019 14:22:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D791D86A79;
	Fri, 29 Nov 2019 14:22:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B7EEDC0881;
	Fri, 29 Nov 2019 14:22:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B033C0881
 for <iommu@lists.linux-foundation.org>; Fri, 29 Nov 2019 14:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 42AB520358
 for <iommu@lists.linux-foundation.org>; Fri, 29 Nov 2019 14:22:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tRiFm+c5b1fc for <iommu@lists.linux-foundation.org>;
 Fri, 29 Nov 2019 14:22:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by silver.osuosl.org (Postfix) with ESMTPS id 72D7220337
 for <iommu@lists.linux-foundation.org>; Fri, 29 Nov 2019 14:22:02 +0000 (UTC)
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1iah9j-0008Ec-Nb; Fri, 29 Nov 2019 14:22:00 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: joro@8bytes.org
Subject: [PATCH v2] iommu/amd: Disable IOMMU on Stoney Ridge systems
Date: Fri, 29 Nov 2019 22:21:54 +0800
Message-Id: <20191129142154.29658-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Cc: Alex Deucher <alexander.deucher@amd.com>, iommu@lists.linux-foundation.org,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, linux-kernel@vger.kernel.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Serious screen flickering when Stoney Ridge outputs to a 4K monitor.

According to Alex Deucher, IOMMU isn't enabled on Windows, so let's do
the same here to avoid screen flickering on 4K monitor.

Cc: Alex Deucher <alexander.deucher@amd.com>
Bug: https://gitlab.freedesktop.org/drm/amd/issues/961
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v2:
- Find Stoney graphics instead of host bridge.

 drivers/iommu/amd_iommu_init.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/amd_iommu_init.c b/drivers/iommu/amd_iommu_init.c
index 568c52317757..139aa6fdadda 100644
--- a/drivers/iommu/amd_iommu_init.c
+++ b/drivers/iommu/amd_iommu_init.c
@@ -2516,6 +2516,7 @@ static int __init early_amd_iommu_init(void)
 	struct acpi_table_header *ivrs_base;
 	acpi_status status;
 	int i, remap_cache_sz, ret = 0;
+	u32 pci_id;
 
 	if (!amd_iommu_detected)
 		return -ENODEV;
@@ -2603,6 +2604,16 @@ static int __init early_amd_iommu_init(void)
 	if (ret)
 		goto out;
 
+	/* Disable IOMMU if there's Stoney Ridge graphics */
+	for (i = 0; i < 32; i++) {
+		pci_id = read_pci_config(0, i, 0, 0);
+		if ((pci_id & 0xffff) == 0x1002 && (pci_id >> 16) == 0x98e4) {
+			pr_info("Disable IOMMU on Stoney Ridge\n");
+			amd_iommu_disabled = true;
+			break;
+		}
+	}
+
 	/* Disable any previously enabled IOMMUs */
 	if (!is_kdump_kernel() || amd_iommu_disabled)
 		disable_iommus();
@@ -2711,7 +2722,7 @@ static int __init state_next(void)
 		ret = early_amd_iommu_init();
 		init_state = ret ? IOMMU_INIT_ERROR : IOMMU_ACPI_FINISHED;
 		if (init_state == IOMMU_ACPI_FINISHED && amd_iommu_disabled) {
-			pr_info("AMD IOMMU disabled on kernel command-line\n");
+			pr_info("AMD IOMMU disabled\n");
 			init_state = IOMMU_CMDLINE_DISABLED;
 			ret = -EINVAL;
 		}
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
