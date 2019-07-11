Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F0C65E8D
	for <lists.iommu@lfdr.de>; Thu, 11 Jul 2019 19:29:20 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DE3C654B1;
	Thu, 11 Jul 2019 17:28:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 69CD1530E
	for <iommu@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 17:19:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2981289C
	for <iommu@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 17:19:48 +0000 (UTC)
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa
	[217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 94A03216B7;
	Thu, 11 Jul 2019 17:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1562865587;
	bh=dYM+N+YaE5Hr8j1sIY7Qhx3ZhcK5zVV2lY6BGZNgdwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YQtBjnng8Sk2hMNuLT6wiJSN60+CZbkhrqhc7o2R5Oo/XNoTAzgXK2/tOTXWH7QfZ
	BO2hjmHDX8R5rCKIFge9vuA2hIeliZHXKuWT45QBmCyNSCRPaf6EVFdl8j++0R1QuP
	EpVu/tMZaoD+QwWqUvfv7oOafU03jIuiV1yejeLg=
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux-foundation.org
Subject: [RFC PATCH v2 05/19] iommu: Introduce iommu_iotlb_gather_add_page()
Date: Thu, 11 Jul 2019 18:19:13 +0100
Message-Id: <20190711171927.28803-6-will@kernel.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190711171927.28803-1-will@kernel.org>
References: <20190711171927.28803-1-will@kernel.org>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vijay Kilary <vkilari@codeaurora.org>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Will Deacon <will@kernel.org>, Jan Glauber <jglauber@marvell.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Jayachandran Chandrasekharan Nair <jnair@marvell.com>,
	Jon Masters <jcm@redhat.com>, Robin Murphy <robin.murphy@arm.com>
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

Introduce a helper function for drivers to use when updating an
iommu_iotlb_gather structure in response to an ->unmap() call, rather
than having to open-code the logic in every page-table implementation.

Signed-off-by: Will Deacon <will@kernel.org>
---
 include/linux/iommu.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 6cdd2e261ee3..95442de75a71 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -451,6 +451,31 @@ static inline void iommu_tlb_sync(struct iommu_domain *domain,
 	iommu_iotlb_gather_init(iotlb_gather);
 }
 
+static inline void iommu_iotlb_gather_add_page(struct iommu_domain *domain,
+					       struct iommu_iotlb_gather *gather,
+					       unsigned long iova, size_t size)
+{
+	unsigned long start = iova, end = start + size;
+
+	/*
+	 * If the new page is disjoint from the current range or is mapped at
+	 * a different granularity, then sync the TLB so that the gather
+	 * structure can be rewritten.
+	 */
+	if (gather->pgsize != size ||
+	    end < gather->start || start > gather->end) {
+		if (gather->pgsize)
+			iommu_tlb_sync(domain, gather);
+		gather->pgsize = size;
+	}
+
+	if (gather->end < end)
+		gather->end = end;
+
+	if (gather->start > start)
+		gather->start = start;
+}
+
 /* PCI device grouping function */
 extern struct iommu_group *pci_device_group(struct device *dev);
 /* Generic device grouping function */
@@ -760,6 +785,12 @@ static inline void iommu_iotlb_gather_init(struct iommu_iotlb_gather *gather)
 {
 }
 
+static inline void iommu_iotlb_gather_add_page(struct iommu_domain *domain,
+					       struct iommu_iotlb_gather *gather,
+					       unsigned long iova, size_t size)
+{
+}
+
 static inline void iommu_device_unregister(struct iommu_device *iommu)
 {
 }
-- 
2.11.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
