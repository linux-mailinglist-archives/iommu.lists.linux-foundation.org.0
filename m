Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DA63EECB1
	for <lists.iommu@lfdr.de>; Tue, 17 Aug 2021 14:46:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A4D9C60684;
	Tue, 17 Aug 2021 12:46:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ohps6NN91Kjm; Tue, 17 Aug 2021 12:46:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id AD7AE60737;
	Tue, 17 Aug 2021 12:46:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84C4BC0022;
	Tue, 17 Aug 2021 12:46:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9700DC000E
 for <iommu@lists.linux-foundation.org>; Tue, 17 Aug 2021 12:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77B7640518
 for <iommu@lists.linux-foundation.org>; Tue, 17 Aug 2021 12:46:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y4ouz-jtpqzQ for <iommu@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 12:46:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 765E440501
 for <iommu@lists.linux-foundation.org>; Tue, 17 Aug 2021 12:46:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="195655107"
X-IronPort-AV: E=Sophos;i="5.84,328,1620716400"; d="scan'208";a="195655107"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 05:46:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,328,1620716400"; d="scan'208";a="462385491"
Received: from allen-box.sh.intel.com ([10.239.159.118])
 by orsmga007.jf.intel.com with ESMTP; 17 Aug 2021 05:46:04 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 0/2] [PULL REQUEST] iommu/vt-d: Fixes for v5.14-rc7
Date: Tue, 17 Aug 2021 20:43:19 +0800
Message-Id: <20210817124321.1517985-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Fenghua Yu <fenghua.yu@intel.com>,
 Kumar Sanjay K <sanjay.k.kumar@intel.com>, iommu@lists.linux-foundation.org,
 Yi Sun <yi.y.sun@intel.com>
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

Two small fixes are queued for v5.14. They aim to fix:

 - PASID reference leakage in intel_svm_unbind_mm();
 - An improper iotlb invalidation in intel_pasid_tear_down_entry().

Please consider it for your iommu/fix branch.

Best regards,
Lu Baolu


Fenghua Yu (1):
  iommu/vt-d: Fix PASID reference leak

Liu Yi L (1):
  iommu/vt-d: Fix incomplete cache flush in
    intel_pasid_tear_down_entry()

 drivers/iommu/intel/pasid.h |  6 ++++++
 drivers/iommu/intel/pasid.c | 10 ++++++++--
 drivers/iommu/intel/svm.c   |  3 ++-
 3 files changed, 16 insertions(+), 3 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
