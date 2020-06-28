Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E2B20C4FC
	for <lists.iommu@lfdr.de>; Sun, 28 Jun 2020 02:37:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5CE0C8789B;
	Sun, 28 Jun 2020 00:37:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IphIAB2qngGA; Sun, 28 Jun 2020 00:37:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8FF2D87698;
	Sun, 28 Jun 2020 00:37:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7DB1EC016F;
	Sun, 28 Jun 2020 00:37:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87A81C016F
 for <iommu@lists.linux-foundation.org>; Sun, 28 Jun 2020 00:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7A44B860DE
 for <iommu@lists.linux-foundation.org>; Sun, 28 Jun 2020 00:37:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KOHnd88JGbbc for <iommu@lists.linux-foundation.org>;
 Sun, 28 Jun 2020 00:37:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DC38F860C1
 for <iommu@lists.linux-foundation.org>; Sun, 28 Jun 2020 00:37:53 +0000 (UTC)
IronPort-SDR: vFJcH6p5RKTx19mQhHKkZACaKLad0xPC0k+/4hGBfSEtwPVMj8cAiWSnAhpZb4YWLXYT0Ufy36
 x9HIaFsWcL5Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9665"; a="144805151"
X-IronPort-AV: E=Sophos;i="5.75,289,1589266800"; d="scan'208";a="144805151"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2020 17:37:52 -0700
IronPort-SDR: j6OM7XnrZ+9iuGMNOEj3FL6aaSkLAEzzuZQGB7FREz9MHFJskQrH1gleXce3tHXRPqXLS1Nrfb
 flyp96BmTt1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,289,1589266800"; d="scan'208";a="302695000"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by fmsmga004.fm.intel.com with ESMTP; 27 Jun 2020 17:37:50 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 0/4] iommu/vt-d: Add prq report and response support
Date: Sun, 28 Jun 2020 08:33:28 +0800
Message-Id: <20200628003332.5720-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-kernel@vger.kernel.org
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

Hi,

This series adds page request event reporting and response support to
the Intel IOMMU driver. This is necessary when the page requests must
be processed by any component other than the vendor IOMMU driver. For
example, when a guest page table was bound to a PASID through the
iommu_ops->sva_bind_gpasid() api, the page requests should be routed to
the guest, and after the page is served, the device should be responded
with the result.

Your review comments are very appreciated.

Best regards,
baolu

Lu Baolu (4):
  iommu/vt-d: Refactor device_to_iommu() helper
  iommu/vt-d: Add a helper to get svm and sdev for pasid
  iommu/vt-d: Report page request faults for guest SVA
  iommu/vt-d: Add page response ops support

 drivers/iommu/intel/iommu.c |  56 +++----
 drivers/iommu/intel/svm.c   | 285 ++++++++++++++++++++++++++++--------
 include/linux/intel-iommu.h |   6 +-
 3 files changed, 246 insertions(+), 101 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
