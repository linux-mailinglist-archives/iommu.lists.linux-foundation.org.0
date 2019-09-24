Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B965CBC775
	for <lists.iommu@lfdr.de>; Tue, 24 Sep 2019 14:02:10 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9E376CD3;
	Tue, 24 Sep 2019 12:02:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 76885CBB
	for <iommu@lists.linux-foundation.org>;
	Tue, 24 Sep 2019 12:02:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E5A5B102
	for <iommu@lists.linux-foundation.org>;
	Tue, 24 Sep 2019 12:01:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Sep 2019 05:01:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,544,1559545200"; d="scan'208";a="179460795"
Received: from black.fi.intel.com ([10.237.72.28])
	by orsmga007.jf.intel.com with ESMTP; 24 Sep 2019 05:01:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3CD28228; Tue, 24 Sep 2019 15:01:54 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org
Subject: [PATCH v1 1/5] ACPI / utils: Describe function parameters in
	kernel-doc
Date: Tue, 24 Sep 2019 15:01:49 +0300
Message-Id: <20190924120153.8382-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
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

Kernel documentation script complains that some of the function parameters
are not described:

drivers/acpi/utils.c:462: warning: Function parameter or member 'handle' not described in 'acpi_handle_path'
drivers/acpi/utils.c:484: warning: Function parameter or member 'level' not described in 'acpi_handle_printk'
drivers/acpi/utils.c:484: warning: Function parameter or member 'handle' not described in 'acpi_handle_printk'
drivers/acpi/utils.c:484: warning: Function parameter or member 'fmt' not described in 'acpi_handle_printk'
drivers/acpi/utils.c:513: warning: Function parameter or member 'descriptor' not described in '__acpi_handle_debug'
drivers/acpi/utils.c:513: warning: Function parameter or member 'handle' not described in '__acpi_handle_debug'
drivers/acpi/utils.c:513: warning: Function parameter or member 'fmt' not described in '__acpi_handle_debug'

Describe function parameters where it's appropriate.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/acpi/utils.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/acpi/utils.c b/drivers/acpi/utils.c
index e3974a8f8fd4..dbd1c4cfd7d1 100644
--- a/drivers/acpi/utils.c
+++ b/drivers/acpi/utils.c
@@ -455,6 +455,7 @@ EXPORT_SYMBOL(acpi_evaluate_ost);
 
 /**
  * acpi_handle_path: Return the object path of handle
+ * @handle: ACPI device handle
  *
  * Caller must free the returned buffer
  */
@@ -473,6 +474,9 @@ static char *acpi_handle_path(acpi_handle handle)
 
 /**
  * acpi_handle_printk: Print message with ACPI prefix and object path
+ * @level: log level
+ * @handle: ACPI device handle
+ * @fmt: format string
  *
  * This function is called through acpi_handle_<level> macros and prints
  * a message with ACPI prefix and object path.  This function acquires
@@ -501,6 +505,9 @@ EXPORT_SYMBOL(acpi_handle_printk);
 #if defined(CONFIG_DYNAMIC_DEBUG)
 /**
  * __acpi_handle_debug: pr_debug with ACPI prefix and object path
+ * @descriptor: Dynamic Debug descriptor
+ * @handle: ACPI device handle
+ * @fmt: format string
  *
  * This function is called through acpi_handle_debug macro and debug
  * prints a message with ACPI prefix and object path. This function
-- 
2.23.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
