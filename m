Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1F722BBB7
	for <lists.iommu@lfdr.de>; Fri, 24 Jul 2020 03:54:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2AD50885C6;
	Fri, 24 Jul 2020 01:54:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ha9xVnQtWK4S; Fri, 24 Jul 2020 01:54:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 770E188579;
	Fri, 24 Jul 2020 01:54:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6FDEEC004C;
	Fri, 24 Jul 2020 01:54:28 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4109DC004C
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jul 2020 01:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2FCBB87E84
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jul 2020 01:54:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rHi-Quh1hbfw for <iommu@lists.linux-foundation.org>;
 Fri, 24 Jul 2020 01:54:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 44C2B87E76
 for <iommu@lists.linux-foundation.org>; Fri, 24 Jul 2020 01:54:26 +0000 (UTC)
IronPort-SDR: qgSPnetn8LMixmzR6PM7vUeeESoEGb7FH3EAx/iSH9CkDbslaow3tPZfYzu6my+LuD/0WNF+Vw
 tUs0RC2AnUEg==
X-IronPort-AV: E=McAfee;i="6000,8403,9691"; a="168778770"
X-IronPort-AV: E=Sophos;i="5.75,388,1589266800"; d="scan'208";a="168778770"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2020 18:54:25 -0700
IronPort-SDR: JZ0AcHpgPfjSvkjC3BNhEKV0BE0fDiYQyZL9pfCxU3HIIslF7VTZmWZvIpX+482oSR6+HRvNze
 ibi5CvTBMTGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,388,1589266800"; d="scan'208";a="488576691"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by fmsmga006.fm.intel.com with ESMTP; 23 Jul 2020 18:54:24 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 00/12] [PULL REQUEST] iommu/vt-d: patches for v5.9
Date: Fri, 24 Jul 2020 09:49:13 +0800
Message-Id: <20200724014925.15523-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: iommu@lists.linux-foundation.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Joerg,

Below patches have been piled up for v5.9. It includes:

 - Misc tweaks and fixes for vSVA
 - Report/response page request events
 - Cleanups

Can you please consider them for iommu/next?

Best regards,
Lu Baolu

Jacob Pan (4):
  iommu/vt-d: Remove global page support in devTLB flush
  iommu/vt-d: Fix PASID devTLB invalidation
  iommu/vt-d: Warn on out-of-range invalidation address
  iommu/vt-d: Disable multiple GPASID-dev bind

Liu Yi L (3):
  iommu/vt-d: Enforce PASID devTLB field mask
  iommu/vt-d: Handle non-page aligned address
  iommu/vt-d: Fix devTLB flush for vSVA

Lu Baolu (5):
  iommu/vt-d: Refactor device_to_iommu() helper
  iommu/vt-d: Add a helper to get svm and sdev for pasid
  iommu/vt-d: Report page request faults for guest SVA
  iommu/vt-d: Add page response ops support
  iommu/vt-d: Rename intel-pasid.h to pasid.h

 drivers/iommu/intel/debugfs.c                 |   2 +-
 drivers/iommu/intel/dmar.c                    |  25 +-
 drivers/iommu/intel/iommu.c                   |  96 +++--
 drivers/iommu/intel/pasid.c                   |  13 +-
 .../iommu/intel/{intel-pasid.h => pasid.h}    |   2 +-
 drivers/iommu/intel/svm.c                     | 335 +++++++++++++-----
 include/linux/intel-iommu.h                   |  11 +-
 7 files changed, 337 insertions(+), 147 deletions(-)
 rename drivers/iommu/intel/{intel-pasid.h => pasid.h} (98%)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
