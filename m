Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ACF224DA2
	for <lists.iommu@lfdr.de>; Sat, 18 Jul 2020 21:35:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E02CD8780E;
	Sat, 18 Jul 2020 19:35:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0dLOpRWhp1kr; Sat, 18 Jul 2020 19:35:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 74D0487814;
	Sat, 18 Jul 2020 19:35:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59707C0733;
	Sat, 18 Jul 2020 19:35:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0BDCEC0733
 for <iommu@lists.linux-foundation.org>; Sat, 18 Jul 2020 19:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0708F87814
 for <iommu@lists.linux-foundation.org>; Sat, 18 Jul 2020 19:35:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lbEdZ2Ie2Tk4 for <iommu@lists.linux-foundation.org>;
 Sat, 18 Jul 2020 19:35:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 778A78780E
 for <iommu@lists.linux-foundation.org>; Sat, 18 Jul 2020 19:35:11 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f134e790000>; Sat, 18 Jul 2020 12:33:13 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sat, 18 Jul 2020 12:35:10 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sat, 18 Jul 2020 12:35:10 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 18 Jul
 2020 19:35:06 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Sat, 18 Jul 2020 19:35:06 +0000
Received: from vdumpa-ubuntu.nvidia.com (Not Verified[172.17.173.140]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f134ee90000>; Sat, 18 Jul 2020 12:35:06 -0700
From: Krishna Reddy <vdumpa@nvidia.com>
To: <joro@8bytes.org>, <will@kernel.org>, <robin.murphy@arm.com>,
 <robh+dt@kernel.org>, <treding@nvidia.com>, <jonathanh@nvidia.com>
Subject: [PATCH v11 0/5] NVIDIA ARM SMMU Implementation
Date: Sat, 18 Jul 2020 12:34:52 -0700
Message-ID: <20200718193457.30046-1-vdumpa@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595100793; bh=TN+H04oNQO9bZvotrlKTP2TmCq3SKVkosF9GEOPNIJU=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
 Content-Type;
 b=rO91Ze9GtaOlLYV08m4UPtp1X0ec4qU9039Jn2xYvNAuFgXvKxFibz9eOlaPcXCzn
 Hie156uusl/owMiO3kHcX+9wuY6QCUWHtAEux9BmuY5tj3WcM7N4GFbFkwMxC6RkcK
 6sJC1H4wFf7tA1Glo3jsFbzM5I9ovsxHqK7zqMWUzqEkPi6PlAGh4HkeZRvb78NFe5
 b76j4ROvTUb4cwt7/1NYzIvxkoJAvVsHAQfAhmDS2j5jKYNjBY2VfV+rOKQpjf/J9K
 C9VJABmlmPgwYTXK0oLhvurERH7nfGzpdj00i+XsjCzV72PrAOqhar4i6PngjWo+Im
 +aJ3xCgRYJtLw==
Cc: snikam@nvidia.com, devicetree@vger.kernel.org, mperttunen@nvidia.com,
 bhuntsman@nvidia.com, yhsu@nvidia.com, linux-kernel@vger.kernel.org,
 talho@nvidia.com, iommu@lists.linux-foundation.org, nicolinc@nvidia.com,
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

Changes in v11:
Addressed Rob comment on DT binding patch to set min/maxItems of reg property in else part.
Rebased on top of https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-joerg/arm-smmu/updates.

Changes in v10:
Perform SMMU base ioremap before calling implementation init.
Check for Global faults across both ARM MMU-500s during global interrupt.
Check for context faults across all contexts of both ARM MMU-500s during context fault interrupt.
Add new DT binding nvidia,smmu-500 for NVIDIA implementation.
https://lkml.org/lkml/2020/7/8/57

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

 .../devicetree/bindings/iommu/arm,smmu.yaml   |  25 +-
 MAINTAINERS                                   |   2 +
 drivers/iommu/Makefile                        |   2 +-
 drivers/iommu/arm-smmu-impl.c                 |   3 +
 drivers/iommu/arm-smmu-nvidia.c               | 278 ++++++++++++++++++
 drivers/iommu/arm-smmu.c                      |  29 +-
 drivers/iommu/arm-smmu.h                      |   6 +
 7 files changed, 334 insertions(+), 11 deletions(-)
 create mode 100644 drivers/iommu/arm-smmu-nvidia.c


base-commit: 49fbb25030265c660de732513f18275d88ff99d3
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
