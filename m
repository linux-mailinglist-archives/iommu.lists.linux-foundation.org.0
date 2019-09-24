Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DC4BD2DE
	for <lists.iommu@lfdr.de>; Tue, 24 Sep 2019 21:38:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 08DF6C5D;
	Tue, 24 Sep 2019 19:37:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 618CACAE
	for <iommu@lists.linux-foundation.org>;
	Tue, 24 Sep 2019 19:37:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 058A587D
	for <iommu@lists.linux-foundation.org>;
	Tue, 24 Sep 2019 19:37:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Sep 2019 12:37:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,545,1559545200"; d="scan'208";a="389971999"
Received: from black.fi.intel.com ([10.237.72.28])
	by fmsmga006.fm.intel.com with ESMTP; 24 Sep 2019 12:37:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C48F4F9; Tue, 24 Sep 2019 22:37:42 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org
Subject: [PATCH v2 2/6] ACPI / utils: Move acpi_dev_get_first_match_dev()
	under CONFIG_ACPI
Date: Tue, 24 Sep 2019 22:37:35 +0300
Message-Id: <20190924193739.86133-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190924193739.86133-1-andriy.shevchenko@linux.intel.com>
References: <20190924193739.86133-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	kbuild test robot <lkp@intel.com>
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

We have a stub defined for the acpi_dev_get_first_match_dev() in acpi.h
for the case when CONFIG_ACPI=n.

Moreover, acpi_dev_put(), counterpart function, is already placed under
CONFIG_ACPI.

Thus, move acpi_dev_get_first_match_dev() under CONFIG_ACPI as well.

Fixes: 817b4d64da03 ("Introduce acpi_dev_get_first_match_dev() helper")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/acpi/acpi_bus.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 175f7b40c585..3f6fddeb7519 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -78,9 +78,6 @@ acpi_evaluate_dsm_typed(acpi_handle handle, const guid_t *guid, u64 rev,
 bool acpi_dev_found(const char *hid);
 bool acpi_dev_present(const char *hid, const char *uid, s64 hrv);
 
-struct acpi_device *
-acpi_dev_get_first_match_dev(const char *hid, const char *uid, s64 hrv);
-
 #ifdef CONFIG_ACPI
 
 #include <linux/proc_fs.h>
@@ -683,6 +680,9 @@ static inline bool acpi_device_can_poweroff(struct acpi_device *adev)
 		adev->power.states[ACPI_STATE_D3_HOT].flags.explicit_set);
 }
 
+struct acpi_device *
+acpi_dev_get_first_match_dev(const char *hid, const char *uid, s64 hrv);
+
 static inline void acpi_dev_put(struct acpi_device *adev)
 {
 	put_device(&adev->dev);
-- 
2.23.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
