Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BBF31F4F1
	for <lists.iommu@lfdr.de>; Fri, 19 Feb 2021 07:02:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 583D087476;
	Fri, 19 Feb 2021 06:02:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dnD-hUuzW4Ja; Fri, 19 Feb 2021 06:02:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 952BD87302;
	Fri, 19 Feb 2021 06:02:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 82353C000D;
	Fri, 19 Feb 2021 06:02:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F30DEC000D
 for <iommu@lists.linux-foundation.org>; Fri, 19 Feb 2021 06:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E83B18739D
 for <iommu@lists.linux-foundation.org>; Fri, 19 Feb 2021 06:02:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y1yvFm0XA6bh for <iommu@lists.linux-foundation.org>;
 Fri, 19 Feb 2021 06:02:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3F23C872B2
 for <iommu@lists.linux-foundation.org>; Fri, 19 Feb 2021 06:02:30 +0000 (UTC)
IronPort-SDR: ePZ3jTXvinn3DrYoKuSsKsnX30En5vdTRTNDwVmM6zWhyL75h1HwYsViVauit1krjNCaqPDBIq
 1IKi2wDj5a7g==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="245198111"
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; d="scan'208";a="245198111"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 22:02:29 -0800
IronPort-SDR: q5sM8qjyrdiqLebPhYkAic93/sddjrQ8IqEV49ww5JS2AxoW1ah9ipbTfL3+8cWY6Y9uQwbXRG
 hGCwvhHxQbjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; d="scan'208";a="362829344"
Received: from otc-wp-03.jf.intel.com ([10.54.39.79])
 by orsmga003.jf.intel.com with ESMTP; 18 Feb 2021 22:02:29 -0800
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Joerg Roedel <joro@8bytes.org>, "Lu Baolu" <baolu.lu@linux.intel.com>
Subject: [PATCH 1/4] iommu/vt-d: Enable write protect for supervisor SVM
Date: Thu, 18 Feb 2021 13:31:15 -0800
Message-Id: <1613683878-89946-2-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613683878-89946-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1613683878-89946-1-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Raj Ashok <ashok.raj@intel.com>, Sanjay Kumar <sanjay.k.kumar@intel.com>,
 Yi Sun <yi.y.sun@intel.com>, Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Wu Hao <hao.wu@intel.com>
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

Write protect bit, when set, inhibits supervisor writes to the read-only
pages. In supervisor shared virtual addressing (SVA), where page tables
are shared between CPU and DMA, IOMMU PASID entry WPE bit should match
CR0.WP bit in the CPU.
This patch sets WPE bit for supervisor PASIDs if CR0.WP is set.

Signed-off-by: Sanjay Kumar <sanjay.k.kumar@intel.com>
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
---
 drivers/iommu/intel/pasid.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/iommu/intel/pasid.c b/drivers/iommu/intel/pasid.c
index 0cceaabc3ce6..0b7e0e726ade 100644
--- a/drivers/iommu/intel/pasid.c
+++ b/drivers/iommu/intel/pasid.c
@@ -410,6 +410,15 @@ static inline void pasid_set_sre(struct pasid_entry *pe)
 	pasid_set_bits(&pe->val[2], 1 << 0, 1);
 }
 
+/*
+ * Setup the WPE(Write Protect Enable) field (Bit 132) of a
+ * scalable mode PASID entry.
+ */
+static inline void pasid_set_wpe(struct pasid_entry *pe)
+{
+	pasid_set_bits(&pe->val[2], 1 << 4, 1 << 4);
+}
+
 /*
  * Setup the P(Present) field (Bit 0) of a scalable mode PASID
  * entry.
@@ -553,6 +562,20 @@ static void pasid_flush_caches(struct intel_iommu *iommu,
 	}
 }
 
+static inline int pasid_enable_wpe(struct pasid_entry *pte)
+{
+	unsigned long cr0 = read_cr0();
+
+	/* CR0.WP is normally set but just to be sure */
+	if (unlikely(!(cr0 & X86_CR0_WP))) {
+		pr_err_ratelimited("No CPU write protect!\n");
+		return -EINVAL;
+	}
+	pasid_set_wpe(pte);
+
+	return 0;
+};
+
 /*
  * Set up the scalable mode pasid table entry for first only
  * translation type.
@@ -584,6 +607,9 @@ int intel_pasid_setup_first_level(struct intel_iommu *iommu,
 			return -EINVAL;
 		}
 		pasid_set_sre(pte);
+		if (pasid_enable_wpe(pte))
+			return -EINVAL;
+
 	}
 
 	if (flags & PASID_FLAG_FL5LP) {
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
