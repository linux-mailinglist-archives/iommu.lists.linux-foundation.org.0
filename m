Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0010971C75
	for <lists.iommu@lfdr.de>; Tue, 23 Jul 2019 18:08:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D33F1CC9;
	Tue, 23 Jul 2019 16:08:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 827F1C9A
	for <iommu@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 16:08:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B8EF98D7
	for <iommu@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 16:08:28 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 0681BBBCE45D5BFE0D5D;
	Wed, 24 Jul 2019 00:08:24 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.202.227.237) by
	DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server
	id 14.3.439.0; Wed, 24 Jul 2019 00:08:15 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <alex.williamson@redhat.com>, <eric.auger@redhat.com>
Subject: [PATCH v8 0/6] vfio/type1: Add support for valid iova list management
Date: Tue, 23 Jul 2019 17:06:31 +0100
Message-ID: <20190723160637.8384-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.202.227.237]
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-1.5 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kevin.tian@intel.com, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	xuwei5@hisilicon.com, linuxarm@huawei.com, iommu@lists.linux-foundation.org
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

This is to revive this series which almost made to 4.18 but got dropped
as Alex found an issue[1] with IGD and USB devices RMRR region being
reported as reserved regions.

Thanks to Eric for his work here[2]. It provides a way to exclude
these regions while reporting the valid iova regions and this respin
make use of that.

Please note that I don't have a platform to verify the reported RMRR
issue and appreciate testing on those platforms.

Thanks,
Shameer

[1] https://lkml.org/lkml/2018/6/5/760
[2] https://lore.kernel.org/patchwork/cover/1083072/

v7-->v8
  -Rebased to 5.3-rc1
  -Addressed comments from Alex and Eric. Please see
   individual patch history.
  -Added Eric's R-by to patches 4/5/6

v6-->v7
 -Rebased to 5.2-rc6 + Eric's patches
 -Added logic to exclude IOMMU_RESV_DIRECT_RELAXABLE reserved memory
  region type(patch #2).
 -Dropped patch #4 of v6 as it is already part of mainline.
 -Addressed "container with only an mdev device will have an empty list"
  case(patches 4/6 & 5/6 - Suggested by Alex)

Old
----
This series introduces an iova list associated with a vfio 
iommu. The list is kept updated taking care of iommu apertures,
and reserved regions. Also this series adds checks for any conflict
with existing dma mappings whenever a new device group is attached to
the domain.

User-space can retrieve valid iova ranges using VFIO_IOMMU_GET_INFO
ioctl capability chains. Any dma map request outside the valid iova
range will be rejected.

v5 --> v6

 -Rebased to 4.17-rc1
 -Changed the ordering such that previous patch#7 "iommu/dma: Move
  PCI window region reservation back...")  is now patch #4. This
  will avoid any bisection issues pointed out by Alex.
 -Added Robins's Reviewed-by tag for patch#4

v4 --> v5
Rebased to next-20180315.
 
 -Incorporated the corner case bug fix suggested by Alex to patch #5.
 -Based on suggestions by Alex and Robin, added patch#7. This
  moves the PCI window  reservation back in to DMA specific path.
  This is to fix the issue reported by Eric[1].

v3 --> v4
 Addressed comments received for v3.
 -dma_addr_t instead of phys_addr_t
 -LIST_HEAD() usage.
 -Free up iova_copy list in case of error.
 -updated logic in filling the iova caps info(patch #5)

RFCv2 --> v3
 Removed RFC tag.
 Addressed comments from Alex and Eric:
 - Added comments to make iova list management logic more clear.
 - Use of iova list copy so that original is not altered in
   case of failure.

RFCv1 --> RFCv2
 Addressed comments from Alex:
-Introduced IOVA list management and added checks for conflicts with 
 existing dma map entries during attach/detach.

Shameer Kolothum (6):
  vfio/type1: Introduce iova list and add iommu aperture validity check
  vfio/type1: Check reserved region conflict and update iova list
  vfio/type1: Update iova list on detach
  vfio/type1: check dma map request is within a valid iova range
  vfio/type1: Add IOVA range capability support
  vfio/type1: remove duplicate retrieval of reserved regions

 drivers/vfio/vfio_iommu_type1.c | 518 +++++++++++++++++++++++++++++++-
 include/uapi/linux/vfio.h       |  26 +-
 2 files changed, 531 insertions(+), 13 deletions(-)

-- 
2.17.1


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
