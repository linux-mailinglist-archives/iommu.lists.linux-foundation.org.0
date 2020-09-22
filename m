Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id F30F4273A96
	for <lists.iommu@lfdr.de>; Tue, 22 Sep 2020 08:17:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9DB7E86397;
	Tue, 22 Sep 2020 06:16:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N83W5QEEMdQJ; Tue, 22 Sep 2020 06:16:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8323C863DE;
	Tue, 22 Sep 2020 06:16:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 624E4C0051;
	Tue, 22 Sep 2020 06:16:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07D6DC0051
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 06:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E8E0C85AD6
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 06:16:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6e2YWU62sPEI for <iommu@lists.linux-foundation.org>;
 Tue, 22 Sep 2020 06:16:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E858D85AA1
 for <iommu@lists.linux-foundation.org>; Tue, 22 Sep 2020 06:16:54 +0000 (UTC)
IronPort-SDR: rW3Rygxa2Wmlx2OiRfx9rX4yrw1VNi+IoULiuFX5DT5eTGdFHHm1EMtzgsDhTMGm37X9tXAy4z
 Nix2uC56U/Ig==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="148206691"
X-IronPort-AV: E=Sophos;i="5.77,289,1596524400"; d="scan'208";a="148206691"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 23:16:53 -0700
IronPort-SDR: MRN1pkDHtVIp8X7IJS5GWx5rYmWiDE08UuKtxsPLLtqWw5ql7hbfKzxbhbczzbNIAFnIiY8+kw
 y7Nbta3zIyZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,289,1596524400"; d="scan'208";a="334877182"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by fmsmga004.fm.intel.com with ESMTP; 21 Sep 2020 23:16:50 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [PATCH v5 0/5] iommu aux-domain APIs extensions
Date: Tue, 22 Sep 2020 14:10:37 +0800
Message-Id: <20200922061042.31633-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Jorge and Alex,

A description of this patch series could be found here.

https://lore.kernel.org/linux-iommu/20200901033422.22249-1-baolu.lu@linux.intel.com/

This version adds some changes according to Alex's review comments.

- Add comments and naming rule for subdevices.
https://lore.kernel.org/linux-iommu/20200910160549.2b176ac5@w520.home/

- Continue detaching even no subdevice parent found.
https://lore.kernel.org/linux-iommu/20200910160547.0a8b9891@w520.home/

- Make subdev_link_device() and subdev_unlink_device() symmetrical.

Please help to review and merge.

Best regards,
baolu

Lu Baolu (5):
  iommu: Add optional subdev in aux_at(de)tach ops
  iommu: Add iommu_at(de)tach_subdev_group()
  iommu: Add iommu_aux_get_domain_for_dev()
  vfio/type1: Use iommu_aux_at(de)tach_group() APIs
  iommu/vt-d: Add is_aux_domain support

 drivers/iommu/intel/iommu.c     | 139 +++++++++++++++++-------
 drivers/iommu/iommu.c           | 184 ++++++++++++++++++++++++++++++--
 drivers/vfio/vfio_iommu_type1.c |  43 ++------
 include/linux/intel-iommu.h     |  17 +--
 include/linux/iommu.h           |  46 +++++++-
 5 files changed, 336 insertions(+), 93 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
