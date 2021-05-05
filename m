Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 91279373FF7
	for <lists.iommu@lfdr.de>; Wed,  5 May 2021 18:32:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EAC99401AE;
	Wed,  5 May 2021 16:32:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ukJZR1Z_7YV9; Wed,  5 May 2021 16:32:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14ED9402B5;
	Wed,  5 May 2021 16:32:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE244C0001;
	Wed,  5 May 2021 16:32:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1BACC0001
 for <iommu@lists.linux-foundation.org>; Wed,  5 May 2021 16:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AB9C405C2
 for <iommu@lists.linux-foundation.org>; Wed,  5 May 2021 16:32:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lIOETcgJRG4l for <iommu@lists.linux-foundation.org>;
 Wed,  5 May 2021 16:32:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2180405B9
 for <iommu@lists.linux-foundation.org>; Wed,  5 May 2021 16:32:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 967D4613FE;
 Wed,  5 May 2021 16:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620232334;
 bh=tm8jSpP60pbo5RlHvOGMwjbKX7BlomLq7rcI8Zd1ArA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ICDvFJ1ObZSCg2xwedzl9XYK9MXsnVMgU3oeKTp87nnbh27OjBABSUFA8D4zYuNJ9
 xWfPMDmK6qCbgOSvZ1/xeaqvYVgpVzT8jPyvn59Z9DNhJuHvbB2h8JVF2N52z8AfEI
 NOEdBDz4JDsifdAKDyDQIBVFmlHoe2xPoqSxgt3mNQLBRWlK2l2PBWCrjIqZkzrv35
 f3agdzwUTdtd+LZqIYhaFlC9yRkS3Irt82xW6w3XTvlyDetDbBGOhpcyJM43jl4uja
 jmru5tD+1VszFSmwgBja5j/KUmv8ZoVjNXwqH4aamypPs7q87RQBB7sEHNR8L+L08J
 JO9MjUq3xiOng==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 036/116] iommu/arm-smmu-v3: Add a check to avoid
 invalid iotlb sync
Date: Wed,  5 May 2021 12:30:04 -0400
Message-Id: <20210505163125.3460440-36-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210505163125.3460440-1-sashal@kernel.org>
References: <20210505163125.3460440-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, iommu@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
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

From: Xiang Chen <chenxiang66@hisilicon.com>

[ Upstream commit 6cc7e5a9c6b02507b9be5a99b51e970afa91c85f ]

It may send a invalid tlb sync for smmuv3 if iotlb_gather is not valid
(iotlb_gather->pgsize = 0). So add a check to avoid invalid iotlb sync
for it.

Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
Link: https://lore.kernel.org/r/1617109106-121844-1-git-send-email-chenxiang66@hisilicon.com
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 8594b4a83043..941ba5484731 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2305,6 +2305,9 @@ static void arm_smmu_iotlb_sync(struct iommu_domain *domain,
 {
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
 
+	if (!gather->pgsize)
+		return;
+
 	arm_smmu_tlb_inv_range_domain(gather->start,
 				      gather->end - gather->start + 1,
 				      gather->pgsize, true, smmu_domain);
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
