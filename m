Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 219CB31F4F3
	for <lists.iommu@lfdr.de>; Fri, 19 Feb 2021 07:02:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CC6668743E;
	Fri, 19 Feb 2021 06:02:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nvXA+XjqckrO; Fri, 19 Feb 2021 06:02:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 35CB18746C;
	Fri, 19 Feb 2021 06:02:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2BB41C000D;
	Fri, 19 Feb 2021 06:02:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59296C000D
 for <iommu@lists.linux-foundation.org>; Fri, 19 Feb 2021 06:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4FF7987302
 for <iommu@lists.linux-foundation.org>; Fri, 19 Feb 2021 06:02:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1II3OyGuOVmF for <iommu@lists.linux-foundation.org>;
 Fri, 19 Feb 2021 06:02:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EC93787427
 for <iommu@lists.linux-foundation.org>; Fri, 19 Feb 2021 06:02:30 +0000 (UTC)
IronPort-SDR: 2Fm0YOFYsVfxlo0yrCpxloTxr3NBvLakFHITUUgI7i4o+tI1HvzIXs6pyXX1MVrDS2BRfYBymd
 XsK+A2u5I/qA==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="245198109"
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; d="scan'208";a="245198109"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 22:02:29 -0800
IronPort-SDR: wVmcecK3h7qBCj4zzziKZys3Iw1DkVS7eSN/rsaWKImrHK0ShrNBbNlX/WFq1NR52Zg0TbyUcT
 I38LJLHfev0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,189,1610438400"; d="scan'208";a="362829341"
Received: from otc-wp-03.jf.intel.com ([10.54.39.79])
 by orsmga003.jf.intel.com with ESMTP; 18 Feb 2021 22:02:29 -0800
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Joerg Roedel <joro@8bytes.org>, "Lu Baolu" <baolu.lu@linux.intel.com>
Subject: [PATCH 0/4] Misc vSVA fixes for VT-d
Date: Thu, 18 Feb 2021 13:31:14 -0800
Message-Id: <1613683878-89946-1-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Raj Ashok <ashok.raj@intel.com>, Yi Sun <yi.y.sun@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>, Wu Hao <hao.wu@intel.com>
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

Hi Baolu et al,

This is a collection of SVA-related fixes.

Thanks,
Jacob


Jacob Pan (4):
  iommu/vt-d: Enable write protect for supervisor SVM
  iommu/vt-d: Enable write protect propagation from guest
  iommu/vt-d: Reject unsupported page request modes
  iommu/vt-d: Calculate and set flags for handle_mm_fault

 drivers/iommu/intel/pasid.c | 31 +++++++++++++++++++++++++++++++
 drivers/iommu/intel/svm.c   | 21 +++++++++++++++++----
 include/uapi/linux/iommu.h  |  3 ++-
 3 files changed, 50 insertions(+), 5 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
