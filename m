Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3CE4060E0
	for <lists.iommu@lfdr.de>; Fri, 10 Sep 2021 02:21:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73EE64066C;
	Fri, 10 Sep 2021 00:21:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p8QtVFbkIt00; Fri, 10 Sep 2021 00:21:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 964884066A;
	Fri, 10 Sep 2021 00:21:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61D71C000D;
	Fri, 10 Sep 2021 00:21:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C48BCC000D
 for <iommu@lists.linux-foundation.org>; Fri, 10 Sep 2021 00:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B452740665
 for <iommu@lists.linux-foundation.org>; Fri, 10 Sep 2021 00:20:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8XpHV0L0LDSq for <iommu@lists.linux-foundation.org>;
 Fri, 10 Sep 2021 00:20:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0EA0440663
 for <iommu@lists.linux-foundation.org>; Fri, 10 Sep 2021 00:20:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E8430610A3;
 Fri, 10 Sep 2021 00:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631233257;
 bh=Hd9Sv/1uiy2JXUm+1VUpeQDNFS9NHLDtvdDFT9PbUn8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JqfvLSV7Ixw8XAuEOgWwPLTPUhBoEYdiRI8PvDWvYwn788igV+4whewI6QJly+hg7
 DYmR5jxELf70lWwPYSxIXi6w7nCrijWGKhP5ZRWpn1oBrJqp1vC4FcEOs21hYFQevh
 PlkADpd+ldQe3gK0if3JXbJsH7vRRoFja4QehWRaVvgwKG/bq1lsjVd4WgADpjPm/V
 Z1hXvELvsH+/25kcMBQ1nCQ6ChiF7IY5kJFGbmijCAOqQMiRto3hVEFKlLoKo5gRgK
 4ziQZmGWJY4JydPzGT/vW777ViY0fIYygM8hv2JXDXhw9PP/++w6Z2lpbRyqhI616L
 j2LP9mnP51L5w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 21/53] iommu/arm-smmu: Fix race condition during
 iommu_group creation
Date: Thu,  9 Sep 2021 20:19:56 -0400
Message-Id: <20210910002028.175174-21-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910002028.175174-1-sashal@kernel.org>
References: <20210910002028.175174-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Ashish Mhetre <amhetre@nvidia.com>,
 iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
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

From: Krishna Reddy <vdumpa@nvidia.com>

[ Upstream commit b1a1347912a742a4e1fcdc9df6302dd9dd2c3405 ]

When two devices with same SID are getting probed concurrently through
iommu_probe_device(), the iommu_group sometimes is getting allocated more
than once as call to arm_smmu_device_group() is not protected for
concurrency. Furthermore, it leads to each device holding a different
iommu_group and domain pointer, separate IOVA space and only one of the
devices' domain is used for translations from IOMMU. This causes accesses
from other device to fault or see incorrect translations.
Fix this by protecting iommu_group allocation from concurrency in
arm_smmu_device_group().

Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
Link: https://lore.kernel.org/r/1628570641-9127-3-git-send-email-amhetre@nvidia.com
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index df24bbe3ea4f..7a0fea12d0e5 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -1475,6 +1475,7 @@ static struct iommu_group *arm_smmu_device_group(struct device *dev)
 	struct iommu_group *group = NULL;
 	int i, idx;
 
+	mutex_lock(&smmu->stream_map_mutex);
 	for_each_cfg_sme(cfg, fwspec, i, idx) {
 		if (group && smmu->s2crs[idx].group &&
 		    group != smmu->s2crs[idx].group)
@@ -1483,8 +1484,10 @@ static struct iommu_group *arm_smmu_device_group(struct device *dev)
 		group = smmu->s2crs[idx].group;
 	}
 
-	if (group)
+	if (group) {
+		mutex_unlock(&smmu->stream_map_mutex);
 		return iommu_group_ref_get(group);
+	}
 
 	if (dev_is_pci(dev))
 		group = pci_device_group(dev);
@@ -1498,6 +1501,7 @@ static struct iommu_group *arm_smmu_device_group(struct device *dev)
 		for_each_cfg_sme(cfg, fwspec, i, idx)
 			smmu->s2crs[idx].group = group;
 
+	mutex_unlock(&smmu->stream_map_mutex);
 	return group;
 }
 
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
