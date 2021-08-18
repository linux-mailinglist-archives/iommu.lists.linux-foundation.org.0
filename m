Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E156D3F0548
	for <lists.iommu@lfdr.de>; Wed, 18 Aug 2021 15:51:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BAA26064B;
	Wed, 18 Aug 2021 13:51:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ruR7vncW31N; Wed, 18 Aug 2021 13:51:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 69C16600B8;
	Wed, 18 Aug 2021 13:51:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3244EC000E;
	Wed, 18 Aug 2021 13:51:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46952C000E
 for <iommu@lists.linux-foundation.org>; Wed, 18 Aug 2021 13:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2220F402C6
 for <iommu@lists.linux-foundation.org>; Wed, 18 Aug 2021 13:51:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OjaLKst3WENa for <iommu@lists.linux-foundation.org>;
 Wed, 18 Aug 2021 13:51:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3717402BA
 for <iommu@lists.linux-foundation.org>; Wed, 18 Aug 2021 13:51:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="214478843"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="214478843"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 06:51:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="449729198"
Received: from allen-box.sh.intel.com ([10.239.159.118])
 by fmsmga007.fm.intel.com with ESMTP; 18 Aug 2021 06:51:38 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 0/9] [PULL REQUEST] Intel IOMMU Updates for Linux v5.15
Date: Wed, 18 Aug 2021 21:48:43 +0800
Message-Id: <20210818134852.1847070-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 Sanjay Kumar <sanjay.k.kumar@intel.com>, iommu@lists.linux-foundation.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

The patches queued in this series are for v5.15.
It includes:

 - Update the virtual command related registers
 - Enable Intel IOMMU scalable mode by default
 - Preset A/D bits for user space DMA usage
 - Allow devices to have more than 32 outstanding PRs 
 - Various cleanups

Please pull.

Best regards,
Baolu

Andy Shevchenko (1):
  iommu/vt-d: Drop the kernel doc annotation

Liu Yi L (2):
  iommu/vt-d: Use pasid_pte_is_present() helper function
  iommu/vt-d: Add present bit check in pasid entry setup helpers

Lu Baolu (5):
  iommu/vt-d: Update the virtual command related registers
  iommu/vt-d: Refactor Kconfig a bit
  iommu/vt-d: Enable Intel IOMMU scalable mode by default
  iommu/vt-d: Preset A/D bits for user space DMA usage
  iommu/vt-d: Allow devices to have more than 32 outstanding PRs

Zhen Lei (1):
  iommu/vt-d: Remove unnecessary oom message

 .../admin-guide/kernel-parameters.txt         | 11 +++---
 include/linux/intel-iommu.h                   |  6 +--
 include/linux/intel-svm.h                     |  5 +++
 drivers/iommu/intel/pasid.h                   | 10 ++---
 drivers/iommu/intel/dmar.c                    |  2 -
 drivers/iommu/intel/iommu.c                   | 37 ++++++-------------
 drivers/iommu/intel/pasid.c                   | 18 ++++++++-
 drivers/iommu/intel/perf.c                    |  2 +-
 drivers/iommu/intel/svm.c                     |  4 --
 drivers/iommu/intel/Kconfig                   | 19 ++++++----
 10 files changed, 60 insertions(+), 54 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
