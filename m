Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A471811B0D3
	for <lists.iommu@lfdr.de>; Wed, 11 Dec 2019 16:26:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 528A6877D3;
	Wed, 11 Dec 2019 15:26:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GSRwjN5bqhWB; Wed, 11 Dec 2019 15:26:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A126C87748;
	Wed, 11 Dec 2019 15:26:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93D40C1D83;
	Wed, 11 Dec 2019 15:26:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 252A1C0881
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 15:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0F02987748
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 15:26:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id flqKuGjAl-Zq for <iommu@lists.linux-foundation.org>;
 Wed, 11 Dec 2019 15:26:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 56EB78770C
 for <iommu@lists.linux-foundation.org>; Wed, 11 Dec 2019 15:26:51 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2011324679;
 Wed, 11 Dec 2019 15:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576078011;
 bh=sjnsZOZDsbB53F4dQC13LCsU2cKRuRJiJyKpA1cHH6A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OucdVJEryUoi5pX7FhunvSWO+pTtXWUtOtUEuHXq71ZXdo5A9NAr8NxaScj4/v5na
 2jPbMUADQRSvnSwEkflFtlyapqmpr0vUEx47t+oLCQTZ/irdMXt7I3JrAqT6lQVjaC
 q5J/1My5J1NpT+iUOulkSmRsrYGb7Cb7/u7x4Tsw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 06/79] iommu: rockchip: Free domain on
 .domain_free
Date: Wed, 11 Dec 2019 10:25:30 -0500
Message-Id: <20191211152643.23056-6-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191211152643.23056-1-sashal@kernel.org>
References: <20191211152643.23056-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, Joerg Roedel <jroedel@suse.de>,
 Heiko Stuebner <heiko@sntech.de>, Ezequiel Garcia <ezequiel@collabora.com>,
 linux-rockchip@lists.infradead.org, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

From: Ezequiel Garcia <ezequiel@collabora.com>

[ Upstream commit 42bb97b80f2e3bf592e3e99d109b67309aa1b30e ]

IOMMU domain resource life is well-defined, managed
by .domain_alloc and .domain_free.

Therefore, domain-specific resources shouldn't be tied to
the device life, but instead to its domain.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Acked-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/rockchip-iommu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index ad3e2b97469ed..140b287e886c8 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -977,13 +977,13 @@ static struct iommu_domain *rk_iommu_domain_alloc(unsigned type)
 	if (!dma_dev)
 		return NULL;
 
-	rk_domain = devm_kzalloc(dma_dev, sizeof(*rk_domain), GFP_KERNEL);
+	rk_domain = kzalloc(sizeof(*rk_domain), GFP_KERNEL);
 	if (!rk_domain)
 		return NULL;
 
 	if (type == IOMMU_DOMAIN_DMA &&
 	    iommu_get_dma_cookie(&rk_domain->domain))
-		return NULL;
+		goto err_free_domain;
 
 	/*
 	 * rk32xx iommus use a 2 level pagetable.
@@ -1018,6 +1018,8 @@ err_free_dt:
 err_put_cookie:
 	if (type == IOMMU_DOMAIN_DMA)
 		iommu_put_dma_cookie(&rk_domain->domain);
+err_free_domain:
+	kfree(rk_domain);
 
 	return NULL;
 }
@@ -1046,6 +1048,7 @@ static void rk_iommu_domain_free(struct iommu_domain *domain)
 
 	if (domain->type == IOMMU_DOMAIN_DMA)
 		iommu_put_dma_cookie(&rk_domain->domain);
+	kfree(rk_domain);
 }
 
 static int rk_iommu_add_device(struct device *dev)
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
