Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CF92B0BE
	for <lists.iommu@lfdr.de>; Mon, 27 May 2019 10:56:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0B44F1612;
	Mon, 27 May 2019 08:56:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BD3F01605
	for <iommu@lists.linux-foundation.org>;
	Mon, 27 May 2019 08:55:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4C8E413A
	for <iommu@lists.linux-foundation.org>;
	Mon, 27 May 2019 08:55:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 779D730832E9;
	Mon, 27 May 2019 08:55:53 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AE7835D978;
	Mon, 27 May 2019 08:55:44 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, joro@8bytes.org,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	dwmw2@infradead.org, lorenzo.pieralisi@arm.com, robin.murphy@arm.com,
	will.deacon@arm.com, hanjun.guo@linaro.org, sudeep.holla@arm.com
Subject: [PATCH v4 0/8] RMRR related fixes and enhancements
Date: Mon, 27 May 2019 10:55:33 +0200
Message-Id: <20190527085541.5294-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Mon, 27 May 2019 08:55:53 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: alex.williamson@redhat.com
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

Currently the Intel reserved region is attached to the
RMRR unit and when building the list of RMRR seen by a device
we link this unique reserved region without taking care of
potential multiple usage of this reserved region by several devices.

Also while reading the vtd spec it is unclear to me whether
the RMRR device scope referenced by an RMRR ACPI struct could
be a PCI-PCI bridge, in which case I think we also need to
check the device belongs to the PCI sub-hierarchy of the device
referenced in the scope. This would be true for device_has_rmrr()
and intel_iommu_get_resv_regions().

Last, the VFIO subsystem would need to compute the usable IOVA range
by querying the iommu_get_group_resv_regions() API. This would allow,
for instance, to report potential conflicts between the guest physical
address space and host reserved regions.

However iommu_get_group_resv_regions() currently fails to differentiate
RMRRs that are known safe for device assignment and RMRRs that must be
enforced. So we introduce a new reserved memory region type (relaxable),
reported when associated to an USB or GFX device. The last 2 patches aim
at unblocking [1] which is stuck since 4.18.

[1-6] are fixes
[7-8] are enhancements

The two parts can be considered separately if needed.

References:
[1] [PATCH v6 0/7] vfio/type1: Add support for valid iova list management
    https://patchwork.kernel.org/patch/10425309/

Branch: This series is available at:
https://github.com/eauger/linux/tree/v5.2-rc2-rmrr-v4

History:

v3 -> v4:
- added "iommu: Fix a leak in iommu_insert_resv_region"
- introduced device_rmrr_is_relaxable and fixed to_pci_dev call
  without checking dev_is_pci
- Despite Robin suggested to hide direct relaxable behind direct
  ones, I think this would lead to a very complex implementation
  of iommu_insert_resv_region while in general the relaxable
  regions are going to be ignored by the caller. By the way I
  found a leak in this function, hence the new first patch

v2 -> v3:
s/||/&& in iommu_group_create_direct_mappings

v1 -> v2:
- introduce is_downstream_to_pci_bridge() in a separate patch, change param
  names and add kerneldoc comment
- add 6,7


Eric Auger (8):
  iommu: Fix a leak in iommu_insert_resv_region
  iommu: Pass a GFP flag parameter to iommu_alloc_resv_region()
  iommu/vt-d: Duplicate iommu_resv_region objects per device list
  iommu/vt-d: Introduce is_downstream_to_pci_bridge helper
  iommu/vt-d: Handle RMRR with PCI bridge device scopes
  iommu/vt-d: Handle PCI bridge RMRR device scopes in
    intel_iommu_get_resv_regions
  iommu: Introduce IOMMU_RESV_DIRECT_RELAXABLE reserved memory regions
  iommu/vt-d: Differentiate relaxable and non relaxable RMRRs

 .../ABI/testing/sysfs-kernel-iommu_groups     |   9 ++
 drivers/acpi/arm64/iort.c                     |   3 +-
 drivers/iommu/amd_iommu.c                     |   7 +-
 drivers/iommu/arm-smmu-v3.c                   |   2 +-
 drivers/iommu/arm-smmu.c                      |   2 +-
 drivers/iommu/intel-iommu.c                   | 127 ++++++++++++------
 drivers/iommu/iommu.c                         |  27 ++--
 include/linux/iommu.h                         |   8 +-
 8 files changed, 128 insertions(+), 57 deletions(-)

-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
