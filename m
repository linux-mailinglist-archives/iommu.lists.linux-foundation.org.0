Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 55720E52C
	for <lists.iommu@lfdr.de>; Mon, 29 Apr 2019 16:47:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F3DF821E3;
	Mon, 29 Apr 2019 14:46:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 99BB821D6
	for <iommu@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 14:44:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 1438371C
	for <iommu@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 14:44:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4877165C;
	Mon, 29 Apr 2019 07:44:42 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
	[10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 855483F5C1;
	Mon, 29 Apr 2019 07:44:40 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH v2 2/7] iommu/dma-iommu: Split iommu_dma_map_msi_msg() in two
	parts
Date: Mon, 29 Apr 2019 15:44:23 +0100
Message-Id: <20190429144428.29254-3-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190429144428.29254-1-julien.grall@arm.com>
References: <20190429144428.29254-1-julien.grall@arm.com>
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

On RT, iommu_dma_map_msi_msg() may be called from non-preemptible
context. This will lead to a splat with CONFIG_DEBUG_ATOMIC_SLEEP as
the function is using spin_lock (they can sleep on RT).

iommu_dma_map_msi_msg() is used to map the MSI page in the IOMMU PT
and update the MSI message with the IOVA.

Only the part to lookup for the MSI page requires to be called in
preemptible context. As the MSI page cannot change over the lifecycle
of the MSI interrupt, the lookup can be cached and re-used later on.

iomma_dma_map_msi_msg() is now split in two functions:
    - iommu_dma_prepare_msi(): This function will prepare the mapping
    in the IOMMU and store the cookie in the structure msi_desc. This
    function should be called in preemptible context.
    - iommu_dma_compose_msi_msg(): This function will update the MSI
    message with the IOVA when the device is behind an IOMMU.

Signed-off-by: Julien Grall <julien.grall@arm.com>

---
    Changes in v2:
        - Rework the commit message to use imperative mood
        - Use the MSI accessor to get/set the iommu cookie
        - Don't use ternary on return
        - Select CONFIG_IRQ_MSI_IOMMU
        - Pass an msi_desc rather than the irq number
---
 drivers/iommu/Kconfig     |  1 +
 drivers/iommu/dma-iommu.c | 47 ++++++++++++++++++++++++++++++++++++++---------
 include/linux/dma-iommu.h | 23 +++++++++++++++++++++++
 3 files changed, 62 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 6f07f3b21816..eb1c8cd243f9 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -94,6 +94,7 @@ config IOMMU_DMA
 	bool
 	select IOMMU_API
 	select IOMMU_IOVA
+	select IRQ_MSI_IOMMU
 	select NEED_SG_DMA_LENGTH
 
 config FSL_PAMU
diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 77aabe637a60..2309f59cefa4 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -888,17 +888,18 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
 	return NULL;
 }
 
-void iommu_dma_map_msi_msg(int irq, struct msi_msg *msg)
+int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr)
 {
-	struct device *dev = msi_desc_to_dev(irq_get_msi_desc(irq));
+	struct device *dev = msi_desc_to_dev(desc);
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
 	struct iommu_dma_cookie *cookie;
 	struct iommu_dma_msi_page *msi_page;
-	phys_addr_t msi_addr = (u64)msg->address_hi << 32 | msg->address_lo;
 	unsigned long flags;
 
-	if (!domain || !domain->iova_cookie)
-		return;
+	if (!domain || !domain->iova_cookie) {
+		desc->iommu_cookie = NULL;
+		return 0;
+	}
 
 	cookie = domain->iova_cookie;
 
@@ -911,7 +912,37 @@ void iommu_dma_map_msi_msg(int irq, struct msi_msg *msg)
 	msi_page = iommu_dma_get_msi_page(dev, msi_addr, domain);
 	spin_unlock_irqrestore(&cookie->msi_lock, flags);
 
-	if (WARN_ON(!msi_page)) {
+	msi_desc_set_iommu_cookie(desc, msi_page);
+
+	if (!msi_page)
+		return -ENOMEM;
+	else
+		return 0;
+}
+
+void iommu_dma_compose_msi_msg(struct msi_desc *desc,
+			       struct msi_msg *msg)
+{
+	struct device *dev = msi_desc_to_dev(desc);
+	const struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
+	const struct iommu_dma_msi_page *msi_page;
+
+	msi_page = msi_desc_get_iommu_cookie(desc);
+
+	if (!domain || !domain->iova_cookie || WARN_ON(!msi_page))
+		return;
+
+	msg->address_hi = upper_32_bits(msi_page->iova);
+	msg->address_lo &= cookie_msi_granule(domain->iova_cookie) - 1;
+	msg->address_lo += lower_32_bits(msi_page->iova);
+}
+
+void iommu_dma_map_msi_msg(int irq, struct msi_msg *msg)
+{
+	struct msi_desc *desc = irq_get_msi_desc(irq);
+	phys_addr_t msi_addr = (u64)msg->address_hi << 32 | msg->address_lo;
+
+	if (WARN_ON(iommu_dma_prepare_msi(desc, msi_addr))) {
 		/*
 		 * We're called from a void callback, so the best we can do is
 		 * 'fail' by filling the message with obviously bogus values.
@@ -922,8 +953,6 @@ void iommu_dma_map_msi_msg(int irq, struct msi_msg *msg)
 		msg->address_lo = ~0U;
 		msg->data = ~0U;
 	} else {
-		msg->address_hi = upper_32_bits(msi_page->iova);
-		msg->address_lo &= cookie_msi_granule(cookie) - 1;
-		msg->address_lo += lower_32_bits(msi_page->iova);
+		iommu_dma_compose_msi_msg(desc, msg);
 	}
 }
diff --git a/include/linux/dma-iommu.h b/include/linux/dma-iommu.h
index e760dc5d1fa8..3fc48fbd6f63 100644
--- a/include/linux/dma-iommu.h
+++ b/include/linux/dma-iommu.h
@@ -71,12 +71,24 @@ void iommu_dma_unmap_resource(struct device *dev, dma_addr_t handle,
 		size_t size, enum dma_data_direction dir, unsigned long attrs);
 
 /* The DMA API isn't _quite_ the whole story, though... */
+/*
+ * Map the MSI page in the IOMMU device and store it in @desc
+ *
+ * Return 0 if succeeded other an error if the preparation has failed.
+ */
+int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr);
+
+/* Update the MSI message if required. */
+void iommu_dma_compose_msi_msg(struct msi_desc *desc,
+			       struct msi_msg *msg);
+
 void iommu_dma_map_msi_msg(int irq, struct msi_msg *msg);
 void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list);
 
 #else
 
 struct iommu_domain;
+struct msi_desc;
 struct msi_msg;
 struct device;
 
@@ -99,6 +111,17 @@ static inline void iommu_put_dma_cookie(struct iommu_domain *domain)
 {
 }
 
+static inline int iommu_dma_prepare_msi(struct msi_desc *desc,
+					phys_addr_t msi_addr)
+{
+	return 0;
+}
+
+static inline void iommu_dma_compose_msi_msg(struct msi_desc *desc,
+					     struct msi_msg *msg)
+{
+}
+
 static inline void iommu_dma_map_msi_msg(int irq, struct msi_msg *msg)
 {
 }
-- 
2.11.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
