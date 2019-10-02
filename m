Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0C9C8FED
	for <lists.iommu@lfdr.de>; Wed,  2 Oct 2019 19:29:49 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4DE5A1431;
	Wed,  2 Oct 2019 17:29:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7D8B7141F
	for <iommu@lists.linux-foundation.org>;
	Wed,  2 Oct 2019 17:29:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 21CBA8C2
	for <iommu@lists.linux-foundation.org>;
	Wed,  2 Oct 2019 17:29:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: ezequiel) with ESMTPSA id 64B6C28A146
From: Ezequiel Garcia <ezequiel@collabora.com>
To: Joerg Roedel <joro@8bytes.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH] iommu: rockchip: Free domain on .domain_free
Date: Wed,  2 Oct 2019 14:29:23 -0300
Message-Id: <20191002172923.22430-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, DOS_RCVD_IP_TWICE_B,
	RCVD_IN_DNSWL_NONE,UNPARSEABLE_RELAY autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-rockchip@lists.infradead.org, iommu@lists.linux-foundation.org,
	kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>,
	linux-kernel@vger.kernel.org
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

IOMMU domain resource life is well-defined, managed
by .domain_alloc and .domain_free.

Therefore, domain-specific resources shouldn't be tied to
the device life, but instead to its domain.

Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/iommu/rockchip-iommu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 26290f310f90..e845bd01a1a2 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -979,13 +979,13 @@ static struct iommu_domain *rk_iommu_domain_alloc(unsigned type)
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
@@ -1020,6 +1020,8 @@ static struct iommu_domain *rk_iommu_domain_alloc(unsigned type)
 err_put_cookie:
 	if (type == IOMMU_DOMAIN_DMA)
 		iommu_put_dma_cookie(&rk_domain->domain);
+err_free_domain:
+	kfree(rk_domain);
 
 	return NULL;
 }
@@ -1048,6 +1050,7 @@ static void rk_iommu_domain_free(struct iommu_domain *domain)
 
 	if (domain->type == IOMMU_DOMAIN_DMA)
 		iommu_put_dma_cookie(&rk_domain->domain);
+	kfree(rk_domain);
 }
 
 static int rk_iommu_add_device(struct device *dev)
-- 
2.22.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
