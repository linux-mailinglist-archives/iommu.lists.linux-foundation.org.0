Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 886E5DA54
	for <lists.iommu@lfdr.de>; Mon, 29 Apr 2019 03:25:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A28D81DD0;
	Mon, 29 Apr 2019 01:25:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4A0491DC8
	for <iommu@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 01:22:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DC76D608
	for <iommu@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 01:22:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Apr 2019 18:22:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,407,1549958400"; d="scan'208";a="146630198"
Received: from allen-box.sh.intel.com ([10.239.159.136])
	by fmsmga007.fm.intel.com with ESMTP; 28 Apr 2019 18:22:25 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 1/1] iommu/vt-d: Cleanup: no spaces at the start of a line
Date: Mon, 29 Apr 2019 09:16:02 +0800
Message-Id: <20190429011602.17625-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
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

Replace the whitespaces at the start of a line with tabs. No
functional changes.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/intel-iommu.c | 53 +++++++++++++++++++------------------
 1 file changed, 27 insertions(+), 26 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index c1f2f83e25d2..e0c0febc6fa5 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -2341,32 +2341,33 @@ static int __domain_mapping(struct dmar_domain *domain, unsigned long iov_pfn,
 }
 
 static int domain_mapping(struct dmar_domain *domain, unsigned long iov_pfn,
-                         struct scatterlist *sg, unsigned long phys_pfn,
-                         unsigned long nr_pages, int prot)
-{
-       int ret;
-       struct intel_iommu *iommu;
-
-       /* Do the real mapping first */
-       ret = __domain_mapping(domain, iov_pfn, sg, phys_pfn, nr_pages, prot);
-       if (ret)
-               return ret;
-
-       /* Notify about the new mapping */
-       if (domain_type_is_vm(domain)) {
-	       /* VM typed domains can have more than one IOMMUs */
-	       int iommu_id;
-	       for_each_domain_iommu(iommu_id, domain) {
-		       iommu = g_iommus[iommu_id];
-		       __mapping_notify_one(iommu, domain, iov_pfn, nr_pages);
-	       }
-       } else {
-	       /* General domains only have one IOMMU */
-	       iommu = domain_get_iommu(domain);
-	       __mapping_notify_one(iommu, domain, iov_pfn, nr_pages);
-       }
+			  struct scatterlist *sg, unsigned long phys_pfn,
+			  unsigned long nr_pages, int prot)
+{
+	int ret;
+	struct intel_iommu *iommu;
+
+	/* Do the real mapping first */
+	ret = __domain_mapping(domain, iov_pfn, sg, phys_pfn, nr_pages, prot);
+	if (ret)
+		return ret;
 
-       return 0;
+	/* Notify about the new mapping */
+	if (domain_type_is_vm(domain)) {
+		/* VM typed domains can have more than one IOMMUs */
+		int iommu_id;
+
+		for_each_domain_iommu(iommu_id, domain) {
+			iommu = g_iommus[iommu_id];
+			__mapping_notify_one(iommu, domain, iov_pfn, nr_pages);
+		}
+	} else {
+		/* General domains only have one IOMMU */
+		iommu = domain_get_iommu(domain);
+		__mapping_notify_one(iommu, domain, iov_pfn, nr_pages);
+	}
+
+	return 0;
 }
 
 static inline int domain_sg_mapping(struct dmar_domain *domain, unsigned long iov_pfn,
@@ -4098,7 +4099,7 @@ static int init_iommu_hw(void)
 				iommu_disable_protect_mem_regions(iommu);
 			continue;
 		}
-	
+
 		iommu_flush_write_buffer(iommu);
 
 		iommu_set_root_entry(iommu);
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
