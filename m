Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id D81CE4689F9
	for <lists.iommu@lfdr.de>; Sun,  5 Dec 2021 09:18:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD5264038A;
	Sun,  5 Dec 2021 08:18:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZPeOPNzA8beR; Sun,  5 Dec 2021 08:18:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4CCBE403F2;
	Sun,  5 Dec 2021 08:18:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90725C0074;
	Sun,  5 Dec 2021 08:18:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34D91C0012
 for <iommu@lists.linux-foundation.org>; Sun,  5 Dec 2021 08:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 245D44040D
 for <iommu@lists.linux-foundation.org>; Sun,  5 Dec 2021 08:18:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tjjR06v7KBOg for <iommu@lists.linux-foundation.org>;
 Sun,  5 Dec 2021 08:18:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E119E40424
 for <iommu@lists.linux-foundation.org>; Sun,  5 Dec 2021 08:18:22 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id l64so1868937pgl.9
 for <iommu@lists.linux-foundation.org>; Sun, 05 Dec 2021 00:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HEtQ2VgG/AmO4M2o0U/qmYacDg8cWHw/nJTaFUeWEoM=;
 b=qVZeIp4wgKkg5FZMbPln6Q/k5s4EHMptgSE2q5o2Xt4yqRYPYjNg7ie0xdW0nU9pK3
 EUPzswRFN0nOeut8n+3r/e0zksf/HiSEBtBx9sn7LR7AgOoxN7xP6SbnHLmWjDcawUWf
 jivfnKtLrjpcSCl9pE113Any9Pq+pa4y9vDbCp+72hnYT17zr/DO7aqWlmnAZjsV9COL
 rKWIGdD84O/9Ch/nucGUpRkDiPhw6cJlPuNmBx1VMYhoKhOTKm0A7D6au5Eoumm4sqxd
 mpOLxi2IMNgtgXsv9pyUZ3m8W2OGNM46u91gZ5lcUWV/daJknoScyM1JyagbFjwbAtVK
 krGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HEtQ2VgG/AmO4M2o0U/qmYacDg8cWHw/nJTaFUeWEoM=;
 b=nQGIiajK3vXlYQZjcouqq+1FUwoVfxknyyTq6xLiFUZqK5rGBoq7CmjOp4AEvQHkR2
 75qFpilYRfvU0RDYrkEb4E07D/Yz7fZmMxkySF/gUqaW2laZfBXFgpj7LuFF6G7Oeq4d
 Iz5/a9ekhmBEk9wK6aMOE07tN0k5cC61C6qyhosDd9nm4EPVWB/pjs2iB6LW49orQK7k
 qW7cOArEerpGwK+/cgDZvbSphrMCJ8D1fOSYMRxyfjF0vVr/YF9H8ztTNZ5qG5f2kwbe
 MSPtrXXQFli27GJ3oeGes8p98DTDeLYoAQvue0ien2C6gG63Ap2T6y/vDNEZ79Z2KmDq
 hXfg==
X-Gm-Message-State: AOAM532A1uNHaRLICZREowquURGyCPoqCaqkyuCTmoHyImtQt3dyV1ki
 GOlCAFz7wKvQXtdQ/zR9kOM=
X-Google-Smtp-Source: ABdhPJxDrjBlMEFOekoi/ebwbSRvDUyUkIlPU98qCt8JNd3nV7P8t6G2JhmCP59zVAcQ4e+N2RRH4w==
X-Received: by 2002:a05:6a00:a94:b0:44c:ecb2:6018 with SMTP id
 b20-20020a056a000a9400b0044cecb26018mr29289107pfl.57.1638692302327; 
 Sun, 05 Dec 2021 00:18:22 -0800 (PST)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:7:87aa:e334:f070:ebca])
 by smtp.gmail.com with ESMTPSA id s8sm6439905pgl.77.2021.12.05.00.18.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 00:18:22 -0800 (PST)
From: Tianyu Lan <ltykernel@gmail.com>
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, jgross@suse.com, sstabellini@kernel.org,
 boris.ostrovsky@oracle.com, joro@8bytes.org, will@kernel.org,
 davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, arnd@arndb.de, hch@infradead.org,
 m.szyprowski@samsung.com, robin.murphy@arm.com, thomas.lendacky@amd.com,
 Tianyu.Lan@microsoft.com, xen-devel@lists.xenproject.org,
 michael.h.kelley@microsoft.com
Subject: [PATCH V4 3/5] hyperv/IOMMU: Enable swiotlb bounce buffer for
 Isolation VM
Date: Sun,  5 Dec 2021 03:18:11 -0500
Message-Id: <20211205081815.129276-4-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211205081815.129276-1-ltykernel@gmail.com>
References: <20211205081815.129276-1-ltykernel@gmail.com>
MIME-Version: 1.0
Cc: linux-arch@vger.kernel.org, parri.andrea@gmail.com,
 linux-hyperv@vger.kernel.org, brijesh.singh@amd.com,
 linux-scsi@vger.kernel.org, konrad.wilk@oracle.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dave.hansen@intel.com,
 iommu@lists.linux-foundation.org, vkuznets@redhat.com, hch@lst.de
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

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

hyperv Isolation VM requires bounce buffer support to copy
data from/to encrypted memory and so enable swiotlb force
mode to use swiotlb bounce buffer for DMA transaction.

In Isolation VM with AMD SEV, the bounce buffer needs to be
accessed via extra address space which is above shared_gpa_boundary
(E.G 39 bit address line) reported by Hyper-V CPUID ISOLATION_CONFIG.
The access physical address will be original physical address +
shared_gpa_boundary. The shared_gpa_boundary in the AMD SEV SNP
spec is called virtual top of memory(vTOM). Memory addresses below
vTOM are automatically treated as private while memory above
vTOM is treated as shared.

Hyper-V initalizes swiotlb bounce buffer and default swiotlb
needs to be disabled. pci_swiotlb_detect_override() and
pci_swiotlb_detect_4gb() enable the default one. To override
the setting, hyperv_swiotlb_detect() needs to run before
these detect functions which depends on the pci_xen_swiotlb_
init(). Make pci_xen_swiotlb_init() depends on the hyperv_swiotlb
_detect() to keep the order.

Swiotlb bounce buffer code calls set_memory_decrypted()
to mark bounce buffer visible to host and map it in extra
address space via memremap. Populate the shared_gpa_boundary
(vTOM) via swiotlb_unencrypted_base variable.

The map function memremap() can't work in the early place
hyperv_iommu_swiotlb_init() and so call swiotlb_update_mem_attributes()
in the hyperv_iommu_swiotlb_later_init().

Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
---
Change since v3:
	* Add comment in pci-swiotlb-xen.c to explain why add
	  dependency between hyperv_swiotlb_detect() and pci_
	  xen_swiotlb_detect().
	* Return directly when fails to allocate Hyper-V swiotlb
	  buffer in the hyperv_iommu_swiotlb_init().
---
 arch/x86/xen/pci-swiotlb-xen.c | 12 ++++++-
 drivers/hv/vmbus_drv.c         |  3 ++
 drivers/iommu/hyperv-iommu.c   | 58 ++++++++++++++++++++++++++++++++++
 include/linux/hyperv.h         |  8 +++++
 4 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/pci-swiotlb-xen.c b/arch/x86/xen/pci-swiotlb-xen.c
index 46df59aeaa06..8e2ee3ce6374 100644
--- a/arch/x86/xen/pci-swiotlb-xen.c
+++ b/arch/x86/xen/pci-swiotlb-xen.c
@@ -4,6 +4,7 @@
 
 #include <linux/dma-map-ops.h>
 #include <linux/pci.h>
+#include <linux/hyperv.h>
 #include <xen/swiotlb-xen.h>
 
 #include <asm/xen/hypervisor.h>
@@ -90,7 +91,16 @@ int pci_xen_swiotlb_init_late(void)
 }
 EXPORT_SYMBOL_GPL(pci_xen_swiotlb_init_late);
 
+/*
+ * Hyper-V initalizes swiotlb bounce buffer and default swiotlb
+ * needs to be disabled. pci_swiotlb_detect_override() and
+ * pci_swiotlb_detect_4gb() enable the default one. To override
+ * the setting, hyperv_swiotlb_detect() needs to run before
+ * these detect functions which depends on the pci_xen_swiotlb_
+ * init(). Make pci_xen_swiotlb_init() depends on the hyperv_swiotlb
+ * _detect() to keep the order.
+ */
 IOMMU_INIT_FINISH(pci_xen_swiotlb_detect,
-		  NULL,
+		  hyperv_swiotlb_detect,
 		  pci_xen_swiotlb_init,
 		  NULL);
diff --git a/drivers/hv/vmbus_drv.c b/drivers/hv/vmbus_drv.c
index 392c1ac4f819..0a64ccfafb8b 100644
--- a/drivers/hv/vmbus_drv.c
+++ b/drivers/hv/vmbus_drv.c
@@ -33,6 +33,7 @@
 #include <linux/random.h>
 #include <linux/kernel.h>
 #include <linux/syscore_ops.h>
+#include <linux/dma-map-ops.h>
 #include <clocksource/hyperv_timer.h>
 #include "hyperv_vmbus.h"
 
@@ -2078,6 +2079,7 @@ struct hv_device *vmbus_device_create(const guid_t *type,
 	return child_device_obj;
 }
 
+static u64 vmbus_dma_mask = DMA_BIT_MASK(64);
 /*
  * vmbus_device_register - Register the child device
  */
@@ -2118,6 +2120,7 @@ int vmbus_device_register(struct hv_device *child_device_obj)
 	}
 	hv_debug_add_dev_dir(child_device_obj);
 
+	child_device_obj->device.dma_mask = &vmbus_dma_mask;
 	return 0;
 
 err_kset_unregister:
diff --git a/drivers/iommu/hyperv-iommu.c b/drivers/iommu/hyperv-iommu.c
index e285a220c913..44ba24d9e06c 100644
--- a/drivers/iommu/hyperv-iommu.c
+++ b/drivers/iommu/hyperv-iommu.c
@@ -13,14 +13,20 @@
 #include <linux/irq.h>
 #include <linux/iommu.h>
 #include <linux/module.h>
+#include <linux/hyperv.h>
+#include <linux/io.h>
 
 #include <asm/apic.h>
 #include <asm/cpu.h>
 #include <asm/hw_irq.h>
 #include <asm/io_apic.h>
+#include <asm/iommu.h>
+#include <asm/iommu_table.h>
 #include <asm/irq_remapping.h>
 #include <asm/hypervisor.h>
 #include <asm/mshyperv.h>
+#include <asm/swiotlb.h>
+#include <linux/dma-direct.h>
 
 #include "irq_remapping.h"
 
@@ -337,4 +343,56 @@ static const struct irq_domain_ops hyperv_root_ir_domain_ops = {
 	.free = hyperv_root_irq_remapping_free,
 };
 
+static void __init hyperv_iommu_swiotlb_init(void)
+{
+	unsigned long hyperv_io_tlb_size;
+	void *hyperv_io_tlb_start;
+
+	/*
+	 * Allocate Hyper-V swiotlb bounce buffer at early place
+	 * to reserve large contiguous memory.
+	 */
+	hyperv_io_tlb_size = swiotlb_size_or_default();
+	hyperv_io_tlb_start = memblock_alloc(hyperv_io_tlb_size, PAGE_SIZE);
+
+	if (!hyperv_io_tlb_start) {
+		pr_warn("Fail to allocate Hyper-V swiotlb buffer.\n");
+		return;
+	}
+
+	swiotlb_init_with_tbl(hyperv_io_tlb_start,
+			      hyperv_io_tlb_size >> IO_TLB_SHIFT, true);
+}
+
+int __init hyperv_swiotlb_detect(void)
+{
+	if (!hypervisor_is_type(X86_HYPER_MS_HYPERV))
+		return 0;
+
+	if (!hv_is_isolation_supported())
+		return 0;
+
+	/*
+	 * Enable swiotlb force mode in Isolation VM to
+	 * use swiotlb bounce buffer for dma transaction.
+	 */
+	if (hv_isolation_type_snp())
+		swiotlb_unencrypted_base = ms_hyperv.shared_gpa_boundary;
+	swiotlb_force = SWIOTLB_FORCE;
+	return 1;
+}
+
+static void __init hyperv_iommu_swiotlb_later_init(void)
+{
+	/*
+	 * Swiotlb bounce buffer needs to be mapped in extra address
+	 * space. Map function doesn't work in the early place and so
+	 * call swiotlb_update_mem_attributes() here.
+	 */
+	swiotlb_update_mem_attributes();
+}
+
+IOMMU_INIT_FINISH(hyperv_swiotlb_detect,
+		  NULL, hyperv_iommu_swiotlb_init,
+		  hyperv_iommu_swiotlb_later_init);
 #endif
diff --git a/include/linux/hyperv.h b/include/linux/hyperv.h
index b823311eac79..1f037e114dc8 100644
--- a/include/linux/hyperv.h
+++ b/include/linux/hyperv.h
@@ -1726,6 +1726,14 @@ int hyperv_write_cfg_blk(struct pci_dev *dev, void *buf, unsigned int len,
 int hyperv_reg_block_invalidate(struct pci_dev *dev, void *context,
 				void (*block_invalidate)(void *context,
 							 u64 block_mask));
+#if IS_ENABLED(CONFIG_HYPERV)
+int __init hyperv_swiotlb_detect(void);
+#else
+static inline int __init hyperv_swiotlb_detect(void)
+{
+	return 0;
+}
+#endif
 
 struct hyperv_pci_block_ops {
 	int (*read_block)(struct pci_dev *dev, void *buf, unsigned int buf_len,
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
