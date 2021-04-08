Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A50358B1B
	for <lists.iommu@lfdr.de>; Thu,  8 Apr 2021 19:14:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86C1041957;
	Thu,  8 Apr 2021 17:14:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with UTF8SMTP id W6iVe-B2R9rt; Thu,  8 Apr 2021 17:14:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3579F4199B;
	Thu,  8 Apr 2021 17:14:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46DF9C0012;
	Thu,  8 Apr 2021 17:14:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6FD6AC000B
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 17:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with UTF8SMTP id 5AB8C41957
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 17:14:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id 0PyIQSd-1Pun for <iommu@lists.linux-foundation.org>;
 Thu,  8 Apr 2021 17:14:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by smtp4.osuosl.org (Postfix) with UTF8SMTPS id 620F241926
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 17:14:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617902074; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=wJofiPJk2Ng3vVzH5vnMXbIUETReFr7LQBZSQkf4zkg=;
 b=CJJaCV3rzPI4YnpBZ/HJjbhhHTSTVyeb1kNeZGaCWRGd4NgbWzg/2hP8W9ekpggIcBDIIWaE
 /P0k0M7gfggiE1++76laMRw/+raXgdwOmvfQRQUCXopm6JySVK2npheiRbfFWAQFccfeSrhj
 3gWAXZanKW1N9VXfbCvJLPkUXNM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 606f39e7f34440a9d4e717b2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 08 Apr 2021 17:14:15
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 92F47C43464; Thu,  8 Apr 2021 17:14:15 +0000 (UTC)
Received: from isaacm-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: isaacm)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id ACAE5C433ED;
 Thu,  8 Apr 2021 17:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org ACAE5C433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=isaacm@codeaurora.org
From: "Isaac J. Manjarres" <isaacm@codeaurora.org>
To: iommu@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH v5 06/15] iommu: Split 'addr_merge' argument to
 iommu_pgsize() into separate parts
Date: Thu,  8 Apr 2021 10:13:53 -0700
Message-Id: <20210408171402.12607-7-isaacm@codeaurora.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210408171402.12607-1-isaacm@codeaurora.org>
References: <20210408171402.12607-1-isaacm@codeaurora.org>
MIME-Version: 1.0
Cc: "Isaac J . Manjarres" <isaacm@codeaurora.org>, robin.murphy@arm.com,
 Will Deacon <will@kernel.org>, pratikp@codeaurora.org
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

From: Will Deacon <will@kernel.org>

The 'addr_merge' parameter to iommu_pgsize() is a fabricated address
intended to describe the alignment requirements to consider when
choosing an appropriate page size. On the iommu_map() path, this address
is the logical OR of the virtual and physical addresses.

Subsequent improvements to iommu_pgsize() will need to check the
alignment of the virtual and physical components of 'addr_merge'
independently, so pass them in as separate parameters and reconstruct
'addr_merge' locally.

No functional change.

Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
---
 drivers/iommu/iommu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index bcd623862bf9..624ce3c7ae33 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2357,12 +2357,13 @@ phys_addr_t iommu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova)
 }
 EXPORT_SYMBOL_GPL(iommu_iova_to_phys);
 
-static size_t iommu_pgsize(struct iommu_domain *domain,
-			   unsigned long addr_merge, size_t size)
+static size_t iommu_pgsize(struct iommu_domain *domain, unsigned long iova,
+			   phys_addr_t paddr, size_t size)
 {
 	unsigned int pgsize_idx;
 	unsigned long pgsizes;
 	size_t pgsize;
+	unsigned long addr_merge = paddr | iova;
 
 	/* Page sizes supported by the hardware and small enough for @size */
 	pgsizes = domain->pgsize_bitmap & GENMASK(__fls(size), 0);
@@ -2415,7 +2416,7 @@ static int __iommu_map(struct iommu_domain *domain, unsigned long iova,
 	pr_debug("map: iova 0x%lx pa %pa size 0x%zx\n", iova, &paddr, size);
 
 	while (size) {
-		size_t pgsize = iommu_pgsize(domain, iova | paddr, size);
+		size_t pgsize = iommu_pgsize(domain, iova, paddr, size);
 
 		pr_debug("mapping: iova 0x%lx pa %pa pgsize 0x%zx\n",
 			 iova, &paddr, pgsize);
@@ -2503,8 +2504,9 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
 	 * or we hit an area that isn't mapped.
 	 */
 	while (unmapped < size) {
-		size_t pgsize = iommu_pgsize(domain, iova, size - unmapped);
+		size_t pgsize;
 
+		pgsize = iommu_pgsize(domain, iova, iova, size - unmapped);
 		unmapped_page = ops->unmap(domain, iova, pgsize, iotlb_gather);
 		if (!unmapped_page)
 			break;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
