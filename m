Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 10832BD2DF
	for <lists.iommu@lfdr.de>; Tue, 24 Sep 2019 21:38:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2A166E1D;
	Tue, 24 Sep 2019 19:37:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0E402CCB
	for <iommu@lists.linux-foundation.org>;
	Tue, 24 Sep 2019 19:37:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A916A87D
	for <iommu@lists.linux-foundation.org>;
	Tue, 24 Sep 2019 19:37:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Sep 2019 12:37:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,545,1559545200"; d="scan'208";a="213800081"
Received: from black.fi.intel.com ([10.237.72.28])
	by fmsmga004.fm.intel.com with ESMTP; 24 Sep 2019 12:37:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id CEA331A1; Tue, 24 Sep 2019 22:37:42 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org
Subject: [PATCH v2 3/6] ACPI / utils: Introduce acpi_dev_hid_uid_match() helper
Date: Tue, 24 Sep 2019 22:37:36 +0300
Message-Id: <20190924193739.86133-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190924193739.86133-1-andriy.shevchenko@linux.intel.com>
References: <20190924193739.86133-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
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

There are users outside of ACPI realm which reimplementing the comparator
function to check if the given device matches to given HID and UID.

For better utilization, introduce a helper for everyone to use.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/acpi/utils.c    | 25 +++++++++++++++++++++++++
 include/acpi/acpi_bus.h |  2 ++
 include/linux/acpi.h    |  6 ++++++
 3 files changed, 33 insertions(+)

diff --git a/drivers/acpi/utils.c b/drivers/acpi/utils.c
index dbd1c4cfd7d1..804ac0df58ec 100644
--- a/drivers/acpi/utils.c
+++ b/drivers/acpi/utils.c
@@ -701,6 +701,31 @@ bool acpi_check_dsm(acpi_handle handle, const guid_t *guid, u64 rev, u64 funcs)
 }
 EXPORT_SYMBOL(acpi_check_dsm);
 
+/**
+ * acpi_dev_hid_uid_match - Match device by supplied HID and UID
+ * @adev: ACPI device to match.
+ * @hid2: Hardware ID of the device.
+ * @uid2: Unique ID of the device, pass NULL to not check _UID.
+ *
+ * Matches HID and UID in @adev with given @hid2 and @uid2.
+ * Returns true if matches.
+ */
+bool acpi_dev_hid_uid_match(struct acpi_device *adev,
+			    const char *hid2, const char *uid2)
+{
+	const char *hid1 = acpi_device_hid(adev);
+	const char *uid1 = acpi_device_uid(adev);
+
+	if (strcmp(hid1, hid2))
+		return false;
+
+	if (!uid2)
+		return true;
+
+	return uid1 && !strcmp(uid1, uid2);
+}
+EXPORT_SYMBOL(acpi_dev_hid_uid_match);
+
 /**
  * acpi_dev_found - Detect presence of a given ACPI device in the namespace.
  * @hid: Hardware ID of the device.
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 3f6fddeb7519..0c23fd0548d1 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -680,6 +680,8 @@ static inline bool acpi_device_can_poweroff(struct acpi_device *adev)
 		adev->power.states[ACPI_STATE_D3_HOT].flags.explicit_set);
 }
 
+bool acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2, const char *uid2);
+
 struct acpi_device *
 acpi_dev_get_first_match_dev(const char *hid, const char *uid, s64 hrv);
 
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 9426b9aaed86..34778e4757fd 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -672,6 +672,12 @@ static inline bool acpi_dev_present(const char *hid, const char *uid, s64 hrv)
 	return false;
 }
 
+static inline bool
+acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2, const char *uid2)
+{
+	return false;
+}
+
 static inline struct acpi_device *
 acpi_dev_get_first_match_dev(const char *hid, const char *uid, s64 hrv)
 {
-- 
2.23.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
