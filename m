Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E471C1089B
	for <lists.iommu@lfdr.de>; Wed,  1 May 2019 15:59:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B681D3694;
	Wed,  1 May 2019 13:59:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 05DC038D0
	for <iommu@lists.linux-foundation.org>;
	Wed,  1 May 2019 13:58:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id A606C189
	for <iommu@lists.linux-foundation.org>;
	Wed,  1 May 2019 13:58:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87553EBD;
	Wed,  1 May 2019 06:58:46 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
	[10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13B883F5AF;
	Wed,  1 May 2019 06:58:43 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH v3 4/7] irqchip/gic-v3-its: Don't map the MSI page in
	its_irq_compose_msi_msg()
Date: Wed,  1 May 2019 14:58:21 +0100
Message-Id: <20190501135824.25586-5-julien.grall@arm.com>
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

its_irq_compose_msi_msg() may be called from non-preemptible context.
However, on RT, iommu_dma_map_msi_msg requires to be called from a
preemptible context.

A recent change split iommu_dma_map_msi_msg() in two new functions:
one that should be called in preemptible context, the other does
not have any requirement.

The GICv3 ITS driver is reworked to avoid executing preemptible code in
non-preemptible context. This can be achieved by preparing the MSI
mapping when allocating the MSI interrupt.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

---
    Changes in v3:
        - Fix typo in the commit message
        - Check the return of iommu_dma_prepare_msi
        - Add Eric's reviewed-by

    Changes in v2:
        - Rework the commit message to use imperative mood
---
 drivers/irqchip/irq-gic-v3-its.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
index 7577755bdcf4..9cddf336c09d 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -1179,7 +1179,7 @@ static void its_irq_compose_msi_msg(struct irq_data *d, struct msi_msg *msg)
 	msg->address_hi		= upper_32_bits(addr);
 	msg->data		= its_get_event_id(d);
 
-	iommu_dma_map_msi_msg(d->irq, msg);
+	iommu_dma_compose_msi_msg(irq_data_get_msi_desc(d), msg);
 }
 
 static int its_irq_set_irqchip_state(struct irq_data *d,
@@ -2566,6 +2566,7 @@ static int its_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 {
 	msi_alloc_info_t *info = args;
 	struct its_device *its_dev = info->scratchpad[0].ptr;
+	struct its_node *its = its_dev->its;
 	irq_hw_number_t hwirq;
 	int err;
 	int i;
@@ -2574,6 +2575,10 @@ static int its_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 	if (err)
 		return err;
 
+	err = iommu_dma_prepare_msi(info->desc, its->get_msi_base(its_dev));
+	if (err)
+		return err;
+
 	for (i = 0; i < nr_irqs; i++) {
 		err = its_irq_gic_domain_alloc(domain, virq + i, hwirq + i);
 		if (err)
-- 
2.11.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
