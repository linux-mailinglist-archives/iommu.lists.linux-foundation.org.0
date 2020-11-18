Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6872B7C6C
	for <lists.iommu@lfdr.de>; Wed, 18 Nov 2020 12:24:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C85482043C;
	Wed, 18 Nov 2020 11:24:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Ol4PKowEbAz; Wed, 18 Nov 2020 11:24:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7030D20459;
	Wed, 18 Nov 2020 11:24:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A2EDC07FF;
	Wed, 18 Nov 2020 11:24:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A150FC07FF
 for <iommu@lists.linux-foundation.org>; Wed, 18 Nov 2020 11:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 9DE7184D35
 for <iommu@lists.linux-foundation.org>; Wed, 18 Nov 2020 11:24:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 35T14s6rAEcn for <iommu@lists.linux-foundation.org>;
 Wed, 18 Nov 2020 11:24:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9A70D83C12
 for <iommu@lists.linux-foundation.org>; Wed, 18 Nov 2020 11:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605698644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=spwbm5vXoHiQvJQpWqgCh2lkcvbGNw23B7J3IRmsnBU=;
 b=bBo/AlpuwqmJtENzMuYPDy7yuvyp82dh+Gg+1XTqLSRchefXqYBC/IjvzPVo1hWQg3whJn
 yJtwDw/GQgyo+kVS0JYYd3hI5CKfzI7468vUinjdKafqLwBgjvumoYQHFX0IQiFbvtatYb
 HK+AWxx1iV1Vssthd7W9Iw3cwnU8WkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-s9rX9rIWNOun08cCpJpc1w-1; Wed, 18 Nov 2020 06:24:02 -0500
X-MC-Unique: s9rX9rIWNOun08cCpJpc1w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EF9C1017DC6;
 Wed, 18 Nov 2020 11:24:00 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-115-104.ams2.redhat.com [10.36.115.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84FEC5B4BC;
 Wed, 18 Nov 2020 11:23:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, will@kernel.org,
 joro@8bytes.org, maz@kernel.org, robin.murphy@arm.com,
 alex.williamson@redhat.com
Subject: [PATCH v13 15/15] iommu/smmuv3: Add PASID cache invalidation per PASID
Date: Wed, 18 Nov 2020 12:21:51 +0100
Message-Id: <20201118112151.25412-16-eric.auger@redhat.com>
In-Reply-To: <20201118112151.25412-1-eric.auger@redhat.com>
References: <20201118112151.25412-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: jean-philippe@linaro.org, vivek.gautam@arm.com, zhangfei.gao@linaro.org
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

v12 -> v13:
- Fix !(info->flags & IOMMU_INV_PASID_FLAGS_PASID) check
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index ed64699a4a0d..45adfe4da11b 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2999,9 +2999,19 @@ arm_smmu_cache_invalidate(struct iommu_domain *domain, struct device *dev,
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
+			if (!(info->flags & IOMMU_INV_PASID_FLAGS_PASID))
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
