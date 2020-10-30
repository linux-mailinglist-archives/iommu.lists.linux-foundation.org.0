Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDF729FCDF
	for <lists.iommu@lfdr.de>; Fri, 30 Oct 2020 06:05:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9E70086A32;
	Fri, 30 Oct 2020 05:05:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a2h2F1Xgt6uH; Fri, 30 Oct 2020 05:05:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D991286A31;
	Fri, 30 Oct 2020 05:05:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BBAC7C0051;
	Fri, 30 Oct 2020 05:05:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44EF0C0051
 for <iommu@lists.linux-foundation.org>; Fri, 30 Oct 2020 05:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3ECDA228D1
 for <iommu@lists.linux-foundation.org>; Fri, 30 Oct 2020 05:05:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aG4H-9NoLUaD for <iommu@lists.linux-foundation.org>;
 Fri, 30 Oct 2020 05:05:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by silver.osuosl.org (Postfix) with ESMTPS id 5768D2037B
 for <iommu@lists.linux-foundation.org>; Fri, 30 Oct 2020 05:05:10 +0000 (UTC)
IronPort-SDR: hSN7X7WYdG1HJK48hXbkOxcWUg/s1028R+vYtZANcVfOPdJdjMDfqeDd2wq8E9RISEfK+8EosG
 jinW09o3466w==
X-IronPort-AV: E=McAfee;i="6000,8403,9789"; a="253268372"
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; d="scan'208";a="253268372"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2020 22:05:04 -0700
IronPort-SDR: yA/8uLhnMK0V46kNAp34cxMA+s1WXTmWTVtL9265fjUb9AtY4ndlRl2EAqyl1S3MC2fCwfyUEF
 LBIDN+mqCFTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,432,1596524400"; d="scan'208";a="425261524"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by fmsmga001.fm.intel.com with ESMTP; 29 Oct 2020 22:05:01 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH v6 0/5] iommu aux-domain APIs extensions
Date: Fri, 30 Oct 2020 12:58:04 +0800
Message-Id: <20201030045809.957927-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Kevin Tian <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, kvm@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
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

Hi Joerg and Alex,

A description of purpose for this series could be found here.

https://lore.kernel.org/linux-iommu/20200901033422.22249-1-baolu.lu@linux.intel.com/

The previous version was posted here.

https://lore.kernel.org/linux-iommu/20200922061042.31633-1-baolu.lu@linux.intel.com/

This version is evolved according to Joerg's comments posted here.

https://lore.kernel.org/linux-iommu/20200924095532.GK27174@8bytes.org/

This basic idea is that IOMMU registers an iommu_ops for subdevice
bus (for example, the vfio/mdev bus), so that the upper layer device
passthrough framework could use the standard iommu-core code to setup
the IOMMU logistics.

This series was tested by Dave Jiang <dave.jiang@intel.com> with his
idxd driver posted here. Very appreciated!

https://lore.kernel.org/lkml/160021250454.67751.3119489448651243709.stgit@djiang5-desk3.ch.intel.com/

Please help to review and comment.

Best regards,
baolu

Lu Baolu (5):
  vfio/mdev: Register mdev bus earlier during boot
  iommu: Use bus iommu ops for aux related callback
  iommu/vt-d: Make some static functions global
  iommu/vt-d: Add iommu_ops support for subdevice bus
  vfio/type1: Use mdev bus iommu_ops for IOMMU callbacks

 drivers/iommu/intel/Kconfig      |  13 ++++
 drivers/iommu/intel/Makefile     |   1 +
 drivers/iommu/intel/iommu.c      |  79 +++++--------------
 drivers/iommu/intel/siov.c       | 119 ++++++++++++++++++++++++++++
 drivers/iommu/iommu.c            |  16 ++--
 drivers/vfio/mdev/mdev_core.c    |  22 +-----
 drivers/vfio/mdev/mdev_driver.c  |   6 ++
 drivers/vfio/mdev/mdev_private.h |   1 -
 drivers/vfio/vfio_iommu_type1.c  | 128 +++----------------------------
 include/linux/intel-iommu.h      |  53 +++++++++++++
 include/linux/mdev.h             |  14 ----
 11 files changed, 236 insertions(+), 216 deletions(-)
 create mode 100644 drivers/iommu/intel/siov.c

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
