Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 206EC1D5F0C
	for <lists.iommu@lfdr.de>; Sat, 16 May 2020 08:24:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C694387E39;
	Sat, 16 May 2020 06:24:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XwWwxP7tAYhM; Sat, 16 May 2020 06:24:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B08A48827D;
	Sat, 16 May 2020 06:24:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A729C016F;
	Sat, 16 May 2020 06:24:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 026CBC016F
 for <iommu@lists.linux-foundation.org>; Sat, 16 May 2020 06:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E683E8827D
 for <iommu@lists.linux-foundation.org>; Sat, 16 May 2020 06:24:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f0oMs1PNRUIi for <iommu@lists.linux-foundation.org>;
 Sat, 16 May 2020 06:24:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 429B087E39
 for <iommu@lists.linux-foundation.org>; Sat, 16 May 2020 06:24:46 +0000 (UTC)
IronPort-SDR: KcAhvKJ9hnuPbilU48jJOrf+tHVn7JUAm8gFJ5Ub3puM26vAfYoZCSCON8St4Nlr1GZHWdwID7
 tGeyMGYyRPrQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 23:24:46 -0700
IronPort-SDR: awsM4wsO3ZrLhTNSuJMhZ5idLNcazMypwivpq3HVBy5tv9T+NEdA65hvdS/ze2/Dv1KIkseVUk
 ynBYTnd3JiGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,398,1583222400"; d="scan'208";a="281442422"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by orsmga002.jf.intel.com with ESMTP; 15 May 2020 23:24:44 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 07/18] iommu/vt-d: Enlightened PASID allocation
Date: Sat, 16 May 2020 14:20:50 +0800
Message-Id: <20200516062101.29541-8-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200516062101.29541-1-baolu.lu@linux.intel.com>
References: <20200516062101.29541-1-baolu.lu@linux.intel.com>
Cc: iommu@lists.linux-foundation.org, Tom Murphy <murphyt7@tcd.ie>
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

Enabling IOMMU in a guest requires communication with the host
driver for certain aspects. Use of PASID ID to enable Shared Virtual
Addressing (SVA) requires managing PASID's in the host. VT-d 3.0 spec
provides a Virtual Command Register (VCMD) to facilitate this.
Writes to this register in the guest are trapped by vIOMMU which
proxies the call to the host driver.

This virtual command interface consists of a capability register,
a virtual command register, and a virtual response register. Refer
to section 10.4.42, 10.4.43, 10.4.44 for more information.

This patch adds the enlightened PASID allocation/free interfaces
via the virtual command interface.

Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
 drivers/iommu/intel-pasid.c | 57 +++++++++++++++++++++++++++++++++++++
 drivers/iommu/intel-pasid.h | 13 ++++++++-
 include/linux/intel-iommu.h |  1 +
 3 files changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/intel-pasid.c b/drivers/iommu/intel-pasid.c
index 5d9d9ff49334..ea8f4ef4e295 100644
--- a/drivers/iommu/intel-pasid.c
+++ b/drivers/iommu/intel-pasid.c
@@ -27,6 +27,63 @@
 static DEFINE_SPINLOCK(pasid_lock);
 u32 intel_pasid_max_id = PASID_MAX;
 
+int vcmd_alloc_pasid(struct intel_iommu *iommu, unsigned int *pasid)
+{
+	unsigned long flags;
+	u8 status_code;
+	int ret = 0;
+	u64 res;
+
+	raw_spin_lock_irqsave(&iommu->register_lock, flags);
+	dmar_writeq(iommu->reg + DMAR_VCMD_REG, VCMD_CMD_ALLOC);
+	IOMMU_WAIT_OP(iommu, DMAR_VCRSP_REG, dmar_readq,
+		      !(res & VCMD_VRSP_IP), res);
+	raw_spin_unlock_irqrestore(&iommu->register_lock, flags);
+
+	status_code = VCMD_VRSP_SC(res);
+	switch (status_code) {
+	case VCMD_VRSP_SC_SUCCESS:
+		*pasid = VCMD_VRSP_RESULT_PASID(res);
+		break;
+	case VCMD_VRSP_SC_NO_PASID_AVAIL:
+		pr_info("IOMMU: %s: No PASID available\n", iommu->name);
+		ret = -ENOSPC;
+		break;
+	default:
+		ret = -ENODEV;
+		pr_warn("IOMMU: %s: Unexpected error code %d\n",
+			iommu->name, status_code);
+	}
+
+	return ret;
+}
+
+void vcmd_free_pasid(struct intel_iommu *iommu, unsigned int pasid)
+{
+	unsigned long flags;
+	u8 status_code;
+	u64 res;
+
+	raw_spin_lock_irqsave(&iommu->register_lock, flags);
+	dmar_writeq(iommu->reg + DMAR_VCMD_REG,
+		    VCMD_CMD_OPERAND(pasid) | VCMD_CMD_FREE);
+	IOMMU_WAIT_OP(iommu, DMAR_VCRSP_REG, dmar_readq,
+		      !(res & VCMD_VRSP_IP), res);
+	raw_spin_unlock_irqrestore(&iommu->register_lock, flags);
+
+	status_code = VCMD_VRSP_SC(res);
+	switch (status_code) {
+	case VCMD_VRSP_SC_SUCCESS:
+		break;
+	case VCMD_VRSP_SC_INVALID_PASID:
+		pr_info("IOMMU: %s: Invalid PASID\n", iommu->name);
+		break;
+	default:
+		pr_warn("IOMMU: %s: Unexpected error code %d\n",
+			iommu->name, status_code);
+	}
+}
+
 /*
  * Per device pasid table management:
  */
diff --git a/drivers/iommu/intel-pasid.h b/drivers/iommu/intel-pasid.h
index ccd50c2ae75c..a41b09b3ffde 100644
--- a/drivers/iommu/intel-pasid.h
+++ b/drivers/iommu/intel-pasid.h
@@ -23,6 +23,16 @@
 #define is_pasid_enabled(entry)		(((entry)->lo >> 3) & 0x1)
 #define get_pasid_dir_size(entry)	(1 << ((((entry)->lo >> 9) & 0x7) + 7))
 
+/* Virtual command interface for enlightened pasid management. */
+#define VCMD_CMD_ALLOC			0x1
+#define VCMD_CMD_FREE			0x2
+#define VCMD_VRSP_IP			0x1
+#define VCMD_VRSP_SC(e)			(((e) >> 1) & 0x3)
+#define VCMD_VRSP_SC_SUCCESS		0
+#define VCMD_VRSP_SC_NO_PASID_AVAIL	1
+#define VCMD_VRSP_SC_INVALID_PASID	1
+#define VCMD_VRSP_RESULT_PASID(e)	(((e) >> 8) & 0xfffff)
+#define VCMD_CMD_OPERAND(e)		((e) << 8)
 /*
  * Domain ID reserved for pasid entries programmed for first-level
  * only and pass-through transfer modes.
@@ -111,5 +121,6 @@ int intel_pasid_setup_nested(struct intel_iommu *iommu,
 			     struct dmar_domain *domain, int addr_width);
 void intel_pasid_tear_down_entry(struct intel_iommu *iommu,
 				 struct device *dev, int pasid);
-
+int vcmd_alloc_pasid(struct intel_iommu *iommu, unsigned int *pasid);
+void vcmd_free_pasid(struct intel_iommu *iommu, unsigned int pasid);
 #endif /* __INTEL_PASID_H */
diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
index a9c984b29a72..addb310b4ded 100644
--- a/include/linux/intel-iommu.h
+++ b/include/linux/intel-iommu.h
@@ -169,6 +169,7 @@
 #define ecap_smpwc(e)		(((e) >> 48) & 0x1)
 #define ecap_flts(e)		(((e) >> 47) & 0x1)
 #define ecap_slts(e)		(((e) >> 46) & 0x1)
+#define ecap_vcs(e)		(((e) >> 44) & 0x1)
 #define ecap_smts(e)		(((e) >> 43) & 0x1)
 #define ecap_dit(e)		((e >> 41) & 0x1)
 #define ecap_pasid(e)		((e >> 40) & 0x1)
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
