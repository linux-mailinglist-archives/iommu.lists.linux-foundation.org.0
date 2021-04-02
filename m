Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C0435252D
	for <lists.iommu@lfdr.de>; Fri,  2 Apr 2021 03:35:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E91FC84B7D;
	Fri,  2 Apr 2021 01:35:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9y-WVJXoJhhT; Fri,  2 Apr 2021 01:35:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85A5B84B8A;
	Fri,  2 Apr 2021 01:35:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6082BC000A;
	Fri,  2 Apr 2021 01:35:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1604BC0011
 for <iommu@lists.linux-foundation.org>; Fri,  2 Apr 2021 01:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with UTF8SMTP id AB79A4017B
 for <iommu@lists.linux-foundation.org>; Fri,  2 Apr 2021 01:35:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=mg.codeaurora.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id uWmouBzwVs0N for <iommu@lists.linux-foundation.org>;
 Fri,  2 Apr 2021 01:35:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by smtp2.osuosl.org (Postfix) with UTF8SMTPS id 0B9AB40145
 for <iommu@lists.linux-foundation.org>; Fri,  2 Apr 2021 01:35:06 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617327307; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=pWsaAkD/ulM3r/dtvU4Ux3jUJP9U1lGgHCZ60SIdziU=;
 b=t63MxWuL8ibWuDSc3oOT4irES8zP3mNh3ySDZSN4FQvaiqBrbculexKO0WgyYlpcjcqIp/4o
 e+1RCioH7JS+5tebdrcr/cANVKw80M+MnduKEAJKjGXnIfCwD+bBbp4jnLio+PniDxEnjfVF
 D3RmwQFDJnGX9aYSb2P/D0a8l+s=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 606674cae0e9c9a6b6db247d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 02 Apr 2021 01:35:06
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AA39BC433ED; Fri,  2 Apr 2021 01:35:06 +0000 (UTC)
Received: from isaacm-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: isaacm)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 963FAC43464;
 Fri,  2 Apr 2021 01:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 963FAC43464
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=isaacm@codeaurora.org
From: "Isaac J. Manjarres" <isaacm@codeaurora.org>
To: iommu@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 04/12] iommu: Add a map_pages() op for IOMMU drivers
Date: Thu,  1 Apr 2021 18:34:43 -0700
Message-Id: <20210402013452.4013-5-isaacm@codeaurora.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210402013452.4013-1-isaacm@codeaurora.org>
References: <20210402013452.4013-1-isaacm@codeaurora.org>
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

Add a callback for IOMMU drivers to provide a path for the
IOMMU framework to call into an IOMMU driver, which can
call into the io-pgtable code, to map a physically contiguous
rnage of pages of the same size.

For IOMMU drivers that do not specify a map_pages() callback,
the existing logic of mapping memory one page block at a time
will be used.

Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
Suggested-by: Will Deacon <will@kernel.org>
---
 include/linux/iommu.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 9cf81242581a..528d6a58479e 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -192,6 +192,8 @@ struct iommu_iotlb_gather {
  * @attach_dev: attach device to an iommu domain
  * @detach_dev: detach device from an iommu domain
  * @map: map a physically contiguous memory region to an iommu domain
+ * @map_pages: map a physically contiguous set of pages of the same size to
+ *             an iommu domain.
  * @unmap: unmap a physically contiguous memory region from an iommu domain
  * @unmap_pages: unmap a number of pages of the same size from an iommu domain
  * @flush_iotlb_all: Synchronously flush all hardware TLBs for this domain
@@ -244,6 +246,9 @@ struct iommu_ops {
 	void (*detach_dev)(struct iommu_domain *domain, struct device *dev);
 	int (*map)(struct iommu_domain *domain, unsigned long iova,
 		   phys_addr_t paddr, size_t size, int prot, gfp_t gfp);
+	int (*map_pages)(struct iommu_domain *domain, unsigned long iova,
+			 phys_addr_t paddr, size_t pgsize, size_t pgcount,
+			 int prot, gfp_t gfp, size_t *mapped);
 	size_t (*unmap)(struct iommu_domain *domain, unsigned long iova,
 		     size_t size, struct iommu_iotlb_gather *iotlb_gather);
 	size_t (*unmap_pages)(struct iommu_domain *domain, unsigned long iova,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
