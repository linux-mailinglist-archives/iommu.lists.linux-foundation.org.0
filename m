Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AF621BC779
	for <lists.iommu@lfdr.de>; Tue, 24 Sep 2019 14:02:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 51287D3E;
	Tue, 24 Sep 2019 12:02:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id F1B46CD9
	for <iommu@lists.linux-foundation.org>;
	Tue, 24 Sep 2019 12:02:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A184689E
	for <iommu@lists.linux-foundation.org>;
	Tue, 24 Sep 2019 12:02:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Sep 2019 05:01:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,544,1559545200"; d="scan'208";a="218602779"
Received: from black.fi.intel.com ([10.237.72.28])
	by fmsmga002.fm.intel.com with ESMTP; 24 Sep 2019 05:01:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6CB5B320; Tue, 24 Sep 2019 15:01:54 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org
Subject: [PATCH v1 5/5] iommu/amd: Switch to use acpi_dev_hid_uid_match()
Date: Tue, 24 Sep 2019 15:01:53 +0300
Message-Id: <20190924120153.8382-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190924120153.8382-1-andriy.shevchenko@linux.intel.com>
References: <20190924120153.8382-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

Since we have a generic helper, drop custom implementation in the driver.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/iommu/amd_iommu.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index 61de81965c44..bad1bcea4ea1 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -129,24 +129,11 @@ static inline int match_hid_uid(struct device *dev,
 				struct acpihid_map_entry *entry)
 {
 	struct acpi_device *adev = ACPI_COMPANION(dev);
-	const char *hid, *uid;
 
 	if (!adev)
 		return -ENODEV;
 
-	hid = acpi_device_hid(adev);
-	uid = acpi_device_uid(adev);
-
-	if (!hid || !(*hid))
-		return -ENODEV;
-
-	if (!uid || !(*uid))
-		return strcmp(hid, entry->hid);
-
-	if (!(*entry->uid))
-		return strcmp(hid, entry->hid);
-
-	return (strcmp(hid, entry->hid) || strcmp(uid, entry->uid));
+	return acpi_dev_hid_uid_match(adev, entry->hid, entry->uid) ? 0 : -ENODEV;
 }
 
 static inline u16 get_pci_device_id(struct device *dev)
-- 
2.23.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
