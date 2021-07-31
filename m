Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id C411B3DC499
	for <lists.iommu@lfdr.de>; Sat, 31 Jul 2021 09:50:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D0A298350D;
	Sat, 31 Jul 2021 07:50:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4cPiSY9nhgUk; Sat, 31 Jul 2021 07:50:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id F234E83506;
	Sat, 31 Jul 2021 07:50:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE422C0010;
	Sat, 31 Jul 2021 07:50:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B71CC0010
 for <iommu@lists.linux-foundation.org>; Sat, 31 Jul 2021 07:50:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 793D74026D
 for <iommu@lists.linux-foundation.org>; Sat, 31 Jul 2021 07:50:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=mailerdienst.de
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O7FSOEn-BN6T for <iommu@lists.linux-foundation.org>;
 Sat, 31 Jul 2021 07:50:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mxwww.masterlogin.de (mxwww.masterlogin.de
 [IPv6:2a03:2900:1:1::a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7DB89400AF
 for <iommu@lists.linux-foundation.org>; Sat, 31 Jul 2021 07:50:34 +0000 (UTC)
Received: from mxout2.routing.net (unknown [192.168.10.82])
 by backup.mxwww.masterlogin.de (Postfix) with ESMTPS id 11E552C533
 for <iommu@lists.linux-foundation.org>; Sat, 31 Jul 2021 07:47:49 +0000 (UTC)
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
 by mxout2.routing.net (Postfix) with ESMTP id 742395FC28;
 Sat, 31 Jul 2021 07:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1627717663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=203p5LOrdBHh+Yer5N7D3VTBaUXubh54vrXwH3UF8Lk=;
 b=sTVl6SjEaPCkXfzHdCJW6bkXpfSshz1B+2feQ8pz2TcMhOHMuuTuMXo1LwG6wa37Ag8MiT
 XCep1oJyXfXwIz3y9dL36QqsPVvld76XWHlp4JrjUWvZWGOHCaFfJTyi0BRFoJMkwwuGGC
 6Q1r5uWoWW0DatZh0p3SESLRXf5B7hE=
Received: from localhost.localdomain (fttx-pool-80.245.79.120.bambit.de
 [80.245.79.120])
 by mxbox4.masterlogin.de (Postfix) with ESMTPSA id CD16280843;
 Sat, 31 Jul 2021 07:47:42 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v2] iommu: Check if group is NULL before remove device
Date: Sat, 31 Jul 2021 09:47:37 +0200
Message-Id: <20210731074737.4573-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mail-ID: c0f3efb9-ff49-441d-a9bc-ca8ab5fd7dbc
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 Frank Wunderlich <frank-w@public-files.de>
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

From: Frank Wunderlich <frank-w@public-files.de>

If probe_device is failing, iommu_group is not initialized because
iommu_group_add_device is not reached, so freeing it will result
in NULL pointer access.

iommu_bus_init
  ->bus_iommu_probe
      ->probe_iommu_group in for each:/* return -22 in fail case */
          ->iommu_probe_device
              ->__iommu_probe_device       /* return -22 here.*/
                  -> ops->probe_device          /* return -22 here.*/
                  -> iommu_group_get_for_dev
                        -> ops->device_group
                        -> iommu_group_add_device //good case
  ->remove_iommu_group  //in fail case, it will remove group
     ->iommu_release_device
         ->iommu_group_remove_device // here we don't have group

In my case ops->probe_device (mtk_iommu_probe_device from
mtk_iommu_v1.c) is due to failing fwspec->ops mismatch.

Fixes: d72e31c93746 ("iommu: IOMMU Groups")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v2:
- commit-message with captial letters on beginning of sentenence
- added more information, many thanks to Yong Wu
---
 drivers/iommu/iommu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 5419c4b9f27a..63f0af10c403 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -924,6 +924,9 @@ void iommu_group_remove_device(struct device *dev)
 	struct iommu_group *group = dev->iommu_group;
 	struct group_device *tmp_device, *device = NULL;
 
+	if (!group)
+		return;
+
 	dev_info(dev, "Removing from iommu group %d\n", group->id);
 
 	/* Pre-notify listeners that a device is being removed. */
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
