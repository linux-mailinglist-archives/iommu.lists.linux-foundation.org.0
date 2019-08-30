Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA7BA30D8
	for <lists.iommu@lfdr.de>; Fri, 30 Aug 2019 09:20:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1A83E5C52;
	Fri, 30 Aug 2019 07:20:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B98C05080
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 07:19:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B5EF1EC
	for <iommu@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 07:19:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Aug 2019 00:19:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,446,1559545200"; d="scan'208";a="182576916"
Received: from allen-box.sh.intel.com ([10.239.159.136])
	by fmsmga007.fm.intel.com with ESMTP; 30 Aug 2019 00:19:02 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: David Woodhouse <dwmw2@infradead.org>, Joerg Roedel <joro@8bytes.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Christoph Hellwig <hch@lst.de>
Subject: [PATCH v8 5/7] iommu/vt-d: Don't switch off swiotlb if bounce page is
	used
Date: Fri, 30 Aug 2019 15:17:16 +0800
Message-Id: <20190830071718.16613-6-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190830071718.16613-1-baolu.lu@linux.intel.com>
References: <20190830071718.16613-1-baolu.lu@linux.intel.com>
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>, kevin.tian@intel.com,
	Stefano Stabellini <sstabellini@kernel.org>, ashok.raj@intel.com,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	alan.cox@intel.com, Jonathan Corbet <corbet@lwn.net>,
	Robin Murphy <robin.murphy@arm.com>, Steven Rostedt <rostedt@goodmis.org>,
	linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	pengfei.xu@intel.com, Ingo Molnar <mingo@redhat.com>,
	jacob.jun.pan@intel.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	mika.westerberg@linux.intel.com
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

The bounce page implementation depends on swiotlb. Hence, don't
switch off swiotlb if the system has untrusted devices or could
potentially be hot-added with any untrusted devices.

Cc: Ashok Raj <ashok.raj@intel.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/Kconfig       |  1 +
 drivers/iommu/intel-iommu.c | 32 +++++++++++++++++---------------
 2 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index e15cdcd8cb3c..a4ddeade8ac4 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -182,6 +182,7 @@ config INTEL_IOMMU
 	select IOMMU_IOVA
 	select NEED_DMA_MAP_STATE
 	select DMAR_TABLE
+	select SWIOTLB
 	help
 	  DMA remapping (DMAR) devices support enables independent address
 	  translations for Direct Memory Access (DMA) from devices.
diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index fee5dff16e95..eb2a13e39eca 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -4575,22 +4575,20 @@ const struct attribute_group *intel_iommu_groups[] = {
 	NULL,
 };
 
-static int __init platform_optin_force_iommu(void)
+static inline bool has_untrusted_dev(void)
 {
 	struct pci_dev *pdev = NULL;
-	bool has_untrusted_dev = false;
 
-	if (!dmar_platform_optin() || no_platform_optin)
-		return 0;
+	for_each_pci_dev(pdev)
+		if (pdev->untrusted)
+			return true;
 
-	for_each_pci_dev(pdev) {
-		if (pdev->untrusted) {
-			has_untrusted_dev = true;
-			break;
-		}
-	}
+	return false;
+}
 
-	if (!has_untrusted_dev)
+static int __init platform_optin_force_iommu(void)
+{
+	if (!dmar_platform_optin() || no_platform_optin || !has_untrusted_dev())
 		return 0;
 
 	if (no_iommu || dmar_disabled)
@@ -4604,9 +4602,6 @@ static int __init platform_optin_force_iommu(void)
 		iommu_identity_mapping |= IDENTMAP_ALL;
 
 	dmar_disabled = 0;
-#if defined(CONFIG_X86) && defined(CONFIG_SWIOTLB)
-	swiotlb = 0;
-#endif
 	no_iommu = 0;
 
 	return 1;
@@ -4746,7 +4741,14 @@ int __init intel_iommu_init(void)
 	up_write(&dmar_global_lock);
 
 #if defined(CONFIG_X86) && defined(CONFIG_SWIOTLB)
-	swiotlb = 0;
+	/*
+	 * If the system has no untrusted device or the user has decided
+	 * to disable the bounce page mechanisms, we don't need swiotlb.
+	 * Mark this and the pre-allocated bounce pages will be released
+	 * later.
+	 */
+	if (!has_untrusted_dev() || intel_no_bounce)
+		swiotlb = 0;
 #endif
 	dma_ops = &intel_dma_ops;
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
