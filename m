Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D028E1E407E
	for <lists.iommu@lfdr.de>; Wed, 27 May 2020 13:53:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 64A0688789;
	Wed, 27 May 2020 11:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G6SVqJ9c8EFd; Wed, 27 May 2020 11:53:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9BEB08876B;
	Wed, 27 May 2020 11:53:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 731CDC088D;
	Wed, 27 May 2020 11:53:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C208C088D
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 11:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 45CBB8876B
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 11:53:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u3bOewPzKP2K for <iommu@lists.linux-foundation.org>;
 Wed, 27 May 2020 11:53:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D1EF088751
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 11:53:27 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 4D05D374; Wed, 27 May 2020 13:53:23 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 00/10] iommu/amd: Updates and Cleanups
Date: Wed, 27 May 2020 13:53:03 +0200
Message-Id: <20200527115313.7426-1-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
Cc: iommu@lists.linux-foundation.org, jroedel@suse.de,
 linux-kernel@vger.kernel.org
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

Hi,

here is a collection of patches that clean up a few things
in the AMD IOMMU driver. Foremost, it moves all related
files of the driver into a separate subdirectory.

But the patches also remove usage of dev->archdata.iommu and
clean up dev_data handling and domain allocation.

Patches are runtime-tested, including device-assignment.

Please review.

Regards,

	Joerg

Joerg Roedel (10):
  iommu/amd: Move AMD IOMMU driver to a subdirectory
  iommu/amd: Unexport get_dev_data()
  iommu/amd: Let free_pagetable() not rely on domain->pt_root
  iommu/amd: Allocate page-table in protection_domain_init()
  iommu/amd: Free page-table in protection_domain_free()
  iommu/amd: Consolidate domain allocation/freeing
  iommu/amd: Remove PD_DMA_OPS_MASK
  iommu/amd: Merge private header files
  iommu/amd: Store dev_data as device iommu private data
  iommu/amd: Remove redundant devid checks

 MAINTAINERS                                   |   2 +-
 drivers/iommu/Makefile                        |   6 +-
 .../{amd_iommu_proto.h => amd/amd_iommu.h}    |  20 +-
 drivers/iommu/{ => amd}/amd_iommu_types.h     |   0
 .../{amd_iommu_debugfs.c => amd/debugfs.c}    |   5 +-
 .../iommu/{amd_iommu_init.c => amd/init.c}    |   6 +-
 drivers/iommu/{amd_iommu.c => amd/iommu.c}    | 265 ++++++------------
 .../iommu/{amd_iommu_v2.c => amd/iommu_v2.c}  |  14 +-
 .../{amd_iommu_quirks.c => amd/quirks.c}      |   0
 drivers/iommu/amd_iommu.h                     |  14 -
 10 files changed, 117 insertions(+), 215 deletions(-)
 rename drivers/iommu/{amd_iommu_proto.h => amd/amd_iommu.h} (88%)
 rename drivers/iommu/{ => amd}/amd_iommu_types.h (100%)
 rename drivers/iommu/{amd_iommu_debugfs.c => amd/debugfs.c} (89%)
 rename drivers/iommu/{amd_iommu_init.c => amd/init.c} (99%)
 rename drivers/iommu/{amd_iommu.c => amd/iommu.c} (95%)
 rename drivers/iommu/{amd_iommu_v2.c => amd/iommu_v2.c} (98%)
 rename drivers/iommu/{amd_iommu_quirks.c => amd/quirks.c} (100%)
 delete mode 100644 drivers/iommu/amd_iommu.h

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
