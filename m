Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 15ABD30D67B
	for <lists.iommu@lfdr.de>; Wed,  3 Feb 2021 10:42:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 52CA885E9B;
	Wed,  3 Feb 2021 09:42:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YFqxSzw1vjP8; Wed,  3 Feb 2021 09:42:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BBA4F85EC1;
	Wed,  3 Feb 2021 09:42:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9D60CC013A;
	Wed,  3 Feb 2021 09:42:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05C3EC013A
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 09:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F28E086777
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 09:42:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QIZq-zOnbMkP for <iommu@lists.linux-foundation.org>;
 Wed,  3 Feb 2021 09:42:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5DC9186456
 for <iommu@lists.linux-foundation.org>; Wed,  3 Feb 2021 09:42:12 +0000 (UTC)
IronPort-SDR: /Fq2vtqTziuPO7mwvnlPhT+JGQqZGi4uRq78NdZm3+OAM7LhUD5L30/WSMElF5wc0dCvZpRw6n
 XfSP6LnC4XEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="181160144"
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; d="scan'208";a="181160144"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 01:42:12 -0800
IronPort-SDR: Oj/AwqmLP8X7/oF8k9PImRunuUL43VquS249Ptf+A3sBvb3qDGT0SzkvEUyhdG2jKQdItJWUHi
 wUg+szf8ggGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; d="scan'208";a="480285030"
Received: from allen-box.sh.intel.com ([10.239.159.128])
 by fmsmga001.fm.intel.com with ESMTP; 03 Feb 2021 01:42:10 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v2 1/3] iommu/vt-d: Add new enum value and structure for SATC
Date: Wed,  3 Feb 2021 17:33:26 +0800
Message-Id: <20210203093329.1617808-2-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203093329.1617808-1-baolu.lu@linux.intel.com>
References: <20210203093329.1617808-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: Ashok Raj <ashok.raj@intel.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>
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
a list of the devices that require ATS for normal device operation. It
is a functional requirement that these devices will not work without OS
enabling ATS capability.

This patch introduces the new enum value and structure to represent the
remapping information. Kernel should parse the information from the
reporting structure and enable ATC for the devices as needed.

Signed-off-by: Yian Chen <yian.chen@intel.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 include/acpi/actbl1.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/acpi/actbl1.h b/include/acpi/actbl1.h
index 43549547ed3e..c38e08cf1b9e 100644
--- a/include/acpi/actbl1.h
+++ b/include/acpi/actbl1.h
@@ -514,7 +514,8 @@ enum acpi_dmar_type {
 	ACPI_DMAR_TYPE_ROOT_ATS = 2,
 	ACPI_DMAR_TYPE_HARDWARE_AFFINITY = 3,
 	ACPI_DMAR_TYPE_NAMESPACE = 4,
-	ACPI_DMAR_TYPE_RESERVED = 5	/* 5 and greater are reserved */
+	ACPI_DMAR_TYPE_SATC = 5,
+	ACPI_DMAR_TYPE_RESERVED = 6	/* 6 and greater are reserved */
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
