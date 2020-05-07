Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 235711C963B
	for <lists.iommu@lfdr.de>; Thu,  7 May 2020 18:18:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 726762040F;
	Thu,  7 May 2020 16:18:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1bhpbnH0CFTS; Thu,  7 May 2020 16:18:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5B9762107D;
	Thu,  7 May 2020 16:18:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55044C07FF;
	Thu,  7 May 2020 16:18:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4A500C07FF
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 16:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 291BA2046E
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 16:18:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uka-YoqBi4VZ for <iommu@lists.linux-foundation.org>;
 Thu,  7 May 2020 16:18:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by silver.osuosl.org (Postfix) with ESMTPS id BA1B42040F
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 16:18:09 +0000 (UTC)
IronPort-SDR: nfChbBqncUoKJs2QEbb5XU0mW2kBj3T/wDUeiXSNZ/c/BP2OxxiRzxFMBOPJj1QD4iPU3JZwmS
 1ipChYh2vx5w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 09:18:08 -0700
IronPort-SDR: RxDn4q3QhFbpQQwxrEwVYfPivfq8iQHQc1LKw4ZML0x1mSoC6dXPs3ewFFsRr0B+4s3h+laacp
 5GnlzG7S/NMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,364,1583222400"; d="scan'208";a="339399254"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga001.jf.intel.com with ESMTP; 07 May 2020 09:18:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 3F3DF124; Thu,  7 May 2020 19:18:06 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux-foundation.org
Subject: [PATCH v1 3/3] iommu/amd: Unify format of the printed messages
Date: Thu,  7 May 2020 19:18:04 +0300
Message-Id: <20200507161804.13275-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200507161804.13275-1-andriy.shevchenko@linux.intel.com>
References: <20200507161804.13275-1-andriy.shevchenko@linux.intel.com>
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

Unify format of the printed messages, i.e. replace printk(LEVEL ... )
with pr_level(...).

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/iommu/amd_iommu_types.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/amd_iommu_types.h b/drivers/iommu/amd_iommu_types.h
index ca8c4522045b3..cf829ebe37cb5 100644
--- a/drivers/iommu/amd_iommu_types.h
+++ b/drivers/iommu/amd_iommu_types.h
@@ -395,10 +395,10 @@
 #define PD_IOMMUV2_MASK		(1UL << 3) /* domain has gcr3 table */
 
 extern bool amd_iommu_dump;
-#define DUMP_printk(format, arg...)					\
-	do {								\
-		if (amd_iommu_dump)						\
-			printk(KERN_INFO "AMD-Vi: " format, ## arg);	\
+#define DUMP_printk(format, arg...)				\
+	do {							\
+		if (amd_iommu_dump)				\
+			pr_info("AMD-Vi: " format, ## arg);	\
 	} while(0);
 
 /* global flag if IOMMUs cache non-present entries */
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
