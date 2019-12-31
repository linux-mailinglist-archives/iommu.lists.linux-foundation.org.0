Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 024BF12DD64
	for <lists.iommu@lfdr.de>; Wed,  1 Jan 2020 03:27:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 885C683AF8;
	Wed,  1 Jan 2020 02:27:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GAdQg2AOGoqD; Wed,  1 Jan 2020 02:27:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C28B683883;
	Wed,  1 Jan 2020 02:27:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2CF2C077D;
	Wed,  1 Jan 2020 02:27:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DDB3FC077D
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jan 2020 02:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C7185204C8
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jan 2020 02:27:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xg26H3M84vJv for <iommu@lists.linux-foundation.org>;
 Wed,  1 Jan 2020 02:27:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by silver.osuosl.org (Postfix) with ESMTPS id 65EEE204B5
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jan 2020 02:27:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Dec 2019 18:27:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,381,1571727600"; d="scan'208";a="221068067"
Received: from unknown (HELO nsgsw-rhel7p6.lm.intel.com) ([10.232.116.83])
 by orsmga006.jf.intel.com with ESMTP; 31 Dec 2019 18:27:01 -0800
From: Jon Derrick <jonathan.derrick@intel.com>
To: <iommu@lists.linux-foundation.org>,
	<linux-pci@vger.kernel.org>
Subject: [RFC 2/5] iommu/vt-d: Unlink device if failed to add to group
Date: Tue, 31 Dec 2019 13:24:20 -0700
Message-Id: <1577823863-3303-3-git-send-email-jonathan.derrick@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1577823863-3303-1-git-send-email-jonathan.derrick@intel.com>
References: <1577823863-3303-1-git-send-email-jonathan.derrick@intel.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Keith Busch <kbusch@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Christoph Hellwig <hch@lst.de>,
 Jon Derrick <jonathan.derrick@intel.com>
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

If the device fails to be added to the group, make sure to unlink the
reference before returning.

Signed-off-by: Jon Derrick <jonathan.derrick@intel.com>
---
 drivers/iommu/intel-iommu.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index b2526a4..978d502 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -5625,8 +5625,10 @@ static int intel_iommu_add_device(struct device *dev)
 
 	group = iommu_group_get_for_dev(dev);
 
-	if (IS_ERR(group))
-		return PTR_ERR(group);
+	if (IS_ERR(group)) {
+		ret = PTR_ERR(group);
+		goto unlink;
+	}
 
 	iommu_group_put(group);
 
@@ -5652,7 +5654,8 @@ static int intel_iommu_add_device(struct device *dev)
 				if (!get_private_domain_for_dev(dev)) {
 					dev_warn(dev,
 						 "Failed to get a private domain.\n");
-					return -ENOMEM;
+					ret = -ENOMEM;
+					goto unlink;
 				}
 
 				dev_info(dev,
@@ -5667,6 +5670,10 @@ static int intel_iommu_add_device(struct device *dev)
 	}
 
 	return 0;
+
+unlink:
+	iommu_device_unlink(&iommu->iommu, dev);
+	return ret;
 }
 
 static void intel_iommu_remove_device(struct device *dev)
-- 
1.8.3.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
