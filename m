Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A0C19E9F2
	for <lists.iommu@lfdr.de>; Sun,  5 Apr 2020 10:33:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1E511881A8;
	Sun,  5 Apr 2020 08:33:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q9-Udq8NflYb; Sun,  5 Apr 2020 08:33:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A7DFB88157;
	Sun,  5 Apr 2020 08:33:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91FA8C0177;
	Sun,  5 Apr 2020 08:33:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C22EBC0177
 for <iommu@lists.linux-foundation.org>; Sun,  5 Apr 2020 08:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9B36620242
 for <iommu@lists.linux-foundation.org>; Sun,  5 Apr 2020 08:33:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vFZ5-5LHLJT5 for <iommu@lists.linux-foundation.org>;
 Sun,  5 Apr 2020 08:33:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by silver.osuosl.org (Postfix) with ESMTPS id CC52B20133
 for <iommu@lists.linux-foundation.org>; Sun,  5 Apr 2020 08:33:53 +0000 (UTC)
IronPort-SDR: 1XIq37bOREVGI1mO7wPiFzGu69B3P6TYJCssfx6yQxfv6lDFpzeB/SxFHJ+m6ky1lseMcZDZcu
 EEHsARBdsqlw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2020 01:33:53 -0700
IronPort-SDR: xXplkE9fuggqWMUFIofyhr39x1/Jumd23Nh09wZMhPDNKVw7ttmTV+E4fzSo9ywGdoAqqhBHwZ
 synuJjM6zGKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,347,1580803200"; d="scan'208";a="397179308"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by orsmga004.jf.intel.com with ESMTP; 05 Apr 2020 01:33:51 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 00/19] [PULL REQUEST] iommu/vt-d: patches for v5.7
Date: Sun,  5 Apr 2020 16:30:34 +0800
Message-Id: <20200405083053.17865-1-baolu.lu@linux.intel.com>
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

Below patches have been piled up for v5.7. They enable below
features:

 - Add support for configuring per-group default domain and remove
   private domain code in the vt-d driver.
 - Nested Shared Virtual Address (SVA) VT-d support
 - Replace Intel SVM with IOMMU SVA APIs

Please consider them for the iommu/vt-d branch.

Best regards,
Lu Baolu

Jacob Pan (11):
  iommu/vt-d: Move domain helper to header
  iommu/uapi: Define a mask for bind data
  iommu/vt-d: Use a helper function to skip agaw for SL
  iommu/vt-d: Add nested translation helper function
  iommu/vt-d: Add bind guest PASID support
  iommu/vt-d: Support flushing more translation cache types
  iommu/vt-d: Add svm/sva invalidate function
  iommu/vt-d: Cache virtual command capability register
  iommu/vt-d: Add custom allocator for IOASID
  iommu/vt-d: Report SVA feature with generic flag
  iommu/vt-d: Replace intel SVM APIs with generic SVA APIs

Lu Baolu (7):
  iommu: Configure default domain with def_domain_type
  iommu/vt-d: Don't force 32bit devices to uses DMA domain
  iommu/vt-d: Don't force PCI sub-hierarchy to use DMA domain
  iommu/vt-d: Add def_domain_type callback
  iommu/vt-d: Apply per-device dma_ops
  iommu/vt-d: Enlightened PASID allocation
  iommu/vt-d: Add get_domain_info() helper

Sai Praneeth Prakhya (1):
  iommu: Add def_domain_type() callback in iommu_ops

 drivers/iommu/dmar.c        |  40 ++
 drivers/iommu/intel-iommu.c | 788 +++++++++++++++---------------------
 drivers/iommu/intel-pasid.c | 353 +++++++++++++++-
 drivers/iommu/intel-pasid.h |  23 +-
 drivers/iommu/intel-svm.c   | 330 ++++++++++++---
 drivers/iommu/iommu.c       | 103 ++++-
 include/linux/intel-iommu.h |  70 +++-
 include/linux/intel-svm.h   |  99 +----
 include/linux/iommu.h       |   6 +
 include/uapi/linux/iommu.h  |   5 +-
 10 files changed, 1191 insertions(+), 626 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
