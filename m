Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 807DBC2370
	for <lists.iommu@lfdr.de>; Mon, 30 Sep 2019 16:37:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DAAD319C6;
	Mon, 30 Sep 2019 14:37:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9FCDF199D
	for <iommu@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 14:37:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AC5B8735
	for <iommu@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 14:37:04 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 2A2F4719A77CE6655499;
	Mon, 30 Sep 2019 22:36:58 +0800 (CST)
Received: from localhost.localdomain (10.67.212.75) by
	DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server
	id 14.3.439.0; Mon, 30 Sep 2019 22:36:48 +0800
From: John Garry <john.garry@huawei.com>
To: <lorenzo.pieralisi@arm.com>, <guohanjun@huawei.com>,
	<sudeep.holla@arm.com>, <robin.murphy@arm.com>, <mark.rutland@arm.com>, 
	<will@kernel.org>
Subject: [RFC PATCH 1/6] ACPI/IORT: Set PMCG device parent
Date: Mon, 30 Sep 2019 22:33:46 +0800
Message-ID: <1569854031-237636-2-git-send-email-john.garry@huawei.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1569854031-237636-1-git-send-email-john.garry@huawei.com>
References: <1569854031-237636-1-git-send-email-john.garry@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.212.75]
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: nleeder@codeaurora.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
	linuxarm@huawei.com, iommu@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org, lenb@kernel.org
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

In the IORT, a PMCG node includes a node reference to its associated
device.

Set the PMCG platform device parent device for future referencing.

For now, we only consider setting for when the associated component is an
SMMUv3.

Signed-off-by: John Garry <john.garry@huawei.com>
---
 drivers/acpi/arm64/iort.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index 8569b79e8b58..0b687520c3e7 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -1455,7 +1455,7 @@ static __init const struct iort_dev_config *iort_get_dev_cfg(
  * Returns: 0 on success, <0 failure
  */
 static int __init iort_add_platform_device(struct acpi_iort_node *node,
-					   const struct iort_dev_config *ops)
+					   const struct iort_dev_config *ops, struct device *parent)
 {
 	struct fwnode_handle *fwnode;
 	struct platform_device *pdev;
@@ -1466,6 +1466,8 @@ static int __init iort_add_platform_device(struct acpi_iort_node *node,
 	if (!pdev)
 		return -ENOMEM;
 
+	pdev->dev.parent = parent;
+
 	if (ops->dev_set_proximity) {
 		ret = ops->dev_set_proximity(&pdev->dev, node);
 		if (ret)
@@ -1573,6 +1575,11 @@ static void __init iort_enable_acs(struct acpi_iort_node *iort_node)
 static inline void iort_enable_acs(struct acpi_iort_node *iort_node) { }
 #endif
 
+static int iort_fwnode_match(struct device *dev, const void *fwnode)
+{
+	return dev->fwnode == fwnode;
+}
+
 static void __init iort_init_platform_devices(void)
 {
 	struct acpi_iort_node *iort_node, *iort_end;
@@ -1594,11 +1601,34 @@ static void __init iort_init_platform_devices(void)
 				iort_table->length);
 
 	for (i = 0; i < iort->node_count; i++) {
+		struct device *parent = NULL;
+
 		if (iort_node >= iort_end) {
 			pr_err("iort node pointer overflows, bad table\n");
 			return;
 		}
 
+		/* Fixme: handle parent declared in IORT after PMCG */
+		if (iort_node->type == ACPI_IORT_NODE_PMCG) {
+			struct acpi_iort_node *iort_assoc_node;
+			struct acpi_iort_pmcg *pmcg;
+			u32 node_reference;
+
+			pmcg = (struct acpi_iort_pmcg *)iort_node->node_data;
+
+			node_reference = pmcg->node_reference;
+			iort_assoc_node = ACPI_ADD_PTR(struct acpi_iort_node, iort,
+				 node_reference);
+
+			if (iort_assoc_node->type == ACPI_IORT_NODE_SMMU_V3) {
+				struct fwnode_handle *assoc_fwnode;
+
+				assoc_fwnode = iort_get_fwnode(iort_assoc_node);
+
+				parent = bus_find_device(&platform_bus_type, NULL,
+				      assoc_fwnode, iort_fwnode_match);
+			}
+		}
 		iort_enable_acs(iort_node);
 
 		ops = iort_get_dev_cfg(iort_node);
@@ -1609,7 +1639,7 @@ static void __init iort_init_platform_devices(void)
 
 			iort_set_fwnode(iort_node, fwnode);
 
-			ret = iort_add_platform_device(iort_node, ops);
+			ret = iort_add_platform_device(iort_node, ops, parent);
 			if (ret) {
 				iort_delete_fwnode(iort_node);
 				acpi_free_fwnode_static(fwnode);
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
