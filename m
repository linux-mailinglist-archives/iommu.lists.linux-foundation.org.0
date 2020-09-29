Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EE82227BC3D
	for <lists.iommu@lfdr.de>; Tue, 29 Sep 2020 06:58:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AE0C4826B7;
	Tue, 29 Sep 2020 04:58:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uxKr1CGByflQ; Tue, 29 Sep 2020 04:58:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 16125853C5;
	Tue, 29 Sep 2020 04:58:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 021ADC0051;
	Tue, 29 Sep 2020 04:58:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53E10C0051
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 04:58:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 43EBA84CE1
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 04:58:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AD64vkd15Nqj for <iommu@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 04:58:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9CA6F826B7
 for <iommu@lists.linux-foundation.org>; Tue, 29 Sep 2020 04:58:23 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id x22so3315964pfo.12
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 21:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mmefgTkltOTlGpxCH/8jD3oM/MLFQKQB+1ziLN9r+E4=;
 b=jRdIbos8PnUoWY/ZHI0L9C/yTUuvHRl0JRVfH9DY3lhyAaUbGcIZDwJj/89c2pDSyr
 kQ5eupL6X8cAce8aboB9HPcoTLygyxOgY9bbarX1mpW+LUYE3ZL6yxX1HfnPHofYVdMc
 2BVUMFg+K2j9Fe9dt80gm3VDBMiNONfJQvpzezxWLJLECgYr2IWC1Fplgvv7ognB9y02
 t6w8Kc6q0FUym67bhq24Q+W4ZfW8CTZhLrwFfzsehNrTKcWhVhTZgibeShs6IjSx41u7
 I5aZZ+fz+caqTNVJreupzS1mPLmDXvRouJHD1RUBjGyzOGTCBhplRoehpx5hEgSjd7sm
 dDEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mmefgTkltOTlGpxCH/8jD3oM/MLFQKQB+1ziLN9r+E4=;
 b=UZbIXQblrjER5OarIydDwgxb2Oabora7xg96fz/QP7lZnmXnc2nAYpY10LVvCxk/JI
 tTlngyHlpMjvZgb2qXjnr3a58qou6Fs6q+6otFI8dVIiRbQFRjakI3xcXr5Ay3d8Giwm
 xcIdv1b6CCpsvyCocEpKDp354eIbRKiOnyGjkIdNL4qfpAN3CLH5RrVYm6EMOvE3Lty7
 FDmpGCXUraYS58pVFypdj131MKcjCkCxdjFal2v7qpzupMbCLN2Dz2H3dexcBiSi0wcf
 k3JpNtBteN9vcJ+/gS2rQ+kNXB9xKru4VC5Qze/Aci267PxA2Px97kUdptWapBv3AI5Q
 5Afw==
X-Gm-Message-State: AOAM53192JN5w7ZB8hq+t5/aeJdtHzh9WCVIrPQt+Rw5THNVUHc7uWw4
 gPpmfD2n+dZF9T0e/XKUu7DHaaJCDHI=
X-Google-Smtp-Source: ABdhPJzdavvYcdQY0CSLoQ88JBVa4a4hECmVUyuJ9YRA2KZEsC3udWNgPG7IhpPEcmQ/k5SCES3lHg==
X-Received: by 2002:a63:d242:: with SMTP id t2mr1955901pgi.47.1601355503208;
 Mon, 28 Sep 2020 21:58:23 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id f207sm3739028pfa.54.2020.09.28.21.58.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 21:58:22 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: thierry.reding@gmail.com,
	joro@8bytes.org
Subject: [PATCH v3 2/2] iommu/tegra-smmu: Expend mutex protection range
Date: Mon, 28 Sep 2020 21:52:47 -0700
Message-Id: <20200929045247.15596-3-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200929045247.15596-1-nicoleotsuka@gmail.com>
References: <20200929045247.15596-1-nicoleotsuka@gmail.com>
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
