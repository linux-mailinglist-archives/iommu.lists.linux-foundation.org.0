Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B33358B10
	for <lists.iommu@lfdr.de>; Thu,  8 Apr 2021 19:14:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8774040267;
	Thu,  8 Apr 2021 17:14:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3GRrShwLLdyN; Thu,  8 Apr 2021 17:14:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3816740266;
	Thu,  8 Apr 2021 17:14:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 142D3C000A;
	Thu,  8 Apr 2021 17:14:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D36C7C000A
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 17:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with UTF8SMTP id BFDA74027D
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 17:14:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with UTF8SMTP id V3H3Lm4lWr07 for <iommu@lists.linux-foundation.org>;
 Thu,  8 Apr 2021 17:14:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by smtp4.osuosl.org (Postfix) with UTF8SMTPS id 69FA140266
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 17:14:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1617902051; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=AMX5ZpZwW4l9DMrpN/F+ImmJfaKhXbY78QgNQLEY8Dk=;
 b=MUWPauiN/qoyuqPcUpCdo9W1uV6HDXNPRnH2K/5+4PxGw8/fSREIuB5Qx4Nb04n3WRRgPqF7
 X8DH3UAtcaeDX/Z5EH8/W1OGj3ktuveZYQo3VVPjq/9kjvUUPrY9zE142wZEVDn7fQs8m1P9
 issccVvb3QWf9fU10qfmmSFUlgM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 606f39e08807bcde1db978c1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 08 Apr 2021 17:14:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7D902C4346A; Thu,  8 Apr 2021 17:14:08 +0000 (UTC)
Received: from isaacm-linux.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: isaacm)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E3019C43463;
 Thu,  8 Apr 2021 17:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E3019C43463
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=isaacm@codeaurora.org
From: "Isaac J. Manjarres" <isaacm@codeaurora.org>
To: iommu@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH v5 00/15] Optimizing iommu_[map/unmap] performance
Date: Thu,  8 Apr 2021 10:13:47 -0700
Message-Id: <20210408171402.12607-1-isaacm@codeaurora.org>
X-Mailer: git-send-email 2.31.0
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

When unmapping a buffer from an IOMMU domain, the IOMMU framework unmaps
the buffer at a granule of the largest page size that is supported by
the IOMMU hardware and fits within the buffer. For every block that
is unmapped, the IOMMU framework will call into the IOMMU driver, and
then the io-pgtable framework to walk the page tables to find the entry
that corresponds to the IOVA, and then unmaps the entry.

This can be suboptimal in scenarios where a buffer or a piece of a
buffer can be split into several contiguous page blocks of the same size.
For example, consider an IOMMU that supports 4 KB page blocks, 2 MB page
blocks, and 1 GB page blocks, and a buffer that is 4 MB in size is being
unmapped at IOVA 0. The current call-flow will result in 4 indirect calls,
and 2 page table walks, to unmap 2 entries that are next to each other in
the page-tables, when both entries could have been unmapped in one shot
by clearing both page table entries in the same call.

The same optimization is applicable to mapping buffers as well, so
these patches implement a set of callbacks called unmap_pages and
map_pages to the io-pgtable code and IOMMU drivers which unmaps or maps
an IOVA range that consists of a number of pages of the same
page size that is supported by the IOMMU hardware, and allows for
manipulating multiple page table entries in the same set of indirect
calls. The reason for introducing these callbacks is to give other IOMMU
drivers/io-pgtable formats time to change to using the new callbacks, so
that the transition to using this approach can be done piecemeal.

Changes since V4:

* Fixed type for addr_merge from phys_addr_t to unsigned long so
  that GENMASK() can be used.
* Hooked up arm_v7s_[unmap/map]_pages to the io-pgtable ops.
* Introduced a macro for calculating the number of page table entries
  for the ARM LPAE io-pgtable format.

Changes since V3:

* Removed usage of ULL variants of bitops from Will's patches, as
  they were not needed.
* Instead of unmapping/mapping pgcount pages, unmap_pages() and
  map_pages() will at most unmap and map pgcount pages, allowing
  for part of the pages in pgcount to be mapped and unmapped. This
  was done to simplify the handling in the io-pgtable layer.
* Extended the existing PTE manipulation methods in io-pgtable-arm
  to handle multiple entries, per Robin's suggestion, eliminating
  the need to add functions to clear multiple PTEs.
* Implemented a naive form of [map/unmap]_pages() for ARM v7s io-pgtable
  format.
* arm_[v7s/lpae]_[map/unmap] will call
  arm_[v7s/lpae]_[map_pages/unmap_pages] with an argument of 1 page.
* The arm_smmu_[map/unmap] functions have been removed, since they
  have been replaced by arm_smmu_[map/unmap]_pages.

Changes since V2:

* Added a check in __iommu_map() to check for the existence
  of either the map or map_pages callback as per Lu's suggestion.

Changes since V1:

* Implemented the map_pages() callbacks
* Integrated Will's patches into this series which
  address several concerns about how iommu_pgsize() partitioned a
  buffer (I made a minor change to the patch which changes
  iommu_pgsize() to use bitmaps by using the ULL variants of
  the bitops)

Isaac J. Manjarres (12):
  iommu/io-pgtable: Introduce unmap_pages() as a page table op
  iommu: Add an unmap_pages() op for IOMMU drivers
  iommu/io-pgtable: Introduce map_pages() as a page table op
  iommu: Add a map_pages() op for IOMMU drivers
  iommu: Add support for the map_pages() callback
  iommu/io-pgtable-arm: Prepare PTE methods for handling multiple
    entries
  iommu/io-pgtable-arm: Implement arm_lpae_unmap_pages()
  iommu/io-pgtable-arm: Implement arm_lpae_map_pages()
  iommu/io-pgtable-arm-v7s: Implement arm_v7s_unmap_pages()
  iommu/io-pgtable-arm-v7s: Implement arm_v7s_map_pages()
  iommu/arm-smmu: Implement the unmap_pages() IOMMU driver callback
  iommu/arm-smmu: Implement the map_pages() IOMMU driver callback

Will Deacon (3):
  iommu: Use bitmap to calculate page size in iommu_pgsize()
  iommu: Split 'addr_merge' argument to iommu_pgsize() into separate
    parts
  iommu: Hook up '->unmap_pages' driver callback

 drivers/iommu/arm/arm-smmu/arm-smmu.c |  18 +--
 drivers/iommu/io-pgtable-arm-v7s.c    |  50 ++++++-
 drivers/iommu/io-pgtable-arm.c        | 189 +++++++++++++++++---------
 drivers/iommu/iommu.c                 | 130 +++++++++++++-----
 include/linux/io-pgtable.h            |   8 ++
 include/linux/iommu.h                 |   9 ++
 6 files changed, 289 insertions(+), 115 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
