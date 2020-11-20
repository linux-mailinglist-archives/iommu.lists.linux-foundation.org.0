Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEFA2BA747
	for <lists.iommu@lfdr.de>; Fri, 20 Nov 2020 11:24:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A13A487535;
	Fri, 20 Nov 2020 10:24:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eSrzguj0utA0; Fri, 20 Nov 2020 10:24:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A387387550;
	Fri, 20 Nov 2020 10:24:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 890A6C0891;
	Fri, 20 Nov 2020 10:24:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9A400C0891
 for <iommu@lists.linux-foundation.org>; Fri, 20 Nov 2020 10:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 85D1B8708A
 for <iommu@lists.linux-foundation.org>; Fri, 20 Nov 2020 10:24:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0iJumT9MW2Ns for <iommu@lists.linux-foundation.org>;
 Fri, 20 Nov 2020 10:24:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 10E9886FCB
 for <iommu@lists.linux-foundation.org>; Fri, 20 Nov 2020 10:24:40 +0000 (UTC)
IronPort-SDR: Whin2eRDCNEkKbn1TQ0ea64ueCGr9THeipKw2B6cZAMrCfOVy5ysL0iF4s0S48M6vsaZRokej1
 R0tZ0x9Yu6hg==
X-IronPort-AV: E=McAfee;i="6000,8403,9810"; a="189551164"
X-IronPort-AV: E=Sophos;i="5.78,356,1599548400"; d="scan'208";a="189551164"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2020 02:24:39 -0800
IronPort-SDR: 82QxPtX+MY911QEA499NebKqFnj+SlZcS99DH6LeAs3dgNH7zKJTQsnslR1nDiVgejQHrsD/kK
 j9ionfDGToUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,356,1599548400"; d="scan'208";a="545393633"
Received: from allen-box.sh.intel.com ([10.239.159.28])
 by orsmga005.jf.intel.com with ESMTP; 20 Nov 2020 02:24:37 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Tom Murphy <murphyt7@tcd.ie>, David Woodhouse <dwmw2@infradead.org>,
 Christoph Hellwig <hch@infradead.org>
Subject: [PATCH v5 0/7] Convert the intel iommu driver to the dma-iommu api
Date: Fri, 20 Nov 2020 18:17:12 +0800
Message-Id: <20201120101719.3172693-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 iommu@lists.linux-foundation.org, Ashok Raj <ashok.raj@intel.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Will,

The previous post of this series could be found here.

https://lore.kernel.org/linux-iommu/20200927063437.13988-1-baolu.lu@linux.intel.com/

Changes in this version:
- Add Tested-by: Logan Gunthorpe <logang@deltatee.com>
- Rebase to v5.10-rc3

Please review and consider it for iommu/next.

Best regards,
baolu

Lu Baolu (3):
  iommu: Add quirk for Intel graphic devices in map_sg
  iommu/vt-d: Update domain geometry in iommu_ops.at(de)tach_dev
  iommu/vt-d: Cleanup after converting to dma-iommu ops

Tom Murphy (4):
  iommu: Handle freelists when using deferred flushing in iommu drivers
  iommu: Add iommu_dma_free_cpu_cached_iovas()
  iommu: Allow the dma-iommu api to use bounce buffers
  iommu/vt-d: Convert intel iommu driver to the iommu ops

 .../admin-guide/kernel-parameters.txt         |   5 -
 drivers/iommu/dma-iommu.c                     | 228 ++++-
 drivers/iommu/intel/Kconfig                   |   1 +
 drivers/iommu/intel/iommu.c                   | 905 +++---------------
 include/linux/dma-iommu.h                     |   8 +
 include/linux/iommu.h                         |   1 +
 6 files changed, 336 insertions(+), 812 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
