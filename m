Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D972AD820
	for <lists.iommu@lfdr.de>; Tue, 10 Nov 2020 14:57:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9553E858B8;
	Tue, 10 Nov 2020 13:57:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U-ny3dL3IK9o; Tue, 10 Nov 2020 13:57:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 26ACD86B6C;
	Tue, 10 Nov 2020 13:57:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0961AC016F;
	Tue, 10 Nov 2020 13:57:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ED69CC016F
 for <iommu@lists.linux-foundation.org>; Tue, 10 Nov 2020 13:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E895F873A0
 for <iommu@lists.linux-foundation.org>; Tue, 10 Nov 2020 13:57:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QBpQYPZJyZa0 for <iommu@lists.linux-foundation.org>;
 Tue, 10 Nov 2020 13:57:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6BFF08739B
 for <iommu@lists.linux-foundation.org>; Tue, 10 Nov 2020 13:57:03 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6E89920797;
 Tue, 10 Nov 2020 13:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605016622;
 bh=pUCSLw0dp38jb6CdCj20KMAJ24P3TkHkgt3ZT3RYx0k=;
 h=Date:From:To:Cc:Subject:From;
 b=0KCiYdkyFaR5w/qPRTfH+xDMnjI09MxOjiucXHAY9YlPQfNr1y4j4FeXENtrJeyOP
 9GFYL2y2nBVLmWT8dVYee4pFrETH/0D1gql3kOhB8tcu7yO0GXEayqV1UFzrxcPtXT
 cEfTcFL+JT9MvvwFugQ7nr1lhhz4GLBXoMDJOgGQ=
Date: Tue, 10 Nov 2020 13:56:58 +0000
From: Will Deacon <will@kernel.org>
To: joro@8bytes.org
Subject: [GIT PULL] iommu/arm-smmu: First batch of updates for 5.11
Message-ID: <20201110135657.GA17034@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 john.stultz@linaro.org, robin.murphy@arm.com,
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

Please can you pull these Arm SMMU updates for 5.11 so that they can get
into -next? I think Bjorn is keen to get a bunch of DT updates moving, so
the sooner we can get this lot out there, the better. Summary in the tag.

There are a few other patches kicking around on the list, so I may send
a second pull on top in a couple of weeks or so.

Cheers,

Will

--->8

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git tags/arm-smmu-updates

for you to fetch changes up to a29bbb0861f487a5e144dc997a9f71a36c7a2404:

  dt-bindings: arm-smmu: Add compatible string for Adreno GPU SMMU (2020-11-10 12:25:49 +0000)

----------------------------------------------------------------
First batch of Arm SMMU updates for 5.11

- Allow implementations to hook writes to S2CR and SCTLR registers

- Handle broken Qualcomm bootloader/firmware

- Support Adreno tightly-coupled SMMU implementation

- Use devm_krealloc()

- Use 'true' instead of '1' when assigning 'bool disable_bypass'

----------------------------------------------------------------
Bjorn Andersson (3):
      iommu/arm-smmu: Allow implementation specific write_s2cr
      iommu/arm-smmu-qcom: Read back stream mappings
      iommu/arm-smmu-qcom: Implement S2CR quirk

Jordan Crouse (2):
      iommu/arm-smmu-qcom: Add implementation for the adreno GPU SMMU
      dt-bindings: arm-smmu: Add compatible string for Adreno GPU SMMU

Kaixu Xia (1):
      iommu/arm-smmu-v3: Assign boolean values to a bool variable

Rob Clark (1):
      iommu/arm-smmu: Add a way for implementations to influence SCTLR

Robin Murphy (1):
      iommu/arm-smmu: Use new devm_krealloc()

 .../devicetree/bindings/iommu/arm,smmu.yaml        |   9 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c        |   2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c         |   8 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c       |  17 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c         | 259 ++++++++++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c              |  18 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.h              |   4 +
 7 files changed, 284 insertions(+), 33 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
