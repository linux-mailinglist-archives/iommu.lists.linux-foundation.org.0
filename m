Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B8412E135
	for <lists.iommu@lfdr.de>; Thu,  2 Jan 2020 01:19:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B1B00854E8;
	Thu,  2 Jan 2020 00:19:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 66v-gT-it+ye; Thu,  2 Jan 2020 00:19:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D194785C90;
	Thu,  2 Jan 2020 00:19:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BC86BC077D;
	Thu,  2 Jan 2020 00:19:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54E4FC077D
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jan 2020 00:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 45019854C0
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jan 2020 00:19:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Azggwi+3M8e for <iommu@lists.linux-foundation.org>;
 Thu,  2 Jan 2020 00:19:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BD078856F4
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jan 2020 00:19:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Jan 2020 16:19:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,384,1571727600"; d="scan'208";a="244475899"
Received: from allen-box.sh.intel.com ([10.239.159.136])
 by fmsmga004.fm.intel.com with ESMTP; 01 Jan 2020 16:19:34 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 03/22] iommu/vt-d: Match CPU and IOMMU paging mode
Date: Thu,  2 Jan 2020 08:18:04 +0800
Message-Id: <20200102001823.21976-4-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200102001823.21976-1-baolu.lu@linux.intel.com>
References: <20200102001823.21976-1-baolu.lu@linux.intel.com>
Cc: iommu@lists.linux-foundation.org
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

From: Jacob Pan <jacob.jun.pan@linux.intel.com>

When setting up first level page tables for sharing with CPU, we need
to ensure IOMMU can support no less than the levels supported by the
CPU.

It is not adequate, as in the current code, to set up 5-level paging
in PASID entry First Level Paging Mode(FLPM) solely based on CPU.

Currently, intel_pasid_setup_first_level() is only used by native SVM
code which already checks paging mode matches. However, future use of
this helper function may not be limited to native SVM.
https://lkml.org/lkml/2019/11/18/1037

Fixes: 437f35e1cd4c8 ("iommu/vt-d: Add first level page table interface")
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
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
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
