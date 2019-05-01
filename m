Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D0F1089F
	for <lists.iommu@lfdr.de>; Wed,  1 May 2019 15:59:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 563B13CAD;
	Wed,  1 May 2019 13:59:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A103C38E4
	for <iommu@lists.linux-foundation.org>;
	Wed,  1 May 2019 13:58:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id D1566711
	for <iommu@lists.linux-foundation.org>;
	Wed,  1 May 2019 13:58:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B372BA78;
	Wed,  1 May 2019 06:58:51 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
	[10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64E6E3F5AF;
	Wed,  1 May 2019 06:58:49 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH v3 6/7] irqchip/gic-v3-mbi: Don't map the MSI page in
	mbi_compose_m{b, s}i_msg()
Date: Wed,  1 May 2019 14:58:23 +0100
Message-Id: <20190501135824.25586-7-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190501135824.25586-1-julien.grall@arm.com>
References: <20190501135824.25586-1-julien.grall@arm.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: jason@lakedaemon.net, douliyangs@gmail.com, marc.zyngier@arm.com,
	robin.murphy@arm.com, Julien Grall <julien.grall@arm.com>,
	miquel.raynal@bootlin.com, tglx@linutronix.de,
	logang@deltatee.com, bigeasy@linutronix.de, linux-rt-users@vger.kernel.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

The functions mbi_compose_m{b, s}i_msg may be called from non-preemptible
context. However, on RT, iommu_dma_map_msi_msg() requires to be called
from a preemptible context.

A recent patch split iommu_dma_map_msi_msg in two new functions:
one that should be called in preemptible context, the other does
not have any requirement.

The GICv3 MSI driver is reworked to avoid executing preemptible code in
non-preemptible context. This can be achieved by preparing the two MSI
mappings when allocating the MSI interrupt.

Signed-off-by: Julien Grall <julien.grall@arm.com>

---
    Changes in v2:
        - Rework the commit message to use imperative mood
---
 drivers/irqchip/irq-gic-v3-mbi.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-mbi.c b/drivers/irqchip/irq-gic-v3-mbi.c
index fbfa7ff6deb1..d50f6cdf043c 100644
--- a/drivers/irqchip/irq-gic-v3-mbi.c
+++ b/drivers/irqchip/irq-gic-v3-mbi.c
@@ -84,6 +84,7 @@ static void mbi_free_msi(struct mbi_range *mbi, unsigned int hwirq,
 static int mbi_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 				   unsigned int nr_irqs, void *args)
 {
+	msi_alloc_info_t *info = args;
 	struct mbi_range *mbi = NULL;
 	int hwirq, offset, i, err = 0;
 
@@ -104,6 +105,16 @@ static int mbi_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 
 	hwirq = mbi->spi_start + offset;
 
+	err = iommu_dma_prepare_msi(info->desc,
+				    mbi_phys_base + GICD_CLRSPI_NSR);
+	if (err)
+		return err;
+
+	err = iommu_dma_prepare_msi(info->desc,
+				    mbi_phys_base + GICD_SETSPI_NSR);
+	if (err)
+		return err;
+
 	for (i = 0; i < nr_irqs; i++) {
 		err = mbi_irq_gic_domain_alloc(domain, virq + i, hwirq + i);
 		if (err)
@@ -142,7 +153,7 @@ static void mbi_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 	msg[0].address_lo = lower_32_bits(mbi_phys_base + GICD_SETSPI_NSR);
 	msg[0].data = data->parent_data->hwirq;
 
-	iommu_dma_map_msi_msg(data->irq, msg);
+	iommu_dma_compose_msi_msg(irq_data_get_msi_desc(data), msg);
 }
 
 #ifdef CONFIG_PCI_MSI
@@ -202,7 +213,7 @@ static void mbi_compose_mbi_msg(struct irq_data *data, struct msi_msg *msg)
 	msg[1].address_lo = lower_32_bits(mbi_phys_base + GICD_CLRSPI_NSR);
 	msg[1].data = data->parent_data->hwirq;
 
-	iommu_dma_map_msi_msg(data->irq, &msg[1]);
+	iommu_dma_compose_msi_msg(irq_data_get_msi_desc(data), &msg[1]);
 }
 
 /* Platform-MSI specific irqchip */
-- 
2.11.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
