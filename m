Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DA227BCF0
	for <lists.iommu@lfdr.de>; Tue, 29 Sep 2020 08:19:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BCA2E8511F;
	Tue, 29 Sep 2020 06:19:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GZmOQXgzB4aM; Tue, 29 Sep 2020 06:19:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 517F385C5E;
	Tue, 29 Sep 2020 06:19:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3CFADC0051;
	Tue, 29 Sep 2020 06:19:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6AA4C0051
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 06:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BE782204FF
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 06:18:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gtZynHpjJbVC for <iommu@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 06:18:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by silver.osuosl.org (Postfix) with ESMTPS id BF56420501
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 06:18:56 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id d6so3491334pfn.9
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 23:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=29m/WsHiomvftKkO4f2zYzL4z5u90lYqkPGhVYhCT8U=;
 b=sVYpadvLpMkkS4bEQ5e+A0z4ogXLC9YYnwmfGfHRrpyAPO+mNVYXnMFl122QKDJrGw
 vZnh8RsrTvECTSeKFo4A7mw6sqtceZx8oaZCQBIwbd4Lcxyo1hjJBp5zNtGJdMvODtjF
 2ScsoySk8y7L8dRABssQfFCxoNMnAoExuJEDmO+ROF+FRWWqn/ow40tkunGEVITa8ps8
 78YcrW2lIg0EFPMRKzaTKD+ESKNbtQkcoIr9CjC2MT4drf4E4dPQaNrKrb0Chi6OqUKD
 WTPYTD8DAmOd9WUmvd4oWbPugRTIbMrLQfgI+C4jkqzeavExEsJiLryMVMuvTOLBfsYh
 siGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=29m/WsHiomvftKkO4f2zYzL4z5u90lYqkPGhVYhCT8U=;
 b=Ej6lFxO3nEjOPzQbfrrpmrINLgtJjZN1myXAfZrkKuFakpBj/AoYJqanKCDZ7dL/Ck
 cI/AVgyJ1TJTPpev5TkRyWbingCHEC+GDE2KygTeYtua8E9QhE5YASFlc7mjRFt41OUv
 I3/HJ3I8TK0+hUD6q0zFE2NZ23qv3rE4YFLCAz/C00qxwXw21jHJV6XCLCUVe/M55d6g
 k2XzS61ciBOJ/+nUdzQlqXkYB5nJJmF2cIa9MRIuO6XeTD71e04uWFhRbM05ybBu6Zh6
 k6ewTtkDw3lnAIrkBUKhnui2mRHfY4sv+OLZSCwDthesVQQrD8Qg0JUHg2qFmQUiOdxJ
 1/zg==
X-Gm-Message-State: AOAM531QYpNamYIkQ0IyCMHp3afp2gotq54Xn1omiX8NUNPeOmMa5jpV
 xvqVbA8su05W9KW+wIsBGO8=
X-Google-Smtp-Source: ABdhPJz+ApO82+RbI3i9Xh25kUhL/M7Ed9+Bj/ABhHgIZjjh2iEQew+S6GYvefeS5GMP8D36tTkgZA==
X-Received: by 2002:a63:1a05:: with SMTP id a5mr2163913pga.145.1601360336284; 
 Mon, 28 Sep 2020 23:18:56 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id cf7sm3280562pjb.52.2020.09.28.23.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 23:18:55 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: thierry.reding@gmail.com,
	joro@8bytes.org
Subject: [PATCH v4 2/2] iommu/tegra-smmu: Expand mutex protection range
Date: Mon, 28 Sep 2020 23:13:25 -0700
Message-Id: <20200929061325.10197-3-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929061325.10197-1-nicoleotsuka@gmail.com>
References: <20200929061325.10197-1-nicoleotsuka@gmail.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 jonathanh@nvidia.com, hch@infradead.org, linux-tegra@vger.kernel.org,
 digetx@gmail.com
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

This is used to protect potential race condition at use_count.
since probes of client drivers, calling attach_dev(), may run
concurrently.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---

Changelog
v3->v4:
 * Fixed typo "Expend" => "Expand"
v2->v3:
 * Renamed label "err_unlock" to "unlock"
v1->v2:
 * N/A

 drivers/iommu/tegra-smmu.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index ec4c9dafff95..6a3ecc334481 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -256,26 +256,19 @@ static int tegra_smmu_alloc_asid(struct tegra_smmu *smmu, unsigned int *idp)
 {
 	unsigned long id;
 
-	mutex_lock(&smmu->lock);
-
 	id = find_first_zero_bit(smmu->asids, smmu->soc->num_asids);
-	if (id >= smmu->soc->num_asids) {
-		mutex_unlock(&smmu->lock);
+	if (id >= smmu->soc->num_asids)
 		return -ENOSPC;
-	}
 
 	set_bit(id, smmu->asids);
 	*idp = id;
 
-	mutex_unlock(&smmu->lock);
 	return 0;
 }
 
 static void tegra_smmu_free_asid(struct tegra_smmu *smmu, unsigned int id)
 {
-	mutex_lock(&smmu->lock);
 	clear_bit(id, smmu->asids);
-	mutex_unlock(&smmu->lock);
 }
 
 static bool tegra_smmu_capable(enum iommu_cap cap)
@@ -420,17 +413,21 @@ static int tegra_smmu_as_prepare(struct tegra_smmu *smmu,
 				 struct tegra_smmu_as *as)
 {
 	u32 value;
-	int err;
+	int err = 0;
+
+	mutex_lock(&smmu->lock);
 
 	if (as->use_count > 0) {
 		as->use_count++;
-		return 0;
+		goto unlock;
 	}
 
 	as->pd_dma = dma_map_page(smmu->dev, as->pd, 0, SMMU_SIZE_PD,
 				  DMA_TO_DEVICE);
-	if (dma_mapping_error(smmu->dev, as->pd_dma))
-		return -ENOMEM;
+	if (dma_mapping_error(smmu->dev, as->pd_dma)) {
+		err = -ENOMEM;
+		goto unlock;
+	}
 
 	/* We can't handle 64-bit DMA addresses */
 	if (!smmu_dma_addr_valid(smmu, as->pd_dma)) {
@@ -453,24 +450,35 @@ static int tegra_smmu_as_prepare(struct tegra_smmu *smmu,
 	as->smmu = smmu;
 	as->use_count++;
 
+	mutex_unlock(&smmu->lock);
+
 	return 0;
 
 err_unmap:
 	dma_unmap_page(smmu->dev, as->pd_dma, SMMU_SIZE_PD, DMA_TO_DEVICE);
+unlock:
+	mutex_unlock(&smmu->lock);
+
 	return err;
 }
 
 static void tegra_smmu_as_unprepare(struct tegra_smmu *smmu,
 				    struct tegra_smmu_as *as)
 {
-	if (--as->use_count > 0)
+	mutex_lock(&smmu->lock);
+
+	if (--as->use_count > 0) {
+		mutex_unlock(&smmu->lock);
 		return;
+	}
 
 	tegra_smmu_free_asid(smmu, as->id);
 
 	dma_unmap_page(smmu->dev, as->pd_dma, SMMU_SIZE_PD, DMA_TO_DEVICE);
 
 	as->smmu = NULL;
+
+	mutex_unlock(&smmu->lock);
 }
 
 static int tegra_smmu_attach_dev(struct iommu_domain *domain,
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
