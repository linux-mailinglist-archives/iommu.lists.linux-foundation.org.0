Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8719C394328
	for <lists.iommu@lfdr.de>; Fri, 28 May 2021 15:03:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1B6940447;
	Fri, 28 May 2021 13:03:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IqNC7RjrJ4Nb; Fri, 28 May 2021 13:03:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id B06BD40418;
	Fri, 28 May 2021 13:03:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7288BC0001;
	Fri, 28 May 2021 13:03:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E534EC0001
 for <iommu@lists.linux-foundation.org>; Fri, 28 May 2021 13:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6323401F1
 for <iommu@lists.linux-foundation.org>; Fri, 28 May 2021 13:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J4_JxP_LTaoB for <iommu@lists.linux-foundation.org>;
 Fri, 28 May 2021 13:02:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D05A140105
 for <iommu@lists.linux-foundation.org>; Fri, 28 May 2021 13:02:54 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Fs4XY0Kj8z66qQ;
 Fri, 28 May 2021 20:59:57 +0800 (CST)
Received: from dggema769-chm.china.huawei.com (10.1.198.211) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 28 May 2021 21:02:47 +0800
Received: from localhost (10.174.179.215) by dggema769-chm.china.huawei.com
 (10.1.198.211) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 28
 May 2021 21:02:47 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <dwmw2@infradead.org>, <baolu.lu@linux.intel.com>, <joro@8bytes.org>,
 <will@kernel.org>
Subject: [PATCH -next] iommu/vt-d: use DEVICE_ATTR_RO macro
Date: Fri, 28 May 2021 21:02:29 +0800
Message-ID: <20210528130229.22108-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggema769-chm.china.huawei.com (10.1.198.211)
X-CFilter-Loop: Reflected
Cc: iommu@lists.linux-foundation.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org
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

Use DEVICE_ATTR_RO() helper instead of plain DEVICE_ATTR(),
which makes the code a bit shorter and easier to read.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/iommu/intel/iommu.c | 42 ++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 24 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index be35284a2016..0638ea8f6f7d 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -4138,62 +4138,56 @@ static inline struct intel_iommu *dev_to_intel_iommu(struct device *dev)
 	return container_of(iommu_dev, struct intel_iommu, iommu);
 }
 
-static ssize_t intel_iommu_show_version(struct device *dev,
-					struct device_attribute *attr,
-					char *buf)
+static ssize_t version_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
 {
 	struct intel_iommu *iommu = dev_to_intel_iommu(dev);
 	u32 ver = readl(iommu->reg + DMAR_VER_REG);
 	return sprintf(buf, "%d:%d\n",
 		       DMAR_VER_MAJOR(ver), DMAR_VER_MINOR(ver));
 }
-static DEVICE_ATTR(version, S_IRUGO, intel_iommu_show_version, NULL);
+static DEVICE_ATTR_RO(version);
 
-static ssize_t intel_iommu_show_address(struct device *dev,
-					struct device_attribute *attr,
-					char *buf)
+static ssize_t address_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
 {
 	struct intel_iommu *iommu = dev_to_intel_iommu(dev);
 	return sprintf(buf, "%llx\n", iommu->reg_phys);
 }
-static DEVICE_ATTR(address, S_IRUGO, intel_iommu_show_address, NULL);
+static DEVICE_ATTR_RO(address);
 
-static ssize_t intel_iommu_show_cap(struct device *dev,
-				    struct device_attribute *attr,
-				    char *buf)
+static ssize_t cap_show(struct device *dev,
+			struct device_attribute *attr, char *buf)
 {
 	struct intel_iommu *iommu = dev_to_intel_iommu(dev);
 	return sprintf(buf, "%llx\n", iommu->cap);
 }
-static DEVICE_ATTR(cap, S_IRUGO, intel_iommu_show_cap, NULL);
+static DEVICE_ATTR_RO(cap);
 
-static ssize_t intel_iommu_show_ecap(struct device *dev,
-				    struct device_attribute *attr,
-				    char *buf)
+static ssize_t ecap_show(struct device *dev,
+			 struct device_attribute *attr, char *buf)
 {
 	struct intel_iommu *iommu = dev_to_intel_iommu(dev);
 	return sprintf(buf, "%llx\n", iommu->ecap);
 }
-static DEVICE_ATTR(ecap, S_IRUGO, intel_iommu_show_ecap, NULL);
+static DEVICE_ATTR_RO(ecap);
 
-static ssize_t intel_iommu_show_ndoms(struct device *dev,
-				      struct device_attribute *attr,
-				      char *buf)
+static ssize_t domains_supported_show(struct device *dev,
+				      struct device_attribute *attr, char *buf)
 {
 	struct intel_iommu *iommu = dev_to_intel_iommu(dev);
 	return sprintf(buf, "%ld\n", cap_ndoms(iommu->cap));
 }
-static DEVICE_ATTR(domains_supported, S_IRUGO, intel_iommu_show_ndoms, NULL);
+static DEVICE_ATTR_RO(domains_supported);
 
-static ssize_t intel_iommu_show_ndoms_used(struct device *dev,
-					   struct device_attribute *attr,
-					   char *buf)
+static ssize_t domains_used_show(struct device *dev,
+				 struct device_attribute *attr, char *buf)
 {
 	struct intel_iommu *iommu = dev_to_intel_iommu(dev);
 	return sprintf(buf, "%d\n", bitmap_weight(iommu->domain_ids,
 						  cap_ndoms(iommu->cap)));
 }
-static DEVICE_ATTR(domains_used, S_IRUGO, intel_iommu_show_ndoms_used, NULL);
+static DEVICE_ATTR_RO(domains_used);
 
 static struct attribute *intel_iommu_attrs[] = {
 	&dev_attr_version.attr,
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
