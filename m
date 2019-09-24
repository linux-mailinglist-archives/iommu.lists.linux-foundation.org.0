Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 081FABD2D9
	for <lists.iommu@lfdr.de>; Tue, 24 Sep 2019 21:37:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 437C7CDF;
	Tue, 24 Sep 2019 19:37:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 05F5BC51
	for <iommu@lists.linux-foundation.org>;
	Tue, 24 Sep 2019 19:37:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A58488A
	for <iommu@lists.linux-foundation.org>;
	Tue, 24 Sep 2019 19:37:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Sep 2019 12:37:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,545,1559545200"; d="scan'208";a="193540242"
Received: from black.fi.intel.com ([10.237.72.28])
	by orsmga006.jf.intel.com with ESMTP; 24 Sep 2019 12:37:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A5CF2F1; Tue, 24 Sep 2019 22:37:42 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org
Subject: [PATCH v2 0/6] ACPI / utils: add new helper for HID/UID match
Date: Tue, 24 Sep 2019 22:37:33 +0300
Message-Id: <20190924193739.86133-1-andriy.shevchenko@linux.intel.com>
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

There are few users outside of ACPI realm that re-introduce a custom
solution to match ACPI device against HID/UID. Add a generic helper for
them.

The series is supposed to go via linux-pm tree.

In v2:
- add patch 2 due to latent issue in the header (lkp)
- get rid of match_hid_uid() completely in patch 6

Andy Shevchenko (6):
  ACPI / utils: Describe function parameters in kernel-doc
  ACPI / utils: Move acpi_dev_get_first_match_dev() under CONFIG_ACPI
  ACPI / utils: Introduce acpi_dev_hid_uid_match() helper
  ACPI / LPSS: Switch to use acpi_dev_hid_uid_match()
  mmc: sdhci-acpi: Switch to use acpi_dev_hid_uid_match()
  iommu/amd: Switch to use acpi_dev_hid_uid_match()

 drivers/acpi/acpi_lpss.c      | 21 +++------------
 drivers/acpi/utils.c          | 32 +++++++++++++++++++++++
 drivers/iommu/amd_iommu.c     | 30 ++++-----------------
 drivers/mmc/host/sdhci-acpi.c | 49 ++++++++++++-----------------------
 include/acpi/acpi_bus.h       |  8 +++---
 include/linux/acpi.h          |  6 +++++
 6 files changed, 67 insertions(+), 79 deletions(-)

-- 
2.23.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
