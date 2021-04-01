Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id AF07E3516DB
	for <lists.iommu@lfdr.de>; Thu,  1 Apr 2021 18:48:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC16D84ABE;
	Thu,  1 Apr 2021 16:48:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aJpchAY4vll3; Thu,  1 Apr 2021 16:48:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2055C84ABB;
	Thu,  1 Apr 2021 16:48:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EE8F2C0012;
	Thu,  1 Apr 2021 16:48:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46E48C000A
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 16:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3120F60BDE
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 16:48:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PBLv1Z6nzlDE for <iommu@lists.linux-foundation.org>;
 Thu,  1 Apr 2021 16:48:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26F7260BE0
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 16:48:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A013A61384;
 Thu,  1 Apr 2021 16:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617295715;
 bh=p4hoXNujhDB52s4CkDR3mvKvMLihsFk6ec9xg1tPeII=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HjXHx5Wcc0eFWhBXlm6rO7YJkyJ7ISLX/ZG6hikgYM0O4Dv6A8PZ+BJvSevosmyID
 BMQHqPjKuj9LWOkmQBsN2muIcjZTGAE2S9vpZ0sZyqdl7coMotpFWX4qkB9DASdAdA
 8MOYbNkn1wTKrQKd9ElOL38sqBegH///SqfyTM38A9hpPK/aN5tj6UmNSjt5wr21zl
 BEE7c57t1BkZB+Txn4rPCbRMopaWbR81Q0MfM4/F0ybVIPYJcb5sQmEA17MS2mYWRv
 6cJA2/T8yfcQnbM5oXhZ76tbrih3c8kbk+J0gmyWhpKEDFlqjqyaLgPyIOPNP5j71X
 YE5ETBtoFYGLA==
From: Will Deacon <will@kernel.org>
To: iommu@lists.linux-foundation.org
Subject: [RFC PATCH 2/6] iommu: Add an unmap_pages() op for IOMMU drivers
Date: Thu,  1 Apr 2021 17:47:34 +0100
Message-Id: <20210401164738.9513-3-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210401164738.9513-1-will@kernel.org>
References: <20210401164738.9513-1-will@kernel.org>
MIME-Version: 1.0
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Pratik Patel <pratikp@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org
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

From: "Isaac J. Manjarres" <isaacm@codeaurora.org>

Add a callback for IOMMU drivers to provide a path for the
IOMMU framework to call into an IOMMU driver, which can call
into the io-pgtable code, to unmap a virtually contiguous
range of pages of the same size.

For IOMMU drivers that do not specify an unmap_pages() callback,
the existing logic of unmapping memory one page block at a time
will be used.

Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Will Deacon <will@kernel.org>
---
 include/linux/iommu.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 5e7fe519430a..9cf81242581a 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -193,6 +193,7 @@ struct iommu_iotlb_gather {
  * @detach_dev: detach device from an iommu domain
  * @map: map a physically contiguous memory region to an iommu domain
  * @unmap: unmap a physically contiguous memory region from an iommu domain
+ * @unmap_pages: unmap a number of pages of the same size from an iommu domain
  * @flush_iotlb_all: Synchronously flush all hardware TLBs for this domain
  * @iotlb_sync_map: Sync mappings created recently using @map to the hardware
  * @iotlb_sync: Flush all queued ranges from the hardware TLBs and empty flush
@@ -245,6 +246,9 @@ struct iommu_ops {
 		   phys_addr_t paddr, size_t size, int prot, gfp_t gfp);
 	size_t (*unmap)(struct iommu_domain *domain, unsigned long iova,
 		     size_t size, struct iommu_iotlb_gather *iotlb_gather);
+	size_t (*unmap_pages)(struct iommu_domain *domain, unsigned long iova,
+			      size_t pgsize, size_t pgcount,
+			      struct iommu_iotlb_gather *iotlb_gather);
 	void (*flush_iotlb_all)(struct iommu_domain *domain);
 	void (*iotlb_sync_map)(struct iommu_domain *domain, unsigned long iova,
 			       size_t size);
-- 
2.31.0.291.g576ba9dcdaf-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
