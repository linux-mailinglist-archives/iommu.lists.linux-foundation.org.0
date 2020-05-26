Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 956801D39CA
	for <lists.iommu@lfdr.de>; Thu, 14 May 2020 20:52:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4B6C720443;
	Thu, 14 May 2020 18:52:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id boa3cig2gpFQ; Thu, 14 May 2020 18:52:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4EE36227AD;
	Thu, 14 May 2020 18:52:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3565AC016F;
	Thu, 14 May 2020 18:52:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CFA1CC016F
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 18:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BBA848848A
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 18:52:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qR2DVtA0MsAJ for <iommu@lists.linux-foundation.org>;
 Thu, 14 May 2020 18:52:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 81B378873B
 for <iommu@lists.linux-foundation.org>; Thu, 14 May 2020 18:52:41 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD24820727;
 Thu, 14 May 2020 18:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589482361;
 bh=QAu8hvM/s35hX8BMMzofK6q080Ve1pE3s86xMzwp0jU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zmeI8JtcRuAchSvueGRbQgqGXbWM8S7nPKCckylr5C3/XFwM0bj6iHd2qyvuJpzr1
 AbIUTTdHw3iDgCdM1h0HoJNsDRtAEnNGPIcJ+Y8sywHK7b3n2OIPJ8F7cdbBrSauTh
 UwfB++g4ukKqw0RaSAQi6CeKT7XWgqdHgycvCMwc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 41/62] iommu/amd: Do not loop forever when trying
 to increase address space
Date: Thu, 14 May 2020 14:51:26 -0400
Message-Id: <20200514185147.19716-41-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200514185147.19716-1-sashal@kernel.org>
References: <20200514185147.19716-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, iommu@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>
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

From: Joerg Roedel <jroedel@suse.de>

[ Upstream commit 5b8a9a047b6cad361405c7900c1e1cdd378c4589 ]

When increase_address_space() fails to allocate memory, alloc_pte()
will call it again until it succeeds. Do not loop forever while trying
to increase the address space and just return an error instead.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
Tested-by: Qian Cai <cai@lca.pw>
Link: https://lore.kernel.org/r/20200504125413.16798-3-joro@8bytes.org
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/amd_iommu.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index 28229a38af4d2..68da484a69dd0 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -1489,8 +1489,19 @@ static u64 *alloc_pte(struct protection_domain *domain,
 	amd_iommu_domain_get_pgtable(domain, &pgtable);
 
 	while (address > PM_LEVEL_SIZE(pgtable.mode)) {
-		*updated = increase_address_space(domain, address, gfp) || *updated;
+		bool upd = increase_address_space(domain, address, gfp);
+
+		/* Read new values to check if update was successful */
 		amd_iommu_domain_get_pgtable(domain, &pgtable);
+
+		/*
+		 * Return an error if there is no memory to update the
+		 * page-table.
+		 */
+		if (!upd && (address > PM_LEVEL_SIZE(pgtable.mode)))
+			return NULL;
+
+		*updated = *updated || upd;
 	}
 
 
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
