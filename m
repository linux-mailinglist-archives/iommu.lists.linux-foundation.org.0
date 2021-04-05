Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id F38FE3546FC
	for <lists.iommu@lfdr.de>; Mon,  5 Apr 2021 21:11:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D5E141CBA;
	Mon,  5 Apr 2021 19:11:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dDHmpL4TrkTE; Mon,  5 Apr 2021 19:11:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B8F241C60;
	Mon,  5 Apr 2021 19:11:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3A792C000A;
	Mon,  5 Apr 2021 19:11:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74705C000A
 for <iommu@lists.linux-foundation.org>; Mon,  5 Apr 2021 19:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with UTF8SMTP id 55E4D41C67
 for <iommu@lists.linux-foundation.org>; Mon,  5 Apr 2021 19:11:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id E23p4u0rTsqX for <iommu@lists.linux-foundation.org>;
 Mon,  5 Apr 2021 19:11:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by smtp4.osuosl.org (Postfix) with UTF8SMTPS id 7495B41C60
 for <iommu@lists.linux-foundation.org>; Mon,  5 Apr 2021 19:11:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617649889; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=meWYZNpYvaxvGCIw5gHD8y80n36WIdsDl1LUjgfGZ8E=;
 b=aOr1OdG2J9UhRHavBDEFf4aoN/2t9zx57MzKyrQMmJ0CAnoeqjT8SiaKDIOX2Ao99h0IMwh3
 Oavpf+y8BuzjUESCimoUO+NZbSQyujYNVfzjuIo7WYi8g2ksr4MG6mX/JBai1wXy07TrmNHm
 MD72h6mjfCVSXMytZnFasMVT9vw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 606b60e18807bcde1dd96c34 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 05 Apr 2021 19:11:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 22AB3C43463; Mon,  5 Apr 2021 19:11:29 +0000 (UTC)
Received: from isaacm-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: isaacm)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1B19CC433C6;
 Mon,  5 Apr 2021 19:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1B19CC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=isaacm@codeaurora.org
From: "Isaac J. Manjarres" <isaacm@codeaurora.org>
To: iommu@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH v3 03/12] iommu/io-pgtable: Introduce map_pages() as a
 page table op
Date: Mon,  5 Apr 2021 12:11:03 -0700
Message-Id: <20210405191112.28192-4-isaacm@codeaurora.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210405191112.28192-1-isaacm@codeaurora.org>
References: <20210405191112.28192-1-isaacm@codeaurora.org>
MIME-Version: 1.0
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>, robin.murphy@arm.com,
 will@kernel.org, pratikp@codeaurora.org
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

Mapping memory into io-pgtables follows the same semantics
that unmapping memory used to follow (i.e. a buffer will be
mapped one page block per call to the io-pgtable code). This
means that it can be optimized in the same way that unmapping
memory was, so add a map_pages() callback to the io-pgtable
ops structure, so that a range of pages of the same size
can be mapped within the same call.

Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
Suggested-by: Will Deacon <will@kernel.org>
---
 include/linux/io-pgtable.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index 2ed0c057d9e7..019149b204b8 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -143,6 +143,7 @@ struct io_pgtable_cfg {
  * struct io_pgtable_ops - Page table manipulation API for IOMMU drivers.
  *
  * @map:          Map a physically contiguous memory region.
+ * @map_pages:    Map a physically contiguous range of pages of the same size.
  * @unmap:        Unmap a physically contiguous memory region.
  * @unmap_pages:  Unmap a range of virtually contiguous pages of the same size.
  * @iova_to_phys: Translate iova to physical address.
@@ -153,6 +154,9 @@ struct io_pgtable_cfg {
 struct io_pgtable_ops {
 	int (*map)(struct io_pgtable_ops *ops, unsigned long iova,
 		   phys_addr_t paddr, size_t size, int prot, gfp_t gfp);
+	int (*map_pages)(struct io_pgtable_ops *ops, unsigned long iova,
+			 phys_addr_t paddr, size_t pgsize, size_t pgcount,
+			 int prot, gfp_t gfp, size_t *mapped);
 	size_t (*unmap)(struct io_pgtable_ops *ops, unsigned long iova,
 			size_t size, struct iommu_iotlb_gather *gather);
 	size_t (*unmap_pages)(struct io_pgtable_ops *ops, unsigned long iova,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
