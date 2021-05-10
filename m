Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id F037137998A
	for <lists.iommu@lfdr.de>; Tue, 11 May 2021 00:01:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E05F83A71;
	Mon, 10 May 2021 22:01:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qIOf4iofhUdD; Mon, 10 May 2021 22:01:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FD1D83AB7;
	Mon, 10 May 2021 22:01:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B694C0001;
	Mon, 10 May 2021 22:01:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FAA8C0001
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 22:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D1E983A71
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 22:01:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QI3LBIu8LgL6 for <iommu@lists.linux-foundation.org>;
 Mon, 10 May 2021 22:01:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B001A83A6C
 for <iommu@lists.linux-foundation.org>; Mon, 10 May 2021 22:01:34 +0000 (UTC)
IronPort-SDR: b+gnv+3hKHmg9eG5Yueh9JEBFjWFhx29m1tv2TYxFK7ApUebR1kRVMJAhtAlsuIA9wWdPE89E1
 4QMxPtSr2oWQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="196204938"
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; d="scan'208";a="196204938"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2021 15:01:26 -0700
IronPort-SDR: 34fe2CGszeCS3BAyVqDPJsQkBaf6yJsuPUza8a16YEQ4vZRKi6mhrivJmwyf9a65Iiat0PWD9S
 wz4Q/uIj3ICw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; d="scan'208";a="470918936"
Received: from otc-wp-03.jf.intel.com ([10.54.39.79])
 by orsmga001.jf.intel.com with ESMTP; 10 May 2021 15:00:52 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Joerg Roedel <joro@8bytes.org>, "Lu Baolu" <baolu.lu@linux.intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>
Subject: [PATCH v4 0/2] Simplify and restrict IOMMU SVA APIs
Date: Mon, 10 May 2021 06:25:06 -0700
Message-Id: <1620653108-44901-1-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Raj Ashok <ashok.raj@intel.com>, vkoul@kernel.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>,
 zhangfei.gao@linaro.org
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

A couple of small changes to simplify and restrict SVA APIs. The motivation
is to make PASID allocation palatable for cgroup consumptions. Misc cgroup
is merged for v5.13, it can be extended for IOASID as another scalar
resource.

I have not tested on ARM platforms due to availability. Would appreciate
if someone could help with the testing on uacce based SVA usages.

Thanks,

Jacob

ChangeLog:
V4	- fixed a cross-compile error
	- rebased to v5.13-rc1 resolved a conflict in intel-svm code

V3	- stop passing mm to sva_bind IOMMU ops, no need to take mm refcount
	in the common SVA code.
	- deleted flag variable in idxd driver

V2
	- retained mm argument in iommu_sva_alloc_pasid()
	- keep generic supervisor flag separated from vt-d's SRE
	- move flag declaration out of CONFIG_IOMMU_API



Jacob Pan (2):
  iommu/sva: Tighten SVA bind API with explicit flags
  iommu/sva: Remove mm parameter from SVA bind API

 drivers/dma/idxd/cdev.c                       |  2 +-
 drivers/dma/idxd/init.c                       |  7 ++----
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   | 12 ++++++----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  5 ++--
 drivers/iommu/intel/svm.c                     | 19 ++++++++-------
 drivers/iommu/iommu-sva-lib.c                 | 11 +++++----
 drivers/iommu/iommu-sva-lib.h                 |  2 +-
 drivers/iommu/iommu.c                         | 13 +++++------
 drivers/misc/uacce/uacce.c                    |  2 +-
 include/linux/intel-iommu.h                   |  3 +--
 include/linux/intel-svm.h                     | 12 ----------
 include/linux/iommu.h                         | 23 ++++++++++++++-----
 12 files changed, 54 insertions(+), 57 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
