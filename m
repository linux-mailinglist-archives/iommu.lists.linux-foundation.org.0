Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACC13A2216
	for <lists.iommu@lfdr.de>; Thu, 10 Jun 2021 04:04:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A892260602;
	Thu, 10 Jun 2021 02:04:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o1h9rxOXg7Vt; Thu, 10 Jun 2021 02:04:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BABD36063C;
	Thu, 10 Jun 2021 02:04:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F089C0029;
	Thu, 10 Jun 2021 02:04:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6F199C000B
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 02:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5115040599
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 02:04:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GQ0HsXvL26i0 for <iommu@lists.linux-foundation.org>;
 Thu, 10 Jun 2021 02:04:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4123A40594
 for <iommu@lists.linux-foundation.org>; Thu, 10 Jun 2021 02:04:15 +0000 (UTC)
IronPort-SDR: KQC5e5XvUFVvfUsVYflCI8i/xRS3xbHmFspTvY6U8E7lxb/3nQlCPsUKodIBXvC469FqeWv9Jh
 U1H8M5c6H+wg==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="202184316"
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="202184316"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 19:03:53 -0700
IronPort-SDR: q+UpHcP2CWdim3In7nQ6fT+sEAmZAo5PhdiWRPYWTpZ1k5Y+NYd2opPpncF98ejj0wCtfGgXpN
 fx4VZvITGVwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="402500517"
Received: from allen-box.sh.intel.com ([10.239.159.105])
 by orsmga006.jf.intel.com with ESMTP; 09 Jun 2021 19:03:50 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 18/23] iommu/vt-d: Use DEVICE_ATTR_RO macro
Date: Thu, 10 Jun 2021 10:01:10 +0800
Message-Id: <20210610020115.1637656-19-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610020115.1637656-1-baolu.lu@linux.intel.com>
References: <20210610020115.1637656-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: Fenghua Yu <fenghua.yu@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Aditya Srivastava <yashsri421@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 YueHaibing <yuehaibing@huawei.com>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 iommu@lists.linux-foundation.org, Colin Ian King <colin.king@canonical.com>,
 Will Deacon <will@kernel.org>
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

From: YueHaibing <yuehaibing@huawei.com>

Use DEVICE_ATTR_RO() helper instead of plain DEVICE_ATTR(),
which makes the code a bit shorter and easier to read.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Link: https://lore.kernel.org/r/20210528130229.22108-1-yuehaibing@huawei.com
---
 drivers/iommu/intel/iommu.c | 42 ++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 24 deletions(-)

diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index c45d4946f92d..65458aee0d95 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -4139,62 +4139,56 @@ static inline struct intel_iommu *dev_to_intel_iommu(struct device *dev)
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
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
