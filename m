Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F19DD57D
	for <lists.iommu@lfdr.de>; Sat, 19 Oct 2019 01:32:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 35337DD5;
	Fri, 18 Oct 2019 23:31:30 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0A48CDB5
	for <iommu@lists.linux-foundation.org>;
	Fri, 18 Oct 2019 23:31:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 91F18821
	for <iommu@lists.linux-foundation.org>;
	Fri, 18 Oct 2019 23:31:23 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
	hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5daa4b4e0000>; Fri, 18 Oct 2019 16:31:26 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate101.nvidia.com (PGP Universal service);
	Fri, 18 Oct 2019 16:31:23 -0700
X-PGP-Universal: processed;
	by hqpgpgate101.nvidia.com on Fri, 18 Oct 2019 16:31:23 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
	(172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Fri, 18 Oct 2019 23:31:22 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
	(172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
	Frontend Transport; Fri, 18 Oct 2019 23:31:22 +0000
Received: from vdumpa-ubuntu.nvidia.com (Not Verified[172.17.173.140]) by
	hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
	id <B5daa4b4a0001>; Fri, 18 Oct 2019 16:31:22 -0700
From: Krishna Reddy <vdumpa@nvidia.com>
To: 
Subject: [PATCH v3 0/7] Nvidia Arm SMMUv2 Implementation
Date: Fri, 18 Oct 2019 16:31:25 -0700
Message-ID: <1571441492-21919-1-git-send-email-vdumpa@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1571441486; bh=5lCaK07q5Qhhlvw2Q+TW1iXiKMXxlWDodMf5qY32+XE=;
	h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	X-NVConfidentiality:MIME-Version:Content-Type;
	b=Tt5NqQ0PjovUOfeE+3HNxxjh4aQjoRK/ak3CYE+nAxX3lP6t4M0gNaHshVpWdP7SK
	VmegAmBb2WvCphuc0kb8oiYqUsMPg+oIXWthLfHGPGHU3PCixsmQUvbAkGExvUW1xd
	dPspNxgBLJ2hASxVmfbg8A2K+FZ5cEt7EiQLEEXpT4K3bFfHRcnBTkohOjU/ef0App
	jaG7J32FdBhxaj5z6te4roa9ZSF6J09KXAfAQKwG9qywpiBtskwbfkULvBHHScS9sa
	PYAiZ11iZ9KP8Y8AD/57U7U/vaEF1Qgzx2TOLAXI4gpNwo5zYye1Wklh+RVHVsvrkY
	7+GoPoL0OkT3w==
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: snikam@nvidia.com, thomasz@nvidia.com, jtukkinen@nvidia.com,
	mperttunen@nvidia.com, will@kernel.org,
	linux-kernel@vger.kernel.org, praithatha@nvidia.com,
	talho@nvidia.com, iommu@lists.linux-foundation.org,
	nicolinc@nvidia.com, linux-tegra@vger.kernel.org,
	yhsu@nvidia.com, treding@nvidia.com, robin.murphy@arm.com,
	avanbrunt@nvidia.com, linux-arm-kernel@lists.infradead.org
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

Changes in v3:
Rebased on top of https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git/ next.
Resolved compile error seen with tegra194.dtsi changes after rebase.

v2 - https://lkml.org/lkml/2019/9/2/980
v1 - https://lkml.org/lkml/2019/8/29/1588

Krishna Reddy (7):
  iommu/arm-smmu: prepare arm_smmu_flush_ops for override
  iommu/arm-smmu: add NVIDIA implementation for dual ARM MMU-500 usage
  dt-bindings: arm-smmu: Add binding for Tegra194 SMMU
  iommu/arm-smmu: Add global/context fault implementation hooks
  arm64: tegra: Add Memory controller DT node on T194
  arm64: tegra: Add DT node for T194 SMMU
  arm64: tegra: enable SMMU for SDHCI and EQOS on T194

 .../devicetree/bindings/iommu/arm,smmu.txt         |   4 +
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |   4 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  88 +++++++
 drivers/iommu/Makefile                             |   2 +-
 drivers/iommu/arm-smmu-impl.c                      |   3 +
 drivers/iommu/arm-smmu-nvidia.c                    | 287 +++++++++++++++++++++
 drivers/iommu/arm-smmu.c                           |  27 +-
 drivers/iommu/arm-smmu.h                           |   8 +-
 9 files changed, 413 insertions(+), 12 deletions(-)
 create mode 100644 drivers/iommu/arm-smmu-nvidia.c

-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
