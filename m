Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DF02B416D
	for <lists.iommu@lfdr.de>; Mon, 16 Nov 2020 11:45:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 20900852D5;
	Mon, 16 Nov 2020 10:45:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GDk6ks-48z08; Mon, 16 Nov 2020 10:45:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C22548536C;
	Mon, 16 Nov 2020 10:45:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AD32BC07FF;
	Mon, 16 Nov 2020 10:45:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53448C07FF
 for <iommu@lists.linux-foundation.org>; Mon, 16 Nov 2020 10:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3F1EB85308
 for <iommu@lists.linux-foundation.org>; Mon, 16 Nov 2020 10:45:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lD6OYSC-h3mQ for <iommu@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 10:45:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id AE545852D5
 for <iommu@lists.linux-foundation.org>; Mon, 16 Nov 2020 10:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605523515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QE1szO8OV1xDFKb+wSnyAiSU7kUqkqlMSoqIskMXHyg=;
 b=Qnzw6Uvla6Dz3r8NG4sy2JF+Nu0kZOG/WBso5KKBViXiY1Vt68VbNVeK0oWORcj5kHYJV/
 cw9DiEZCguIdZmI2GqW33GnCfCtP5lc89FDphyO72yNHiHY4tpNf7HvhJAzZHwYpmr56gR
 bR3htK/0Hcob8os93eJhvQ0aeViHnTw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-BB4NcFKMM7Kq8NwwcPiiPQ-1; Mon, 16 Nov 2020 05:45:14 -0500
X-MC-Unique: BB4NcFKMM7Kq8NwwcPiiPQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C06EC18BA281;
 Mon, 16 Nov 2020 10:45:11 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-230.ams2.redhat.com [10.36.113.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0F955C5AF;
 Mon, 16 Nov 2020 10:44:59 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, will@kernel.org,
 joro@8bytes.org, maz@kernel.org, robin.murphy@arm.com
Subject: [PATCH v12 15/15] iommu/smmuv3: Add PASID cache invalidation per PASID
Date: Mon, 16 Nov 2020 11:43:16 +0100
Message-Id: <20201116104316.31816-16-eric.auger@redhat.com>
In-Reply-To: <20201116104316.31816-1-eric.auger@redhat.com>
References: <20201116104316.31816-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: jean-philippe@linaro.org, vivek.gautam@arm.com, alex.williamson@redhat.com,
 zhangfei.gao@linaro.org
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

In order to cascade guest CFGI_CD, let's add PASID cache invalidation
per PASID.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 6549c3ee6af6..eb0e09936803 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -3002,9 +3002,19 @@ arm_smmu_cache_invalidate(struct iommu_domain *domain, struct device *dev,
 		} else {
 			return -EINVAL;
 		}
-	}
-	if (inv_info->cache & IOMMU_CACHE_INV_TYPE_PASID ||
-	    inv_info->cache & IOMMU_CACHE_INV_TYPE_DEV_IOTLB) {
+	} else if (inv_info->cache & IOMMU_CACHE_INV_TYPE_PASID) {
+		if (inv_info->granularity == IOMMU_INV_GRANU_PASID) {
+			struct iommu_inv_pasid_info *info =
+				&inv_info->granu.pasid_info;
+
+			if (!info->flags & IOMMU_INV_PASID_FLAGS_PASID)
+				return -EINVAL;
+
+			arm_smmu_sync_cd(smmu_domain, info->pasid, true);
+		} else {
+			return -ENOENT;
+		}
+	} else { /* IOMMU_CACHE_INV_TYPE_DEV_IOTLB */
 		return -ENOENT;
 	}
 	return 0;
-- 
2.21.3

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
