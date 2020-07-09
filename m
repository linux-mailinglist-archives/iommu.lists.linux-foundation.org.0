Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F38219978
	for <lists.iommu@lfdr.de>; Thu,  9 Jul 2020 09:10:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0A59C20487;
	Thu,  9 Jul 2020 07:10:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CltjjtBnLTT3; Thu,  9 Jul 2020 07:10:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9115B220D6;
	Thu,  9 Jul 2020 07:10:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7242EC016F;
	Thu,  9 Jul 2020 07:10:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0004C016F
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 07:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C2BA8220D6
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 07:10:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9KeVGb5QodCP for <iommu@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 07:10:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by silver.osuosl.org (Postfix) with ESMTPS id 8243A20487
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 07:10:15 +0000 (UTC)
IronPort-SDR: m7YE7C0QN4ehGhOyEUE5nNKrZTqnqOGcfKKoT437x9kxnx9mJ5HFyVUXR/spRwgpbD169IqjK1
 wQH/3MfBuk6w==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="136178163"
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="136178163"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2020 00:10:14 -0700
IronPort-SDR: OBw5NJTJ7Znsq61PDeO9m7aYdCc4C2KPfERJMXwybxLxgfoRmIQZ34ipr+P+qESB5G1ZzMXP7x
 //IoscYm/CEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,331,1589266800"; d="scan'208";a="316138822"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2020 00:10:12 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v3 0/4] iommu/vt-d: Add prq report and response support
Date: Thu,  9 Jul 2020 15:05:33 +0800
Message-Id: <20200709070537.18473-1-baolu.lu@linux.intel.com>
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
v2->v3:
  - Adress Kevin's review comments
    https://lore.kernel.org/linux-iommu/20200706002535.9381-1-baolu.lu@linux.intel.com/T/#t
  - Set IOMMU_FAULT_PAGE_RESPONSE_NEEDS_PASID flag
    https://lore.kernel.org/linux-iommu/20200706002535.9381-1-baolu.lu@linux.intel.com/T/#m0190af2f6cf967217e9def6fa0fed4e0fe5a477e

v1->v2:
  - v1 posted at https://lkml.org/lkml/2020/6/27/387
  - Remove unnecessary pci_get_domain_bus_and_slot()
  - Return error when sdev == NULL in intel_svm_page_response()

Lu Baolu (4):
  iommu/vt-d: Refactor device_to_iommu() helper
  iommu/vt-d: Add a helper to get svm and sdev for pasid
  iommu/vt-d: Report page request faults for guest SVA
  iommu/vt-d: Add page response ops support

 drivers/iommu/intel/iommu.c |  56 ++----
 drivers/iommu/intel/svm.c   | 332 ++++++++++++++++++++++++++++--------
 include/linux/intel-iommu.h |   6 +-
 3 files changed, 278 insertions(+), 116 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
