Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7EA319CEE
	for <lists.iommu@lfdr.de>; Fri, 12 Feb 2021 11:59:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0245285F8C;
	Fri, 12 Feb 2021 10:59:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8YXp1ijzbDUd; Fri, 12 Feb 2021 10:59:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 742D285FA6;
	Fri, 12 Feb 2021 10:59:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5BBEEC013A;
	Fri, 12 Feb 2021 10:59:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB944C013A;
 Fri, 12 Feb 2021 10:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D8CD286E68;
 Fri, 12 Feb 2021 10:59:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jr6ihfmiD7db; Fri, 12 Feb 2021 10:59:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id CCA6E87120;
 Fri, 12 Feb 2021 10:59:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6664612FC;
 Fri, 12 Feb 2021 02:59:20 -0800 (PST)
Received: from usa.arm.com (a074945.blr.arm.com [10.162.16.71])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1D82A3F719;
 Fri, 12 Feb 2021 02:59:15 -0800 (PST)
From: Vivek Gautam <vivek.gautam@arm.com>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, virtualization@lists.linux-foundation.org
Subject: [PATCH 2/2] iommu: arm-smmu-v3: Report domain nesting info reuqired
 for stage1
Date: Fri, 12 Feb 2021 16:28:59 +0530
Message-Id: <20210212105859.8445-3-vivek.gautam@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210212105859.8445-1-vivek.gautam@arm.com>
References: <20210212105859.8445-1-vivek.gautam@arm.com>
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, mst@redhat.com,
 will.deacon@arm.com, alex.williamson@redhat.com, robin.murphy@arm.com
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

Update nested domain information required for stage1 page table.

Signed-off-by: Vivek Gautam <vivek.gautam@arm.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index c11dd3940583..728018921fae 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2555,6 +2555,7 @@ static int arm_smmu_domain_nesting_info(struct arm_smmu_domain *smmu_domain,
 					void *data)
 {
 	struct iommu_nesting_info *info = (struct iommu_nesting_info *)data;
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	unsigned int size;
 
 	if (!info || smmu_domain->stage != ARM_SMMU_DOMAIN_NESTED)
@@ -2571,9 +2572,20 @@ static int arm_smmu_domain_nesting_info(struct arm_smmu_domain *smmu_domain,
 		return 0;
 	}
 
-	/* report an empty iommu_nesting_info for now */
-	memset(info, 0x0, size);
+	/* Update the nesting info as required for stage1 page tables */
+	info->addr_width = smmu->ias;
+	info->format = IOMMU_PASID_FORMAT_ARM_SMMU_V3;
+	info->features = IOMMU_NESTING_FEAT_BIND_PGTBL |
+			 IOMMU_NESTING_FEAT_PAGE_RESP |
+			 IOMMU_NESTING_FEAT_CACHE_INVLD;
+	info->pasid_bits = smmu->ssid_bits;
+	info->vendor.smmuv3.asid_bits = smmu->asid_bits;
+	info->vendor.smmuv3.pgtbl_fmt = ARM_64_LPAE_S1;
+	memset(&info->padding, 0x0, 12);
+	memset(&info->vendor.smmuv3.padding, 0x0, 9);
+
 	info->argsz = size;
+
 	return 0;
 }
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
