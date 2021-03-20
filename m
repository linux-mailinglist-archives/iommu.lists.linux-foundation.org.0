Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BC98A342A1A
	for <lists.iommu@lfdr.de>; Sat, 20 Mar 2021 04:03:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE986401AD;
	Sat, 20 Mar 2021 03:03:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hm6Ctm8mD1UF; Sat, 20 Mar 2021 03:03:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1F3E440188;
	Sat, 20 Mar 2021 03:03:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BF4A2C0010;
	Sat, 20 Mar 2021 03:03:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2E3FC0001
 for <iommu@lists.linux-foundation.org>; Sat, 20 Mar 2021 03:03:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9527F40188
 for <iommu@lists.linux-foundation.org>; Sat, 20 Mar 2021 03:03:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2haBRzfvOmE8 for <iommu@lists.linux-foundation.org>;
 Sat, 20 Mar 2021 03:03:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4A5340187
 for <iommu@lists.linux-foundation.org>; Sat, 20 Mar 2021 03:03:40 +0000 (UTC)
IronPort-SDR: ytv2udd7hlDmB0gIPEeC2FLFKAylwny20x5U4YHaINCWYQyL/s5JABKVdsRsBx9chuDCpARh7V
 vT4dqJggULTw==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="177134311"
X-IronPort-AV: E=Sophos;i="5.81,263,1610438400"; d="scan'208";a="177134311"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 20:03:39 -0700
IronPort-SDR: EjE/3mmmQpmz4SFApQF+ZfoEHvw3Fa1b3Q+4o938Z/E/t6Eq1sbk7s9/1TwYI4Pu/mZP/VcHFM
 ZSijeZ1g024w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,263,1610438400"; d="scan'208";a="441520635"
Received: from allen-box.sh.intel.com ([10.239.159.128])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Mar 2021 20:03:38 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 0/5] iommu/vt-d: Several misc fixes
Date: Sat, 20 Mar 2021 10:54:10 +0800
Message-Id: <20210320025415.641201-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

Hi Joerg,

This series includes some misc fixes for the VT-d iommu driver. Please
help to review and merge.

Best regards,
baolu

Change log:
 v1->v2:
  - v1: https://lore.kernel.org/linux-iommu/20210225062654.2864322-1-baolu.lu@linux.intel.com/
  - [PATCH 2/5] iommu/vt-d: Remove WO permissions on second-level paging entries
     - Refine the commit message to make the intention clear.

Lu Baolu (5):
  iommu/vt-d: Report the right page fault address
  iommu/vt-d: Remove WO permissions on second-level paging entries
  iommu/vt-d: Invalidate PASID cache when root/context entry changed
  iommu/vt-d: Use user privilege for RID2PASID translation
  iommu/vt-d: Avoid unnecessary cache flush in pasid entry teardown

 drivers/iommu/intel/iommu.c | 28 ++++++++++++++++------------
 drivers/iommu/intel/pasid.c |  6 +++++-
 drivers/iommu/intel/svm.c   |  2 +-
 include/linux/intel-iommu.h |  1 +
 4 files changed, 23 insertions(+), 14 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
