Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B1EDF115
	for <lists.iommu@lfdr.de>; Mon, 21 Oct 2019 17:17:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 88C3FC21;
	Mon, 21 Oct 2019 15:17:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AA9AC907
	for <iommu@lists.linux-foundation.org>;
	Mon, 21 Oct 2019 15:17:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1498C87E
	for <iommu@lists.linux-foundation.org>;
	Mon, 21 Oct 2019 15:17:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 2D454AE39;
	Mon, 21 Oct 2019 15:17:23 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH] iommu/amd: Apply the same IVRS IOAPIC workaround to Acer
	Aspire A315-41
Date: Mon, 21 Oct 2019 17:17:21 +0200
Message-Id: <20191021151721.12393-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

Acer Aspire A315-41 requires the very same workaround as the existing
quirk for Dell Latitude 5495.  Add the new entry for that.

BugLink: https://bugzilla.suse.com/show_bug.cgi?id=1137799
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/iommu/amd_iommu_quirks.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/iommu/amd_iommu_quirks.c b/drivers/iommu/amd_iommu_quirks.c
index c235f79b7a20..5120ce4fdce3 100644
--- a/drivers/iommu/amd_iommu_quirks.c
+++ b/drivers/iommu/amd_iommu_quirks.c
@@ -73,6 +73,19 @@ static const struct dmi_system_id ivrs_quirks[] __initconst = {
 		},
 		.driver_data = (void *)&ivrs_ioapic_quirks[DELL_LATITUDE_5495],
 	},
+	{
+		/*
+		 * Acer Aspire A315-41 requires the very same workaround as
+		 * Dell Latitude 5495
+		 */
+		.callback = ivrs_ioapic_quirk_cb,
+		.ident = "Acer Aspire A315-41",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire A315-41"),
+		},
+		.driver_data = (void *)&ivrs_ioapic_quirks[DELL_LATITUDE_5495],
+	},
 	{
 		.callback = ivrs_ioapic_quirk_cb,
 		.ident = "Lenovo ideapad 330S-15ARR",
-- 
2.16.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
