Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1465C13C1DA
	for <lists.iommu@lfdr.de>; Wed, 15 Jan 2020 13:53:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BBE4B8653F;
	Wed, 15 Jan 2020 12:53:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IyHZ-NvGJPXK; Wed, 15 Jan 2020 12:53:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B4D768650F;
	Wed, 15 Jan 2020 12:53:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AD277C077D;
	Wed, 15 Jan 2020 12:53:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB7A8C077D
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jan 2020 12:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D2BF88659B
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jan 2020 12:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OmhM3+LQ0Gol for <iommu@lists.linux-foundation.org>;
 Wed, 15 Jan 2020 12:53:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 03C278650F
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jan 2020 12:53:30 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id c9so15629040wrw.8
 for <iommu@lists.linux-foundation.org>; Wed, 15 Jan 2020 04:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qvpO6T6lCyQjsFcC/B3MAQOfFJPvli4NlBcE8bVnq2o=;
 b=Un9dRtM79GzqVUSyAD8iZOkwazLCNFPN06jszbZzjoO5X6y3APf6Ai8m4xLDh1rv+p
 9QpUygnXhnhwj68gkjMH+zGrl+vtJTYPOfVTL2+UTTkmT8asVWfVm8hswGh4oMCiJv6J
 FobO4S5wB3tp7ZFAa9ajhZM3j0+zz352jdcby4we3TkEQ7IiQS7idAfquMS9qPFuK1Lg
 hp67GsukgiTHq6OTCFJKkEn6W6VseusestCZQjMr7nMdk6WS/LI8W+rIfW17KZCi/FVi
 AGdk3/KfLRFvd0K6uSzqopJBpMTMjB2fKWn0V7QdS+tbKdEz2rGjDW/6TF6iw9KRthix
 Dxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qvpO6T6lCyQjsFcC/B3MAQOfFJPvli4NlBcE8bVnq2o=;
 b=fMxg7q3QuG+nxieQuJa9rXWp95J9nbr+UsCekvRqVt5HhHnn0oGGGKN4//AC/Rhc/C
 7GtFEpXLJdvZhnNZZwtl3R3skGz/FK4zy7siWrXp83rC1AC8uFPD3brvLjk9pc9R5INZ
 3NjJahGucYi+1lEHmgrBxxgmRlAqPyCYYpNxcPRysc5j5gb2sokrqOoezbFvHoN9Q/vv
 Uqlo6yrd+DxEpwpwd69Vo2H2Y+J7Qa+IdOwv8k8rzSLNSOFGwMpLRugpyprBak9XjjF4
 8UfSCLNtCAksCJ17HxNo00utA9TNm1WqrfQFMyvO5pfvFg8TwD7Z/4Z0DxW3uFt2s5jy
 E6mg==
X-Gm-Message-State: APjAAAUG2j8UGYcBf4TGGp0blOocwORh7oq+UKjuvZ4ywiGYnx70sxMR
 dAdFWRLuYQVd28bMBBS08iIjcA==
X-Google-Smtp-Source: APXvYqzDH6Ofz9W/fkRMwJX0uclPKkOnzuIwGWl7fHBi5dpcESWKfC7gH7eOZddi3/XzZnxRbT2koQ==
X-Received: by 2002:adf:e6d2:: with SMTP id y18mr32269694wrm.262.1579092808455; 
 Wed, 15 Jan 2020 04:53:28 -0800 (PST)
Received: from localhost.localdomain
 ([2001:171b:2266:ba60:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id d12sm25196171wrp.62.2020.01.15.04.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 04:53:28 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
 iommu@lists.linux-foundation.org, will@kernel.org
Subject: [PATCH v5 01/13] iommu/arm-smmu-v3: Drop __GFP_ZERO flag from DMA
 allocation
Date: Wed, 15 Jan 2020 13:52:27 +0100
Message-Id: <20200115125239.136759-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200115125239.136759-1-jean-philippe@linaro.org>
References: <20200115125239.136759-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: mark.rutland@arm.com, guohanjun@huawei.com, rjw@rjwysocki.net,
 robh+dt@kernel.org, sudeep.holla@arm.com, bhelgaas@google.com,
 zhangfei.gao@linaro.org, robin.murphy@arm.com, lenb@kernel.org
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

Since commit 518a2f1925c3 ("dma-mapping: zero memory returned from
dma_alloc_*"), dma_alloc_* always initializes memory to zero, so there
is no need to use dma_zalloc_* or pass the __GFP_ZERO flag anymore.

The flag was introduced by commit 04fa26c71be5 ("iommu/arm-smmu: Convert
DMA buffer allocations to the managed API"), since the managed API
didn't provide a dmam_zalloc_coherent() function.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/arm-smmu-v3.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index effe72eb89e7..d4e8b7f8d9f4 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -1675,7 +1675,7 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
 
 	desc->span = STRTAB_SPLIT + 1;
 	desc->l2ptr = dmam_alloc_coherent(smmu->dev, size, &desc->l2ptr_dma,
-					  GFP_KERNEL | __GFP_ZERO);
+					  GFP_KERNEL);
 	if (!desc->l2ptr) {
 		dev_err(smmu->dev,
 			"failed to allocate l2 stream table for SID %u\n",
@@ -2161,8 +2161,7 @@ static int arm_smmu_domain_finalise_s1(struct arm_smmu_domain *smmu_domain,
 		return asid;
 
 	cfg->cdptr = dmam_alloc_coherent(smmu->dev, CTXDESC_CD_DWORDS << 3,
-					 &cfg->cdptr_dma,
-					 GFP_KERNEL | __GFP_ZERO);
+					 &cfg->cdptr_dma, GFP_KERNEL);
 	if (!cfg->cdptr) {
 		dev_warn(smmu->dev, "failed to allocate context descriptor\n");
 		ret = -ENOMEM;
@@ -2883,7 +2882,7 @@ static int arm_smmu_init_strtab_2lvl(struct arm_smmu_device *smmu)
 
 	l1size = cfg->num_l1_ents * (STRTAB_L1_DESC_DWORDS << 3);
 	strtab = dmam_alloc_coherent(smmu->dev, l1size, &cfg->strtab_dma,
-				     GFP_KERNEL | __GFP_ZERO);
+				     GFP_KERNEL);
 	if (!strtab) {
 		dev_err(smmu->dev,
 			"failed to allocate l1 stream table (%u bytes)\n",
@@ -2910,7 +2909,7 @@ static int arm_smmu_init_strtab_linear(struct arm_smmu_device *smmu)
 
 	size = (1 << smmu->sid_bits) * (STRTAB_STE_DWORDS << 3);
 	strtab = dmam_alloc_coherent(smmu->dev, size, &cfg->strtab_dma,
-				     GFP_KERNEL | __GFP_ZERO);
+				     GFP_KERNEL);
 	if (!strtab) {
 		dev_err(smmu->dev,
 			"failed to allocate linear stream table (%u bytes)\n",
-- 
2.24.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
