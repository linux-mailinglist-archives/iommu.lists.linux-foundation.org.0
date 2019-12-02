Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 975AE10F10B
	for <lists.iommu@lfdr.de>; Mon,  2 Dec 2019 20:53:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4B40885F4E;
	Mon,  2 Dec 2019 19:53:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r3apxRldsoEP; Mon,  2 Dec 2019 19:53:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 28F7185F4C;
	Mon,  2 Dec 2019 19:53:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25019C1798;
	Mon,  2 Dec 2019 19:53:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70227C1798
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 19:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6C3C020BF8
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 19:53:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mEXKlb4fAUXu for <iommu@lists.linux-foundation.org>;
 Mon,  2 Dec 2019 19:53:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by silver.osuosl.org (Postfix) with ESMTPS id A0FEB20505
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 19:53:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Dec 2019 11:53:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,270,1571727600"; d="scan'208";a="218438145"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by fmsmga001.fm.intel.com with ESMTP; 02 Dec 2019 11:53:49 -0800
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, "Lu Baolu" <baolu.lu@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v5 2/8] iommu/vt-d: Match CPU and IOMMU paging mode
Date: Mon,  2 Dec 2019 11:58:23 -0800
Message-Id: <1575316709-54903-3-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575316709-54903-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1575316709-54903-1-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Joe Perches <joe@perches.com>
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

When setting up first level page tables for sharing with CPU, we need
to ensure IOMMU can support no less than the levels supported by the
CPU.

It is not adequate, as in the current code, to set up 5-level paging
in PASID entry First Level Paging Mode(FLPM) solely based on CPU.

Currently, intel_pasid_setup_first_level() is only used by native SVM
code which already checks paging mode matches. However, future use of
this helper function may not be limited to native SVM.
https://lkml.org/lkml/2019/11/18/1037

Fixes: 437f35e1cd4c8 ("iommu/vt-d: Add first level page table
interface")
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Acked-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel-pasid.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/intel-pasid.c b/drivers/iommu/intel-pasid.c
index 040a445be300..e7cb0b8a7332 100644
--- a/drivers/iommu/intel-pasid.c
+++ b/drivers/iommu/intel-pasid.c
@@ -499,8 +499,16 @@ int intel_pasid_setup_first_level(struct intel_iommu *iommu,
 	}
 
 #ifdef CONFIG_X86
-	if (cpu_feature_enabled(X86_FEATURE_LA57))
-		pasid_set_flpm(pte, 1);
+	/* Both CPU and IOMMU paging mode need to match */
+	if (cpu_feature_enabled(X86_FEATURE_LA57)) {
+		if (cap_5lp_support(iommu->cap)) {
+			pasid_set_flpm(pte, 1);
+		} else {
+			pr_err("VT-d has no 5-level paging support for CPU\n");
+			pasid_clear_entry(pte);
+			return -EINVAL;
+		}
+	}
 #endif /* CONFIG_X86 */
 
 	pasid_set_domain_id(pte, did);
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
