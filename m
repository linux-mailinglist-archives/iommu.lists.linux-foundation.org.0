Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 03457321BEE
	for <lists.iommu@lfdr.de>; Mon, 22 Feb 2021 16:55:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98A77831CA;
	Mon, 22 Feb 2021 15:54:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y_-Zsqf-b5NR; Mon, 22 Feb 2021 15:54:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 335E082FBE;
	Mon, 22 Feb 2021 15:54:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0FD2EC0001;
	Mon, 22 Feb 2021 15:54:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9829C0001
 for <iommu@lists.linux-foundation.org>; Mon, 22 Feb 2021 15:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6E8A6F584
 for <iommu@lists.linux-foundation.org>; Mon, 22 Feb 2021 15:54:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pVXMvnWy9_EX for <iommu@lists.linux-foundation.org>;
 Mon, 22 Feb 2021 15:54:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A55376F4D3
 for <iommu@lists.linux-foundation.org>; Mon, 22 Feb 2021 15:54:53 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Dkmsp5cdxzlNSL;
 Mon, 22 Feb 2021 23:52:46 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.47.88.147) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Mon, 22 Feb 2021 23:54:37 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <kvmarm@lists.cs.columbia.edu>
Subject: [RFC PATCH 4/5] iommu/arm-smmu-v3: Use pinned VMID for NESTED stage
 with BTM
Date: Mon, 22 Feb 2021 15:53:37 +0000
Message-ID: <20210222155338.26132-5-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
In-Reply-To: <20210222155338.26132-1-shameerali.kolothum.thodi@huawei.com>
References: <20210222155338.26132-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.47.88.147]
X-CFilter-Loop: Reflected
Cc: jean-philippe@linaro.org, maz@kernel.org, linuxarm@openeuler.org,
 alex.williamson@redhat.com, prime.zeng@hisilicon.com, zhangfei.gao@linaro.org
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

If the SMMU supports BTM and the device belongs to NESTED domain
with shared pasid table, we need to use the VMID allocated by the
KVM for the s2 configuration. Hence, request a pinned VMID from KVM.

Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 49 ++++++++++++++++++++-
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 26bf7da1bcd0..04f83f7c8319 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -28,6 +28,7 @@
 #include <linux/pci.h>
 #include <linux/pci-ats.h>
 #include <linux/platform_device.h>
+#include <linux/kvm_host.h>
 
 #include <linux/amba/bus.h>
 
@@ -2195,6 +2196,33 @@ static void arm_smmu_bitmap_free(unsigned long *map, int idx)
 	clear_bit(idx, map);
 }
 
+static int arm_smmu_pinned_vmid_get(struct arm_smmu_domain *smmu_domain)
+{
+	struct arm_smmu_master *master;
+
+	master = list_first_entry_or_null(&smmu_domain->devices,
+					  struct arm_smmu_master, domain_head);
+	if (!master)
+		return -EINVAL;
+
+	return kvm_pinned_vmid_get(master->dev);
+}
+
+static int arm_smmu_pinned_vmid_put(struct arm_smmu_domain *smmu_domain)
+{
+	struct arm_smmu_master *master;
+
+	master = list_first_entry_or_null(&smmu_domain->devices,
+					  struct arm_smmu_master, domain_head);
+	if (!master)
+		return -EINVAL;
+
+	if (smmu_domain->s2_cfg.vmid)
+		return kvm_pinned_vmid_put(master->dev);
+
+	return 0;
+}
+
 static void arm_smmu_domain_free(struct iommu_domain *domain)
 {
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
@@ -2215,8 +2243,11 @@ static void arm_smmu_domain_free(struct iommu_domain *domain)
 		mutex_unlock(&arm_smmu_asid_lock);
 	}
 	if (s2_cfg->set) {
-		if (s2_cfg->vmid)
-			arm_smmu_bitmap_free(smmu->vmid_map, s2_cfg->vmid);
+		if (s2_cfg->vmid) {
+			if (!(smmu->features & ARM_SMMU_FEAT_BTM) &&
+			    smmu_domain->stage != ARM_SMMU_DOMAIN_NESTED)
+				arm_smmu_bitmap_free(smmu->vmid_map, s2_cfg->vmid);
+		}
 	}
 
 	kfree(smmu_domain);
@@ -3199,6 +3230,17 @@ static int arm_smmu_attach_pasid_table(struct iommu_domain *domain,
 				!(smmu->features & ARM_SMMU_FEAT_2_LVL_CDTAB))
 			goto out;
 
+		if (smmu->features & ARM_SMMU_FEAT_BTM) {
+			ret = arm_smmu_pinned_vmid_get(smmu_domain);
+			if (ret < 0)
+				goto out;
+
+			if (smmu_domain->s2_cfg.vmid)
+				arm_smmu_bitmap_free(smmu->vmid_map, smmu_domain->s2_cfg.vmid);
+
+			smmu_domain->s2_cfg.vmid = (u16)ret;
+		}
+
 		smmu_domain->s1_cfg.cdcfg.cdtab_dma = cfg->base_ptr;
 		smmu_domain->s1_cfg.s1cdmax = cfg->pasid_bits;
 		smmu_domain->s1_cfg.s1fmt = cfg->vendor_data.smmuv3.s1fmt;
@@ -3221,6 +3263,7 @@ static int arm_smmu_attach_pasid_table(struct iommu_domain *domain,
 static void arm_smmu_detach_pasid_table(struct iommu_domain *domain)
 {
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	struct arm_smmu_master *master;
 	unsigned long flags;
 
@@ -3237,6 +3280,8 @@ static void arm_smmu_detach_pasid_table(struct iommu_domain *domain)
 		arm_smmu_install_ste_for_dev(master);
 	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
 
+	if (smmu->features & ARM_SMMU_FEAT_BTM)
+		arm_smmu_pinned_vmid_put(smmu_domain);
 unlock:
 	mutex_unlock(&smmu_domain->init_mutex);
 }
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
