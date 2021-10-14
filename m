Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE5242D1F5
	for <lists.iommu@lfdr.de>; Thu, 14 Oct 2021 07:42:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29D564036B;
	Thu, 14 Oct 2021 05:42:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id crYmioRklftp; Thu, 14 Oct 2021 05:42:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A0C14401D8;
	Thu, 14 Oct 2021 05:42:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 608D8C000D;
	Thu, 14 Oct 2021 05:42:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50780C000D
 for <iommu@lists.linux-foundation.org>; Thu, 14 Oct 2021 05:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3212260AD2
 for <iommu@lists.linux-foundation.org>; Thu, 14 Oct 2021 05:42:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xHorNwmb6Rrj for <iommu@lists.linux-foundation.org>;
 Thu, 14 Oct 2021 05:42:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D80C6077E
 for <iommu@lists.linux-foundation.org>; Thu, 14 Oct 2021 05:42:46 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="214543989"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="214543989"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 22:42:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="626685195"
Received: from allen-box.sh.intel.com ([10.239.159.118])
 by fmsmga001.fm.intel.com with ESMTP; 13 Oct 2021 22:42:40 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 0/9] [PULL REQUEST] Intel IOMMU Updates for Linux v5.16
Date: Thu, 14 Oct 2021 13:38:30 +0800
Message-Id: <20211014053839.727419-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Fenghua Yu <fenghua.yu@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Kyung Min Park <kyung.min.park@intel.com>, iommu@lists.linux-foundation.org,
 Longpeng <longpeng2@huawei.com>
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

The patches queued in this series are for v5.16. It includes:

 - Dump DMAR translation structure when DMA fault occurs.
 - An optimization in the page table manipulation code.
 - Use second level for GPA->HPA translation.
 - Various cleanups

Please pull.

Best regards,
Baolu

Fenghua Yu (1):
  iommu/vt-d: Clean up unused PASID updating functions

Kyung Min Park (1):
  iommu/vt-d: Dump DMAR translation structure when DMA fault occurs

Longpeng(Mike) (2):
  iommu/vt-d: Convert the return type of first_pte_in_page to bool
  iommu/vt-d: Avoid duplicate removing in __domain_mapping()

Lu Baolu (4):
  iommu/vt-d: Remove duplicate identity domain flag
  iommu/vt-d: Check FL and SL capability sanity in scalable mode
  iommu/vt-d: Use second level for GPA->HPA translation
  iommu/vt-d: Delete dev_has_feat callback

Tvrtko Ursulin (1):
  iommu/vt-d: Do not falsely log intel_iommu is unsupported kernel
    option

 include/linux/dmar.h            |   8 ++
 include/linux/intel-iommu.h     |  13 +-
 arch/x86/include/asm/fpu/api.h  |   2 -
 drivers/iommu/intel/cap_audit.h |   1 +
 drivers/iommu/intel/cap_audit.c |  13 ++
 drivers/iommu/intel/dmar.c      |  10 +-
 drivers/iommu/intel/iommu.c     | 213 ++++++++++++++++++++++----------
 drivers/iommu/intel/svm.c       |  24 +---
 drivers/iommu/intel/Kconfig     |   4 +
 9 files changed, 188 insertions(+), 100 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
