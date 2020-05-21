Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CD81DCD91
	for <lists.iommu@lfdr.de>; Thu, 21 May 2020 15:00:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C818E20008;
	Thu, 21 May 2020 13:00:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vyi9efRY1X2w; Thu, 21 May 2020 13:00:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 56E7822731;
	Thu, 21 May 2020 13:00:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 440E4C0176;
	Thu, 21 May 2020 13:00:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA5E0C0176
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 13:00:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A67BA893C6
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 13:00:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1U0kVRPTU82n for <iommu@lists.linux-foundation.org>;
 Thu, 21 May 2020 13:00:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8E99E893B7
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 13:00:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B629D6E;
 Thu, 21 May 2020 06:00:44 -0700 (PDT)
Received: from red-moon.arm.com (unknown [10.57.29.145])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CAC5E3F305;
 Thu, 21 May 2020 06:00:41 -0700 (PDT)
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 10/12] of/irq: Make of_msi_map_rid() PCI bus agnostic
Date: Thu, 21 May 2020 14:00:06 +0100
Message-Id: <20200521130008.8266-11-lorenzo.pieralisi@arm.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200521130008.8266-1-lorenzo.pieralisi@arm.com>
References: <20200521130008.8266-1-lorenzo.pieralisi@arm.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Makarand Pawagi <makarand.pawagi@nxp.com>, Sudeep Holla <sudeep.holla@arm.com>,
 linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Robin Murphy <robin.murphy@arm.com>,
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

There is nothing PCI bus specific in the of_msi_map_rid()
implementation other than the requester ID tag for the input
ID space. Rename requester ID to a more generic ID so that
the translation code can be used by all busses that require
input/output ID translations.

Leave a wrapper function of_msi_map_rid() in place to keep
existing PCI code mapping requester ID syntactically unchanged.

No functional change intended.

Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/of/irq.c       | 28 ++++++++++++++--------------
 include/linux/of_irq.h | 14 ++++++++++++--
 2 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index 48a40326984f..25d17b8a1a1a 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -576,43 +576,43 @@ void __init of_irq_init(const struct of_device_id *matches)
 	}
 }
 
-static u32 __of_msi_map_rid(struct device *dev, struct device_node **np,
-			    u32 rid_in)
+static u32 __of_msi_map_id(struct device *dev, struct device_node **np,
+			    u32 id_in)
 {
 	struct device *parent_dev;
-	u32 rid_out = rid_in;
+	u32 id_out = id_in;
 
 	/*
 	 * Walk up the device parent links looking for one with a
 	 * "msi-map" property.
 	 */
 	for (parent_dev = dev; parent_dev; parent_dev = parent_dev->parent)
-		if (!of_map_rid(parent_dev->of_node, rid_in, "msi-map",
-				"msi-map-mask", np, &rid_out))
+		if (!of_map_id(parent_dev->of_node, id_in, "msi-map",
+				"msi-map-mask", np, &id_out))
 			break;
-	return rid_out;
+	return id_out;
 }
 
 /**
- * of_msi_map_rid - Map a MSI requester ID for a device.
+ * of_msi_map_id - Map a MSI ID for a device.
  * @dev: device for which the mapping is to be done.
  * @msi_np: device node of the expected msi controller.
- * @rid_in: unmapped MSI requester ID for the device.
+ * @id_in: unmapped MSI ID for the device.
  *
  * Walk up the device hierarchy looking for devices with a "msi-map"
- * property.  If found, apply the mapping to @rid_in.
+ * property.  If found, apply the mapping to @id_in.
  *
- * Returns the mapped MSI requester ID.
+ * Returns the mapped MSI ID.
  */
-u32 of_msi_map_rid(struct device *dev, struct device_node *msi_np, u32 rid_in)
+u32 of_msi_map_id(struct device *dev, struct device_node *msi_np, u32 id_in)
 {
-	return __of_msi_map_rid(dev, &msi_np, rid_in);
+	return __of_msi_map_id(dev, &msi_np, id_in);
 }
 
 /**
  * of_msi_map_get_device_domain - Use msi-map to find the relevant MSI domain
  * @dev: device for which the mapping is to be done.
- * @rid: Requester ID for the device.
+ * @id: Device ID.
  * @bus_token: Bus token
  *
  * Walk up the device hierarchy looking for devices with a "msi-map"
@@ -625,7 +625,7 @@ struct irq_domain *of_msi_map_get_device_domain(struct device *dev, u32 id,
 {
 	struct device_node *np = NULL;
 
-	__of_msi_map_rid(dev, &np, id);
+	__of_msi_map_id(dev, &np, id);
 	return irq_find_matching_host(np, bus_token);
 }
 
diff --git a/include/linux/of_irq.h b/include/linux/of_irq.h
index 7142a3722758..cf9cb1e545ce 100644
--- a/include/linux/of_irq.h
+++ b/include/linux/of_irq.h
@@ -55,7 +55,12 @@ extern struct irq_domain *of_msi_map_get_device_domain(struct device *dev,
 							u32 id,
 							u32 bus_token);
 extern void of_msi_configure(struct device *dev, struct device_node *np);
-u32 of_msi_map_rid(struct device *dev, struct device_node *msi_np, u32 rid_in);
+u32 of_msi_map_id(struct device *dev, struct device_node *msi_np, u32 id_in);
+static inline u32 of_msi_map_rid(struct device *dev,
+				 struct device_node *msi_np, u32 rid_in)
+{
+	return of_msi_map_id(dev, msi_np, rid_in);
+}
 #else
 static inline int of_irq_count(struct device_node *dev)
 {
@@ -93,10 +98,15 @@ static inline struct irq_domain *of_msi_map_get_device_domain(struct device *dev
 static inline void of_msi_configure(struct device *dev, struct device_node *np)
 {
 }
+static inline u32 of_msi_map_id(struct device *dev,
+				 struct device_node *msi_np, u32 id_in)
+{
+	return id_in;
+}
 static inline u32 of_msi_map_rid(struct device *dev,
 				 struct device_node *msi_np, u32 rid_in)
 {
-	return rid_in;
+	return of_msi_map_id(dev, msi_np, rid_in);
 }
 #endif
 
-- 
2.26.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
