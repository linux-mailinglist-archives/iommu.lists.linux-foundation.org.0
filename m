Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E8628C2372
	for <lists.iommu@lfdr.de>; Mon, 30 Sep 2019 16:37:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 313A519CC;
	Mon, 30 Sep 2019 14:37:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4AA79199D
	for <iommu@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 14:37:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D1D6F735
	for <iommu@lists.linux-foundation.org>;
	Mon, 30 Sep 2019 14:37:05 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 40F62D0A7B7A024C01A2;
	Mon, 30 Sep 2019 22:36:58 +0800 (CST)
Received: from localhost.localdomain (10.67.212.75) by
	DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server
	id 14.3.439.0; Mon, 30 Sep 2019 22:36:48 +0800
From: John Garry <john.garry@huawei.com>
To: <lorenzo.pieralisi@arm.com>, <guohanjun@huawei.com>,
	<sudeep.holla@arm.com>, <robin.murphy@arm.com>, <mark.rutland@arm.com>, 
	<will@kernel.org>
Subject: [RFC PATCH 2/6] iommu/arm-smmu-v3: Record IIDR in arm_smmu_device
	structure
Date: Mon, 30 Sep 2019 22:33:47 +0800
Message-ID: <1569854031-237636-3-git-send-email-john.garry@huawei.com>
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

To allow other devices know the SMMU HW IIDR, record the IIDR contents as
the first member of the arm_smmu_device structure.

In storing as the first member, it saves exposing SMMU APIs, which are
nicely self-contained today.

Signed-off-by: John Garry <john.garry@huawei.com>
---
 drivers/iommu/arm-smmu-v3.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index 40f4757096c3..1ed3ef0f1ec3 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -70,6 +70,8 @@
 #define IDR1_SSIDSIZE			GENMASK(10, 6)
 #define IDR1_SIDSIZE			GENMASK(5, 0)
 
+#define ARM_SMMU_IIDR                  0x18
+
 #define ARM_SMMU_IDR5			0x14
 #define IDR5_STALL_MAX			GENMASK(31, 16)
 #define IDR5_GRAN64K			(1 << 6)
@@ -546,6 +548,7 @@ struct arm_smmu_strtab_cfg {
 
 /* An SMMUv3 instance */
 struct arm_smmu_device {
+	u32						iidr; /* must be first member */
 	struct device			*dev;
 	void __iomem			*base;
 
@@ -3153,6 +3156,8 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	iommu_device_set_ops(&smmu->iommu, &arm_smmu_ops);
 	iommu_device_set_fwnode(&smmu->iommu, dev->fwnode);
 
+	smmu->iidr = readl(smmu->base + ARM_SMMU_IIDR);
+
 	ret = iommu_device_register(&smmu->iommu);
 	if (ret) {
 		dev_err(dev, "Failed to register iommu\n");
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
