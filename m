Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 38208416491
	for <lists.iommu@lfdr.de>; Thu, 23 Sep 2021 19:43:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC7E560BC1;
	Thu, 23 Sep 2021 17:43:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x9xKFg6gHQV0; Thu, 23 Sep 2021 17:43:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C1BB4606AE;
	Thu, 23 Sep 2021 17:43:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC5F3C0025;
	Thu, 23 Sep 2021 17:43:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 233ADC000D
 for <iommu@lists.linux-foundation.org>; Thu, 23 Sep 2021 17:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ED9C0403FF
 for <iommu@lists.linux-foundation.org>; Thu, 23 Sep 2021 17:26:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I1Ea6AyvAm2V for <iommu@lists.linux-foundation.org>;
 Thu, 23 Sep 2021 17:26:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6410400B5
 for <iommu@lists.linux-foundation.org>; Thu, 23 Sep 2021 17:26:53 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10116"; a="223933655"
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="223933655"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 10:26:52 -0700
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="704832519"
Received: from unknown (HELO bad-guy.kumite) ([10.252.132.140])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 10:26:51 -0700
From: Ben Widawsky <ben.widawsky@intel.com>
To: linux-cxl@vger.kernel.org
Subject: [PATCH v2 1/9] cxl: Convert "RBI" to enum
Date: Thu, 23 Sep 2021 10:26:39 -0700
Message-Id: <20210923172647.72738-2-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923172647.72738-1-ben.widawsky@intel.com>
References: <20210923172647.72738-1-ben.widawsky@intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 23 Sep 2021 17:43:10 +0000
Cc: Ben Widawsky <ben.widawsky@intel.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <helgaas@kernel.org>,
 "David E. Box" <david.e.box@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Kan Liang <kan.liang@linux.intel.com>
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

In preparation for passing around the Register Block Indicator (RBI) as
a parameter, it is desirable to convert the type to an enum so that the
interface can use a well defined type checked parameter.

As a result of this change, should future versions of the spec add
sparsely defined identifiers, it could become a problem if checking for
invalid identifiers since the code currently checks for the max
identifier. This is not an issue with current spec, and the algorithm to
obtain the register blocks will change before those possible additions
are made.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 drivers/cxl/pci.h | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/cxl/pci.h b/drivers/cxl/pci.h
index 8c1a58813816..7d3e4bf06b45 100644
--- a/drivers/cxl/pci.h
+++ b/drivers/cxl/pci.h
@@ -20,13 +20,15 @@
 #define CXL_REGLOC_BIR_MASK GENMASK(2, 0)
 
 /* Register Block Identifier (RBI) */
-#define CXL_REGLOC_RBI_MASK GENMASK(15, 8)
-#define CXL_REGLOC_RBI_EMPTY 0
-#define CXL_REGLOC_RBI_COMPONENT 1
-#define CXL_REGLOC_RBI_VIRT 2
-#define CXL_REGLOC_RBI_MEMDEV 3
-#define CXL_REGLOC_RBI_TYPES CXL_REGLOC_RBI_MEMDEV + 1
+enum cxl_regloc_type {
+	CXL_REGLOC_RBI_EMPTY = 0,
+	CXL_REGLOC_RBI_COMPONENT,
+	CXL_REGLOC_RBI_VIRT,
+	CXL_REGLOC_RBI_MEMDEV,
+	CXL_REGLOC_RBI_TYPES
+};
 
+#define CXL_REGLOC_RBI_MASK GENMASK(15, 8)
 #define CXL_REGLOC_ADDR_MASK GENMASK(31, 16)
 
 #endif /* __CXL_PCI_H__ */
-- 
2.33.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
