Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0888D1266E7
	for <lists.iommu@lfdr.de>; Thu, 19 Dec 2019 17:31:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AAA1988703;
	Thu, 19 Dec 2019 16:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s30Ulf-6sbFA; Thu, 19 Dec 2019 16:31:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D945B886FF;
	Thu, 19 Dec 2019 16:31:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3ADAC1AE8;
	Thu, 19 Dec 2019 16:31:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1F01AC077D
 for <iommu@lists.linux-foundation.org>; Thu, 19 Dec 2019 16:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 06F7587F7F
 for <iommu@lists.linux-foundation.org>; Thu, 19 Dec 2019 16:31:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qVjvGj29X37N for <iommu@lists.linux-foundation.org>;
 Thu, 19 Dec 2019 16:31:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9A4E587F74
 for <iommu@lists.linux-foundation.org>; Thu, 19 Dec 2019 16:31:21 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f129so6285478wmf.2
 for <iommu@lists.linux-foundation.org>; Thu, 19 Dec 2019 08:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qvpO6T6lCyQjsFcC/B3MAQOfFJPvli4NlBcE8bVnq2o=;
 b=ybmj/yFMV4WPp7svNei7QMmCl8bEZOgf5I1OmMiNuceKiEvs5FOwc+5QNBcmfQrlON
 DofenBUgXZTyi4JhcRiIepGkKcdGY4BtKidQwP7/JHO1FEOJNjzrzX8jKjeJNf5cwrSN
 tS2rRvNKSfBvhZDS+GHaReUR5s84Sru30RnnKkOevGMAjdhnFV1FNoTdrYF5xTS2C5Pz
 pBv91NSiFLc4P/2cJ1BRlji6oxczL+VzlLLYhsrAz88xLoCnUc9XjeqfwlqEjDnliWJA
 9uGe7CZ4PKzluz2OcGmuwW1v9QwotUUAWENXlNB7vZEd8IAreHDTExzizhbd8YlzdFMR
 HnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qvpO6T6lCyQjsFcC/B3MAQOfFJPvli4NlBcE8bVnq2o=;
 b=km3AP3Mkjm5L8OXl7LTY1SttJXUq+vDUPFMLRypqaE/DuSCN+6ean9tQEP+DMMCuJA
 kvIjm90gQBhjcMUprNZQS3fniyQJvw3z7Fb76kqIvDC5kgApUAUkYUQ5ay21ixcGLF7K
 5G+SMAUnyKSb8Es3Taim4uYYTdAo1gna600rjztmMBpOroC5FysA8TRe3XNhHK4cFBfL
 XxR3lm6SXhagxQBkDstA7+X1wdA0i6i3CfU8MxteTogD8/OER3KptP0VNpB9O4qvlnWo
 rnFsesWYbTBSboLKY6+qFjxaj+W+GLq2lMJGqiyaFXNCWyquisn0Wrplqyz4gDpcCpvk
 po7A==
X-Gm-Message-State: APjAAAXGpSkq60LbsiXN3sP48ew67ye7LrnJkJNdepHeiVFkwj5+8uUO
 34L0JKMAKlO9/wOKgAYbavjoEg==
X-Google-Smtp-Source: APXvYqxbh4xLAjFUzI3q0HQZiQKtrGjMkp4J2NYL+c3vK40JxUXhicQB54JCrIL/QmT7sGb7qr24dA==
X-Received: by 2002:a1c:b456:: with SMTP id d83mr10758320wmf.172.1576773080107; 
 Thu, 19 Dec 2019 08:31:20 -0800 (PST)
Received: from localhost.localdomain (adsl-84-227-176-239.adslplus.ch.
 [84.227.176.239])
 by smtp.gmail.com with ESMTPSA id u22sm7092068wru.30.2019.12.19.08.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2019 08:31:19 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
 iommu@lists.linux-foundation.org
Subject: [PATCH v4 01/13] iommu/arm-smmu-v3: Drop __GFP_ZERO flag from DMA
 allocation
Date: Thu, 19 Dec 2019 17:30:21 +0100
Message-Id: <20191219163033.2608177-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191219163033.2608177-1-jean-philippe@linaro.org>
References: <20191219163033.2608177-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: mark.rutland@arm.com, robin.murphy@arm.com, guohanjun@huawei.com,
 rjw@rjwysocki.net, robh+dt@kernel.org, sudeep.holla@arm.com,
 bhelgaas@google.com, zhangfei.gao@linaro.org, will@kernel.org, lenb@kernel.org
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
