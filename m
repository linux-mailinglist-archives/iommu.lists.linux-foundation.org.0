Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3DD187A1D
	for <lists.iommu@lfdr.de>; Tue, 17 Mar 2020 08:05:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3E55088B24;
	Tue, 17 Mar 2020 07:05:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ETTYhHKHCFy3; Tue, 17 Mar 2020 07:05:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B81AB88B10;
	Tue, 17 Mar 2020 07:05:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CC64C1D88;
	Tue, 17 Mar 2020 07:05:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D22FCC013E
 for <iommu@lists.linux-foundation.org>; Tue, 17 Mar 2020 07:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C0C7688B15
 for <iommu@lists.linux-foundation.org>; Tue, 17 Mar 2020 07:05:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2cQifdE-WC6o for <iommu@lists.linux-foundation.org>;
 Tue, 17 Mar 2020 07:05:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9128188B10
 for <iommu@lists.linux-foundation.org>; Tue, 17 Mar 2020 07:05:13 +0000 (UTC)
IronPort-SDR: GS+SzL7i1WKsbkN85Rioef8yn1MTdIcSgS8msgVn6wCg9d3LMG6o4JU+dQO6xaqOzfTO5ZJqgE
 xzYTlj4zoEuQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 00:05:13 -0700
IronPort-SDR: KhH0qzyCLlOIhb6zL/i+bFFfzSMHbL5pW7UQ5Cyeq1zAAFRVlKtusqJvUdomuIuad2W5jPRi87
 mMiVXz9o5iwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,563,1574150400"; d="scan'208";a="267867281"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by fmsmga004.fm.intel.com with ESMTP; 17 Mar 2020 00:05:10 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 0/5] iommu/vt-d: Add page request draining support
Date: Tue, 17 Mar 2020 15:02:24 +0800
Message-Id: <20200317070229.21131-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org
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

When a PASID is stopped or terminated, there can be pending
PRQs (requests that haven't received responses) in remapping
hardware. VT-d driver must drain the pending page requests so
that the pasid could be reused. The register level interface
for page request draining is defined in 7.11 of the VT-d spec.
This series adds the support for page requests draining.

This functionality was mainly developed and tested by
	Jacob Pan <jacob.jun.pan@linux.intel.com>
	Liu Yi L <yi.l.liu@intel.com>.
Thanks a lot.

Please help to review.

Best regards,
baolu

Jacob Pan (1):
  iommu/vt-d: Add page request draining support

Lu Baolu (4):
  iommu/vt-d: Add get_domain_info() helper
  iommu/vt-d: Refactor parameters for qi_submit_sync()
  iommu/vt-d: Multiple descriptors per qi_submit_sync()
  iommu/vt-d: Refactor prq_event_thread()

 drivers/iommu/dmar.c                |  50 ++++---
 drivers/iommu/intel-iommu.c         |  38 +++--
 drivers/iommu/intel-pasid.c         |  16 +--
 drivers/iommu/intel-svm.c           | 207 ++++++++++++++++++++++++----
 drivers/iommu/intel_irq_remapping.c |   2 +-
 include/linux/intel-iommu.h         |   9 +-
 6 files changed, 258 insertions(+), 64 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
