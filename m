Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F45A1E6AD9
	for <lists.iommu@lfdr.de>; Thu, 28 May 2020 21:26:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F04AB88326;
	Thu, 28 May 2020 19:26:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RpBehk8Rbo+f; Thu, 28 May 2020 19:26:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1A12D8831A;
	Thu, 28 May 2020 19:26:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1343C016F;
	Thu, 28 May 2020 19:26:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 300BEC016F
 for <iommu@lists.linux-foundation.org>; Thu, 28 May 2020 19:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1C92D882FD
 for <iommu@lists.linux-foundation.org>; Thu, 28 May 2020 19:26:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6wYi+DoCnK5X for <iommu@lists.linux-foundation.org>;
 Thu, 28 May 2020 19:26:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 12252882F3
 for <iommu@lists.linux-foundation.org>; Thu, 28 May 2020 19:26:43 +0000 (UTC)
IronPort-SDR: y5lByx5+CWP19LXVXCgk/98ZY0jFm5KO6YB6J8WwwIuhI3/m68yLZwhfxALfY+lUlZNy197Fi9
 rHhVIeautNJw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2020 12:26:42 -0700
IronPort-SDR: 8lFMhq4Vj+4W9l0BaODkA9EUrp1HYfHD3lU1EQUUvkcHhZXBaYdyHUPbVXzOMxWej48negq3I1
 W8tQJQ2YL0Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,446,1583222400"; d="scan'208";a="270963860"
Received: from sai-dev-mach.sc.intel.com ([143.183.140.153])
 by orsmga006.jf.intel.com with ESMTP; 28 May 2020 12:26:41 -0700
From: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
To: iommu@lists.linux-foundation.org
Subject: [PATCH V3 0/3] iommu: Add support to change default domain of an iommu
Date: Thu, 28 May 2020 12:23:09 -0700
Message-Id: <cover.1590686413.git.sai.praneeth.prakhya@intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: Ashok Raj <ashok.raj@intel.com>, Will Deacon <will.deacon@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

Presently, the default domain of a iommu group is allocated during boot time and
it cannot be changed later. So, the device would typically be either in identity
(pass_through) mode or the device would be in DMA mode as long as the system is
up and running. There is no way to change the default domain type dynamically
i.e. after booting, a device cannot switch between identity mode and DMA mode.

Assume a use case wherein the privileged user would want to use the device in
pass-through mode when the device is used for host so that it would be high
performing. Presently, this is not supported. Hence add support to change the
default domain of an iommu group dynamically.

Support this by writing to a sysfs file, namely
"/sys/kernel/iommu_groups/<grp_id>/type".

Testing:
--------
Tested by dynamically changing storage device (nvme) from
1. identity mode to DMA and making sure file transfer works
2. DMA mode to identity mode and making sure file transfer works
Tested only for intel_iommu/vt-d. Would appreciate if someone could test on AMD
and ARM based machines.

Based on iommu maintainer's 'next' branch.

Changes from V2:
----------------
1. Change the logic of updating default domain from V2 because
   ops->probe_finalize() could be used to update dma_ops.
2. Drop 1st and 2nd patch of V2 series because they are no longer needed on
   iommu maintainer's 'next' branch.
3. Limit this feature to iommu groups with only one device.
4. Hold device_lock and group mutex until the default domain is changed.

Changes from V1:
----------------
1. V1 patch set wasn't updating dma_ops for some vendors (Eg: AMD), hence,
   change the logic of updating default domain as below (because adding a device
   to iommu_group automatically updates dma_ops)
   a. Allocate a new domain
   b. For every device in the group
	i. Remove the device from the group
	ii. Add the device back to the group
   c. Free previous domain
2. Drop 1st patch of V1 (iommu/vt-d: Modify device_def_domain_type() to use at
   runtime) because "iommu=pt" has no effect on this function anymore.
3. Added a patch to take/release lock while reading iommu_group->default_domain->type
   because it can be changed any time by user.
4. Before changing default domain type of a group, check if the group is
   directly assigned for user level access. If so, abort.
5. Sanitize return path (using ternary operator) in iommu_group_store_type()
6. Split 2nd patch of V1 (iommu: Add device_def_domain_type() call back function
   to iommu_ops) into two patches such that iommu generic changes are now in 1st
   patch of V2 and vt-d specific changes are in 2nd patch of V2.
7. Rename device_def_domain_type() to dev_def_domain_type()
8. Remove example from documentation
9. Change the value written to file "/sys/kernel/iommu_groups/<grp_id>/type"
   from "dma" to "DMA".

Changes from RFC:
-----------------
1. Added support for "auto" type, so that kernel selects one among identity or
   dma mode.
2. Use "system_state" in device_def_domain_type() instead of an argument.

Sai Praneeth Prakhya (3):
  iommu: Add support to change default domain of an iommu_group
  iommu: Take lock before reading iommu_group default domain type
  iommu: Document usage of "/sys/kernel/iommu_groups/<grp_id>/type" file

 .../ABI/testing/sysfs-kernel-iommu_groups     |  30 +++
 drivers/iommu/iommu.c                         | 213 +++++++++++++++++-
 2 files changed, 242 insertions(+), 1 deletion(-)

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
