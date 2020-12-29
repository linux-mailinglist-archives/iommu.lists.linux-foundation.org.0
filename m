Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4E62E6D8E
	for <lists.iommu@lfdr.de>; Tue, 29 Dec 2020 04:25:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F2A0D871EA;
	Tue, 29 Dec 2020 03:25:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QYDSr9x0UAxc; Tue, 29 Dec 2020 03:25:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0F13C87149;
	Tue, 29 Dec 2020 03:25:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F0C13C0174;
	Tue, 29 Dec 2020 03:25:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9CD5BC0174
 for <iommu@lists.linux-foundation.org>; Tue, 29 Dec 2020 03:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 83F6B85D17
 for <iommu@lists.linux-foundation.org>; Tue, 29 Dec 2020 03:25:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4GpDX9HY2bQK for <iommu@lists.linux-foundation.org>;
 Tue, 29 Dec 2020 03:25:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E283D85CA8
 for <iommu@lists.linux-foundation.org>; Tue, 29 Dec 2020 03:25:38 +0000 (UTC)
IronPort-SDR: 4J6PgJopiB8jwXiMIPXAA8VDcN+ZwplUWCWjPYs/+lnAfGiqvcruMtG656+lz8O6LVwgzoq5Mx
 dv5RHFEwb2ZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9848"; a="238005098"
X-IronPort-AV: E=Sophos;i="5.78,456,1599548400"; d="scan'208";a="238005098"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2020 19:25:37 -0800
IronPort-SDR: /8e8CaXnujQmaeiR61yr/eq8PqFVnJF/uypGEQMAk9nOqBPyV98vpee9o6OG9PQkUmVjAUas9z
 m3dLjbr8JX3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,456,1599548400"; d="scan'208";a="392962405"
Received: from yiliu-dev.bj.intel.com (HELO iov-dev.bj.intel.com)
 ([10.238.156.135])
 by fmsmga004.fm.intel.com with ESMTP; 28 Dec 2020 19:25:34 -0800
From: Liu Yi L <yi.l.liu@intel.com>
To: baolu.lu@linux.intel.com,
	joro@8bytes.org,
	will@kernel.org
Subject: [PATCH v3 0/3] iommu/vt-d: Misc fixes on scalable mode
Date: Tue, 29 Dec 2020 11:25:10 +0800
Message-Id: <20201229032513.486395-1-yi.l.liu@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: kevin.tian@intel.com, ashok.raj@intel.com, jun.j.tian@intel.com,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 yi.y.sun@intel.com
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

Hi Baolu, Joerg, Will,

This patchset aims to fix a bug regards to native SVM usage, and
also several bugs around subdevice (attached to device via auxiliary
manner) tracking and ineffective device_tlb flush.

v2 -> v3:
- Address comments from Baolu Lu against v2
- Rebased to 5.11-rc1
v2: https://lore.kernel.org/linux-iommu/20201223062720.29364-1-yi.l.liu@intel.com/

v1 -> v2:
- Use a more recent Fix tag in "iommu/vt-d: Move intel_iommu info from struct intel_svm to struct intel_svm_dev"
- Refined the "iommu/vt-d: Track device aux-attach with subdevice_domain_info"
- Rename "iommu/vt-d: A fix to iommu_flush_dev_iotlb() for aux-domain" to be
  "iommu/vt-d: Fix ineffective devTLB invalidation for subdevices"
- Refined the commit messages
v1: https://lore.kernel.org/linux-iommu/20201220000352.183523-1-yi.l.liu@intel.com/

Liu Yi L (3):
  iommu/vt-d: Move intel_iommu info from struct intel_svm to struct
    intel_svm_dev
  iommu/vt-d: Track device aux-attach with subdevice_domain_info
  iommu/vt-d: Fix ineffective devTLB invalidation for subdevices

 drivers/iommu/intel/iommu.c | 148 ++++++++++++++++++++++++++----------
 drivers/iommu/intel/svm.c   |   9 ++-
 include/linux/intel-iommu.h |  18 +++--
 3 files changed, 125 insertions(+), 50 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
