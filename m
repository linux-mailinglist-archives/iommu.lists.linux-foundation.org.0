Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4A13454C3
	for <lists.iommu@lfdr.de>; Tue, 23 Mar 2021 02:15:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FEC340350;
	Tue, 23 Mar 2021 01:15:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 58B0JImnrnEP; Tue, 23 Mar 2021 01:15:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E7CD4034E;
	Tue, 23 Mar 2021 01:15:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61EC9C0012;
	Tue, 23 Mar 2021 01:15:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29FB3C0001
 for <iommu@lists.linux-foundation.org>; Tue, 23 Mar 2021 01:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0FED660689
 for <iommu@lists.linux-foundation.org>; Tue, 23 Mar 2021 01:15:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n35x90rrJkwI for <iommu@lists.linux-foundation.org>;
 Tue, 23 Mar 2021 01:15:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7313460674
 for <iommu@lists.linux-foundation.org>; Tue, 23 Mar 2021 01:15:37 +0000 (UTC)
IronPort-SDR: CpQb6gK6/Iya5qXAK3+Q0g41JWhJ7R4r7IjPCpM6ZeyJn1VplNLk5s+D6jtqif1TcPqeo8uA+R
 7J5hH17WZzHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="275480157"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="275480157"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 18:15:36 -0700
IronPort-SDR: Q8RsDOJ/JL6cw62Nw9uMR8/5n3JdeWVrk1I+zTuWv8wVJUm/aLSjfd+RYLBRTjFDiQoEPmZ6m8
 CSkRDn8o7tlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="435362413"
Received: from allen-box.sh.intel.com ([10.239.159.128])
 by fmsmga004.fm.intel.com with ESMTP; 22 Mar 2021 18:15:34 -0700
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 0/5] iommu/vt-d: Several misc cleanups
Date: Tue, 23 Mar 2021 09:05:55 +0800
Message-Id: <20210323010600.678627-1-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: kevin.tian@intel.com, ashok.raj@intel.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, jacob.jun.pan@intel.com
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

Hi Joerg et al,

This series includes several cleanups in the VT-d driver. Please help to
review.

Best regards,
baolu

Lu Baolu (5):
  iommu/vt-d: Remove unused dma map/unmap trace events
  iommu/vt-d: Remove svm_dev_ops
  iommu/vt-d: Remove SVM_FLAG_PRIVATE_PASID
  iommu/vt-d: Remove unused function declarations
  iommu/vt-d: Make unnecessarily global functions static

 drivers/iommu/intel/pasid.c        |   4 +-
 drivers/iommu/intel/pasid.h        |   5 --
 drivers/iommu/intel/svm.c          |  55 +++++--------
 include/linux/intel-iommu.h        |   3 -
 include/linux/intel-svm.h          |  23 +-----
 include/trace/events/intel_iommu.h | 120 -----------------------------
 6 files changed, 24 insertions(+), 186 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
