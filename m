Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A72342A1F
	for <lists.iommu@lfdr.de>; Sat, 20 Mar 2021 04:03:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B749340329;
	Sat, 20 Mar 2021 03:03:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xks6rwLsUf_i; Sat, 20 Mar 2021 03:03:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBE7C4035E;
	Sat, 20 Mar 2021 03:03:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D144C0016;
	Sat, 20 Mar 2021 03:03:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39C18C0001
 for <iommu@lists.linux-foundation.org>; Sat, 20 Mar 2021 03:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23697401B0
 for <iommu@lists.linux-foundation.org>; Sat, 20 Mar 2021 03:03:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OEOECOMPW968 for <iommu@lists.linux-foundation.org>;
 Sat, 20 Mar 2021 03:03:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 82829401AF
 for <iommu@lists.linux-foundation.org>; Sat, 20 Mar 2021 03:03:49 +0000 (UTC)
IronPort-SDR: ++2fAZK3DJmXn5z4UfjP/g/Pq7Fa79Ak7sZOPJlwU7cGSfLfBolmDoEJTH2sXAaFLKUGaA/k57
 rqzZXYmOix2g==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="177134320"
X-IronPort-AV: E=Sophos;i="5.81,263,1610438400"; d="scan'208";a="177134320"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 20:03:49 -0700
IronPort-SDR: GtzBBybHgTE+q3gu17H1/MN7s+4+3UH6qtj1OQ6e8CwwqZDyOkXzcS0jT7MpqN0HdGy37AVFAE
 tRcWQAiNCrTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,263,1610438400"; d="scan'208";a="441520667"
Received: from allen-box.sh.intel.com ([10.239.159.128])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Mar 2021 20:03:47 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 5/5] iommu/vt-d: Avoid unnecessary cache flush in pasid
 entry teardown
Date: Sat, 20 Mar 2021 10:54:15 +0800
Message-Id: <20210320025415.641201-6-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210320025415.641201-1-baolu.lu@linux.intel.com>
References: <20210320025415.641201-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

When a present pasid entry is disassembled, all kinds of pasid related
caches need to be flushed. But when a pasid entry is not being used
(PRESENT bit not set), we don't need to do this. Check the PRESENT bit
in intel_pasid_tear_down_entry() and avoid flushing caches if it's not
set.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel/pasid.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/intel/pasid.c b/drivers/iommu/intel/pasid.c
index dd69df5a188a..7a73385edcc0 100644
--- a/drivers/iommu/intel/pasid.c
+++ b/drivers/iommu/intel/pasid.c
@@ -502,6 +502,9 @@ void intel_pasid_tear_down_entry(struct intel_iommu *iommu, struct device *dev,
 	if (WARN_ON(!pte))
 		return;
 
+	if (!(pte->val[0] & PASID_PTE_PRESENT))
+		return;
+
 	did = pasid_get_domain_id(pte);
 	intel_pasid_clear_entry(dev, pasid, fault_ignore);
 
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
