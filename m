Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C3719229FFF
	for <lists.iommu@lfdr.de>; Wed, 22 Jul 2020 21:19:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5A6528879E;
	Wed, 22 Jul 2020 19:19:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LTMgagKOvy-o; Wed, 22 Jul 2020 19:19:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4BA6688501;
	Wed, 22 Jul 2020 19:19:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41080C004C;
	Wed, 22 Jul 2020 19:19:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93B0CC004C
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 19:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8F09F86294
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 19:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mjNBaL1gx6BD for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 19:19:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 95524883E0
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jul 2020 19:19:44 +0000 (UTC)
IronPort-SDR: 9+Ij4A3RMD0SdllMLNGSlVRKFfCkDlBgL/Y9NGWfBozkx7UZKvtnSkQHsBXG9sJjZEGOH+u+03
 AerbWRJendHQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9690"; a="129972727"
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; d="scan'208";a="129972727"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 12:19:43 -0700
IronPort-SDR: u8dB6tCe6daCeeZUYnl2KskOg1cDgCIiizqLfBnJgP2LOUR+wEj9wfGbjiyvqUcw7zjHCoWBI2
 PfZGbiG0ZHcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,383,1589266800"; d="scan'208";a="362811901"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga001.jf.intel.com with ESMTP; 22 Jul 2020 12:19:43 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 "Lu Baolu" <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH v5 4/7] iommu/vt-d: Handle non-page aligned address
Date: Wed, 22 Jul 2020 12:26:24 -0700
Message-Id: <1595445987-40095-5-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595445987-40095-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1595445987-40095-1-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>
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

From: Liu Yi L <yi.l.liu@intel.com>

Address information for device TLB invalidation comes from userspace
when device is directly assigned to a guest with vIOMMU support.
VT-d requires page aligned address. This patch checks and enforce
address to be page aligned, otherwise reserved bits can be set in the
invalidation descriptor. Unrecoverable fault will be reported due to
non-zero value in the reserved bits.

Fixes: 61a06a16e36d8 ("iommu/vt-d: Support flushing more translation
cache types")
Acked-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 drivers/iommu/intel/dmar.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/intel/dmar.c b/drivers/iommu/intel/dmar.c
index 9be08b9400ee..6038d02c5066 100644
--- a/drivers/iommu/intel/dmar.c
+++ b/drivers/iommu/intel/dmar.c
@@ -1456,9 +1456,25 @@ void qi_flush_dev_iotlb_pasid(struct intel_iommu *iommu, u16 sid, u16 pfsid,
 	 * Max Invs Pending (MIP) is set to 0 for now until we have DIT in
 	 * ECAP.
 	 */
-	desc.qw1 |= addr & ~mask;
-	if (size_order)
+	if (addr & GENMASK_ULL(size_order + VTD_PAGE_SHIFT, 0))
+		pr_warn_ratelimited("Invalidate non-aligned address %llx, order %d\n", addr, size_order);
+
+	/* Take page address */
+	desc.qw1 = QI_DEV_EIOTLB_ADDR(addr);
+
+	if (size_order) {
+		/*
+		 * Existing 0s in address below size_order may be the least
+		 * significant bit, we must set them to 1s to avoid having
+		 * smaller size than desired.
+		 */
+		desc.qw1 |= GENMASK_ULL(size_order + VTD_PAGE_SHIFT - 1,
+					VTD_PAGE_SHIFT);
+		/* Clear size_order bit to indicate size */
+		desc.qw1 &= ~mask;
+		/* Set the S bit to indicate flushing more than 1 page */
 		desc.qw1 |= QI_DEV_EIOTLB_SIZE;
+	}
 
 	qi_submit_sync(iommu, &desc, 1, 0);
 }
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
