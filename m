Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AA04321507D
	for <lists.iommu@lfdr.de>; Mon,  6 Jul 2020 02:30:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1C84B88B81;
	Mon,  6 Jul 2020 00:30:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6iQD-8ftUC8V; Mon,  6 Jul 2020 00:30:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8813188B6B;
	Mon,  6 Jul 2020 00:30:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 67B0BC016F;
	Mon,  6 Jul 2020 00:30:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 718D5C016F
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jul 2020 00:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5968F88B15
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jul 2020 00:30:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0OszjeJtMwcc for <iommu@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 00:30:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B0A5C88AD3
 for <iommu@lists.linux-foundation.org>; Mon,  6 Jul 2020 00:30:10 +0000 (UTC)
IronPort-SDR: CbGmzhzYb4rBEXiBFuUxpv1GFsND7Mr+P+eoz7oBL3Galtrnj2Fz8h91QsYuPMng4WPMv8yqDi
 zhcxk0APmzEg==
X-IronPort-AV: E=McAfee;i="6000,8403,9673"; a="126935675"
X-IronPort-AV: E=Sophos;i="5.75,318,1589266800"; d="scan'208";a="126935675"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2020 17:30:10 -0700
IronPort-SDR: Iics2lKfEiEEFtnVFe3qwfMztH0gnI+NifAvr9us7R8JwdBerX7Lw7q/YmSGTB542tYs22Xg/A
 MOMBvnMoYjiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,318,1589266800"; d="scan'208";a="266404912"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by fmsmga007.fm.intel.com with ESMTP; 05 Jul 2020 17:30:07 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v2 0/4] iommu/vt-d: Add prq report and response support
Date: Mon,  6 Jul 2020 08:25:31 +0800
Message-Id: <20200706002535.9381-1-baolu.lu@linux.intel.com>
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

Change log:
v1->v2:
  - v1 posted at https://lkml.org/lkml/2020/6/27/387
  - Remove unnecessary pci_get_domain_bus_and_slot()
  - Return error when sdev == NULL in intel_svm_page_response()

Lu Baolu (4):
  iommu/vt-d: Refactor device_to_iommu() helper
  iommu/vt-d: Add a helper to get svm and sdev for pasid
  iommu/vt-d: Report page request faults for guest SVA
  iommu/vt-d: Add page response ops support

 drivers/iommu/intel/iommu.c |  56 ++-----
 drivers/iommu/intel/svm.c   | 302 +++++++++++++++++++++++++++---------
 include/linux/intel-iommu.h |   6 +-
 3 files changed, 248 insertions(+), 116 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
