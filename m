Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E49F91D5F05
	for <lists.iommu@lfdr.de>; Sat, 16 May 2020 08:24:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 57DD7898B9;
	Sat, 16 May 2020 06:24:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UyN14nu69G7a; Sat, 16 May 2020 06:24:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BC36C898B8;
	Sat, 16 May 2020 06:24:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1290C016F;
	Sat, 16 May 2020 06:24:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62205C016F
 for <iommu@lists.linux-foundation.org>; Sat, 16 May 2020 06:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5186787E39
 for <iommu@lists.linux-foundation.org>; Sat, 16 May 2020 06:24:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uO28HFwLRdhM for <iommu@lists.linux-foundation.org>;
 Sat, 16 May 2020 06:24:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B635187E33
 for <iommu@lists.linux-foundation.org>; Sat, 16 May 2020 06:24:33 +0000 (UTC)
IronPort-SDR: D9QIAWe1ezeOK/xs0nfYHwgNRkHeTrBid9+vExQQ5hcYUWbnEvECNIAk4t2eHuT+2lm+8QE35o
 ZVgDta6/D51g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 23:24:33 -0700
IronPort-SDR: 8PQmkv2awsBIJjioBbXvQGQeIYulFoa0XIF7QVMDxQQyHuK2lIxT+Pwcu2fliEbU4xic2Sp4mG
 6k1sEWa+sG3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,398,1583222400"; d="scan'208";a="281442384"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by orsmga002.jf.intel.com with ESMTP; 15 May 2020 23:24:31 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 00/18] [PULL REQUEST] iommu/vt-d: patches for v5.8
Date: Sat, 16 May 2020 14:20:43 +0800
Message-Id: <20200516062101.29541-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: iommu@lists.linux-foundation.org, Tom Murphy <murphyt7@tcd.ie>
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

Below patches have been piled up for v5.8. They enable below features:

 - Nested Shared Virtual Address (SVA) VT-d support
 - Replace Intel SVM with IOMMU SVA APIs
 - SVA page request draining support

Can you please consider them for iommu/next?

Best regards,
Lu Baolu

Jacob Pan (9):
  iommu/vt-d: Move domain helper to header
  iommu/vt-d: Use a helper function to skip agaw for SL
  iommu/vt-d: Add nested translation helper function
  iommu/vt-d: Add bind guest PASID support
  iommu/vt-d: Support flushing more translation cache types
  iommu/vt-d: Add svm/sva invalidate function
  iommu/vt-d: Add custom allocator for IOASID
  iommu/vt-d: Report SVA feature with generic flag
  iommu/vt-d: Replace intel SVM APIs with generic SVA APIs

Lu Baolu (8):
  iommu/vt-d: Enlightened PASID allocation
  iommu/vt-d: Add get_domain_info() helper
  iommu/vt-d: Multiple descriptors per qi_submit_sync()
  iommu/vt-d: debugfs: Add support to show inv queue internals
  iommu/vt-d: Disable non-recoverable fault processing before unbind
  iommu/vt-d: Add page request draining support
  iommu/vt-d: Remove redundant IOTLB flush
  iommu/vt-d: Remove duplicated check in intel_svm_bind_mm()

Tom Murphy (1):
  iommu/vt-d: Remove IOVA handling code from the non-dma_ops path

 drivers/iommu/dmar.c                |  99 ++++--
 drivers/iommu/intel-iommu-debugfs.c |  62 ++++
 drivers/iommu/intel-iommu.c         | 449 +++++++++++++++++++++-------
 drivers/iommu/intel-pasid.c         | 309 +++++++++++++++++--
 drivers/iommu/intel-pasid.h         |  27 +-
 drivers/iommu/intel-svm.c           | 445 ++++++++++++++++++++++-----
 drivers/iommu/intel_irq_remapping.c |   2 +-
 include/linux/intel-iommu.h         |  81 ++++-
 include/linux/intel-svm.h           |  94 +-----
 include/uapi/linux/iommu.h          |   5 +
 10 files changed, 1252 insertions(+), 321 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
