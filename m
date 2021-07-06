Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A853BC6E5
	for <lists.iommu@lfdr.de>; Tue,  6 Jul 2021 08:51:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8771A403AB;
	Tue,  6 Jul 2021 06:51:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aVzJcyt72UCX; Tue,  6 Jul 2021 06:51:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 86FFA403AA;
	Tue,  6 Jul 2021 06:51:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54958C000E;
	Tue,  6 Jul 2021 06:51:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ABD14C000E
 for <iommu@lists.linux-foundation.org>; Tue,  6 Jul 2021 06:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E8906079C
 for <iommu@lists.linux-foundation.org>; Tue,  6 Jul 2021 06:51:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kkMkP4_3eD0o for <iommu@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 06:51:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E903260748
 for <iommu@lists.linux-foundation.org>; Tue,  6 Jul 2021 06:51:16 +0000 (UTC)
Received: from 1.general.khfeng.us.vpn ([10.172.68.174] helo=localhost)
 by youngberry.canonical.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1m0evI-00077K-N5; Tue, 06 Jul 2021 06:51:13 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH] iommu: Fallback to default setting when def_domain_type()
 callback returns 0
Date: Tue,  6 Jul 2021 14:51:06 +0800
Message-Id: <20210706065106.271765-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Cc: "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 open list <linux-kernel@vger.kernel.org>
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

Commit 28b41e2c6aeb ("iommu: Move def_domain type check for untrusted
device into core") not only moved the check for untrusted device to
IOMMU core, it also introduced a behavioral change by returning
def_domain_type() directly without checking its return value. That makes
many devices no longer use the default IOMMU setting.

So revert back to the old behavior which defaults to
iommu_def_domain_type when driver callback returns 0.

Fixes: 28b41e2c6aeb ("iommu: Move def_domain type check for untrusted device into core")
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/iommu/iommu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 5419c4b9f27a..faac4f795025 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1507,14 +1507,15 @@ EXPORT_SYMBOL_GPL(fsl_mc_device_group);
 static int iommu_get_def_domain_type(struct device *dev)
 {
 	const struct iommu_ops *ops = dev->bus->iommu_ops;
+	unsigned int type = 0;
 
 	if (dev_is_pci(dev) && to_pci_dev(dev)->untrusted)
 		return IOMMU_DOMAIN_DMA;
 
 	if (ops->def_domain_type)
-		return ops->def_domain_type(dev);
+		type = ops->def_domain_type(dev);
 
-	return 0;
+	return (type == 0) ? iommu_def_domain_type : type;
 }
 
 static int iommu_group_alloc_default_domain(struct bus_type *bus,
-- 
2.31.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
