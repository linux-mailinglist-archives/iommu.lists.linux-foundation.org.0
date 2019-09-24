Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E01B6BC778
	for <lists.iommu@lfdr.de>; Tue, 24 Sep 2019 14:02:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 32351D36;
	Tue, 24 Sep 2019 12:02:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D2516CD1
	for <iommu@lists.linux-foundation.org>;
	Tue, 24 Sep 2019 12:02:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 713C887D
	for <iommu@lists.linux-foundation.org>;
	Tue, 24 Sep 2019 12:02:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Sep 2019 05:01:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,544,1559545200"; d="scan'208";a="182892414"
Received: from black.fi.intel.com ([10.237.72.28])
	by orsmga008.jf.intel.com with ESMTP; 24 Sep 2019 05:01:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 4CE9596; Tue, 24 Sep 2019 15:01:54 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org
Subject: [PATCH v1 2/5] ACPI / utils: Introduce acpi_dev_hid_uid_match() helper
Date: Tue, 24 Sep 2019 15:01:50 +0300
Message-Id: <20190924120153.8382-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190924120153.8382-1-andriy.shevchenko@linux.intel.com>
References: <20190924120153.8382-1-andriy.shevchenko@linux.intel.com>
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
 include/acpi/acpi_bus.h |  3 +++
 include/linux/acpi.h    |  6 ++++++
 3 files changed, 34 insertions(+)

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
index 175f7b40c585..d3cc8a786065 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -75,6 +75,9 @@ acpi_evaluate_dsm_typed(acpi_handle handle, const guid_t *guid, u64 rev,
 	  .package.elements = (eles)			\
 	}
 
+bool acpi_dev_hid_uid_match(struct acpi_device *adev,
+			    const char *hid2, const char *uid2);
+
 bool acpi_dev_found(const char *hid);
 bool acpi_dev_present(const char *hid, const char *uid, s64 hrv);
 
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 9426b9aaed86..272b51a4f385 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -662,6 +662,12 @@ static inline u64 acpi_arch_get_root_pointer(void)
 
 struct fwnode_handle;
 
+static inline bool acpi_dev_hid_uid_match(struct acpi_device *adev,
+					  const char *hid2, const char *uid2)
+{
+	return false;
+}
+
 static inline bool acpi_dev_found(const char *hid)
 {
 	return false;
-- 
2.23.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
