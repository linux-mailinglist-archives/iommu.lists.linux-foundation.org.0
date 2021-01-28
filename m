Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8AC3076A6
	for <lists.iommu@lfdr.de>; Thu, 28 Jan 2021 14:03:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8978F86FCB;
	Thu, 28 Jan 2021 13:03:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mX-FPYK2RfQa; Thu, 28 Jan 2021 13:03:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C2BE38738B;
	Thu, 28 Jan 2021 13:03:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8691DC1825;
	Thu, 28 Jan 2021 13:03:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 33970C08A1
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 13:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 12DC286C0F
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 13:03:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gwyW4oRjTFD8 for <iommu@lists.linux-foundation.org>;
 Thu, 28 Jan 2021 13:03:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9E4FC86B00
 for <iommu@lists.linux-foundation.org>; Thu, 28 Jan 2021 13:03:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.79,382,1602514800"; d="scan'208";a="70357045"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 28 Jan 2021 22:03:17 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id AB8554017D71;
 Thu, 28 Jan 2021 22:03:17 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: joro@8bytes.org
Subject: [PATCH 1/2] iommu/ipmmu-vmsa: refactor ipmmu_of_xlate()
Date: Thu, 28 Jan 2021 22:02:59 +0900
Message-Id: <1611838980-4940-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611838980-4940-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1611838980-4940-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, iommu@lists.linux-foundation.org
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

Refactor ipmmu_of_xlate() to improve readability/scalability.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/iommu/ipmmu-vmsa.c | 49 +++++++++++++++++-----------------------------
 1 file changed, 18 insertions(+), 31 deletions(-)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 0f18abd..0bdf354 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -735,54 +735,41 @@ static int ipmmu_init_platform_device(struct device *dev,
 	return 0;
 }
 
-static const struct soc_device_attribute soc_rcar_gen3[] = {
-	{ .soc_id = "r8a774a1", },
-	{ .soc_id = "r8a774b1", },
-	{ .soc_id = "r8a774c0", },
-	{ .soc_id = "r8a774e1", },
-	{ .soc_id = "r8a7795", },
-	{ .soc_id = "r8a77961", },
-	{ .soc_id = "r8a7796", },
-	{ .soc_id = "r8a77965", },
-	{ .soc_id = "r8a77970", },
-	{ .soc_id = "r8a77990", },
-	{ .soc_id = "r8a77995", },
+static const struct soc_device_attribute soc_needs_opt_in[] = {
+	{ .family = "R-Car Gen3", },
+	{ .family = "RZ/G2", },
 	{ /* sentinel */ }
 };
 
-static const struct soc_device_attribute soc_rcar_gen3_whitelist[] = {
-	{ .soc_id = "r8a774b1", },
-	{ .soc_id = "r8a774c0", },
-	{ .soc_id = "r8a774e1", },
-	{ .soc_id = "r8a7795", .revision = "ES3.*" },
-	{ .soc_id = "r8a77961", },
-	{ .soc_id = "r8a77965", },
-	{ .soc_id = "r8a77990", },
-	{ .soc_id = "r8a77995", },
+static const struct soc_device_attribute soc_denylist[] = {
+	{ .soc_id = "r8a774a1", },
+	{ .soc_id = "r8a7795", .revision = "ES1.*" },
+	{ .soc_id = "r8a7795", .revision = "ES2.*" },
+	{ .soc_id = "r8a7796", },
 	{ /* sentinel */ }
 };
 
-static const char * const rcar_gen3_slave_whitelist[] = {
+static const char * const devices_allowlist[] = {
 };
 
-static bool ipmmu_slave_whitelist(struct device *dev)
+static bool ipmmu_device_is_allowed(struct device *dev)
 {
 	unsigned int i;
 
 	/*
-	 * For R-Car Gen3 use a white list to opt-in slave devices.
+	 * R-Car Gen3 and RZ/G2 use the allow list to opt-in devices.
 	 * For Other SoCs, this returns true anyway.
 	 */
-	if (!soc_device_match(soc_rcar_gen3))
+	if (!soc_device_match(soc_needs_opt_in))
 		return true;
 
-	/* Check whether this R-Car Gen3 can use the IPMMU correctly or not */
-	if (!soc_device_match(soc_rcar_gen3_whitelist))
+	/* Check whether this SoC can use the IPMMU correctly or not */
+	if (soc_device_match(soc_denylist))
 		return false;
 
-	/* Check whether this slave device can work with the IPMMU */
-	for (i = 0; i < ARRAY_SIZE(rcar_gen3_slave_whitelist); i++) {
-		if (!strcmp(dev_name(dev), rcar_gen3_slave_whitelist[i]))
+	/* Check whether this device can work with the IPMMU */
+	for (i = 0; i < ARRAY_SIZE(devices_allowlist); i++) {
+		if (!strcmp(dev_name(dev), devices_allowlist[i]))
 			return true;
 	}
 
@@ -793,7 +780,7 @@ static bool ipmmu_slave_whitelist(struct device *dev)
 static int ipmmu_of_xlate(struct device *dev,
 			  struct of_phandle_args *spec)
 {
-	if (!ipmmu_slave_whitelist(dev))
+	if (!ipmmu_device_is_allowed(dev))
 		return -ENODEV;
 
 	iommu_fwspec_add_ids(dev, spec->args, 1);
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
