Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D86121AEEF4
	for <lists.iommu@lfdr.de>; Sat, 18 Apr 2020 16:41:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7F109877F1;
	Sat, 18 Apr 2020 14:41:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k3Amk+Z1GmUB; Sat, 18 Apr 2020 14:41:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6258C876FB;
	Sat, 18 Apr 2020 14:41:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4BE8EC0172;
	Sat, 18 Apr 2020 14:41:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5DECCC0172;
 Sat, 18 Apr 2020 14:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5A462876FB;
 Sat, 18 Apr 2020 14:41:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VB5jtA2ximfb; Sat, 18 Apr 2020 14:41:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AD72486E2A;
 Sat, 18 Apr 2020 14:41:41 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9F2EB21D79;
 Sat, 18 Apr 2020 14:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587220901;
 bh=QSO+MTYLOIEKsq08PJYUz+Ls1m/XYejmU5s/QbqlFiI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WUaBi7Ded/wH/YxNrTWD6C3Grc5x57b3A93N0TgeT88oIir8kO4HriK6+wPQPzNfb
 xvjp68kfyfisEI6LKsjozaeGQRBb1UQRaNVWS9Iv5xOAoU83MC+YE13labZFK19rfo
 ILUceAw+G01MC39UvrBvHHFtUPHKJb/ftAvRiV5o=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 42/78] iommu/virtio: Fix freeing of incomplete
 domains
Date: Sat, 18 Apr 2020 10:40:11 -0400
Message-Id: <20200418144047.9013-42-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200418144047.9013-1-sashal@kernel.org>
References: <20200418144047.9013-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Joerg Roedel <jroedel@suse.de>, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
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

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

[ Upstream commit 7062af3ed2ba451029e3733d9f677c68f5ea9e77 ]

Calling viommu_domain_free() on a domain that hasn't been finalised (not
attached to any device, for example) can currently cause an Oops,
because we attempt to call ida_free() on ID 0, which may either be
unallocated or used by another domain.

Only initialise the vdomain->viommu pointer, which denotes a finalised
domain, at the end of a successful viommu_domain_finalise().

Fixes: edcd69ab9a32 ("iommu: Add virtio-iommu driver")
Reported-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Link: https://lore.kernel.org/r/20200326093558.2641019-3-jean-philippe@linaro.org
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/virtio-iommu.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index 3ea9d76829995..6c340a4f4fd28 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -614,18 +614,20 @@ static int viommu_domain_finalise(struct viommu_dev *viommu,
 	int ret;
 	struct viommu_domain *vdomain = to_viommu_domain(domain);
 
-	vdomain->viommu		= viommu;
-	vdomain->map_flags	= viommu->map_flags;
+	ret = ida_alloc_range(&viommu->domain_ids, viommu->first_domain,
+			      viommu->last_domain, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+
+	vdomain->id		= (unsigned int)ret;
 
 	domain->pgsize_bitmap	= viommu->pgsize_bitmap;
 	domain->geometry	= viommu->geometry;
 
-	ret = ida_alloc_range(&viommu->domain_ids, viommu->first_domain,
-			      viommu->last_domain, GFP_KERNEL);
-	if (ret >= 0)
-		vdomain->id = (unsigned int)ret;
+	vdomain->map_flags	= viommu->map_flags;
+	vdomain->viommu		= viommu;
 
-	return ret > 0 ? 0 : ret;
+	return 0;
 }
 
 static void viommu_domain_free(struct iommu_domain *domain)
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
