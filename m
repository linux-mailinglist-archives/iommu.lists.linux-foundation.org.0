Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD601716C0
	for <lists.iommu@lfdr.de>; Thu, 27 Feb 2020 13:04:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6849822CD4;
	Thu, 27 Feb 2020 12:04:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aup0A4Ozzr6p; Thu, 27 Feb 2020 12:04:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6456C204B9;
	Thu, 27 Feb 2020 12:04:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C676C0177;
	Thu, 27 Feb 2020 12:04:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 310B9C1D88
 for <iommu@lists.linux-foundation.org>; Thu, 27 Feb 2020 12:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1BFAF86C3E
 for <iommu@lists.linux-foundation.org>; Thu, 27 Feb 2020 12:04:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0f965PoJWiqW for <iommu@lists.linux-foundation.org>;
 Thu, 27 Feb 2020 12:04:12 +0000 (UTC)
X-Greylist: delayed 00:06:13 by SQLgrey-1.7.6
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 857FB86508
 for <iommu@lists.linux-foundation.org>; Thu, 27 Feb 2020 12:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hrcBhMncJ32MXRHGuTL6swwaFI9Sr5ffwOu59lQ9o2M=; b=TDzvLMqrUapPyGG0+g7gAPVhWx
 mhvzh9avWYg4kzwkRpvJfsECes10vWGfJUhr+6SBUkTVMywdTWtXqsm0rU4l865u56DtPXulnyGdM
 2z+3dwzZwq75ZHykOdyMd5eQCBdLGmWCW75ovTvTk5NIEBTc+eianlBbOGA2bmjKxWWZgi4y31zSC
 3VdhwXIoY6zF/FKXkJRvbmmHa9lTwaO8gW0NRy1mrBZAeI5TtJ1A8WBW/qM6owMFsLZFbm/ePiZbg
 +5bp6m9Lsfr8BbTot+3geF3ySvWpT37ayVF2JWZlwLwFHqoqTaF5XCjc4fNYkKd2J+cDMBm64ApUl
 /b5VrWeg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([2001:4d48:ad52:3201:222:68ff:fe15:37dd]:58320 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1j7Hnd-0005Kk-FA; Thu, 27 Feb 2020 11:57:53 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1j7Hnc-0004Bm-Kn; Thu, 27 Feb 2020 11:57:52 +0000
From: Russell King <rmk+kernel@armlinux.org.uk>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH] iommu: silence iommu group prints
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1j7Hnc-0004Bm-Kn@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Feb 2020 11:57:52 +0000
Cc: iommu@lists.linux-foundation.org
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

On the LX2160A, there are lots (about 160) of IOMMU messages produced
during boot; this is excessive.  Reduce the severity of these messages
to debug level.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/iommu/iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 3ead597e1c57..304281ec623b 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -741,7 +741,7 @@ int iommu_group_add_device(struct iommu_group *group, struct device *dev)
 
 	trace_add_device_to_group(group->id, dev);
 
-	dev_info(dev, "Adding to iommu group %d\n", group->id);
+	dev_dbg(dev, "Adding to iommu group %d\n", group->id);
 
 	return 0;
 
@@ -775,7 +775,7 @@ void iommu_group_remove_device(struct device *dev)
 	struct iommu_group *group = dev->iommu_group;
 	struct group_device *tmp_device, *device = NULL;
 
-	dev_info(dev, "Removing from iommu group %d\n", group->id);
+	dev_dbg(dev, "Removing from iommu group %d\n", group->id);
 
 	/* Pre-notify listeners that a device is being removed. */
 	blocking_notifier_call_chain(&group->notifier,
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
