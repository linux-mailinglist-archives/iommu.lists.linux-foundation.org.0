Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6C826FA6C
	for <lists.iommu@lfdr.de>; Fri, 18 Sep 2020 12:20:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1EC0287303;
	Fri, 18 Sep 2020 10:20:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bBjhTy6df3Pv; Fri, 18 Sep 2020 10:20:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3378E87302;
	Fri, 18 Sep 2020 10:20:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20DDEC0051;
	Fri, 18 Sep 2020 10:20:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0154C0051
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 10:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BCC6020421
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 10:20:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FdF2QIf+vI3z for <iommu@lists.linux-foundation.org>;
 Fri, 18 Sep 2020 10:20:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by silver.osuosl.org (Postfix) with ESMTPS id B27EE2E1F7
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 10:19:59 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id l17so5486507edq.12
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 03:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aqv3ZDmHKVFNAXTFaRsRnoonjs/rFQLnkFE+WBCHtmI=;
 b=cuyYD9o/KzC2pIYNckBzClyiRwbWWDYRG475drB7yzqFBvhSWeBm3J8FmSaGnL0/QL
 xR5nwdy+AoCeQX991HFvNwMNz44bp6fu5ti8Y8v2hcXqFC1lOPbND6L5oFijW/vmNOgr
 jkbT+FFiHBatj7ZQGuSzXJEiIhDGrrD6NyCe4fcpTtTZN5mugHhhrol7rj87jxw19KlX
 fAA/gWwR5rwqcGX+vONvq58dF3itVamwNTl6jzJqZ2ci+XmvsNqMQ2gAuZyp5QFswi5t
 8do3FK/EEnppYoFOMH1AZv/MOSaRGF+tKntJHn6srTIge0DrFrSiIZn2eltb1H0byEiT
 eddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aqv3ZDmHKVFNAXTFaRsRnoonjs/rFQLnkFE+WBCHtmI=;
 b=L+mtNGBajziQv5eCeaR+DE9PMHAp4v2sW9GWELI69pwHmM0eVIsJjQTlZsuVByRW5p
 mg3fHCKKumM3C58ZTqV1WnDc8zl39QDnkRbPq8bXv7D12PRps6lARYsD4BSLXYMEAFbO
 Dkpg9JX7KCp8p7RoLVI2QSWA/8pk6bRC2Gm4OodsucFtDV/+MbYBhFpuzC+lzeR7fx1E
 62lrrl5O9C4YnXJ9Nkz2O2+kN/IdixEHQjbDeyVkD74TqzYKRKbA7E3uqo93zWc6+oOA
 CAxmgMP3awnCBso1HUNiDQ3A8hJVvNPrbbbTIJRGopyYVzZztnCHzCln4+P9GXNKKUlL
 1RaA==
X-Gm-Message-State: AOAM532fuCp6DYXOd++CZDlValiX8nD9qPsLacIOKhej0bvKO4431QCa
 SNLEInj6XRyGyZWkyLcBT46gEq/E/y0RB8nE
X-Google-Smtp-Source: ABdhPJycXf3Ue6WIV9Rxlo1kNEAhhbHclDtt1uJfQwBDseNfUhXzRCHBEOheY+S+oHqGf/+yU03vAA==
X-Received: by 2002:aa7:c6cf:: with SMTP id b15mr24539435eds.134.1600424397669; 
 Fri, 18 Sep 2020 03:19:57 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id r16sm1940674edc.57.2020.09.18.03.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 03:19:57 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Subject: [PATCH v10 03/13] iommu/sva: Add PASID helpers
Date: Fri, 18 Sep 2020 12:18:43 +0200
Message-Id: <20200918101852.582559-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200918101852.582559-1-jean-philippe@linaro.org>
References: <20200918101852.582559-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: fenghua.yu@intel.com, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 catalin.marinas@arm.com, robin.murphy@arm.com, zhangfei.gao@linaro.org,
 will@kernel.org
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

Let IOMMU drivers allocate a single PASID per mm. Store the mm in the
IOASID set to allow refcounting and searching mm by PASID, when handling
an I/O page fault.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v10: small comment updates
---
 drivers/iommu/Kconfig         |  5 ++
 drivers/iommu/Makefile        |  1 +
 drivers/iommu/iommu-sva-lib.h | 15 ++++++
 drivers/iommu/iommu-sva-lib.c | 86 +++++++++++++++++++++++++++++++++++
 4 files changed, 107 insertions(+)
 create mode 100644 drivers/iommu/iommu-sva-lib.h
 create mode 100644 drivers/iommu/iommu-sva-lib.c

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index bef5d75e306b..fb1787377eb6 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -103,6 +103,11 @@ config IOMMU_DMA
 	select IRQ_MSI_IOMMU
 	select NEED_SG_DMA_LENGTH
 
+# Shared Virtual Addressing library
+config IOMMU_SVA_LIB
+	bool
+	select IOASID
+
 config FSL_PAMU
 	bool "Freescale IOMMU support"
 	depends on PCI
diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
index 11f1771104f3..61bd30cd8369 100644
--- a/drivers/iommu/Makefile
+++ b/drivers/iommu/Makefile
@@ -27,3 +27,4 @@ obj-$(CONFIG_FSL_PAMU) += fsl_pamu.o fsl_pamu_domain.o
 obj-$(CONFIG_S390_IOMMU) += s390-iommu.o
 obj-$(CONFIG_HYPERV_IOMMU) += hyperv-iommu.o
 obj-$(CONFIG_VIRTIO_IOMMU) += virtio-iommu.o
+obj-$(CONFIG_IOMMU_SVA_LIB) += iommu-sva-lib.o
diff --git a/drivers/iommu/iommu-sva-lib.h b/drivers/iommu/iommu-sva-lib.h
new file mode 100644
index 000000000000..b40990aef3fd
--- /dev/null
+++ b/drivers/iommu/iommu-sva-lib.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * SVA library for IOMMU drivers
+ */
+#ifndef _IOMMU_SVA_LIB_H
+#define _IOMMU_SVA_LIB_H
+
+#include <linux/ioasid.h>
+#include <linux/mm_types.h>
+
+int iommu_sva_alloc_pasid(struct mm_struct *mm, ioasid_t min, ioasid_t max);
+void iommu_sva_free_pasid(struct mm_struct *mm);
+struct mm_struct *iommu_sva_find(ioasid_t pasid);
+
+#endif /* _IOMMU_SVA_LIB_H */
diff --git a/drivers/iommu/iommu-sva-lib.c b/drivers/iommu/iommu-sva-lib.c
new file mode 100644
index 000000000000..bd41405d34e9
--- /dev/null
+++ b/drivers/iommu/iommu-sva-lib.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Helpers for IOMMU drivers implementing SVA
+ */
+#include <linux/mutex.h>
+#include <linux/sched/mm.h>
+
+#include "iommu-sva-lib.h"
+
+static DEFINE_MUTEX(iommu_sva_lock);
+static DECLARE_IOASID_SET(iommu_sva_pasid);
+
+/**
+ * iommu_sva_alloc_pasid - Allocate a PASID for the mm
+ * @mm: the mm
+ * @min: minimum PASID value (inclusive)
+ * @max: maximum PASID value (inclusive)
+ *
+ * Try to allocate a PASID for this mm, or take a reference to the existing one
+ * provided it fits within the [@min, @max] range. On success the PASID is
+ * available in mm->pasid, and must be released with iommu_sva_free_pasid().
+ * @min must be greater than 0, because 0 indicates an unused mm->pasid.
+ *
+ * Returns 0 on success and < 0 on error.
+ */
+int iommu_sva_alloc_pasid(struct mm_struct *mm, ioasid_t min, ioasid_t max)
+{
+	int ret = 0;
+	ioasid_t pasid;
+
+	if (min == INVALID_IOASID || max == INVALID_IOASID ||
+	    min == 0 || max < min)
+		return -EINVAL;
+
+	mutex_lock(&iommu_sva_lock);
+	if (mm->pasid) {
+		if (mm->pasid >= min && mm->pasid <= max)
+			ioasid_get(mm->pasid);
+		else
+			ret = -EOVERFLOW;
+	} else {
+		pasid = ioasid_alloc(&iommu_sva_pasid, min, max, mm);
+		if (pasid == INVALID_IOASID)
+			ret = -ENOMEM;
+		else
+			mm->pasid = pasid;
+	}
+	mutex_unlock(&iommu_sva_lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(iommu_sva_alloc_pasid);
+
+/**
+ * iommu_sva_free_pasid - Release the mm's PASID
+ * @mm: the mm
+ *
+ * Drop one reference to a PASID allocated with iommu_sva_alloc_pasid()
+ */
+void iommu_sva_free_pasid(struct mm_struct *mm)
+{
+	mutex_lock(&iommu_sva_lock);
+	if (ioasid_put(mm->pasid))
+		mm->pasid = 0;
+	mutex_unlock(&iommu_sva_lock);
+}
+EXPORT_SYMBOL_GPL(iommu_sva_free_pasid);
+
+/* ioasid_find getter() requires a void * argument */
+static bool __mmget_not_zero(void *mm)
+{
+	return mmget_not_zero(mm);
+}
+
+/**
+ * iommu_sva_find() - Find mm associated to the given PASID
+ * @pasid: Process Address Space ID assigned to the mm
+ *
+ * On success a reference to the mm is taken, and must be released with mmput().
+ *
+ * Returns the mm corresponding to this PASID, or an error if not found.
+ */
+struct mm_struct *iommu_sva_find(ioasid_t pasid)
+{
+	return ioasid_find(&iommu_sva_pasid, pasid, __mmget_not_zero);
+}
+EXPORT_SYMBOL_GPL(iommu_sva_find);
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
