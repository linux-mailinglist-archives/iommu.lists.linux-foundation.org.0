Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 752EFA3D6B
	for <lists.iommu@lfdr.de>; Fri, 30 Aug 2019 20:08:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1D5906339;
	Fri, 30 Aug 2019 18:08:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 82BD360A5
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 15:08:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 832E089B
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 15:07:59 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id e16so7320681wro.5
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 08:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0pAZWJp00xZ1ls1Af08EI7mW5qet6OlsQR65F0SwZhs=;
	b=Uhod1U8XJp5hvgo/TUndU/vB/K3LqXxuAeZVAeuRIVdGOfTHzNRkOwN4osOc40UuE5
	1zbifQ3t/DupGF//0a//lbZHwzoTo6QVboCPsr+tvklkQoTjH1/FYdaux2SjAfGCOpZ0
	aaXT7pAXocMPWV0Xg9GtrbNyGi3SmspC4gJtWpFECD2jINQg8+kDPQEGXlrAPljAZ6MO
	Bdigb/DGLDuPQjYHP6+nOeEcj4fW4+9AgzYdVUBteNpxJsrnLzwx/E63kRUe2CI/0SzE
	heoO2mGCnXSSOoKS6wS0YDpnRrp6s8F65jBfDu0Q/tvSU+1uM06S/GMYkDzLMDPtR3BH
	HskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=0pAZWJp00xZ1ls1Af08EI7mW5qet6OlsQR65F0SwZhs=;
	b=DVgmGVzVN5ib82IfztVYTrr7+50clrUkgZhNmkmwvIrjE/hsktxC3OU3ck4029UoKK
	m8R12fQJ4hpFKeGLZw7bpXq44c+yjsZnC6XZytBWB39T2i5ZQjYz7+F4C92r8MfTRXIG
	sEGQzfKd2hDKWBLLhI41S6B1iEmwwwYvHW8VUrgIduA+kj/uG/1S4SfbrJHAP/6SLYkQ
	mpyWFSCQxxg+ycF8NL7+ZASNjScL7MnMo0jvmSeruR/IrZfjBUx4pmF601dj94bGeBwJ
	pc1gL1pgIkDMnXg28W2qIRDT05Dp/EOAE9x3xdPyIqdT9xIUfrjsUk64/zGc7gjIpAhk
	GXXg==
X-Gm-Message-State: APjAAAWt6y8qxzI0SDRAo2TnTUp0nF7dSj79Puub3Z34MQHhAYmwkDxm
	oJz9DffiUaFuSRzjhfBm2DY=
X-Google-Smtp-Source: APXvYqzHQGc0Wx4HRiZiz1ofDsxcHrSk8e6DnIqmyFNiH0txU8A57/I3wSP5Sr5aEeWTtm785SC13w==
X-Received: by 2002:adf:f507:: with SMTP id q7mr19297657wro.210.1567177678081; 
	Fri, 30 Aug 2019 08:07:58 -0700 (PDT)
Received: from localhost.localdomain (ip5b4096c3.dynamic.kabel-deutschland.de.
	[91.64.150.195])
	by smtp.gmail.com with ESMTPSA id 16sm8270956wmx.45.2019.08.30.08.07.56
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 08:07:57 -0700 (PDT)
From: Krzysztof Wilczynski <kw@linux.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH] PCI: Move ATS declarations to linux/pci.h
Date: Fri, 30 Aug 2019 17:07:56 +0200
Message-Id: <20190830150756.21305-1-kw@linux.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Fri, 30 Aug 2019 18:07:03 +0000
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, linux-pci@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>, David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Move ATS function prototypes from include/linux/pci-ats.h to
include/linux/pci.h so users only need to include <linux/pci.h>:

Realted to PRI capability:

  pci_enable_pri()
  pci_disable_pri()
  pci_restore_pri_state()
  pci_reset_pri()

Related to PASID capability:

  pci_enable_pasid()
  pci_disable_pasid()
  pci_restore_pasid_state()
  pci_pasid_features()
  pci_max_pasids()
  pci_prg_resp_pasid_required()

No functional changes intended.

Signed-off-by: Krzysztof Wilczynski <kw@linux.com>
---
 drivers/iommu/amd_iommu.c   |  1 -
 drivers/iommu/arm-smmu-v3.c |  1 -
 drivers/iommu/intel-iommu.c |  1 -
 drivers/iommu/intel-pasid.c |  1 -
 drivers/iommu/intel-svm.c   |  1 -
 drivers/pci/ats.c           |  1 -
 drivers/pci/pci.c           |  1 -
 include/linux/pci-ats.h     | 77 -------------------------------------
 include/linux/pci.h         | 34 ++++++++++++++++
 9 files changed, 34 insertions(+), 84 deletions(-)
 delete mode 100644 include/linux/pci-ats.h

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index 04a9f8443344..d43913386915 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -13,7 +13,6 @@
 #include <linux/acpi.h>
 #include <linux/amba/bus.h>
 #include <linux/platform_device.h>
-#include <linux/pci-ats.h>
 #include <linux/bitmap.h>
 #include <linux/slab.h>
 #include <linux/debugfs.h>
diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index 0ad6d34d1e96..3bd9455efc39 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -29,7 +29,6 @@
 #include <linux/of_iommu.h>
 #include <linux/of_platform.h>
 #include <linux/pci.h>
-#include <linux/pci-ats.h>
 #include <linux/platform_device.h>
 
 #include <linux/amba/bus.h>
diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 4658cda6f3d2..362845b5c88a 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -35,7 +35,6 @@
 #include <linux/syscore_ops.h>
 #include <linux/tboot.h>
 #include <linux/dmi.h>
-#include <linux/pci-ats.h>
 #include <linux/memblock.h>
 #include <linux/dma-contiguous.h>
 #include <linux/dma-direct.h>
diff --git a/drivers/iommu/intel-pasid.c b/drivers/iommu/intel-pasid.c
index 040a445be300..f670315afa67 100644
--- a/drivers/iommu/intel-pasid.c
+++ b/drivers/iommu/intel-pasid.c
@@ -16,7 +16,6 @@
 #include <linux/iommu.h>
 #include <linux/memory.h>
 #include <linux/pci.h>
-#include <linux/pci-ats.h>
 #include <linux/spinlock.h>
 
 #include "intel-pasid.h"
diff --git a/drivers/iommu/intel-svm.c b/drivers/iommu/intel-svm.c
index 780de0caafe8..ee9dfc84f925 100644
--- a/drivers/iommu/intel-svm.c
+++ b/drivers/iommu/intel-svm.c
@@ -13,7 +13,6 @@
 #include <linux/intel-svm.h>
 #include <linux/rculist.h>
 #include <linux/pci.h>
-#include <linux/pci-ats.h>
 #include <linux/dmar.h>
 #include <linux/interrupt.h>
 #include <linux/mm_types.h>
diff --git a/drivers/pci/ats.c b/drivers/pci/ats.c
index e18499243f84..3f5fb2d4a763 100644
--- a/drivers/pci/ats.c
+++ b/drivers/pci/ats.c
@@ -10,7 +10,6 @@
  */
 
 #include <linux/export.h>
-#include <linux/pci-ats.h>
 #include <linux/pci.h>
 #include <linux/slab.h>
 
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index f20a3de57d21..c8f2a05e6b37 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -29,7 +29,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/pci_hotplug.h>
 #include <linux/vmalloc.h>
-#include <linux/pci-ats.h>
 #include <asm/setup.h>
 #include <asm/dma.h>
 #include <linux/aer.h>
diff --git a/include/linux/pci-ats.h b/include/linux/pci-ats.h
deleted file mode 100644
index 1ebb88e7c184..000000000000
--- a/include/linux/pci-ats.h
+++ /dev/null
@@ -1,77 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef LINUX_PCI_ATS_H
-#define LINUX_PCI_ATS_H
-
-#include <linux/pci.h>
-
-#ifdef CONFIG_PCI_PRI
-
-int pci_enable_pri(struct pci_dev *pdev, u32 reqs);
-void pci_disable_pri(struct pci_dev *pdev);
-void pci_restore_pri_state(struct pci_dev *pdev);
-int pci_reset_pri(struct pci_dev *pdev);
-
-#else /* CONFIG_PCI_PRI */
-
-static inline int pci_enable_pri(struct pci_dev *pdev, u32 reqs)
-{
-	return -ENODEV;
-}
-
-static inline void pci_disable_pri(struct pci_dev *pdev)
-{
-}
-
-static inline void pci_restore_pri_state(struct pci_dev *pdev)
-{
-}
-
-static inline int pci_reset_pri(struct pci_dev *pdev)
-{
-	return -ENODEV;
-}
-
-#endif /* CONFIG_PCI_PRI */
-
-#ifdef CONFIG_PCI_PASID
-
-int pci_enable_pasid(struct pci_dev *pdev, int features);
-void pci_disable_pasid(struct pci_dev *pdev);
-void pci_restore_pasid_state(struct pci_dev *pdev);
-int pci_pasid_features(struct pci_dev *pdev);
-int pci_max_pasids(struct pci_dev *pdev);
-int pci_prg_resp_pasid_required(struct pci_dev *pdev);
-
-#else  /* CONFIG_PCI_PASID */
-
-static inline int pci_enable_pasid(struct pci_dev *pdev, int features)
-{
-	return -EINVAL;
-}
-
-static inline void pci_disable_pasid(struct pci_dev *pdev)
-{
-}
-
-static inline void pci_restore_pasid_state(struct pci_dev *pdev)
-{
-}
-
-static inline int pci_pasid_features(struct pci_dev *pdev)
-{
-	return -EINVAL;
-}
-
-static inline int pci_max_pasids(struct pci_dev *pdev)
-{
-	return -EINVAL;
-}
-
-static inline int pci_prg_resp_pasid_required(struct pci_dev *pdev)
-{
-	return 0;
-}
-#endif /* CONFIG_PCI_PASID */
-
-
-#endif /* LINUX_PCI_ATS_H*/
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 463486016290..8ac142801890 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2349,6 +2349,40 @@ static inline bool pci_is_thunderbolt_attached(struct pci_dev *pdev)
 void pci_uevent_ers(struct pci_dev *pdev, enum  pci_ers_result err_type);
 #endif
 
+#ifdef CONFIG_PCI_PRI
+int pci_enable_pri(struct pci_dev *pdev, u32 reqs);
+void pci_disable_pri(struct pci_dev *pdev);
+void pci_restore_pri_state(struct pci_dev *pdev);
+int pci_reset_pri(struct pci_dev *pdev);
+#else /* CONFIG_PCI_PRI */
+static inline int pci_enable_pri(struct pci_dev *pdev, u32 reqs)
+{ return -ENODEV; }
+static inline void pci_disable_pri(struct pci_dev *pdev) { }
+static inline void pci_restore_pri_state(struct pci_dev *pdev) { }
+static inline int pci_reset_pri(struct pci_dev *pdev)
+{ return -ENODEV; }
+#endif /* CONFIG_PCI_PRI */
+
+#ifdef CONFIG_PCI_PASID
+int pci_enable_pasid(struct pci_dev *pdev, int features);
+void pci_disable_pasid(struct pci_dev *pdev);
+void pci_restore_pasid_state(struct pci_dev *pdev);
+int pci_pasid_features(struct pci_dev *pdev);
+int pci_max_pasids(struct pci_dev *pdev);
+int pci_prg_resp_pasid_required(struct pci_dev *pdev);
+#else  /* CONFIG_PCI_PASID */
+static inline int pci_enable_pasid(struct pci_dev *pdev, int features)
+{ return -EINVAL; }
+static inline void pci_disable_pasid(struct pci_dev *pdev) { }
+static inline void pci_restore_pasid_state(struct pci_dev *pdev) { }
+static inline int pci_pasid_features(struct pci_dev *pdev)
+{ return -EINVAL; }
+static inline int pci_max_pasids(struct pci_dev *pdev)
+{ return -EINVAL; }
+static inline int pci_prg_resp_pasid_required(struct pci_dev *pdev)
+{ return 0; }
+#endif /* CONFIG_PCI_PASID */
+
 /* Provide the legacy pci_dma_* API */
 #include <linux/pci-dma-compat.h>
 
-- 
2.22.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
