Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA5F192FC5
	for <lists.iommu@lfdr.de>; Wed, 25 Mar 2020 18:49:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 92ADB86D10;
	Wed, 25 Mar 2020 17:49:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CS_Hlg_GK6Oc; Wed, 25 Mar 2020 17:49:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DB25C86D1D;
	Wed, 25 Mar 2020 17:49:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BC438C1D7C;
	Wed, 25 Mar 2020 17:49:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EBD29C0177
 for <iommu@lists.linux-foundation.org>; Wed, 25 Mar 2020 17:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DB5F786CEF
 for <iommu@lists.linux-foundation.org>; Wed, 25 Mar 2020 17:49:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ihl1gvG1r8xm for <iommu@lists.linux-foundation.org>;
 Wed, 25 Mar 2020 17:49:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C21308621D
 for <iommu@lists.linux-foundation.org>; Wed, 25 Mar 2020 17:49:48 +0000 (UTC)
IronPort-SDR: 3gclL2R8MobivGnaxQ8obV/Z318upnjdp4f832jzeL3EQxs/EfhJ5f79POA5/0Fpl6pYvG5wCA
 h7n4uqYELlpA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 10:49:48 -0700
IronPort-SDR: nTGyV5KO2GQfWBaE7MPTXA5oh1MfNXhUZcWgU80XHoM7UXz+iNhogqiHO0iw7vWby/zNgBoMMA
 +l0m2WDGAf9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,305,1580803200"; d="scan'208";a="393702187"
Received: from jacob-builder.jf.intel.com ([10.7.199.155])
 by orsmga004.jf.intel.com with ESMTP; 25 Mar 2020 10:49:47 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Lu Baolu" <baolu.lu@linux.intel.com>, iommu@lists.linux-foundation.org,
 LKML <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>
Subject: [PATCH 00/10] IOASID extensions for guest SVA
Date: Wed, 25 Mar 2020 10:55:21 -0700
Message-Id: <1585158931-1825-1-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jonathan Cameron <jic23@kernel.org>
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

IOASID was introduced in v5.5 as a generic kernel allocator service for
both PCIe Process Address Space ID (PASID) and ARM SMMU's Sub Stream
ID. In addition to basic ID allocation, ioasid_set was introduced as a
token that is shared by a group of IOASIDs. This set token can be used
for permission checking but lack of some features needed by guest Shared
Virtual Address (SVA). In addition, IOASID support for life cycle
management is needed among multiple users.

This patchset introduces two extensions to the IOASID code,
1. IOASID set operations
2. Notifications for IOASID state synchronization

Part #1:
IOASIDs used by each VM fits naturally into an ioasid_set. The usage
for per set management requires the following features:

- Quota enforcement - This is to prevent one VM from abusing the
  allocator to take all the system IOASIDs. Though VFIO layer can also
  enforce the quota, but it cannot cover the usage with both guest and
  host SVA on the same system.

- Stores guest IOASID-Host IOASID mapping within the set. To
  support live migration, IOASID namespace should be owned by the
  guest. This requires per IOASID set look up between guest and host
  IOASIDs. This patchset does not introduce non-identity guest-host
  IOASID lookup, we merely introduce the infrastructure in per set data.

- Set level operations, e.g. when a guest terminates, it is likely to
free the entire set. Having a single place to manage the set where the
IOASIDs are stored makes iteration much easier.


New APIs are:
- void ioasid_install_capacity(ioasid_t total);
  Set the system capacity prior to any allocations. On x86, VT-d driver
  calls this function to set max number of PASIDs, typically 1 million
  (20 bits).

- int ioasid_alloc_system_set(int quota);
  Host system has a default ioasid_set, during boot it is expected that
  this default set is allocated with a reasonable quota, e.g. PID_MAX.
  This default/system set is used for baremetal SVA.

- int ioasid_alloc_set(struct ioasid_set *token, ioasid_t quota, int
*sid);
  Allocate a new set with a token, returned sid (set ID) will be used
  to allocate IOASIDs within the set. Allocation of IOASIDs cannot
  exceed the quota.

- void ioasid_free_set(int sid, bool destroy_set);
  Free the entire set and notify all users with an option to destroy
  the set. Set ID can be used for allocation again if not destroyed.

- int ioasid_find_sid(ioasid_t ioasid);
  Look up the set ID from an ioasid. There is no reference held,
  assuming set has a single owner.

- int ioasid_adjust_set(int sid, int quota);
  Change the quota of the set, new quota cannot be less than the number
  of IOASIDs already allocated within the set. This is useful when
  IOASID resource needs to be balanced among VMs.

Part #2
Notification service. Since IOASIDs are used by many consumers that
follow publisher-subscriber pattern, notification is a natural choice
to keep states synchronized. For example, on x86 system, guest PASID
allocation and bind call results in VFIO IOCTL that can add and change
guest-host PASID states. At the same time, IOMMU driver and KVM need to
maintain its own PASID contexts. In this case, VFIO is the publisher
within the kernel, IOMMU driver and KVM are the subscribers.

This patchset introduces a global blocking notifier chain and APIs to
operate on. Not all events nor all IOASIDs are of interests to all
subscribers. e.g. KVM is only interested in the IOASIDs within its set.
IOMMU driver is not ioasid_set aware. A further optimization could be
having both global and per set notifier. But consider the infrequent
nature of bind/unbind and relatively long process life cycle, this
optimization may not be needed at this time.

To register/unregister notification blocks, use these two APIs:
- int ioasid_add_notifier(struct notifier_block *nb);
- void ioasid_remove_notifier(struct notifier_block *nb)

To send notification on an IOASID with one of the commands (FREE,
BIND/UNBIND, etc.), use:
- int ioasid_notify(ioasid_t id, enum ioasid_notify_val cmd);

This work is a result of collaboration with many people:
Liu, Yi L <yi.l.liu@intel.com>
Wu Hao <hao.wu@intel.com>
Ashok Raj <ashok.raj@intel.com>
Kevin Tian <kevin.tian@intel.com>

Thanks,

Jacob

Jacob Pan (10):
  iommu/ioasid: Introduce system-wide capacity
  iommu/vt-d: Set IOASID capacity when SVM is enabled
  iommu/ioasid: Introduce per set allocation APIs
  iommu/ioasid: Rename ioasid_set_data to avoid confusion with
    ioasid_set
  iommu/ioasid: Create an IOASID set for host SVA use
  iommu/ioasid: Convert to set aware allocations
  iommu/ioasid: Use mutex instead of spinlock
  iommu/ioasid: Introduce notifier APIs
  iommu/ioasid: Support ioasid_set quota adjustment
  iommu/vt-d: Register PASID notifier for status change

 drivers/iommu/intel-iommu.c |  20 ++-
 drivers/iommu/intel-svm.c   |  89 ++++++++--
 drivers/iommu/ioasid.c      | 387 +++++++++++++++++++++++++++++++++++++++-----
 include/linux/intel-iommu.h |   1 +
 include/linux/ioasid.h      |  86 +++++++++-
 5 files changed, 522 insertions(+), 61 deletions(-)

-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
