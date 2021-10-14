Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id C88E142D1F4
	for <lists.iommu@lfdr.de>; Thu, 14 Oct 2021 07:42:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23FDE834DE;
	Thu, 14 Oct 2021 05:42:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MTd8cD6VgNTa; Thu, 14 Oct 2021 05:42:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8A5988350A;
	Thu, 14 Oct 2021 05:42:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8C23EC0025;
	Thu, 14 Oct 2021 05:42:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2F36CC000D
 for <iommu@lists.linux-foundation.org>; Thu, 14 Oct 2021 05:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 982DC6077E
 for <iommu@lists.linux-foundation.org>; Thu, 14 Oct 2021 05:42:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m82Peb3_xMVd for <iommu@lists.linux-foundation.org>;
 Thu, 14 Oct 2021 05:42:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7D37607BA
 for <iommu@lists.linux-foundation.org>; Thu, 14 Oct 2021 05:42:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="214543995"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="214543995"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 22:42:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="626685201"
Received: from allen-box.sh.intel.com ([10.239.159.118])
 by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2021 22:42:42 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 1/9] iommu/vt-d: Do not falsely log intel_iommu is unsupported
 kernel option
Date: Thu, 14 Oct 2021 13:38:31 +0800
Message-Id: <20211014053839.727419-2-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211014053839.727419-1-baolu.lu@linux.intel.com>
References: <20211014053839.727419-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: Fenghua Yu <fenghua.yu@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Eero Tamminen <eero.t.tamminen@intel.com>,
 Kyung Min Park <kyung.min.park@intel.com>, iommu@lists.linux-foundation.org,
 Longpeng <longpeng2@huawei.com>
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

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Handling of intel_iommu kernel command line option should return "true" to
indicate option is valid and so avoid logging it as unknown by the core
parsing code.

Also log unknown sub-options at the notice level to let user know of
potential typos or similar.

Reported-by: Eero Tamminen <eero.t.tamminen@intel.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Link: https://lore.kernel.org/r/20210831112947.310080-1-tvrtko.ursulin@linux.intel.com
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/iommu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index d75f59ae28e6..9a356075d345 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -412,6 +412,7 @@ static int __init intel_iommu_setup(char *str)
 {
 	if (!str)
 		return -EINVAL;
+
 	while (*str) {
 		if (!strncmp(str, "on", 2)) {
 			dmar_disabled = 0;
@@ -441,13 +442,16 @@ static int __init intel_iommu_setup(char *str)
 		} else if (!strncmp(str, "tboot_noforce", 13)) {
 			pr_info("Intel-IOMMU: not forcing on after tboot. This could expose security risk for tboot\n");
 			intel_iommu_tboot_noforce = 1;
+		} else {
+			pr_notice("Unknown option - '%s'\n", str);
 		}
 
 		str += strcspn(str, ",");
 		while (*str == ',')
 			str++;
 	}
-	return 0;
+
+	return 1;
 }
 __setup("intel_iommu=", intel_iommu_setup);
 
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
