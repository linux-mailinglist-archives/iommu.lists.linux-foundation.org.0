Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB141DD494
	for <lists.iommu@lfdr.de>; Thu, 21 May 2020 19:39:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B825E893CC;
	Thu, 21 May 2020 17:39:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0lHoMcQ0UqDH; Thu, 21 May 2020 17:39:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 453178929D;
	Thu, 21 May 2020 17:39:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27FB1C0176;
	Thu, 21 May 2020 17:39:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA942C0176
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 17:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 99B89872ED
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 17:39:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UXFtpQdjsQVz for <iommu@lists.linux-foundation.org>;
 Thu, 21 May 2020 17:39:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2194E86D84
 for <iommu@lists.linux-foundation.org>; Thu, 21 May 2020 17:39:49 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C7A27207F7;
 Thu, 21 May 2020 17:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590082788;
 bh=rZ7OTMNu5T3UCgib1e3eEgYYpyAWOaCd5OohlJnEMDo=;
 h=Date:From:To:Cc:Subject:From;
 b=oEgGuQeONzen71ym3SmfwHbStp6Iv/qiCn0Zlhowk7y9UaPuWTV7/MDErl+ZfoI92
 hKW2W7RzfGMoHlfcHHFFWSidXGbZ61miQMpUe5ThBpYwJXb506hwMe4IX82saoP6tl
 9OQNYX8y1p83Kx0VoFMpCjUZprB7ll8BGFkU8EQw=
Date: Thu, 21 May 2020 18:39:44 +0100
From: Will Deacon <will@kernel.org>
To: joro@8bytes.org
Subject: [GIT PULL] iommu/arm-smmu: Updates for 5.8
Message-ID: <20200521173944.GM6608@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kernel-team@android.com, iommu@lists.linux-foundation.org,
 robin.murphy@arm.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

Hi Joerg,

Please pull these Arm SMMU updates for 5.8. The branch is based on your
'core' branch from a little while ago.

Summary in the tag.

Cheers,

Will

--->8

The following changes since commit 1b032ec1ecbce6047af7d11c9db432e237cb17d8:

  iommu: Unexport iommu_group_get_for_dev() (2020-05-05 14:36:14 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git tags/arm-smmu-updates

for you to fetch changes up to 0299a1a81ca056e79c1a7fb751f936ec0d5c7afe:

  iommu/arm-smmu-v3: Manage ASIDs with xarray (2020-05-21 14:54:06 +0100)

----------------------------------------------------------------
Arm SMMU updates for 5.8

- Avoid mapping reserved MMIO space on SMMUv3, so that it can be claimed
  by the PMU driver

- Use xarray to manage ASIDs on SMMUv3

- Reword confusing shutdown message

- DT compatible string updates

- Allow implementations to override the default domain type

----------------------------------------------------------------
Andre Przywara (1):
      dt-bindings: arm-smmu: Allow mmu-400, smmu-v1 compatible

Chen Zhou (1):
      iommu/arm-smmu-v3: remove set but not used variable 'smmu'

Jean-Philippe Brucker (2):
      iommu/arm-smmu-v3: Don't reserve implementation defined register space
      iommu/arm-smmu-v3: Manage ASIDs with xarray

Jordan Crouse (1):
      iommu/arm-smmu: Allow client devices to select direct mapping

Sai Prakash Ranjan (3):
      iommu/arm-smmu: Make remove callback message more informative
      iommu: arm-smmu-impl: Convert to a generic reset implementation
      iommu/arm-smmu: Implement iommu_ops->def_domain_type call-back

Sibi Sankar (3):
      dt-bindings: remoteproc: qcom: Add iommus property
      arm64: dts: qcom: sdm845-cheza: Add iommus property
      iommu/arm-smmu-qcom: Request direct mapping for modem device

 .../devicetree/bindings/iommu/arm,smmu.yaml        |  4 +-
 .../devicetree/bindings/remoteproc/qcom,q6v5.txt   |  3 +
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |  5 ++
 drivers/iommu/arm-smmu-impl.c                      |  8 ++-
 drivers/iommu/arm-smmu-qcom.c                      | 37 ++++++++++++-
 drivers/iommu/arm-smmu-v3.c                        | 64 +++++++++++++++++-----
 drivers/iommu/arm-smmu.c                           | 14 ++++-
 drivers/iommu/arm-smmu.h                           |  1 +
 8 files changed, 113 insertions(+), 23 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
