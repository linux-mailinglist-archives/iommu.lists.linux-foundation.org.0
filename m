Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC09127276
	for <lists.iommu@lfdr.de>; Fri, 20 Dec 2019 01:32:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 96C0D864A4;
	Fri, 20 Dec 2019 00:32:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R9JLvBxjNUXi; Fri, 20 Dec 2019 00:32:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0BAB286388;
	Fri, 20 Dec 2019 00:32:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E51A5C077D;
	Fri, 20 Dec 2019 00:32:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CFD8FC077D
 for <iommu@lists.linux-foundation.org>; Fri, 20 Dec 2019 00:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CA30C81394
 for <iommu@lists.linux-foundation.org>; Fri, 20 Dec 2019 00:32:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CD8KDzSMerMX for <iommu@lists.linux-foundation.org>;
 Fri, 20 Dec 2019 00:32:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D06988809E
 for <iommu@lists.linux-foundation.org>; Fri, 20 Dec 2019 00:32:34 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id g6so379053plp.6
 for <iommu@lists.linux-foundation.org>; Thu, 19 Dec 2019 16:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=akrkBMpqRXFQPcCm5/1wYSUhWRwH2v6a1sHtRnKtplc=;
 b=UYODVoHi8JFnpKfFi7iMfwGGR517WAqt+lYnzVodSOBLM2zUwiOWvlJvNKEChhQXJ0
 PBFvkFCyErW+Rg2WPraOX/9oK1T/EbTUYZyige1JseNpRKndJBVFrw2+rf1ibXps0Hw1
 uWRi5eq+2ytYrFC5lxnq3/OPyoZguseK8X9E+vM3fTOxgMwfA/qKhGKjqKU75K7lsjZW
 zlecgfcIo0AEKzkI8CDJA5H2dCgBAez79yEcSJ52ED7rQbOe/XkBVLeiwTInPRQX871M
 kqOgHrdMJPrcPCs39xFTTAFkjmROEBZ4lsil5j15/swwiyT4HTenhlik1n2r3ZENk391
 BVgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=akrkBMpqRXFQPcCm5/1wYSUhWRwH2v6a1sHtRnKtplc=;
 b=FOeFYkBLhdd2z/Tpgq+bak987t0+hkCpsvMCAZKom+8B4nXaNeEqpkESQ5eX/7c6VY
 Lvur5iHhajhIkZHXrZbH6MpqombhkWfFvOQoTGcI01vY67BX8NZipmfxsxjfWCZvPbl5
 c/UZKPprYV0wgCVKs/cl05zPq5544nlwpaqpZ3RhEIzwG8UMDSBUuckg8yMIs2W/4m3Y
 AlfdXg/cVga0+6VECW1/PrXvtyVYuLA/ZhneSSZYIVkJIvk+hpyGPG0GJDf1ES2klyzX
 mlASsUhJjpdIvwSZkHhpTVYrTD20Ra9mAf7l+3lQRBV2rbqWL9ofOuQVw0dFfSARqNxD
 KZfA==
X-Gm-Message-State: APjAAAVuKmelxNQpaZ/BeMffkkw1ATLfO6HnIuTp63Zbx5Lr2hnKVxaM
 C7WwGyWI5Fd01acbXVZxIhE=
X-Google-Smtp-Source: APXvYqyTPeiJwGFOX7bNSvc/YQlDxCfCUFmPP4tT6wpZ2HM3ivMg7wYXgSmvVnrMFp+NujRZOXkP2w==
X-Received: by 2002:a17:902:be07:: with SMTP id
 r7mr11660195pls.183.1576801954343; 
 Thu, 19 Dec 2019 16:32:34 -0800 (PST)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id a23sm10145845pfg.82.2019.12.19.16.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 16:32:33 -0800 (PST)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: thierry.reding@gmail.com,
	joro@8bytes.org
Subject: [PATCH 3/4] iommu/tegra-smmu: Fix iova->phys translation
Date: Thu, 19 Dec 2019 16:29:13 -0800
Message-Id: <20191220002914.19043-4-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191220002914.19043-1-nicoleotsuka@gmail.com>
References: <20191220002914.19043-1-nicoleotsuka@gmail.com>
Cc: linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com
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

IOVA might not be always 4KB aligned. So tegra_smmu_iova_to_phys
function needs to add on the lower 12-bit offset from input iova.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/iommu/tegra-smmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 5594b47a88bf..3999ecb63cfa 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -721,7 +721,7 @@ static phys_addr_t tegra_smmu_iova_to_phys(struct iommu_domain *domain,
 
 	pfn = *pte & as->smmu->pfn_mask;
 
-	return SMMU_PFN_PHYS(pfn);
+	return SMMU_PFN_PHYS(pfn) + SMMU_OFFSET_IN_PAGE(iova);
 }
 
 static struct tegra_smmu *tegra_smmu_find(struct device_node *np)
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
