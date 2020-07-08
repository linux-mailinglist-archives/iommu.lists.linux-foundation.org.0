Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F865217EB0
	for <lists.iommu@lfdr.de>; Wed,  8 Jul 2020 07:00:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E2294879F3;
	Wed,  8 Jul 2020 05:00:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id egM-avjC09SH; Wed,  8 Jul 2020 05:00:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B3F4F879E7;
	Wed,  8 Jul 2020 05:00:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9912FC016F;
	Wed,  8 Jul 2020 05:00:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2203BC016F
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 05:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0995888802
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 05:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hiQ5Cy5RtMSl for <iommu@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 05:00:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by hemlock.osuosl.org (Postfix) with ESMTPS id D187388647
 for <iommu@lists.linux-foundation.org>; Wed,  8 Jul 2020 05:00:17 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f0552ab0002>; Tue, 07 Jul 2020 21:59:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 07 Jul 2020 22:00:17 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 07 Jul 2020 22:00:17 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 8 Jul
 2020 05:00:13 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 8 Jul 2020 05:00:13 +0000
Received: from vdumpa-ubuntu.nvidia.com (Not Verified[172.17.173.140]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f0552dd0001>; Tue, 07 Jul 2020 22:00:13 -0700
From: Krishna Reddy <vdumpa@nvidia.com>
To: <joro@8bytes.org>, <will@kernel.org>, <robin.murphy@arm.com>,
 <robh+dt@kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>
Subject: [PATCH v10 0/5] NVIDIA ARM SMMU Implementation
Date: Tue, 7 Jul 2020 22:00:12 -0700
Message-ID: <20200708050017.31563-1-vdumpa@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1594184363; bh=+VIMULVcX/VU6BtBuWewZbJl68Bh+UrUfFfMcAm4UI4=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
 Content-Type;
 b=qgWKt/HlteNBV+Xgo/IPryofk7LkeQfjTY6lpdJ6OV//R8I1OutMYPX+GjWXuwkCV
 JXwq2R7CgE1k3tgTZoCQraHRxz5Fnjxwg/wqbsWFCc4DdFiv70IU7UUF5CXWpCTi1A
 dRSLY/QSLQATnzDTAEncddPo7o6ooPmHmTwffnCfhKVzi6mxHDseXQ7czVi47MkXtQ
 6QynXZNc6Q9DokeafjZvk2ByvkHtIY1S1l0HwYQzkIsaTLFsOfpyibiYa2kunp61QO
 L2lRiD/w6HMfj6dS9CD8kRiqfue9YHsP3XKc5y9fXCwinIVMg83WnfJmAhp19Mnhhh
 0iLrz7b5ePFww==
Cc: snikam@nvidia.com, devicetree@vger.kernel.org, nicoleotsuka@gmail.com,
 mperttunen@nvidia.com, bhuntsman@nvidia.com, yhsu@nvidia.com,
 linux-kernel@vger.kernel.org, talho@nvidia.com,
 iommu@lists.linux-foundation.org, nicolinc@nvidia.com,
 linux-tegra@vger.kernel.org, praithatha@nvidia.com,
 linux-arm-kernel@lists.infradead.org, bbiswas@nvidia.com
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

Changes in v10:
Perform SMMU base ioremap before calling implementation init.
Check for Global faults across both ARM MMU-500s during global interrupt.
Check for context faults across all contexts of both ARM MMU-500s during context fault interrupt.
Add new DT binding nvidia,smmu-500 for NVIDIA implementation.

v9 - https://lkml.org/lkml/2020/6/30/1282
v8 - https://lkml.org/lkml/2020/6/29/2385
v7 - https://lkml.org/lkml/2020/6/28/347
v6 - https://lkml.org/lkml/2020/6/4/1018
v5 - https://lkml.org/lkml/2020/5/21/1114
v4 - https://lkml.org/lkml/2019/10/30/1054
v3 - https://lkml.org/lkml/2019/10/18/1601
v2 - https://lkml.org/lkml/2019/9/2/980
v1 - https://lkml.org/lkml/2019/8/29/1588


Krishna Reddy (5):
  iommu/arm-smmu: move TLB timeout and spin count macros
  iommu/arm-smmu: ioremap smmu mmio region before implementation init
  iommu/arm-smmu: add NVIDIA implementation for ARM MMU-500 usage
  dt-bindings: arm-smmu: add binding for Tegra194 SMMU
  iommu/arm-smmu: Add global/context fault implementation hooks

 .../devicetree/bindings/iommu/arm,smmu.yaml   |  18 ++
 MAINTAINERS                                   |   2 +
 drivers/iommu/Makefile                        |   2 +-
 drivers/iommu/arm-smmu-impl.c                 |   3 +
 drivers/iommu/arm-smmu-nvidia.c               | 278 ++++++++++++++++++
 drivers/iommu/arm-smmu.c                      |  29 +-
 drivers/iommu/arm-smmu.h                      |   6 +
 7 files changed, 328 insertions(+), 10 deletions(-)
 create mode 100644 drivers/iommu/arm-smmu-nvidia.c


base-commit: e5640f21b63d2a5d3e4e0c4111b2b38e99fe5164
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
