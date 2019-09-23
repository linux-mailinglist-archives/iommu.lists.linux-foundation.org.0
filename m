Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDE7BB3AC
	for <lists.iommu@lfdr.de>; Mon, 23 Sep 2019 14:27:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 495DCCC3;
	Mon, 23 Sep 2019 12:27:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 51442CC6
	for <iommu@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 12:27:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E1A0889A
	for <iommu@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 12:27:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Sep 2019 05:27:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,539,1559545200"; d="scan'208";a="203116661"
Received: from allen-box.sh.intel.com ([10.239.159.136])
	by fmsmga001.fm.intel.com with ESMTP; 23 Sep 2019 05:27:19 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, David Woodhouse <dwmw2@infradead.org>,
	Alex Williamson <alex.williamson@redhat.com>
Subject: [RFC PATCH 1/4] iommu/vt-d: Move domain_flush_cache helper into header
Date: Mon, 23 Sep 2019 20:24:51 +0800
Message-Id: <20190923122454.9888-2-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190923122454.9888-1-baolu.lu@linux.intel.com>
References: <20190923122454.9888-1-baolu.lu@linux.intel.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, Yi Sun <yi.y.sun@linux.intel.com>,
	ashok.raj@intel.com, kvm@vger.kernel.org,
	sanjay.k.kumar@intel.com, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, yi.y.sun@intel.com
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

So that it could be used in other source files as well.

Cc: Ashok Raj <ashok.raj@intel.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Liu Yi L <yi.l.liu@intel.com>
Cc: Yi Sun <yi.y.sun@linux.intel.com>
Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel-iommu.c | 7 -------
 include/linux/intel-iommu.h | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 5aa68a094efd..9cfe8098d993 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -828,13 +828,6 @@ static struct intel_iommu *device_to_iommu(struct device *dev, u8 *bus, u8 *devf
 	return iommu;
 }
 
-static void domain_flush_cache(struct dmar_domain *domain,
-			       void *addr, int size)
-{
-	if (!domain->iommu_coherency)
-		clflush_cache_range(addr, size);
-}
-
 static int device_context_mapped(struct intel_iommu *iommu, u8 bus, u8 devfn)
 {
 	struct context_entry *context;
diff --git a/include/linux/intel-iommu.h b/include/linux/intel-iommu.h
index ed11ef594378..3ee694d4f361 100644
--- a/include/linux/intel-iommu.h
+++ b/include/linux/intel-iommu.h
@@ -629,6 +629,13 @@ static inline int first_pte_in_page(struct dma_pte *pte)
 	return !((unsigned long)pte & ~VTD_PAGE_MASK);
 }
 
+static inline void
+domain_flush_cache(struct dmar_domain *domain, void *addr, int size)
+{
+	if (!domain->iommu_coherency)
+		clflush_cache_range(addr, size);
+}
+
 extern struct dmar_drhd_unit * dmar_find_matched_drhd_unit(struct pci_dev *dev);
 extern int dmar_find_matched_atsr_unit(struct pci_dev *dev);
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
