Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B7142267774
	for <lists.iommu@lfdr.de>; Sat, 12 Sep 2020 05:28:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 36E7C87578;
	Sat, 12 Sep 2020 03:28:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jSsP0sogDbZo; Sat, 12 Sep 2020 03:28:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A291B8751E;
	Sat, 12 Sep 2020 03:28:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94E2CC0051;
	Sat, 12 Sep 2020 03:28:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2BFEC0051
 for <iommu@lists.linux-foundation.org>; Sat, 12 Sep 2020 03:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CF191204BF
 for <iommu@lists.linux-foundation.org>; Sat, 12 Sep 2020 03:28:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id csmy5SbP6ecm for <iommu@lists.linux-foundation.org>;
 Sat, 12 Sep 2020 03:28:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by silver.osuosl.org (Postfix) with ESMTPS id BF87A2034B
 for <iommu@lists.linux-foundation.org>; Sat, 12 Sep 2020 03:28:12 +0000 (UTC)
IronPort-SDR: 9JP9HemXJVAn/bCi32war6iYna3lPhELhLcabcJZVVtUqN2GP/CDNYol8pcSTndlht0pnHTV+b
 LLiPi4L9nYxQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9741"; a="159826801"
X-IronPort-AV: E=Sophos;i="5.76,418,1592895600"; d="scan'208";a="159826801"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2020 20:28:05 -0700
IronPort-SDR: vAnIu1Sv+EC2IcfvY8nEZeyNa/WSeMrZVFkDgx7RL++t/LyKAc6WdQoss2M0CYiDmJF740nZKt
 oOow2M0qgWOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,418,1592895600"; d="scan'208";a="408321391"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by fmsmga001.fm.intel.com with ESMTP; 11 Sep 2020 20:28:01 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>, Tom Murphy <murphyt7@tcd.ie>,
 David Woodhouse <dwmw2@infradead.org>,
 Christoph Hellwig <hch@infradead.org>
Subject: [PATCH v3 0/6] Convert the intel iommu driver to the dma-iommu api
Date: Sat, 12 Sep 2020 11:21:54 +0800
Message-Id: <20200912032200.11489-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Intel-gfx@lists.freedesktop.org,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Tom Murphy has almost done all the work. His latest patch series was
posted here.

https://lore.kernel.org/linux-iommu/20200903201839.7327-1-murphyt7@tcd.ie/

Thanks a lot!

This series is a follow-up with below changes:

1. Add a quirk for the i915 driver issue described in Tom's cover
letter.
2. Fix several bugs in patch "iommu: Allow the dma-iommu api to use
bounce buffers" to make the bounce buffer work for untrusted devices.
3. Several cleanups in iommu/vt-d driver after the conversion.

Please review and test.

Best regards,
baolu

Lu Baolu (2):
  iommu: Add quirk for Intel graphic devices in map_sg
  iommu/vt-d: Cleanup after converting to dma-iommu ops

Tom Murphy (4):
  iommu: Handle freelists when using deferred flushing in iommu drivers
  iommu: Add iommu_dma_free_cpu_cached_iovas()
  iommu: Allow the dma-iommu api to use bounce buffers
  iommu/vt-d: Convert intel iommu driver to the iommu ops

 .../admin-guide/kernel-parameters.txt         |   5 -
 drivers/iommu/dma-iommu.c                     | 229 ++++-
 drivers/iommu/intel/Kconfig                   |   1 +
 drivers/iommu/intel/iommu.c                   | 885 +++---------------
 include/linux/dma-iommu.h                     |   8 +
 include/linux/iommu.h                         |   1 +
 6 files changed, 323 insertions(+), 806 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
