Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4A5362A0F
	for <lists.iommu@lfdr.de>; Fri, 16 Apr 2021 23:19:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BF92403B3;
	Fri, 16 Apr 2021 21:19:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MnBBrBGQm8lt; Fri, 16 Apr 2021 21:19:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22859403A6;
	Fri, 16 Apr 2021 21:19:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E5DF8C000A;
	Fri, 16 Apr 2021 21:19:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6E3EC000A
 for <iommu@lists.linux-foundation.org>; Fri, 16 Apr 2021 21:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7C7B8469D
 for <iommu@lists.linux-foundation.org>; Fri, 16 Apr 2021 21:19:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aIlERkMqWmLI for <iommu@lists.linux-foundation.org>;
 Fri, 16 Apr 2021 21:19:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F4A6843EA
 for <iommu@lists.linux-foundation.org>; Fri, 16 Apr 2021 21:19:48 +0000 (UTC)
IronPort-SDR: y7UGBF3tIn5473OLltS/dZVJHw6w0ndSiF7fxvEyNhh9hftehS+dcrDYVuueNOMgjgRbj0wrzV
 GYQsFPH+h5iA==
X-IronPort-AV: E=McAfee;i="6200,9189,9956"; a="194671893"
X-IronPort-AV: E=Sophos;i="5.82,228,1613462400"; d="scan'208";a="194671893"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2021 14:19:34 -0700
IronPort-SDR: 3vfggyqGry/nrWnHH+RyO74dDk6XQPSCR1gyRWlQfj+zUkev56L0d89TQ/9Fa8JB9F+8VTCDsy
 fes5B32D8e6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,228,1613462400"; d="scan'208";a="522825399"
Received: from otc-wp-03.jf.intel.com ([10.54.39.79])
 by fmsmga001.fm.intel.com with ESMTP; 16 Apr 2021 14:19:34 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Joerg Roedel <joro@8bytes.org>, "Lu Baolu" <baolu.lu@linux.intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>
Subject: [PATCH v3 0/2] Simplify and restrict IOMMU SVA APIs
Date: Fri, 16 Apr 2021 05:45:12 -0700
Message-Id: <1618577114-30156-1-git-send-email-jacob.jun.pan@linux.intel.com>
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
 include/linux/intel-svm.h                     | 17 ++------------
 include/linux/iommu.h                         | 23 ++++++++++++++-----
 12 files changed, 56 insertions(+), 60 deletions(-)


base-commit: e49d033bddf5b565044e2abe4241353959bc9120
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
