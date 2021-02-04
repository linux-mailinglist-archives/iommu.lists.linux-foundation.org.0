Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EE530A8B3
	for <lists.iommu@lfdr.de>; Mon,  1 Feb 2021 14:29:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6A51B2044B;
	Mon,  1 Feb 2021 13:29:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MI-at2jQ-rDn; Mon,  1 Feb 2021 13:29:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4FB9420452;
	Mon,  1 Feb 2021 13:29:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30BD8C013A;
	Mon,  1 Feb 2021 13:29:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8BE43C013A
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 13:29:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 769BE810B9
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 13:29:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bfS7PpJdXn2Z for <iommu@lists.linux-foundation.org>;
 Mon,  1 Feb 2021 13:29:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id F0E7D806ED
 for <iommu@lists.linux-foundation.org>; Mon,  1 Feb 2021 13:29:16 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DTpfL15PVz162lZ;
 Mon,  1 Feb 2021 21:27:54 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.176.220) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Mon, 1 Feb 2021 21:29:01 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Mark
 Rutland" <mark.rutland@arm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, iommu
 <iommu@lists.linux-foundation.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 0/1] perf/smmuv3: Don't reserve the PMCG register spaces
Date: Mon, 1 Feb 2021 21:27:49 +0800
Message-ID: <20210201132750.1709-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.176.220]
X-CFilter-Loop: Reflected
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
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

v4 --> v5:
1. Give up doing the mapping for the entire SMMU register space.
2. Fix some compile warnings. Sorry. So sorry.

v3 --> v4:
1. Delete the unnecessary encapsulation function smmu_pmu_get_and_ioremap_resource().
2. Discard adding MODULE_SOFTDEP.

v2 --> v3:
Patch 3 is updated because https://lkml.org/lkml/2021/1/22/532 has been queued in advance.

v1 --> v2:
According to Robin Murphy's suggestion: https://lkml.org/lkml/2021/1/20/470
Don't reserve the PMCG register spaces, and reserve the entire SMMU register space.

v1:
Since the PMCG may implement its resigters space(4KB Page0 and 4KB Page1)
within the SMMUv3 64KB Page0. In this case, when the SMMUv3 driver reserves the
64KB Page0 resource in advance, the PMCG driver try to reserve its Page0 and
Page1 resources, a resource conflict occurs.

commit 52f3fab0067d6fa ("iommu/arm-smmu-v3: Don't reserve implementation
defined register space") reduce the resource reservation range of the SMMUv3
driver, it only reserves the first 0xe00 bytes in the 64KB Page0, to avoid
the above-mentioned resource conflicts.

But the SMMUv3.3 add support for ECMDQ, its registers space is also implemented
in the SMMUv3 64KB Page0. This means we need to build two separate mappings.
New features may be added in the future, and more independent mappings may be
required. The simple problem is complicated because the user expects to map the
entire SMMUv3 64KB Page0.

Therefore, the proper solution is: If the PMCG register resources are located in
the 64KB Page0 of the SMMU, the PMCG driver does not reserve the conflict resources
when the SMMUv3 driver has reserved the conflict resources before. Instead, the PMCG
driver only performs devm_ioremap() to ensure that it can work properly.

Zhen Lei (1):
  perf/smmuv3: Don't reserve the PMCG register spaces

 drivers/perf/arm_smmuv3_pmu.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

-- 
2.26.0.106.g9fadedd


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
