Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB5727B89D
	for <lists.iommu@lfdr.de>; Tue, 29 Sep 2020 02:04:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2A89586F8F;
	Tue, 29 Sep 2020 00:04:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sMe5jYqrJfEa; Tue, 29 Sep 2020 00:04:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 116F786FBE;
	Tue, 29 Sep 2020 00:04:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DFF8DC016F;
	Tue, 29 Sep 2020 00:04:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81AC4C0891
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 00:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 79850866C3
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 00:04:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YqW2oGNle6Jw for <iommu@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 00:04:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 49B2B866BA
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 00:04:48 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id t7so1679399pjd.3
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 17:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ak7Ng8aJusKwlu1ow/SGyHutH7FZzRbWyWxzcNaToBI=;
 b=vbseF/dDrAqieP+HHCdB/1SnSYVNo3zR6H+rhRZjZ/4Gx7/U4Y2+ufZJpr2BSv1Fat
 gUXB23PctE6Upb6vW/JvVAQ5+KNFIS3DYgf0U/Kpq7Gqe/RuLjZ5Vo4jXkWyhi0sBBf6
 W8h7SKzGfg8ucM42yXjkr0MHprAr/mTGCQ0G6pZtRSIpiL8T5n2ogFE89dhm0CuAWN3G
 cvbPtyBHgLQpXkR53MYF+ORl8csy28N3OGDUu7xjVRgjuGaFVxxPkbYlJCQJynK0CQ0L
 050Xz1YJH4w5cG/YTbNttIFyX+UhhbUNzGH+yBEJfJm7KuYFQAuu6lyYfAadHjyTJ5Cl
 mavw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ak7Ng8aJusKwlu1ow/SGyHutH7FZzRbWyWxzcNaToBI=;
 b=C9MciQtMLF4nsYPWbbs5luiInylLLFCQUGhYfGRQZOovNXz/hHgYF7arnzXkmPoIvC
 OXF6hf8IybTh+V7lQ3MQrW/5/mNvU4N1ogM9X7H0gBd9CJ3NHBpYyrePl4SBlBwiRVtq
 1pr9uV3yJOoPpZ8iNO5LmJ7zqxsYSvQjt/sT5j4zz3X4My4m5M1r6n98pOo245rPzPIO
 K+6lvU7GzuQkP5BVXVY/rC0+3pLvWWpcELCJgxmbzlsneJGbTRvOiC/XNJ3Rsv523YZv
 9zs0YojzfhoWLdfbs9Dsoyue1YMxwLVjV+SGdtK5sk90k6ikyNx/3J4h0nN2BxFG1jqh
 yPfg==
X-Gm-Message-State: AOAM530MmRVT3hcgVJgLkU0Za6g/p3QtaIwKkf4fiUZCd8l353x586wZ
 vFh0gRiGlpWm7H42rjmFkGA=
X-Google-Smtp-Source: ABdhPJzfftLBnioepcruORsOFCylGetHbEudyK5hBpQ88TcFkWVYtcbyVEOPUO8lQZO4e54kAnFQLg==
X-Received: by 2002:a17:90a:ed88:: with SMTP id
 k8mr1391123pjy.232.1601337887889; 
 Mon, 28 Sep 2020 17:04:47 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id fz23sm2392814pjb.36.2020.09.28.17.04.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 17:04:47 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: thierry.reding@gmail.com,
	joro@8bytes.org
Subject: [PATCH v2 2/2] iommu/tegra-smmu: Expend mutex protection range
Date: Mon, 28 Sep 2020 16:59:01 -0700
Message-Id: <20200928235901.28337-3-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200928235901.28337-1-nicoleotsuka@gmail.com>
References: <20200928235901.28337-1-nicoleotsuka@gmail.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org, digetx@gmail.com
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
v1->v2:
 * N/A

 drivers/iommu/tegra-smmu.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index ec4c9dafff95..acda5902e095 100644
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
+		goto err_unlock;
 	}
 
 	as->pd_dma = dma_map_page(smmu->dev, as->pd, 0, SMMU_SIZE_PD,
 				  DMA_TO_DEVICE);
-	if (dma_mapping_error(smmu->dev, as->pd_dma))
-		return -ENOMEM;
+	if (dma_mapping_error(smmu->dev, as->pd_dma)) {
+		err = -ENOMEM;
+		goto err_unlock;
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
+err_unlock:
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
