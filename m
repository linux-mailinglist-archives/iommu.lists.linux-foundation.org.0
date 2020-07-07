Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE48216375
	for <lists.iommu@lfdr.de>; Tue,  7 Jul 2020 03:44:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3A2DD88DBF;
	Tue,  7 Jul 2020 01:44:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VXW5JPRP4bJy; Tue,  7 Jul 2020 01:44:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0D07587739;
	Tue,  7 Jul 2020 01:44:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4955C016F;
	Tue,  7 Jul 2020 01:44:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 43513C016F
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 01:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2A92388BFD
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 01:44:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 71yWh0KYrAVr for <iommu@lists.linux-foundation.org>;
 Tue,  7 Jul 2020 01:44:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E5B1988A5F
 for <iommu@lists.linux-foundation.org>; Tue,  7 Jul 2020 01:44:35 +0000 (UTC)
IronPort-SDR: TgqN6+7Iy4YwB9M9d1zfKjr7noj9u/xQTMo29KuMkfM4eVh04Ylt2sPzONCIACyFYZt35sLEYl
 Ic2cIjtY693Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9674"; a="149036787"
X-IronPort-AV: E=Sophos;i="5.75,321,1589266800"; d="scan'208";a="149036787"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2020 18:44:35 -0700
IronPort-SDR: HFLhQnGpMHKamOHZBRQ+F+vBuVPMBcUnf+p3xHf4IHlvImkUA3ScTysnJAuTevgcGcP2WaYAEb
 hzRXtwRh7few==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,321,1589266800"; d="scan'208";a="266688906"
Received: from allen-box.sh.intel.com ([10.239.159.139])
 by fmsmga007.fm.intel.com with ESMTP; 06 Jul 2020 18:44:32 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 0/2] iommu_aux_at(de)tach_device() enhancement
Date: Tue,  7 Jul 2020 09:39:55 +0800
Message-Id: <20200707013957.23672-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Kevin Tian <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, kvm@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
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

This series aims to enhance the iommu_aux_at(de)tach_device() api's
so that some generic iommu api's like iommu_get_domain_for_dev() could
also work for vfio/mdev device.

The initial version of this series was post at

https://lkml.org/lkml/2020/6/26/1118

This version is evolved according to Robin's feedback.

Your comments are very appreciated.

Best regards,
baolu

Lu Baolu (2):
  iommu: iommu_aux_at(de)tach_device() extension
  iommu: Add aux_domain_attached flag to iommu_group

 drivers/iommu/iommu.c           | 98 +++++++++++++++++++++++++++++----
 drivers/vfio/vfio_iommu_type1.c |  5 +-
 include/linux/iommu.h           | 12 ++--
 3 files changed, 99 insertions(+), 16 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
