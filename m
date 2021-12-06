Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A1ED146AC98
	for <lists.iommu@lfdr.de>; Mon,  6 Dec 2021 23:39:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5806384BF7;
	Mon,  6 Dec 2021 22:39:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GVEGTkME2F2Z; Mon,  6 Dec 2021 22:39:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1F3AE84BFD;
	Mon,  6 Dec 2021 22:39:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09AF6C0012;
	Mon,  6 Dec 2021 22:39:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3CD5FC0012
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 22:39:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F4C641C6C
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 22:39:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linutronix.de header.b="eNkXff63";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=linutronix.de header.b="1h7Xx/9o"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BK5Vq8fA4rO5 for <iommu@lists.linux-foundation.org>;
 Mon,  6 Dec 2021 22:39:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0936541C6A
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 22:39:52 +0000 (UTC)
Message-ID: <20211206210439.509185723@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1638830391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=MAzri/Ik5YcCf7rqaBTMF5Cuwc5gLSC2IVoV+Z98uqM=;
 b=eNkXff63vr2Q2uY7VZzzS51kJWHiTQ8Ei9UuAfkro31+v28y0JL805IOJNrM9zgQjXwOoy
 f3vue31+qcqig9tHhSMJP1WBdK3VXMOJUDpJ6LjA0WjRzWY239DspymZ/Tnb9u5fghtpg7
 f54iz0Hxah6Bj4pFOigwKc9KaA4OzD/m7gKwWpFMx68HQ2ctQNxFO4mIskKlAgGDUd1gcr
 yTZAlBcvZ+Cjf9HdunsVmkmWC+zKZruFEYPSDPQJEE5uZRKrj74qCM7/l6/7urvMtLddEv
 LxZpFzneCrrjny6BHGYZoEHxHces3Orz45z+E2dUnTstoxDQHpfpO7naza31wA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1638830391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=MAzri/Ik5YcCf7rqaBTMF5Cuwc5gLSC2IVoV+Z98uqM=;
 b=1h7Xx/9oH8FwYZLNkKeByCn3tZV2xGgre0G22+oZmN+SvXQeds8+8s5wK0++7gL9dxyRy9
 YFyDZVy0EjjXy2Bw==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V2 34/36] bus: fsl-mc: fsl-mc-allocator: Rework MSI handling
References: <20211206210307.625116253@linutronix.de>
MIME-Version: 1.0
Date: Mon,  6 Dec 2021 23:39:50 +0100 (CET)
Cc: Nishanth Menon <nm@ti.com>, Mark Rutland <mark.rutland@arm.com>,
 Stuart Yoder <stuyoder@gmail.com>, linux-pci@vger.kernel.org,
 Will Deacon <will@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Marc Zygnier <maz@kernel.org>, Sinan Kaya <okaya@kernel.org>,
 iommu@lists.linux-foundation.org, Bjorn Helgaas <helgaas@kernel.org>,
 Megha Dey <megha.dey@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Cedric Le Goater <clg@kaod.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Juergen Gross <jgross@suse.com>, Tero Kristo <kristo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
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

Storing a pointer to the MSI descriptor just to track the Linux interrupt
number is daft. Just store the interrupt number and be done with it.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Cc: Stuart Yoder <stuyoder@gmail.com>
---
 drivers/bus/fsl-mc/dprc-driver.c                    |    8 ++++----
 drivers/bus/fsl-mc/fsl-mc-allocator.c               |    9 ++-------
 drivers/bus/fsl-mc/fsl-mc-msi.c                     |    6 +++---
 drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c    |    4 ++--
 drivers/net/ethernet/freescale/dpaa2/dpaa2-ptp.c    |    4 +---
 drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.c |    5 ++---
 drivers/soc/fsl/dpio/dpio-driver.c                  |    8 ++++----
 drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c              |    4 ++--
 include/linux/fsl/mc.h                              |    4 ++--
 9 files changed, 22 insertions(+), 30 deletions(-)

--- a/drivers/bus/fsl-mc/dprc-driver.c
+++ b/drivers/bus/fsl-mc/dprc-driver.c
@@ -400,7 +400,7 @@ static irqreturn_t dprc_irq0_handler_thr
 	struct fsl_mc_device *mc_dev = to_fsl_mc_device(dev);
 	struct fsl_mc_bus *mc_bus = to_fsl_mc_bus(mc_dev);
 	struct fsl_mc_io *mc_io = mc_dev->mc_io;
-	struct msi_desc *msi_desc = mc_dev->irqs[0]->msi_desc;
+	int irq = mc_dev->irqs[0]->virq;
 
 	dev_dbg(dev, "DPRC IRQ %d triggered on CPU %u\n",
 		irq_num, smp_processor_id());
@@ -409,7 +409,7 @@ static irqreturn_t dprc_irq0_handler_thr
 		return IRQ_HANDLED;
 
 	mutex_lock(&mc_bus->scan_mutex);
-	if (!msi_desc || msi_desc->irq != (u32)irq_num)
+	if (irq != (u32)irq_num)
 		goto out;
 
 	status = 0;
@@ -521,7 +521,7 @@ static int register_dprc_irq_handler(str
 	 * function that programs the MSI physically in the device
 	 */
 	error = devm_request_threaded_irq(&mc_dev->dev,
-					  irq->msi_desc->irq,
+					  irq->virq,
 					  dprc_irq0_handler,
 					  dprc_irq0_handler_thread,
 					  IRQF_NO_SUSPEND | IRQF_ONESHOT,
@@ -771,7 +771,7 @@ static void dprc_teardown_irq(struct fsl
 
 	(void)disable_dprc_irq(mc_dev);
 
-	devm_free_irq(&mc_dev->dev, irq->msi_desc->irq, &mc_dev->dev);
+	devm_free_irq(&mc_dev->dev, irq->virq, &mc_dev->dev);
 
 	fsl_mc_free_irqs(mc_dev);
 }
--- a/drivers/bus/fsl-mc/fsl-mc-allocator.c
+++ b/drivers/bus/fsl-mc/fsl-mc-allocator.c
@@ -350,7 +350,6 @@ int fsl_mc_populate_irq_pool(struct fsl_
 			     unsigned int irq_count)
 {
 	unsigned int i;
-	struct msi_desc *msi_desc;
 	struct fsl_mc_device_irq *irq_resources;
 	struct fsl_mc_device_irq *mc_dev_irq;
 	int error;
@@ -388,16 +387,12 @@ int fsl_mc_populate_irq_pool(struct fsl_
 		mc_dev_irq->resource.type = res_pool->type;
 		mc_dev_irq->resource.data = mc_dev_irq;
 		mc_dev_irq->resource.parent_pool = res_pool;
+		mc_dev_irq->virq = msi_get_virq(&mc_bus_dev->dev, i);
+		mc_dev_irq->resource.id = mc_dev_irq->virq;
 		INIT_LIST_HEAD(&mc_dev_irq->resource.node);
 		list_add_tail(&mc_dev_irq->resource.node, &res_pool->free_list);
 	}
 
-	for_each_msi_entry(msi_desc, &mc_bus_dev->dev) {
-		mc_dev_irq = &irq_resources[msi_desc->msi_index];
-		mc_dev_irq->msi_desc = msi_desc;
-		mc_dev_irq->resource.id = msi_desc->irq;
-	}
-
 	res_pool->max_count = irq_count;
 	res_pool->free_count = irq_count;
 	mc_bus->irq_resources = irq_resources;
--- a/drivers/bus/fsl-mc/fsl-mc-msi.c
+++ b/drivers/bus/fsl-mc/fsl-mc-msi.c
@@ -58,11 +58,11 @@ static void fsl_mc_msi_update_dom_ops(st
 }
 
 static void __fsl_mc_msi_write_msg(struct fsl_mc_device *mc_bus_dev,
-				   struct fsl_mc_device_irq *mc_dev_irq)
+				   struct fsl_mc_device_irq *mc_dev_irq,
+				   struct msi_desc *msi_desc)
 {
 	int error;
 	struct fsl_mc_device *owner_mc_dev = mc_dev_irq->mc_dev;
-	struct msi_desc *msi_desc = mc_dev_irq->msi_desc;
 	struct dprc_irq_cfg irq_cfg;
 
 	/*
@@ -129,7 +129,7 @@ static void fsl_mc_msi_write_msg(struct
 	/*
 	 * Program the MSI (paddr, value) pair in the device:
 	 */
-	__fsl_mc_msi_write_msg(mc_bus_dev, mc_dev_irq);
+	__fsl_mc_msi_write_msg(mc_bus_dev, mc_dev_irq, msi_desc);
 }
 
 static void fsl_mc_msi_update_chip_ops(struct msi_domain_info *info)
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
@@ -4246,7 +4246,7 @@ static int dpaa2_eth_setup_irqs(struct f
 	}
 
 	irq = ls_dev->irqs[0];
-	err = devm_request_threaded_irq(&ls_dev->dev, irq->msi_desc->irq,
+	err = devm_request_threaded_irq(&ls_dev->dev, irq->virq,
 					NULL, dpni_irq0_handler_thread,
 					IRQF_NO_SUSPEND | IRQF_ONESHOT,
 					dev_name(&ls_dev->dev), &ls_dev->dev);
@@ -4273,7 +4273,7 @@ static int dpaa2_eth_setup_irqs(struct f
 	return 0;
 
 free_irq:
-	devm_free_irq(&ls_dev->dev, irq->msi_desc->irq, &ls_dev->dev);
+	devm_free_irq(&ls_dev->dev, irq->virq, &ls_dev->dev);
 free_mc_irq:
 	fsl_mc_free_irqs(ls_dev);
 
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-ptp.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-ptp.c
@@ -129,7 +129,6 @@ static irqreturn_t dpaa2_ptp_irq_handler
 static int dpaa2_ptp_probe(struct fsl_mc_device *mc_dev)
 {
 	struct device *dev = &mc_dev->dev;
-	struct fsl_mc_device_irq *irq;
 	struct ptp_qoriq *ptp_qoriq;
 	struct device_node *node;
 	void __iomem *base;
@@ -177,8 +176,7 @@ static int dpaa2_ptp_probe(struct fsl_mc
 		goto err_unmap;
 	}
 
-	irq = mc_dev->irqs[0];
-	ptp_qoriq->irq = irq->msi_desc->irq;
+	ptp_qoriq->irq = mc_dev->irqs[0]->virq;
 
 	err = request_threaded_irq(ptp_qoriq->irq, NULL,
 				   dpaa2_ptp_irq_handler_thread,
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-switch.c
@@ -1553,8 +1553,7 @@ static int dpaa2_switch_setup_irqs(struc
 
 	irq = sw_dev->irqs[DPSW_IRQ_INDEX_IF];
 
-	err = devm_request_threaded_irq(dev, irq->msi_desc->irq,
-					NULL,
+	err = devm_request_threaded_irq(dev, irq->virq, NULL,
 					dpaa2_switch_irq0_handler_thread,
 					IRQF_NO_SUSPEND | IRQF_ONESHOT,
 					dev_name(dev), dev);
@@ -1580,7 +1579,7 @@ static int dpaa2_switch_setup_irqs(struc
 	return 0;
 
 free_devm_irq:
-	devm_free_irq(dev, irq->msi_desc->irq, dev);
+	devm_free_irq(dev, irq->virq, dev);
 free_irq:
 	fsl_mc_free_irqs(sw_dev);
 	return err;
--- a/drivers/soc/fsl/dpio/dpio-driver.c
+++ b/drivers/soc/fsl/dpio/dpio-driver.c
@@ -88,7 +88,7 @@ static void unregister_dpio_irq_handlers
 	irq = dpio_dev->irqs[0];
 
 	/* clear the affinity hint */
-	irq_set_affinity_hint(irq->msi_desc->irq, NULL);
+	irq_set_affinity_hint(irq->virq, NULL);
 }
 
 static int register_dpio_irq_handlers(struct fsl_mc_device *dpio_dev, int cpu)
@@ -98,7 +98,7 @@ static int register_dpio_irq_handlers(st
 
 	irq = dpio_dev->irqs[0];
 	error = devm_request_irq(&dpio_dev->dev,
-				 irq->msi_desc->irq,
+				 irq->virq,
 				 dpio_irq_handler,
 				 0,
 				 dev_name(&dpio_dev->dev),
@@ -111,10 +111,10 @@ static int register_dpio_irq_handlers(st
 	}
 
 	/* set the affinity hint */
-	if (irq_set_affinity_hint(irq->msi_desc->irq, cpumask_of(cpu)))
+	if (irq_set_affinity_hint(irq->virq, cpumask_of(cpu)))
 		dev_err(&dpio_dev->dev,
 			"irq_set_affinity failed irq %d cpu %d\n",
-			irq->msi_desc->irq, cpu);
+			irq->virq, cpu);
 
 	return 0;
 }
--- a/drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c
+++ b/drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c
@@ -67,7 +67,7 @@ static int vfio_set_trigger(struct vfio_
 	int hwirq;
 	int ret;
 
-	hwirq = vdev->mc_dev->irqs[index]->msi_desc->irq;
+	hwirq = vdev->mc_dev->irqs[index]->virq;
 	if (irq->trigger) {
 		free_irq(hwirq, irq);
 		kfree(irq->name);
@@ -137,7 +137,7 @@ static int vfio_fsl_mc_set_irq_trigger(s
 		return vfio_set_trigger(vdev, index, fd);
 	}
 
-	hwirq = vdev->mc_dev->irqs[index]->msi_desc->irq;
+	hwirq = vdev->mc_dev->irqs[index]->virq;
 
 	irq = &vdev->mc_irqs[index];
 
--- a/include/linux/fsl/mc.h
+++ b/include/linux/fsl/mc.h
@@ -91,13 +91,13 @@ struct fsl_mc_resource {
 
 /**
  * struct fsl_mc_device_irq - MC object device message-based interrupt
- * @msi_desc: pointer to MSI descriptor allocated by fsl_mc_msi_alloc_descs()
+ * @virq: Linux virtual interrupt number
  * @mc_dev: MC object device that owns this interrupt
  * @dev_irq_index: device-relative IRQ index
  * @resource: MC generic resource associated with the interrupt
  */
 struct fsl_mc_device_irq {
-	struct msi_desc *msi_desc;
+	unsigned int virq;
 	struct fsl_mc_device *mc_dev;
 	u8 dev_irq_index;
 	struct fsl_mc_resource resource;

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
