Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D1126204458
	for <lists.iommu@lfdr.de>; Tue, 23 Jun 2020 01:18:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 811378870A;
	Mon, 22 Jun 2020 23:18:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T4wgnqlhUrDz; Mon, 22 Jun 2020 23:18:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A48498872B;
	Mon, 22 Jun 2020 23:18:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 912D9C089E;
	Mon, 22 Jun 2020 23:18:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38359C016F
 for <iommu@lists.linux-foundation.org>; Mon, 22 Jun 2020 23:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 24B3C261E5
 for <iommu@lists.linux-foundation.org>; Mon, 22 Jun 2020 23:18:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JqMg7nDZx+PG for <iommu@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 23:18:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by silver.osuosl.org (Postfix) with ESMTPS id 36D9025296
 for <iommu@lists.linux-foundation.org>; Mon, 22 Jun 2020 23:18:07 +0000 (UTC)
IronPort-SDR: 0vGHi4sR2tJZ/HkJIaDXaC6Sl7Hf1Y4ZukwveYGxt3lu9eVgGM12vCRjW99A16PW0aD9ZvL8iy
 +W8BgkAAMhJw==
X-IronPort-AV: E=McAfee;i="6000,8403,9660"; a="161982984"
X-IronPort-AV: E=Sophos;i="5.75,268,1589266800"; d="scan'208";a="161982984"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2020 16:18:05 -0700
IronPort-SDR: Cj7AQv4B1Kxl5fdWhPt7Ml7Trkx5AXeiFIF953Y/0nwqrzNTvKs35c/iTMUjmQAjymRfcyc1e8
 lC1xyqCndTjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,268,1589266800"; d="scan'208";a="301006548"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by fmsmga004.fm.intel.com with ESMTP; 22 Jun 2020 16:18:04 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 4/6] iommu/vt-d: Enable PCI ACS for platform opt in hint
Date: Tue, 23 Jun 2020 07:13:43 +0800
Message-Id: <20200622231345.29722-5-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200622231345.29722-1-baolu.lu@linux.intel.com>
References: <20200622231345.29722-1-baolu.lu@linux.intel.com>
Cc: Lalithambika Krishnakumar <lalithambika.krishnakumar@intel.com>,
 iommu@lists.linux-foundation.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Ashok Raj <ashok.raj@intel.com>
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

PCI ACS is disabled if Intel IOMMU is off by default or intel_iommu=off
is used in command line. Unfortunately, Intel IOMMU will be forced on if
there're devices sitting on an external facing PCI port that is marked
as untrusted (for example, thunderbolt peripherals). That means, PCI ACS
is disabled while Intel IOMMU is forced on to isolate those devices. As
the result, the devices of an MFD will be grouped by a single group even
the ACS is supported on device.

[    0.691263] pci 0000:00:07.1: Adding to iommu group 3
[    0.691277] pci 0000:00:07.2: Adding to iommu group 3
[    0.691292] pci 0000:00:07.3: Adding to iommu group 3

Fix it by requesting PCI ACS when Intel IOMMU is detected with platform
opt in hint.

Fixes: 89a6079df791a ("iommu/vt-d: Force IOMMU on for platform opt in hint")
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Ashok Raj <ashok.raj@intel.com>
Co-developed-by: Lalithambika Krishnakumar <lalithambika.krishnakumar@intel.com>
Signed-off-by: Lalithambika Krishnakumar <lalithambika.krishnakumar@intel.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/iommu/intel/dmar.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
index cc46dff98fa0..683b812c5c47 100644
--- a/drivers/iommu/intel/dmar.c
+++ b/drivers/iommu/intel/dmar.c
@@ -898,7 +898,8 @@ int __init detect_intel_iommu(void)
 	if (!ret)
 		ret = dmar_walk_dmar_table((struct acpi_table_dmar *)dmar_tbl,
 					   &validate_drhd_cb);
-	if (!ret && !no_iommu && !iommu_detected && !dmar_disabled) {
+	if (!ret && !no_iommu && !iommu_detected &&
+	    (!dmar_disabled || dmar_platform_optin())) {
 		iommu_detected = 1;
 		/* Make sure ACS will be enabled */
 		pci_request_acs();
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
