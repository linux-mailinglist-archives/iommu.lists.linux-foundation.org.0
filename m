Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C8C3FA42E
	for <lists.iommu@lfdr.de>; Sat, 28 Aug 2021 09:09:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 989B94088D;
	Sat, 28 Aug 2021 07:09:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UQFjU1mrz0Fs; Sat, 28 Aug 2021 07:09:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7C53D40247;
	Sat, 28 Aug 2021 07:09:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 423E7C000E;
	Sat, 28 Aug 2021 07:09:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3373C000E
 for <iommu@lists.linux-foundation.org>; Sat, 28 Aug 2021 07:09:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E328983134
 for <iommu@lists.linux-foundation.org>; Sat, 28 Aug 2021 07:09:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nze2Fbih5IwC for <iommu@lists.linux-foundation.org>;
 Sat, 28 Aug 2021 07:09:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5530E830FB
 for <iommu@lists.linux-foundation.org>; Sat, 28 Aug 2021 07:09:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10089"; a="216222587"
X-IronPort-AV: E=Sophos;i="5.84,358,1620716400"; d="scan'208";a="216222587"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2021 00:09:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,358,1620716400"; d="scan'208";a="495954835"
Received: from allen-box.sh.intel.com ([10.239.159.118])
 by fmsmga008.fm.intel.com with ESMTP; 28 Aug 2021 00:09:20 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 0/2] [PULL REQUEST] iommu/vt-d: Fixes for v5.15-rc1
Date: Sat, 28 Aug 2021 15:06:20 +0800
Message-Id: <20210828070622.2437559-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Fenghua Yu <fenghua.yu@intel.com>, iommu@lists.linux-foundation.org,
 Dave Jiang <dave.jiang@intel.com>
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

Two small fixes are queued for v5.15. They aim to fix:

 - PASID leakage in intel_svm_unbind_mm();
 - Deadlock in intel_svm_drain_prq().

Please consider them for the iommu/fix branch.

Best regards,
Lu Baolu

Fenghua Yu (2):
  iommu/vt-d: Fix PASID leak in intel_svm_unbind_mm()
  iommu/vt-d: Fix a deadlock in intel_svm_drain_prq()

 drivers/iommu/intel/svm.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
