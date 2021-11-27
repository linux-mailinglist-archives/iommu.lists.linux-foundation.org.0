Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E4045F87B
	for <lists.iommu@lfdr.de>; Sat, 27 Nov 2021 02:21:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13C824099D;
	Sat, 27 Nov 2021 01:21:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YMjqf0vs4eZZ; Sat, 27 Nov 2021 01:21:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 249EB4099C;
	Sat, 27 Nov 2021 01:21:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 01B58C003C;
	Sat, 27 Nov 2021 01:21:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B6A3C001C
 for <iommu@lists.linux-foundation.org>; Sat, 27 Nov 2021 01:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8766F4092D
 for <iommu@lists.linux-foundation.org>; Sat, 27 Nov 2021 01:21:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KYCaPX8MTJkd for <iommu@lists.linux-foundation.org>;
 Sat, 27 Nov 2021 01:21:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9C5740643
 for <iommu@lists.linux-foundation.org>; Sat, 27 Nov 2021 01:21:25 +0000 (UTC)
Message-ID: <20211126230524.173951799@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1637976084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=KQEQh1eEOaSazo6Y93s5vbUnfdxHtVwCI6okaSxjU/U=;
 b=HaW+RKZ7US4Uu1k70IERdgewYgAMO/snn0yfQAQKJQDV4+qotinJnq7cCON8tEPAT7rdOB
 r70bHhrvTkbQmARtu72DrjfgKSBgj93XYilRpVJ0089gw260ZqWj0PiinAug3WaymX0MEE
 7sp5xkGEXGeP+gsxDW7PesVsFgMjZEw9q0NaYuwiDC1UFt6w9303srXzckGNXJqZGQoY5a
 PkfsnMrcCVDQMENutonhoy9fnwGZHuWYwB/emrBw7crNcLZlLAW8PEiqA1hYJWyx0W7hgz
 chYnaHaj57PvEU1llnXC1JG85C6WnKrW1waddqqyiuJ9onsjL6OGWwGEioK6Ow==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1637976084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=KQEQh1eEOaSazo6Y93s5vbUnfdxHtVwCI6okaSxjU/U=;
 b=uvgZMbPuMeAAMoTatuwmExeWKcPlhOOIOhWbhLCB5AC9TFeOxtcdjgKAjMAphx/pwRm93S
 DArVVtnf9TF/OxAA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch 04/37] PCI/MSI: Use lock from msi_device_data
References: <20211126224100.303046749@linutronix.de>
MIME-Version: 1.0
Date: Sat, 27 Nov 2021 02:21:23 +0100 (CET)
Cc: Nishanth Menon <nm@ti.com>, Mark Rutland <mark.rutland@arm.com>,
 Stuart Yoder <stuyoder@gmail.com>, linux-pci@vger.kernel.org,
 Will Deacon <will@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Marc Zygnier <maz@kernel.org>, x86@kernel.org, Sinan Kaya <okaya@kernel.org>,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <helgaas@kernel.org>,
 Megha Dey <megha.dey@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Tero Kristo <kristo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org
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

Remove the register lock from struct device and use the one in
struct msi_device_data.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/base/core.c    |    1 -
 drivers/pci/msi/msi.c  |    2 +-
 include/linux/device.h |    2 --
 3 files changed, 1 insertion(+), 4 deletions(-)

--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2875,7 +2875,6 @@ void device_initialize(struct device *de
 	device_pm_init(dev);
 	set_dev_node(dev, NUMA_NO_NODE);
 #ifdef CONFIG_GENERIC_MSI_IRQ
-	raw_spin_lock_init(&dev->msi_lock);
 	INIT_LIST_HEAD(&dev->msi_list);
 #endif
 	INIT_LIST_HEAD(&dev->links.consumers);
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -18,7 +18,7 @@ int pci_msi_ignore_mask;
 
 static noinline void pci_msi_update_mask(struct msi_desc *desc, u32 clear, u32 set)
 {
-	raw_spinlock_t *lock = &desc->dev->msi_lock;
+	raw_spinlock_t *lock = &desc->dev->msi.data->lock;
 	unsigned long flags;
 
 	if (!desc->pci.msi_attrib.can_mask)
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -422,7 +422,6 @@ struct dev_msi_info {
  * @em_pd:	device's energy model performance domain
  * @pins:	For device pin management.
  *		See Documentation/driver-api/pin-control.rst for details.
- * @msi_lock:	Lock to protect MSI mask cache and mask register
  * @msi_list:	Hosts MSI descriptors
  * @numa_node:	NUMA node this device is close to.
  * @dma_ops:    DMA mapping operations for this device.
@@ -520,7 +519,6 @@ struct device {
 #endif
 	struct dev_msi_info	msi;
 #ifdef CONFIG_GENERIC_MSI_IRQ
-	raw_spinlock_t		msi_lock;
 	struct list_head	msi_list;
 #endif
 #ifdef CONFIG_DMA_OPS

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
