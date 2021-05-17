Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7BE3824E0
	for <lists.iommu@lfdr.de>; Mon, 17 May 2021 08:58:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F66A83AC9;
	Mon, 17 May 2021 06:58:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0p0SNDIhkHYf; Mon, 17 May 2021 06:58:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92C1F83AC7;
	Mon, 17 May 2021 06:58:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60E97C0001;
	Mon, 17 May 2021 06:58:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AB778C0001
 for <iommu@lists.linux-foundation.org>; Mon, 17 May 2021 06:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A4C8400E0
 for <iommu@lists.linux-foundation.org>; Mon, 17 May 2021 06:58:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GCQStXduQGQv for <iommu@lists.linux-foundation.org>;
 Mon, 17 May 2021 06:58:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6CF3B400DD
 for <iommu@lists.linux-foundation.org>; Mon, 17 May 2021 06:58:13 +0000 (UTC)
IronPort-SDR: JxdN90nXIJ888PFznIxeux3WZca3umE6UgTzorghbWSPv1YmAhug2q8bDXaZOi+OX5nffaAejw
 0GM8ANYS2IFg==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="198444123"
X-IronPort-AV: E=Sophos;i="5.82,306,1613462400"; d="scan'208";a="198444123"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2021 23:58:13 -0700
IronPort-SDR: +b6iXjPOeWDE8Px4zL1yzWrOmREE6ePkVz2Y2PBNBs2OiJl1JmKjcdhmIFaw6A7AIdyxdioW8g
 lzhjTKuTNekQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,306,1613462400"; d="scan'208";a="460174368"
Received: from allen-box.sh.intel.com ([10.239.159.128])
 by fmsmga004.fm.intel.com with ESMTP; 16 May 2021 23:57:54 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 1/1] iommu/vt-d: Support asynchronous IOMMU nested
 capabilities
Date: Mon, 17 May 2021 14:57:01 +0800
Message-Id: <20210517065701.5078-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: kevin.tian@intel.com, ashok.raj@intel.com, sanjay.k.kumar@intel.com,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 jacob.jun.pan@intel.com
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

Current VT-d implementation supports nested translation only if all
underlying IOMMUs support the nested capability. This is unnecessary
as the upper layer is allowed to create different containers and set
them with different type of iommu backend. The IOMMU driver needs to
guarantee that devices attached to a nested mode iommu_domain should
support nested capabilility.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/iommu.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

Change log:
v1->v2:
  - Remove unnecessary global capability check

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index f1742da42478..00c6611ee839 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -4755,6 +4755,13 @@ static int prepare_domain_attach_device(struct iommu_domain *domain,
 	if (!iommu)
 		return -ENODEV;
 
+	if ((dmar_domain->flags & DOMAIN_FLAG_NESTING_MODE) &&
+	    !ecap_nest(iommu->ecap)) {
+		dev_err(dev, "%s: iommu not support nested translation\n",
+			iommu->name);
+		return -EINVAL;
+	}
+
 	/* check if this iommu agaw is sufficient for max mapped address */
 	addr_width = agaw_to_width(iommu->agaw);
 	if (addr_width > cap_mgaw(iommu->cap))
@@ -5455,7 +5462,7 @@ intel_iommu_enable_nesting(struct iommu_domain *domain)
 	int ret = -ENODEV;
 
 	spin_lock_irqsave(&device_domain_lock, flags);
-	if (nested_mode_support() && list_empty(&dmar_domain->devices)) {
+	if (list_empty(&dmar_domain->devices)) {
 		dmar_domain->flags |= DOMAIN_FLAG_NESTING_MODE;
 		dmar_domain->flags &= ~DOMAIN_FLAG_USE_FIRST_LEVEL;
 		ret = 0;
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
