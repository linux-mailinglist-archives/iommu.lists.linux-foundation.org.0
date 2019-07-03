Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F2C5DB33
	for <lists.iommu@lfdr.de>; Wed,  3 Jul 2019 03:57:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DA408119E;
	Wed,  3 Jul 2019 01:57:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 949DA1079
	for <iommu@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 01:57:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D525A70D
	for <iommu@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 01:57:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jul 2019 18:57:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,445,1557212400"; d="scan'208";a="190875048"
Received: from sai-dev-mach.sc.intel.com ([143.183.140.153])
	by fmsmga002.fm.intel.com with ESMTP; 02 Jul 2019 18:57:08 -0700
From: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
To: iommu@lists.linux-foundation.org
Subject: [PATCH RFC 0/4] iommu: Add support to change default domain of a group
Date: Tue,  2 Jul 2019 18:53:58 -0700
Message-Id: <cover.1562116655.git.sai.praneeth.prakhya@intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Spam-Status: No, score=-4.6 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
	RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Ashok Raj <ashok.raj@intel.com>, Will Deacon <will.deacon@arm.com>,
	Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Presently, the default domain of a group is allocated during boot time and it
cannot be changed later. So, the device would typically be either in
identity/pass through mode or the device would be in DMA mode as long as the
system is up and running. There is no way to change the default domain type
dynamically i.e. after booting, a device cannot switch between identity mode and
DMA mode.

Assume a use case where-in the priviliged user would want to use the device in
pass-through mode when the device is used for host but would want to switch to
dma protected mode when switching for VFIO in user space. Presently, this is not
supported and hence add support to change default domain of a group dynamically.

Support this through a sysfs file, namely "/sys/kernel/iommu_groups/<grp_id>/type".

Testing:
--------
Tested by dynamically changing USB device from identity mode to dma and from dma
to identity. Only for x86_64 (i.e. intel_iommu/vt-d). Haven't tested for other
architectures.

Sai Praneeth Prakhya (4):
  iommu/vt-d: Modify device_def_domain_type() to use at runtime
  iommu: Add device_def_domain_type() call back function to iommu_ops
  iommu: Add support to change default domain of a group
  iommu: Document usage of "/sys/kernel/iommu_groups/<grp_id>/type" file

 .../ABI/testing/sysfs-kernel-iommu_groups     |  34 ++++
 drivers/iommu/intel-iommu.c                   |  32 +++-
 drivers/iommu/iommu.c                         | 178 +++++++++++++++++-
 include/linux/iommu.h                         |   3 +
 4 files changed, 237 insertions(+), 10 deletions(-)

Cc: Christoph Hellwig <hch@lst.de>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Ashok Raj <ashok.raj@intel.com>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Sohil Mehta <sohil.mehta@intel.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
Signed-off-by: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>

-- 
2.19.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
