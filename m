Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2C9255E83
	for <lists.iommu@lfdr.de>; Fri, 28 Aug 2020 18:05:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CD07987FFE;
	Fri, 28 Aug 2020 16:05:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19bkyi0vNkyt; Fri, 28 Aug 2020 16:05:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4BAA887FF2;
	Fri, 28 Aug 2020 16:05:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33E76C0891;
	Fri, 28 Aug 2020 16:05:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13A6EC0051
 for <iommu@lists.linux-foundation.org>; Fri, 28 Aug 2020 16:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F0C7987FF2
 for <iommu@lists.linux-foundation.org>; Fri, 28 Aug 2020 16:05:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pJ0XQ8AKlE0j for <iommu@lists.linux-foundation.org>;
 Fri, 28 Aug 2020 16:05:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5420987FF7
 for <iommu@lists.linux-foundation.org>; Fri, 28 Aug 2020 16:05:22 +0000 (UTC)
IronPort-SDR: 5xP7DdtzhZFcn3hiAJ/c55j2sEbmwHJK1WjRTmhvzSfwBQM9/U7eXRtBsds/JcWtMM3BpBhRaH
 dx3HmoMbu4FA==
X-IronPort-AV: E=McAfee;i="6000,8403,9727"; a="241508123"
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; d="scan'208";a="241508123"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2020 09:05:05 -0700
IronPort-SDR: c4yyOz1OmFE2FTsEGeHYA1aMaud/gd43jVoMwSPhe8M6QKOwzfd8NimSQsLCjDio4V0kcs8C6L
 M+VU83igtXfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,364,1592895600"; d="scan'208";a="337534703"
Received: from black.fi.intel.com ([10.237.72.28])
 by FMSMGA003.fm.intel.com with ESMTP; 28 Aug 2020 09:05:03 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id D2991166; Fri, 28 Aug 2020 19:05:02 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 iommu@lists.linux-foundation.org, Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v1] iommu/vt-d: Move intel_iommu_ops to header file
Date: Fri, 28 Aug 2020 19:05:02 +0300
Message-Id: <20200828160502.65695-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

Compiler is not happy about hidden declaration of intel_iommu_ops.

.../drivers/iommu/intel/iommu.c:414:24: warning: symbol 'intel_iommu_ops' was not declared. Should it be static?

Move declaration to header file to make compiler happy.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/iommu/intel/dmar.c  | 2 --
 include/linux/intel-iommu.h | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
index 93e6345f3414..538ee03a4f4a 100644
--- a/drivers/iommu/intel/dmar.c
+++ b/drivers/iommu/intel/dmar.c
@@ -64,8 +64,6 @@ static unsigned long dmar_seq_ids[BITS_TO_LONGS(DMAR_UNITS_SUPPORTED)];
 static int alloc_iommu(struct dmar_drhd_unit *drhd);
 static void free_iommu(struct intel_iommu *iommu);
 
-extern const struct iommu_ops intel_iommu_ops;
-
 static void dmar_register_drhd_unit(struct dmar_drhd_unit *drhd)
 {
 	/*
diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
index b1ed2f25f7c0..64fa5c56c825 100644
--- a/include/linux/intel-iommu.h
+++ b/include/linux/intel-iommu.h
@@ -787,6 +787,8 @@ struct context_entry *iommu_context_addr(struct intel_iommu *iommu, u8 bus,
 					 u8 devfn, int alloc);
 
 #ifdef CONFIG_INTEL_IOMMU
+extern const struct iommu_ops intel_iommu_ops;
+
 extern int iommu_calculate_agaw(struct intel_iommu *iommu);
 extern int iommu_calculate_max_sagaw(struct intel_iommu *iommu);
 extern int dmar_disabled;
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
