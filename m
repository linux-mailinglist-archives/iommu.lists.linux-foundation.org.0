Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFEB1F3B56
	for <lists.iommu@lfdr.de>; Tue,  9 Jun 2020 15:03:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6AF1C88782;
	Tue,  9 Jun 2020 13:03:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k94qSjc1zt+G; Tue,  9 Jun 2020 13:03:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D462988780;
	Tue,  9 Jun 2020 13:03:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C00B3C016F;
	Tue,  9 Jun 2020 13:03:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C15ADC016F
 for <iommu@lists.linux-foundation.org>; Tue,  9 Jun 2020 13:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AD36186D84
 for <iommu@lists.linux-foundation.org>; Tue,  9 Jun 2020 13:03:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t84m7eQlNq0t for <iommu@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 13:03:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8D8A686D2B
 for <iommu@lists.linux-foundation.org>; Tue,  9 Jun 2020 13:03:12 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id C9A372C3; Tue,  9 Jun 2020 15:03:09 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v2 0/2] iommu: Move Intel and AMD drivers into their own
 subdirectory
Date: Tue,  9 Jun 2020 15:03:01 +0200
Message-Id: <20200609130303.26974-1-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 David Woodhouse <dwmw2@infradead.org>
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

here is the updated version of the changes to move the Intel and AMD
IOMMU drivers into their own subdirectories. This time with updated
MAINTAINERS file entries.

Regards,

	Joerg

Joerg Roedel (2):
  iommu/amd: Move AMD IOMMU driver into subdirectory
  iommu/vt-d: Move Intel IOMMU driver into subdirectory

 MAINTAINERS                                    |  5 ++---
 drivers/iommu/Makefile                         | 18 +++++++++---------
 drivers/iommu/{ => amd}/amd_iommu.h            |  0
 drivers/iommu/{ => amd}/amd_iommu_types.h      |  0
 .../{amd_iommu_debugfs.c => amd/debugfs.c}     |  0
 drivers/iommu/{amd_iommu_init.c => amd/init.c} |  2 +-
 drivers/iommu/{amd_iommu.c => amd/iommu.c}     |  2 +-
 .../iommu/{amd_iommu_v2.c => amd/iommu_v2.c}   |  0
 .../iommu/{amd_iommu_quirks.c => amd/quirks.c} |  0
 .../{intel-iommu-debugfs.c => intel/debugfs.c} |  0
 drivers/iommu/{ => intel}/dmar.c               |  2 +-
 drivers/iommu/{ => intel}/intel-pasid.h        |  0
 drivers/iommu/{intel-iommu.c => intel/iommu.c} |  2 +-
 .../irq_remapping.c}                           |  2 +-
 drivers/iommu/{intel-pasid.c => intel/pasid.c} |  0
 drivers/iommu/{intel-svm.c => intel/svm.c}     |  0
 drivers/iommu/{intel-trace.c => intel/trace.c} |  0
 17 files changed, 16 insertions(+), 17 deletions(-)
 rename drivers/iommu/{ => amd}/amd_iommu.h (100%)
 rename drivers/iommu/{ => amd}/amd_iommu_types.h (100%)
 rename drivers/iommu/{amd_iommu_debugfs.c => amd/debugfs.c} (100%)
 rename drivers/iommu/{amd_iommu_init.c => amd/init.c} (99%)
 rename drivers/iommu/{amd_iommu.c => amd/iommu.c} (99%)
 rename drivers/iommu/{amd_iommu_v2.c => amd/iommu_v2.c} (100%)
 rename drivers/iommu/{amd_iommu_quirks.c => amd/quirks.c} (100%)
 rename drivers/iommu/{intel-iommu-debugfs.c => intel/debugfs.c} (100%)
 rename drivers/iommu/{ => intel}/dmar.c (99%)
 rename drivers/iommu/{ => intel}/intel-pasid.h (100%)
 rename drivers/iommu/{intel-iommu.c => intel/iommu.c} (99%)
 rename drivers/iommu/{intel_irq_remapping.c => intel/irq_remapping.c} (99%)
 rename drivers/iommu/{intel-pasid.c => intel/pasid.c} (100%)
 rename drivers/iommu/{intel-svm.c => intel/svm.c} (100%)
 rename drivers/iommu/{intel-trace.c => intel/trace.c} (100%)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
