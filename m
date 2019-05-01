Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8351089A
	for <lists.iommu@lfdr.de>; Wed,  1 May 2019 15:59:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 71E383B60;
	Wed,  1 May 2019 13:59:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3D26FB8F
	for <iommu@lists.linux-foundation.org>;
	Wed,  1 May 2019 13:58:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id E207A711
	for <iommu@lists.linux-foundation.org>;
	Wed,  1 May 2019 13:58:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C67D0A78;
	Wed,  1 May 2019 06:58:43 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
	[10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 52F583F5AF;
	Wed,  1 May 2019 06:58:41 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH v3 3/7] irqchip/gicv2m: Don't map the MSI page in
	gicv2m_compose_msi_msg()
Date: Wed,  1 May 2019 14:58:20 +0100
Message-Id: <20190501135824.25586-4-julien.grall@arm.com>
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

gicv2m_compose_msi_msg() may be called from non-preemptible context.
However, on RT, iommu_dma_map_msi_msg() requires to be called from a
preemptible context.

A recent change split iommu_dma_map_msi_msg() in two new functions:
one that should be called in preemptible context, the other does
not have any requirement.

The GICv2m driver is reworked to avoid executing preemptible code in
non-preemptible context. This can be achieved by preparing the MSI
mapping when allocating the MSI interrupt.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

---
    Changes in v3:
        - Add Eric's reviewed-by

    Changes in v2:
        - Rework the commit message to use imperative mood
---
 drivers/irqchip/irq-gic-v2m.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v2m.c b/drivers/irqchip/irq-gic-v2m.c
index f5fe0100f9ff..4359f0583377 100644
--- a/drivers/irqchip/irq-gic-v2m.c
+++ b/drivers/irqchip/irq-gic-v2m.c
@@ -110,7 +110,7 @@ static void gicv2m_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
 	if (v2m->flags & GICV2M_NEEDS_SPI_OFFSET)
 		msg->data -= v2m->spi_offset;
 
-	iommu_dma_map_msi_msg(data->irq, msg);
+	iommu_dma_compose_msi_msg(irq_data_get_msi_desc(data), msg);
 }
 
 static struct irq_chip gicv2m_irq_chip = {
@@ -167,6 +167,7 @@ static void gicv2m_unalloc_msi(struct v2m_data *v2m, unsigned int hwirq,
 static int gicv2m_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 				   unsigned int nr_irqs, void *args)
 {
+	msi_alloc_info_t *info = args;
 	struct v2m_data *v2m = NULL, *tmp;
 	int hwirq, offset, i, err = 0;
 
@@ -186,6 +187,11 @@ static int gicv2m_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 
 	hwirq = v2m->spi_start + offset;
 
+	err = iommu_dma_prepare_msi(info->desc,
+				    v2m->res.start + V2M_MSI_SETSPI_NS);
+	if (err)
+		return err;
+
 	for (i = 0; i < nr_irqs; i++) {
 		err = gicv2m_irq_gic_domain_alloc(domain, virq + i, hwirq + i);
 		if (err)
-- 
2.11.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
