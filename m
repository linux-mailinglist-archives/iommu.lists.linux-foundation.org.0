Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AE62D1279F8
	for <lists.iommu@lfdr.de>; Fri, 20 Dec 2019 12:30:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C5D8C8818E;
	Fri, 20 Dec 2019 11:30:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hvxvLBZXtRqP; Fri, 20 Dec 2019 11:30:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BC16B881B7;
	Fri, 20 Dec 2019 11:30:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F27DC1796;
	Fri, 20 Dec 2019 11:30:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 706FBC077D
 for <iommu@lists.linux-foundation.org>; Fri, 20 Dec 2019 11:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 54BD08812F
 for <iommu@lists.linux-foundation.org>; Fri, 20 Dec 2019 11:30:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z6+hH+OiQQ3E for <iommu@lists.linux-foundation.org>;
 Fri, 20 Dec 2019 11:30:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 56BA288106
 for <iommu@lists.linux-foundation.org>; Fri, 20 Dec 2019 11:30:31 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 740D02C7; Fri, 20 Dec 2019 12:30:28 +0100 (CET)
Date: Fri, 20 Dec 2019 12:30:26 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [git pull] IOMMU Fixes for Linux v5.5-rc2
Message-ID: <20191220113020.GA18747@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

Hi Linus,

thanks for taking care of the KASAN related IOMMU fix while I was dived
into other development work and sorry for the inconvenience. Here are
the other IOMMU fixes that piled up during the last weeks:

The following changes since commit d1eef1c619749b2a57e514a3fa67d9a516ffa919:

  Linux 5.5-rc2 (2019-12-15 15:16:08 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.5-rc2

for you to fetch changes up to c18647900ec864d401ba09b3bbd5b34f331f8d26:

  iommu/dma: Relax locking in iommu_dma_prepare_msi() (2019-12-18 17:41:36 +0100)

----------------------------------------------------------------
IOMMU Fixes for Linux v5.5-rc2

Including:

	- Fix kmemleak warning in IOVA code

	- Fix compile warnings on ARM32/64 in dma-iommu code due to
	  dma_mask type mismatches

	- Make ISA reserved regions relaxable, so that VFIO can assign
	  devices which have such regions defined

	- Fix mapping errors resulting in IO page-faults in the VT-d
	  driver

	- Make sure direct mappings for a domain are created after the
	  default domain is updated

	- Map ISA reserved regions in the VT-d driver with correct
	  permissions

	- Remove unneeded check for PSI capability in the IOTLB flush
	  code of the VT-d driver

	- Lockdep fix iommu_dma_prepare_msi()

----------------------------------------------------------------
Alex Williamson (1):
      iommu/vt-d: Set ISA bridge reserved region as relaxable

Jerry Snitselaar (2):
      iommu: set group default domain before creating direct mappings
      iommu/vt-d: Allocate reserved region for ISA with correct permission

Lu Baolu (2):
      iommu/vt-d: Fix dmar pte read access not set error
      iommu/vt-d: Remove incorrect PSI capability check

Robin Murphy (2):
      iommu/dma: Rationalise types for DMA masks
      iommu/dma: Relax locking in iommu_dma_prepare_msi()

Xiaotao Yin (1):
      iommu/iova: Init the struct iova to fix the possible memleak

 drivers/iommu/dma-iommu.c   | 23 +++++++++++------------
 drivers/iommu/intel-iommu.c | 12 ++----------
 drivers/iommu/intel-svm.c   |  6 +-----
 drivers/iommu/iommu.c       |  4 ++--
 drivers/iommu/iova.c        |  2 +-
 5 files changed, 17 insertions(+), 30 deletions(-)

Please pull.

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
