Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E76F716AED1
	for <lists.iommu@lfdr.de>; Mon, 24 Feb 2020 19:24:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A22C48486F;
	Mon, 24 Feb 2020 18:24:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4uT9UWEukZqb; Mon, 24 Feb 2020 18:24:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2EDEB83F1D;
	Mon, 24 Feb 2020 18:24:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 085BBC18DA;
	Mon, 24 Feb 2020 18:24:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C708C0177
 for <iommu@lists.linux-foundation.org>; Mon, 24 Feb 2020 18:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7B74A8550D
 for <iommu@lists.linux-foundation.org>; Mon, 24 Feb 2020 18:24:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zwMQoGIFTLZd for <iommu@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 18:24:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A0C2D85A5B
 for <iommu@lists.linux-foundation.org>; Mon, 24 Feb 2020 18:24:46 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id m3so161276wmi.0
 for <iommu@lists.linux-foundation.org>; Mon, 24 Feb 2020 10:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CtUhXGlPsIJ68oWTTxDmR3+h0pZJEayRCmYSb70blVo=;
 b=MFGs5MApluTu8IWUQBUgGAvYQlWhw1Qg2i+s50QDE2pYw6MygCWeXQvU/qEk+wfERl
 tPpPnU4HcP6RGBxQuFWSwHBNETP/FPS0qBwIHIkmI3LJOI5RvUK2VhdbyzebuzRIDKRZ
 KcNhdPVk42z7exdHVwlPnaJ/qMMBtfBGKweEvWlXxWjNys3C6A0o0SdGp9EMSAAxIo3H
 NANpUzrLoBK5dZmkPbaQsif1wuvzXYei3gn+ou7YVkO53ACHTmwdLRkdjRAXpY2EzFb+
 1IDZsvUikMU64ttNWS2qFyACSY2bSLQKCbTwGmkKTT8xO9+ZOMvb18lvg+NrPE5G9nsr
 /WWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CtUhXGlPsIJ68oWTTxDmR3+h0pZJEayRCmYSb70blVo=;
 b=khyZbm0QBEnG1zrLwIjULmIbQGHLr2ISPqDv5yAlZ9AJI/7kmSMxqg0cyRUi0PCT69
 hBFmkRMI5Yo+kDosQjfHBfu8ZFmu1ZibiCQ7uBUFgNyxSjStgZsKFSz1jiGupBTB7+Zm
 YeSItGvo1GuyuwrT/TcOaLYkxYKV2hScC1Obmu80F2z65aSu9s8pBsz5SJejCUVgRJCi
 Xnb2+JXMk1hj0tE0lEbP07uPxbc+xh9pG99XGZU84KZcCTI7Z0zhShrw5C25KxJ8nWo3
 4Ah8q6045ZkJM3GzRYtMhCuWcs3Cf6RYjIT+kyQewADB3ZHeTiKr9dQQnB00rVr03tVO
 oMDg==
X-Gm-Message-State: APjAAAVpmnZbCR5yMXKfcuDPF7AlppXInrcl5NILkd1hSaE2SYH+t9Uf
 jQ0M8gI/qFnoowzOCCHRxPXL8j7pKqA=
X-Google-Smtp-Source: APXvYqxO1XjG5q9pMUD2nep9ZGbytcZIoxc+NEQ3zQomCXOkrENArq99rGCzJfi6OEEwS8GBwWrg4A==
X-Received: by 2002:a7b:cb46:: with SMTP id v6mr318402wmj.117.1582568684877;
 Mon, 24 Feb 2020 10:24:44 -0800 (PST)
Received: from localhost.localdomain
 ([2001:171b:c9a8:fbc0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id n3sm304255wmc.27.2020.02.24.10.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Feb 2020 10:24:44 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-mm@kvack.org
Subject: [PATCH v4 14/26] iommu/arm-smmu-v3: Enable broadcast TLB maintenance
Date: Mon, 24 Feb 2020 19:23:49 +0100
Message-Id: <20200224182401.353359-15-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224182401.353359-1-jean-philippe@linaro.org>
References: <20200224182401.353359-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: mark.rutland@arm.com, kevin.tian@intel.com,
 Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, catalin.marinas@arm.com,
 robin.murphy@arm.com, robh+dt@kernel.org, zhangfei.gao@linaro.org,
 will@kernel.org, christian.koenig@amd.com
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

From: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>

The SMMUv3 can handle invalidation targeted at TLB entries with shared
ASIDs. If the implementation supports broadcast TLB maintenance, enable it
and keep track of it in a feature bit. The SMMU will then be affected by
inner-shareable TLB invalidations from other agents.

A major side-effect of this change is that stage-2 translation contexts
are now affected by all invalidations by VMID. VMIDs are all shared and
the only ways to prevent over-invalidation, since the stage-2 page tables
are not shared between CPU and SMMU, are to either disable BTM or allocate
different VMIDs. This patch does not address the problem.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/arm-smmu-v3.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index 77554d89653b..b72b2fdcd21f 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -56,6 +56,7 @@
 #define IDR0_ASID16			(1 << 12)
 #define IDR0_ATS			(1 << 10)
 #define IDR0_HYP			(1 << 9)
+#define IDR0_BTM			(1 << 5)
 #define IDR0_COHACC			(1 << 4)
 #define IDR0_TTF			GENMASK(3, 2)
 #define IDR0_TTF_AARCH64		2
@@ -642,6 +643,7 @@ struct arm_smmu_device {
 #define ARM_SMMU_FEAT_STALL_FORCE	(1 << 13)
 #define ARM_SMMU_FEAT_VAX		(1 << 14)
 #define ARM_SMMU_FEAT_E2H		(1 << 15)
+#define ARM_SMMU_FEAT_BTM		(1 << 16)
 	u32				features;
 
 #define ARM_SMMU_OPT_SKIP_PREFETCH	(1 << 0)
@@ -3757,11 +3759,14 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu, bool bypass)
 	writel_relaxed(reg, smmu->base + ARM_SMMU_CR1);
 
 	/* CR2 (random crap) */
-	reg = CR2_PTM | CR2_RECINVSID;
+	reg = CR2_RECINVSID;
 
 	if (smmu->features & ARM_SMMU_FEAT_E2H)
 		reg |= CR2_E2H;
 
+	if (!(smmu->features & ARM_SMMU_FEAT_BTM))
+		reg |= CR2_PTM;
+
 	writel_relaxed(reg, smmu->base + ARM_SMMU_CR2);
 
 	/* Stream table */
@@ -3872,6 +3877,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 {
 	u32 reg;
 	bool coherent = smmu->features & ARM_SMMU_FEAT_COHERENCY;
+	bool vhe = cpus_have_cap(ARM64_HAS_VIRT_HOST_EXTN);
 
 	/* IDR0 */
 	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR0);
@@ -3921,10 +3927,19 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
 
 	if (reg & IDR0_HYP) {
 		smmu->features |= ARM_SMMU_FEAT_HYP;
-		if (cpus_have_cap(ARM64_HAS_VIRT_HOST_EXTN))
+		if (vhe)
 			smmu->features |= ARM_SMMU_FEAT_E2H;
 	}
 
+	/*
+	 * If the CPU is using VHE, but the SMMU doesn't support it, the SMMU
+	 * will create TLB entries for NH-EL1 world and will miss the
+	 * broadcasted TLB invalidations that target EL2-E2H world. Don't enable
+	 * BTM in that case.
+	 */
+	if (reg & IDR0_BTM && (!vhe || reg & IDR0_HYP))
+		smmu->features |= ARM_SMMU_FEAT_BTM;
+
 	/*
 	 * The coherency feature as set by FW is used in preference to the ID
 	 * register, but warn on mismatch.
-- 
2.25.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
