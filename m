Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id F05F71DCD7A
	for <lists.iommu@lfdr.de>; Thu, 21 May 2020 15:00:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3CEB7814CA;
	Thu, 21 May 2020 13:00:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hzEqOyJr84KC; Thu, 21 May 2020 13:00:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9DEAB8841A;
	Thu, 21 May 2020 13:00:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87F79C0176;
	Thu, 21 May 2020 13:00:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90D9BC0176
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 13:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8026F883F7
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 13:00:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IijfMEkhSFRu for <iommu@lists.linux-foundation.org>;
 Thu, 21 May 2020 13:00:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8521B88415
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 13:00:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FA8A1063;
 Thu, 21 May 2020 06:00:25 -0700 (PDT)
Received: from red-moon.arm.com (unknown [10.57.29.145])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EAC63F305;
 Thu, 21 May 2020 06:00:22 -0700 (PDT)
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 03/12] ACPI/IORT: Make iort_msi_map_rid() PCI agnostic
Date: Thu, 21 May 2020 13:59:59 +0100
Message-Id: <20200521130008.8266-4-lorenzo.pieralisi@arm.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200521130008.8266-1-lorenzo.pieralisi@arm.com>
References: <20200521130008.8266-1-lorenzo.pieralisi@arm.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Makarand Pawagi <makarand.pawagi@nxp.com>, linux-pci@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Hanjun Guo <guohanjun@huawei.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Robin Murphy <robin.murphy@arm.com>,
 linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Will Deacon <will@kernel.org>,
 Diana Craciun <diana.craciun@oss.nxp.com>
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

There is nothing PCI specific in iort_msi_map_rid(). Make it
a generic function, iort_msi_map_id() and provide a stub
for iort_msi_map_rid() on top of it to keep current users
unchanged.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Hanjun Guo <guohanjun@huawei.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
---
 drivers/acpi/arm64/iort.c | 12 ++++++------
 include/linux/acpi_iort.h | 12 ++++++++++--
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index 8f2a961c1364..f346a785e0b5 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -585,22 +585,22 @@ static struct acpi_iort_node *iort_find_dev_node(struct device *dev)
 }
 
 /**
- * iort_msi_map_rid() - Map a MSI requester ID for a device
+ * iort_msi_map_id() - Map a MSI input ID for a device
  * @dev: The device for which the mapping is to be done.
- * @req_id: The device requester ID.
+ * @input_id: The device input ID.
  *
- * Returns: mapped MSI RID on success, input requester ID otherwise
+ * Returns: mapped MSI ID on success, input ID otherwise
  */
-u32 iort_msi_map_rid(struct device *dev, u32 req_id)
+u32 iort_msi_map_id(struct device *dev, u32 input_id)
 {
 	struct acpi_iort_node *node;
 	u32 dev_id;
 
 	node = iort_find_dev_node(dev);
 	if (!node)
-		return req_id;
+		return input_id;
 
-	iort_node_map_id(node, req_id, &dev_id, IORT_MSI_TYPE);
+	iort_node_map_id(node, input_id, &dev_id, IORT_MSI_TYPE);
 	return dev_id;
 }
 
diff --git a/include/linux/acpi_iort.h b/include/linux/acpi_iort.h
index 08ec6bd2297f..8c71f92b92ef 100644
--- a/include/linux/acpi_iort.h
+++ b/include/linux/acpi_iort.h
@@ -28,7 +28,11 @@ void iort_deregister_domain_token(int trans_id);
 struct fwnode_handle *iort_find_domain_token(int trans_id);
 #ifdef CONFIG_ACPI_IORT
 void acpi_iort_init(void);
-u32 iort_msi_map_rid(struct device *dev, u32 req_id);
+u32 iort_msi_map_id(struct device *dev, u32 id);
+static inline u32 iort_msi_map_rid(struct device *dev, u32 req_id)
+{
+	return iort_msi_map_id(dev, req_id);
+}
 struct irq_domain *iort_get_device_domain(struct device *dev, u32 id,
 					  enum irq_domain_bus_token bus_token);
 void acpi_configure_pmsi_domain(struct device *dev);
@@ -39,8 +43,12 @@ const struct iommu_ops *iort_iommu_configure(struct device *dev);
 int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head);
 #else
 static inline void acpi_iort_init(void) { }
+static inline u32 iort_msi_map_id(struct device *dev, u32 id)
+{ return id; }
 static inline u32 iort_msi_map_rid(struct device *dev, u32 req_id)
-{ return req_id; }
+{
+	return iort_msi_map_id(dev, req_id);
+}
 static inline struct irq_domain *iort_get_device_domain(
 	struct device *dev, u32 id, enum irq_domain_bus_token bus_token)
 { return NULL; }
-- 
2.26.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
