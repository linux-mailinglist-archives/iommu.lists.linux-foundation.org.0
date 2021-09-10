Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 690BB4060A3
	for <lists.iommu@lfdr.de>; Fri, 10 Sep 2021 02:17:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9C5140266;
	Fri, 10 Sep 2021 00:17:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LW717PSQp8Zn; Fri, 10 Sep 2021 00:17:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8FB694011B;
	Fri, 10 Sep 2021 00:17:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 784E0C0022;
	Fri, 10 Sep 2021 00:17:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29553C000D
 for <iommu@lists.linux-foundation.org>; Fri, 10 Sep 2021 00:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02E724064D
 for <iommu@lists.linux-foundation.org>; Fri, 10 Sep 2021 00:17:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q48aoOO8Ln8Y for <iommu@lists.linux-foundation.org>;
 Fri, 10 Sep 2021 00:17:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BEDA40656
 for <iommu@lists.linux-foundation.org>; Fri, 10 Sep 2021 00:17:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4AFB26121E;
 Fri, 10 Sep 2021 00:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631233028;
 bh=1zAsTmc/vJugNTEDqc1y5VUxzqIYX1Skj8p08T3ERBQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I70wlbsWxyWVeE8IUmX1iNA+xTmf8JCBKsvRJUZ3IfiuQrKhyNslBcz9eOEWDRUcN
 IJI0Oc9ZV0GWzufWe2CQFTcGMOmkcEf+0Vm8bQPOYhhRCDplZHBrBh1xKaQXW79hv7
 eKeRxuDp8AXxqe33PNt/fWyiEccRg35Yn3mjscs3W5s8W9UrZ2sfSMe0pqWSDszH1y
 nf8CPdNTR67/pHmxvd7cOtIYVwalBdxPk/pRZHY1z9/JSyKyphGjIlP8bYC4K/cmNP
 E+acB5f9lpwbl9p27qogCwQPWZhC2ULm5wL3fSzUktf2TJFjr0My2ycLRsSyufv9U8
 SzmUxbGUb3r/g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.14 50/99] iommu/vt-d: Add present bit check in pasid
 entry setup helpers
Date: Thu,  9 Sep 2021 20:15:09 -0400
Message-Id: <20210910001558.173296-50-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910001558.173296-1-sashal@kernel.org>
References: <20210910001558.173296-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, iommu@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>
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

From: Liu Yi L <yi.l.liu@intel.com>

[ Upstream commit 423d39d8518c1bba12e0889a92beeddbb1502392 ]

The helper functions should not modify the pasid entries which are still
in use. Add a check against present bit.

Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
Link: https://lore.kernel.org/r/20210817042425.1784279-1-yi.l.liu@intel.com
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Link: https://lore.kernel.org/r/20210818134852.1847070-10-baolu.lu@linux.intel.com
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/intel/pasid.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/iommu/intel/pasid.c b/drivers/iommu/intel/pasid.c
index 9ec374e17469..60c07050f6a7 100644
--- a/drivers/iommu/intel/pasid.c
+++ b/drivers/iommu/intel/pasid.c
@@ -540,6 +540,10 @@ void intel_pasid_tear_down_entry(struct intel_iommu *iommu, struct device *dev,
 		devtlb_invalidation_with_pasid(iommu, dev, pasid);
 }
 
+/*
+ * This function flushes cache for a newly setup pasid table entry.
+ * Caller of it should not modify the in-use pasid table entries.
+ */
 static void pasid_flush_caches(struct intel_iommu *iommu,
 				struct pasid_entry *pte,
 			       u32 pasid, u16 did)
@@ -591,6 +595,10 @@ int intel_pasid_setup_first_level(struct intel_iommu *iommu,
 	if (WARN_ON(!pte))
 		return -EINVAL;
 
+	/* Caller must ensure PASID entry is not in use. */
+	if (pasid_pte_is_present(pte))
+		return -EBUSY;
+
 	pasid_clear_entry(pte);
 
 	/* Setup the first level page table pointer: */
@@ -690,6 +698,10 @@ int intel_pasid_setup_second_level(struct intel_iommu *iommu,
 		return -ENODEV;
 	}
 
+	/* Caller must ensure PASID entry is not in use. */
+	if (pasid_pte_is_present(pte))
+		return -EBUSY;
+
 	pasid_clear_entry(pte);
 	pasid_set_domain_id(pte, did);
 	pasid_set_slptr(pte, pgd_val);
@@ -729,6 +741,10 @@ int intel_pasid_setup_pass_through(struct intel_iommu *iommu,
 		return -ENODEV;
 	}
 
+	/* Caller must ensure PASID entry is not in use. */
+	if (pasid_pte_is_present(pte))
+		return -EBUSY;
+
 	pasid_clear_entry(pte);
 	pasid_set_domain_id(pte, did);
 	pasid_set_address_width(pte, iommu->agaw);
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
