Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1C620E9E6
	for <lists.iommu@lfdr.de>; Tue, 30 Jun 2020 02:10:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1888586B43;
	Tue, 30 Jun 2020 00:10:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vnhBaPW84zwa; Tue, 30 Jun 2020 00:10:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 985A787509;
	Tue, 30 Jun 2020 00:10:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 69DD7C016E;
	Tue, 30 Jun 2020 00:10:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71292C016E
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 00:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 55D9A89273
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 00:10:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1xtJAWFve7an for <iommu@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 00:10:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B5E2C8923C
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 00:10:52 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5efa82ff0001>; Mon, 29 Jun 2020 17:10:39 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 29 Jun 2020 17:10:52 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 29 Jun 2020 17:10:52 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 30 Jun
 2020 00:10:50 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 30 Jun 2020 00:10:50 +0000
Received: from vdumpa-ubuntu.nvidia.com (Not Verified[172.17.173.140]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5efa83090000>; Mon, 29 Jun 2020 17:10:50 -0700
From: Krishna Reddy <vdumpa@nvidia.com>
To: 
Subject: [PATCH v8 0/3] Nvidia Arm SMMUv2 Implementation
Date: Mon, 29 Jun 2020 17:10:48 -0700
Message-ID: <20200630001051.12350-1-vdumpa@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593475839; bh=A/DY8WfS/ePl/C6tRJmTrHqrrBEogIsRd+4oj+0xSTA=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
 Content-Type;
 b=lGhEO/9E2j7hRcPdFudAxb/eK0vwaElmUAjU13AvIaUJc3ZwS//D+u2EEKmJqrG0M
 naWxl9V51xSUFkiBqsACvrb+V6Tbb3fjJCu8moZ6hepC9rYzzNPSUUNUaverbuqOGg
 DMACFX8Uqx3EIKYYvIZqZmB+uT02YZ/4DxkPoAgZOdCzzPmAquBVqrEalWfDL46+eJ
 nfks+f1bmAdz7M/ECpxgxsKd5qUhm3IhSep5L6HeWxqiDMEKiZws1PpC+af4T2FR+o
 ZcWqUcJvo1BKS2y2eHYTUUUvBpvt1bUNzOSJL7lyb3bOvmex2m/o4wTN3ZOFvw2FuD
 5x0Xrg4Jdh1TA==
Cc: snikam@nvidia.com, nicoleotsuka@gmail.com, mperttunen@nvidia.com,
 bhuntsman@nvidia.com, will@kernel.org, linux-kernel@vger.kernel.org,
 praithatha@nvidia.com, talho@nvidia.com, iommu@lists.linux-foundation.org,
 nicolinc@nvidia.com, linux-tegra@vger.kernel.org, yhsu@nvidia.com,
 treding@nvidia.com, robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org,
 bbiswas@nvidia.com
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

Changes in v8:
Fixed incorrect CB_FSR read issue during context bank fault.
Rebased and validated patches on top of git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git next

v7 - https://lkml.org/lkml/2020/6/28/347
v6 - https://lkml.org/lkml/2020/6/4/1018
v5 - https://lkml.org/lkml/2020/5/21/1114
v4 - https://lkml.org/lkml/2019/10/30/1054
v3 - https://lkml.org/lkml/2019/10/18/1601
v2 - https://lkml.org/lkml/2019/9/2/980
v1 - https://lkml.org/lkml/2019/8/29/1588

Krishna Reddy (3):
  iommu/arm-smmu: add NVIDIA implementation for dual ARM MMU-500 usage
  dt-bindings: arm-smmu: Add binding for Tegra194 SMMU
  iommu/arm-smmu: Add global/context fault implementation hooks

 .../devicetree/bindings/iommu/arm,smmu.yaml   |   5 +
 MAINTAINERS                                   |   2 +
 drivers/iommu/Makefile                        |   2 +-
 drivers/iommu/arm-smmu-impl.c                 |   3 +
 drivers/iommu/arm-smmu-nvidia.c               | 294 ++++++++++++++++++
 drivers/iommu/arm-smmu.c                      |  17 +-
 drivers/iommu/arm-smmu.h                      |   4 +
 7 files changed, 324 insertions(+), 3 deletions(-)
 create mode 100644 drivers/iommu/arm-smmu-nvidia.c


base-commit: 48f0bcfb7aad2c6eb4c1e66476b58475aa14393e
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
