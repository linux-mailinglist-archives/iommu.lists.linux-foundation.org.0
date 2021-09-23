Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAF1416492
	for <lists.iommu@lfdr.de>; Thu, 23 Sep 2021 19:43:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0B0C83EE5;
	Thu, 23 Sep 2021 17:43:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TicBmbVNEKIK; Thu, 23 Sep 2021 17:43:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id EED5284119;
	Thu, 23 Sep 2021 17:43:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A0D5C0029;
	Thu, 23 Sep 2021 17:43:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40845C000D
 for <iommu@lists.linux-foundation.org>; Thu, 23 Sep 2021 17:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C09240201
 for <iommu@lists.linux-foundation.org>; Thu, 23 Sep 2021 17:26:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NZDaQMUp_Jmr for <iommu@lists.linux-foundation.org>;
 Thu, 23 Sep 2021 17:26:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7133A401B2
 for <iommu@lists.linux-foundation.org>; Thu, 23 Sep 2021 17:26:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10116"; a="223933658"
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="223933658"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 10:26:54 -0700
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; d="scan'208";a="704832533"
Received: from unknown (HELO bad-guy.kumite) ([10.252.132.140])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 10:26:53 -0700
From: Ben Widawsky <ben.widawsky@intel.com>
To: linux-cxl@vger.kernel.org
Subject: [PATCH v2 3/9] cxl/pci: Remove pci request/release regions
Date: Thu, 23 Sep 2021 10:26:41 -0700
Message-Id: <20210923172647.72738-4-ben.widawsky@intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210923172647.72738-1-ben.widawsky@intel.com>
References: <20210923172647.72738-1-ben.widawsky@intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 23 Sep 2021 17:43:10 +0000
Cc: Ben Widawsky <ben.widawsky@intel.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <helgaas@kernel.org>,
 "David E. Box" <david.e.box@linux.intel.com>,
 Dan Williams <dan.j.williams@intel.com>, David Woodhouse <dwmw2@infradead.org>,
 Kan Liang <kan.liang@linux.intel.com>
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

Quoting Dan, "... the request + release regions should probably just be
dropped. It's not like any of the register enumeration would collide
with someone else who already has the registers mapped. The collision
only comes when the registers are mapped for their final usage, and that
will have more precision in the request."

Recommended-by: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
---
 drivers/cxl/pci.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/cxl/pci.c b/drivers/cxl/pci.c
index ccc7c2573ddc..7256c236fdb3 100644
--- a/drivers/cxl/pci.c
+++ b/drivers/cxl/pci.c
@@ -453,9 +453,6 @@ static int cxl_pci_setup_regs(struct cxl_mem *cxlm)
 		return -ENXIO;
 	}
 
-	if (pci_request_mem_regions(pdev, pci_name(pdev)))
-		return -ENODEV;
-
 	/* Get the size of the Register Locator DVSEC */
 	pci_read_config_dword(pdev, regloc + PCI_DVSEC_HEADER1, &regloc_size);
 	regloc_size = FIELD_GET(PCI_DVSEC_HEADER1_LENGTH_MASK, regloc_size);
@@ -499,8 +496,6 @@ static int cxl_pci_setup_regs(struct cxl_mem *cxlm)
 		n_maps++;
 	}
 
-	pci_release_mem_regions(pdev);
-
 	for (i = 0; i < n_maps; i++) {
 		ret = cxl_map_regs(cxlm, &maps[i]);
 		if (ret)
-- 
2.33.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
