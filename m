Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB7334F71D
	for <lists.iommu@lfdr.de>; Wed, 31 Mar 2021 05:06:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9752F40643;
	Wed, 31 Mar 2021 03:06:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2BbuVCxiQT7C; Wed, 31 Mar 2021 03:06:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5E53C4063D;
	Wed, 31 Mar 2021 03:06:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17510C0011;
	Wed, 31 Mar 2021 03:06:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FAC9C000A
 for <iommu@lists.linux-foundation.org>; Wed, 31 Mar 2021 03:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with UTF8SMTP id EFDDF847F8
 for <iommu@lists.linux-foundation.org>; Wed, 31 Mar 2021 03:06:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id J8IiK-LfiHGW for <iommu@lists.linux-foundation.org>;
 Wed, 31 Mar 2021 03:06:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by smtp1.osuosl.org (Postfix) with UTF8SMTPS id 42C0E847FC
 for <iommu@lists.linux-foundation.org>; Wed, 31 Mar 2021 03:06:03 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617159963; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ZFyP2XOkIx4Gt6xuV8ZuLezkXTK8JIfSAjRt6Ke52ew=;
 b=qRKQFzY/5b80p2xVggG1rzMtUkGuQ5a5/Md7rX0g376SK06KFWZ+Js8/GLtzcIm93MNl2ccv
 0tU0wnXClFu9mc1Lb62MRLbXxYpa7EjDxEcPwVE/6blS8V5Vag5yvM6sjeyLY5jeHVYGv2kj
 EoRBYOB/gadlsNZGaO9kwAcQZpo=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6063e5eb03cfff345233c436 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 31 Mar 2021 03:00:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BAB30C433ED; Wed, 31 Mar 2021 03:00:58 +0000 (UTC)
Received: from isaacm-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: isaacm)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id C063EC433C6;
 Wed, 31 Mar 2021 03:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C063EC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=isaacm@codeaurora.org
From: "Isaac J. Manjarres" <isaacm@codeaurora.org>
To: iommu@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 1/5] iommu/io-pgtable: Introduce unmap_pages() as a page
 table op
Date: Tue, 30 Mar 2021 20:00:38 -0700
Message-Id: <20210331030042.13348-2-isaacm@codeaurora.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210331030042.13348-1-isaacm@codeaurora.org>
References: <20210331030042.13348-1-isaacm@codeaurora.org>
MIME-Version: 1.0
Cc: "Isaac J. Manjarres" <isaacm@codeaurora.org>, will@kernel.org,
 robin.murphy@arm.com, pratikp@codeaurora.org
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

The io-pgtable code expects to operate on a single block or
granule of memory that is supported by the IOMMU hardware when
unmapping memory.

This means that when a large buffer that consists of multiple
such blocks is unmapped, the io-pgtable code will walk the page
tables to the correct level to unmap each block, even for blocks
that are virtually contiguous and at the same level, which can
incur an overhead in performance.

Introduce the unmap_pages() page table op to express to the
io-pgtable code that it should unmap a number of blocks of
the same size, instead of a single block. Doing so allows
multiple blocks to be unmapped in one call to the io-pgtable
code, reducing the number of page table walks, and indirect
calls.

Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
Suggested-by: Will Deacon <will@kernel.org>
---
 include/linux/io-pgtable.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index a4c9ca2c31f1..2ed0c057d9e7 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -144,6 +144,7 @@ struct io_pgtable_cfg {
  *
  * @map:          Map a physically contiguous memory region.
  * @unmap:        Unmap a physically contiguous memory region.
+ * @unmap_pages:  Unmap a range of virtually contiguous pages of the same size.
  * @iova_to_phys: Translate iova to physical address.
  *
  * These functions map directly onto the iommu_ops member functions with
@@ -154,6 +155,9 @@ struct io_pgtable_ops {
 		   phys_addr_t paddr, size_t size, int prot, gfp_t gfp);
 	size_t (*unmap)(struct io_pgtable_ops *ops, unsigned long iova,
 			size_t size, struct iommu_iotlb_gather *gather);
+	size_t (*unmap_pages)(struct io_pgtable_ops *ops, unsigned long iova,
+			      size_t pgsize, size_t pgcount,
+			      struct iommu_iotlb_gather *gather);
 	phys_addr_t (*iova_to_phys)(struct io_pgtable_ops *ops,
 				    unsigned long iova);
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
