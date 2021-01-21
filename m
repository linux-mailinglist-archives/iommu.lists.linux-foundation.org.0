Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4914B2FDF04
	for <lists.iommu@lfdr.de>; Thu, 21 Jan 2021 02:53:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C9A6920516;
	Thu, 21 Jan 2021 01:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6SP0ZWX4q2eG; Thu, 21 Jan 2021 01:53:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5CBB12050F;
	Thu, 21 Jan 2021 01:53:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3ABF6C013A;
	Thu, 21 Jan 2021 01:53:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 600E6C013A
 for <iommu@lists.linux-foundation.org>; Thu, 21 Jan 2021 01:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3E0022050F
 for <iommu@lists.linux-foundation.org>; Thu, 21 Jan 2021 01:53:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kWs-GDRhE6+N for <iommu@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 01:53:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by silver.osuosl.org (Postfix) with ESMTPS id 58E552050D
 for <iommu@lists.linux-foundation.org>; Thu, 21 Jan 2021 01:53:33 +0000 (UTC)
IronPort-SDR: bpJifM6Ib9N2agtx2IVjQZ/ZuytAIu3VcZgWlPQ2fu7HQNcK999HrVS4WxynEDPxv/d52kckK6
 0f3J8AsLBW/w==
X-IronPort-AV: E=McAfee;i="6000,8403,9870"; a="197938362"
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; d="scan'208";a="197938362"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2021 17:53:32 -0800
IronPort-SDR: MppMeJ08UYxsSLMBQbzoQhkhOCVLYCY6ifw48dPJBnnOGHCJBGjmtUPdIkUMTRGLGw81T2ibOZ
 sg11M0rsOxag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,362,1602572400"; d="scan'208";a="391762240"
Received: from allen-box.sh.intel.com ([10.239.159.28])
 by orsmga007.jf.intel.com with ESMTP; 20 Jan 2021 17:53:30 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 0/3] iommu/vt-d: Some misc tweaks in SVA
Date: Thu, 21 Jan 2021 09:45:02 +0800
Message-Id: <20210121014505.1659166-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
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

This includes some misc tweaks in the VT-d SVA implementation. I will
plan them for v5.12 if no objections.

Best regards,
baolu

Lu Baolu (3):
  iommu/vt-d: Add rate limited information when PRQ overflows
  iommu/vt-d: Allow devices to have more than 32 outstanding PRQ
  iommu/vt-d: Use INVALID response code instead of FAILURE

 drivers/iommu/intel/iommu.c |  3 ++-
 drivers/iommu/intel/svm.c   | 19 +++++++++----------
 include/linux/intel-svm.h   |  5 +++++
 3 files changed, 16 insertions(+), 11 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
