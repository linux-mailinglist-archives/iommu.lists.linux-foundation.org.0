Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A0F1E8FF0
	for <lists.iommu@lfdr.de>; Sat, 30 May 2020 11:16:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 573332043A;
	Sat, 30 May 2020 09:16:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H2RFJTYbkLcY; Sat, 30 May 2020 09:16:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C87A42045D;
	Sat, 30 May 2020 09:16:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8BBC9C0895;
	Sat, 30 May 2020 09:16:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC602C016F
 for <iommu@lists.linux-foundation.org>; Sat, 30 May 2020 09:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 902D98828F
 for <iommu@lists.linux-foundation.org>; Sat, 30 May 2020 09:16:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hK7XR82iCIxj for <iommu@lists.linux-foundation.org>;
 Sat, 30 May 2020 09:16:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8EA768803D
 for <iommu@lists.linux-foundation.org>; Sat, 30 May 2020 09:16:28 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 7AF68A855B4A1C271330;
 Sat, 30 May 2020 17:16:24 +0800 (CST)
Received: from SWX921481.china.huawei.com (10.126.200.151) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Sat, 30 May 2020 17:16:16 +0800
From: Barry Song <song.bao.hua@hisilicon.com>
To: <will@kernel.org>, <robin.murphy@arm.com>, <hch@lst.de>,
 <m.szyprowski@samsung.com>, <iommu@lists.linux-foundation.org>
Subject: [PATCH] iommu/arm-smmu-v3: expose numa_node attribute to users in
 sysfs
Date: Sat, 30 May 2020 21:15:05 +1200
Message-ID: <20200530091505.56664-1-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.126.200.151]
X-CFilter-Loop: Reflected
Cc: linuxarm@huawei.com, linux-arm-kernel@lists.infradead.org
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

As tests show the latency of dma_unmap can increase dramatically while
calling them cross NUMA nodes, especially cross CPU packages, eg.
300ns vs 800ns while waiting for the completion of CMD_SYNC in an
empty command queue. The large latency causing by remote node will
in turn make contention of the command queue more serious, and enlarge
the latency of DMA users within local NUMA nodes.

Users might intend to enforce NUMA locality with the consideration of
the position of SMMU. The patch provides minor benefit by presenting
this information to users directly, as they might want to know it without
checking hardware spec at all.

Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
---
 drivers/iommu/arm-smmu-v3.c | 40 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index 82508730feb7..754c4d59498b 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -4021,6 +4021,44 @@ err_reset_pci_ops: __maybe_unused;
 	return err;
 }
 
+static ssize_t numa_node_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%d\n", dev_to_node(dev));
+}
+static DEVICE_ATTR_RO(numa_node);
+
+static umode_t arm_smmu_numa_attr_visible(struct kobject *kobj, struct attribute *a,
+		int n)
+{
+	struct device *dev = container_of(kobj, typeof(*dev), kobj);
+
+	if (!IS_ENABLED(CONFIG_NUMA))
+		return 0;
+
+	if (a == &dev_attr_numa_node.attr &&
+			dev_to_node(dev) == NUMA_NO_NODE)
+		return 0;
+
+	return a->mode;
+}
+
+static struct attribute *arm_smmu_dev_attrs[] = {
+	&dev_attr_numa_node.attr,
+	NULL
+};
+
+static struct attribute_group arm_smmu_dev_attrs_group = {
+	.attrs          = arm_smmu_dev_attrs,
+	.is_visible     = arm_smmu_numa_attr_visible,
+};
+
+
+static const struct attribute_group *arm_smmu_dev_attrs_groups[] = {
+	&arm_smmu_dev_attrs_group,
+	NULL,
+};
+
 static int arm_smmu_device_probe(struct platform_device *pdev)
 {
 	int irq, ret;
@@ -4097,7 +4135,7 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 		return ret;
 
 	/* And we're up. Go go go! */
-	ret = iommu_device_sysfs_add(&smmu->iommu, dev, NULL,
+	ret = iommu_device_sysfs_add(&smmu->iommu, dev, arm_smmu_dev_attrs_groups,
 				     "smmu3.%pa", &ioaddr);
 	if (ret)
 		return ret;
-- 
2.23.0


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
