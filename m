Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FCA30B6B2
	for <lists.iommu@lfdr.de>; Tue,  2 Feb 2021 05:49:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E470786F67;
	Tue,  2 Feb 2021 04:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f7oXTOHnPeP2; Tue,  2 Feb 2021 04:49:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6FF0D86E88;
	Tue,  2 Feb 2021 04:49:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C053C013A;
	Tue,  2 Feb 2021 04:49:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48763C013A
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 04:49:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 44C198667A
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 04:49:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BtVLUPavyCkg for <iommu@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 04:49:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7E6A98665D
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 04:49:27 +0000 (UTC)
IronPort-SDR: T/kGWAvDkcbHF0mVeYHDg9RIlwuj+1yn5bUb4itzkS/Pvoh0czGBz1APJFInVEbUmbeg77m2DG
 To8GBZdnH55g==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="199708354"
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; d="scan'208";a="199708354"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 20:49:27 -0800
IronPort-SDR: wAxT30eNnXWM0H40ErK8jQjP1Q9pZ/al1hrouLQk5jVS0VeY2tqaA/bT85AeSabvD5tnK/ejrc
 CJ1cfUArULog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,394,1602572400"; d="scan'208";a="479423181"
Received: from allen-box.sh.intel.com ([10.239.159.128])
 by fmsmga001.fm.intel.com with ESMTP; 01 Feb 2021 20:49:25 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 1/3] iommu/vt-d: Add new enum value and structure for SATC
Date: Tue,  2 Feb 2021 12:40:55 +0800
Message-Id: <20210202044057.615277-2-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210202044057.615277-1-baolu.lu@linux.intel.com>
References: <20210202044057.615277-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: Ashok Raj <ashok.raj@intel.com>, linux-kernel@vger.kernel.org
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

From: Yian Chen <yian.chen@intel.com>

Starting from Intel Platform VT-d v3.2, BIOS may provide new remapping
structure SATC for SOC integrated devices, according to section 8.8 of
Intel VT-d architecture specification v3.2. The SATC structure reports
a list of the devices that require SATC enabling via ATS capacity.

This patch introduces the new enum value and structure to represent the
remapping information. Kernel should parse the information from the
reporting structure and enable ATC for the devices as needed.

Signed-off-by: Yian Chen <yian.chen@intel.com>
---
 include/acpi/actbl1.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/acpi/actbl1.h b/include/acpi/actbl1.h
index 43549547ed3e..b7ca802b66d2 100644
--- a/include/acpi/actbl1.h
+++ b/include/acpi/actbl1.h
@@ -514,7 +514,8 @@ enum acpi_dmar_type {
 	ACPI_DMAR_TYPE_ROOT_ATS = 2,
 	ACPI_DMAR_TYPE_HARDWARE_AFFINITY = 3,
 	ACPI_DMAR_TYPE_NAMESPACE = 4,
-	ACPI_DMAR_TYPE_RESERVED = 5	/* 5 and greater are reserved */
+	ACPI_DMAR_TYPE_SATC = 5,
+	ACPI_DMAR_TYPE_RESERVED = 6	/* 5 and greater are reserved */
 };
 
 /* DMAR Device Scope structure */
@@ -607,6 +608,14 @@ struct acpi_dmar_andd {
 	char device_name[1];
 };
 
+/* 5: SOC Integrated Address Translation Cache Reporting Structure */
+
+struct acpi_dmar_satc {
+	struct acpi_dmar_header header;
+	u8 flags;
+	u8 reserved;
+	u16 segment;
+};
 /*******************************************************************************
  *
  * DRTM - Dynamic Root of Trust for Measurement table
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
