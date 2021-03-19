Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF4A341B3B
	for <lists.iommu@lfdr.de>; Fri, 19 Mar 2021 12:15:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 355976071A;
	Fri, 19 Mar 2021 11:15:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S1L-lTXt26_N; Fri, 19 Mar 2021 11:15:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47E146070B;
	Fri, 19 Mar 2021 11:15:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C19AC0010;
	Fri, 19 Mar 2021 11:15:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6657C0001
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 11:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1A3C6070B
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 11:15:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DG4N-P8h2qjI for <iommu@lists.linux-foundation.org>;
 Fri, 19 Mar 2021 11:15:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DFFC606EE
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 11:15:11 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 576282DA; Fri, 19 Mar 2021 12:15:07 +0100 (CET)
Date: Fri, 19 Mar 2021 12:15:05 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [git pull] IOMMU Fixes for Linux v5.12-rc3
Message-ID: <YFSHuWNVKFOTHJWt@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
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

The following changes since commit 1e28eed17697bcf343c6743f0028cc3b5dd88bf0:

  Linux 5.12-rc3 (2021-03-14 14:41:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git tags/iommu-fixes-v5.12-rc3

for you to fetch changes up to 8dfd0fa6ecdc5e2099a57d485b7ce237abc6c7a0:

  iommu/tegra-smmu: Make tegra_smmu_probe_device() to handle all IOMMU phandles (2021-03-18 11:31:12 +0100)

----------------------------------------------------------------
IOMMU Fixes for Linux v5.12-rc3

Including:

	- Three AMD IOMMU patches to fix a boot crash on AMD Stoney
	  systems and every other AMD IOMMU system booted with
	  'amd_iommu=off'. This is a v5.11 regression.

	- A Fix for the Tegra IOMMU driver to make sure it detects all
	  IOMMUs

----------------------------------------------------------------
Dmitry Osipenko (1):
      iommu/tegra-smmu: Make tegra_smmu_probe_device() to handle all IOMMU phandles

Joerg Roedel (3):
      iommu/amd: Move Stoney Ridge check to detect_ivrs()
      iommu/amd: Don't call early_amd_iommu_init() when AMD IOMMU is disabled
      iommu/amd: Keep track of amd_iommu_irq_remap state

 drivers/iommu/amd/init.c   | 36 ++++++++++++++++++++----------------
 drivers/iommu/tegra-smmu.c |  7 +++----
 2 files changed, 23 insertions(+), 20 deletions(-)

Please pull.

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
