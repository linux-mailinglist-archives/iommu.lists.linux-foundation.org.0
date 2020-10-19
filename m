Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B9C292D72
	for <lists.iommu@lfdr.de>; Mon, 19 Oct 2020 20:22:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6CDC68766D;
	Mon, 19 Oct 2020 18:22:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZII4+THbs8PU; Mon, 19 Oct 2020 18:22:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3F3F887669;
	Mon, 19 Oct 2020 18:22:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D845C0051;
	Mon, 19 Oct 2020 18:22:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D66DC0051
 for <iommu@lists.linux-foundation.org>; Mon, 19 Oct 2020 18:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0BCDD864D6
 for <iommu@lists.linux-foundation.org>; Mon, 19 Oct 2020 18:22:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KxC1SqMgzdCA for <iommu@lists.linux-foundation.org>;
 Mon, 19 Oct 2020 18:22:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E84F480859
 for <iommu@lists.linux-foundation.org>; Mon, 19 Oct 2020 18:22:47 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id m22so558990ots.4
 for <iommu@lists.linux-foundation.org>; Mon, 19 Oct 2020 11:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y5fNqoL1fwVXzRoGLdhjgGjKn0H5ZhfiH9MEwllD/6E=;
 b=OTz9mUw0OYOkF+/xpWHYVhItGhBW6akviDkDx1yCTgro7wI2gTIkIonv6xdt4B4uuw
 gslPeIfjwSYj39iPXBJZAhq9tJruKkYVR5wwfJV1IzfXuat2vAQGzRQw+D94UU/BHXrt
 anK2LjGHLKW1i17ayHJh3wwgG8K8VTsZwP4vzNvCKrQwXq/2cHt8ldkIqSgXz4P8lOTp
 20q8teCg7ioBGrKxxo24rhD/R02SS7Tj5vr4kJAFoS6HvIHKZ0fLjCD7BIPN2eph2BB+
 zHL3pVc+idQf+fYjuc+FLxmnc9JvxuLOMQw6u8U2BR4TevDJnbKT7Gduugq+W1ZYotXV
 P6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y5fNqoL1fwVXzRoGLdhjgGjKn0H5ZhfiH9MEwllD/6E=;
 b=fRBa/uCOfJeU1wNlI6INsKipGkD5qA8pbCZUtChIYXIh2xK9CCcHKCSTQsaEj9TZHx
 mD0O9CXGHe4cKmLmXRgPx3eY9tEnZ5lM8F6ruvNGM4HONMJogox0z/Oe3kb5OuLITzng
 OnszBXDWJAszDmSdvf3L8F20SlIYBzWDYYCtxCeLWtIS0LS3Y4dzU7UilPKVBPan3NvT
 PNk5u7EDPYgnbJZltB+9Np2PQZLRSCbcLhEb+0ldQVwyHXgYhhh4RdZjPdWXbkpt1MKW
 kOo3meYVWon6I0fa+sISqRRJdQtCG8VHCirlEKF2EYrX5PddDHwLhBzdG9J0+CT7n1pI
 RPBQ==
X-Gm-Message-State: AOAM530i+o0fyTowaWYxqvqxgWZlQyLsZ10Bs69AZBZZk+XvDbj3BIlc
 iSJ5tI+NkDnFN9FGpC+vI1mPaw==
X-Google-Smtp-Source: ABdhPJz3wQQ65x7rCRGuRiOD/lEinJpwbkX3sUptNu3HmaIQTCVTBlcQfpdKY5yqjTfNAFucQx80DQ==
X-Received: by 2002:a05:6830:19fd:: with SMTP id
 t29mr868207ott.307.1603131767028; 
 Mon, 19 Oct 2020 11:22:47 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id o8sm175296oog.47.2020.10.19.11.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 11:22:46 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 Thierry Reding <treding@nvidia.com>, Rob Clark <robdclark@chromium.org>
Subject: [PATCH v5 2/3] iommu/arm-smmu-qcom: Read back stream mappings
Date: Mon, 19 Oct 2020 11:23:22 -0700
Message-Id: <20201019182323.3162386-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201019182323.3162386-1-bjorn.andersson@linaro.org>
References: <20201019182323.3162386-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

The Qualcomm boot loader configures stream mapping for the peripherals
that it accesses and in particular it sets up the stream mapping for the
display controller to be allowed to scan out a splash screen or EFI
framebuffer.

Read back the stream mappings during initialization and make the
arm-smmu driver maintain the streams in bypass mode.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v4:
- Don't increment s2cr[i]->count, as this is not actually needed to survive
  probe deferral

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index be4318044f96..48627fcf6bed 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -23,6 +23,28 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ }
 };
 
+static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
+{
+	u32 smr;
+	int i;
+
+	for (i = 0; i < smmu->num_mapping_groups; i++) {
+		smr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_SMR(i));
+
+		if (FIELD_GET(ARM_SMMU_SMR_VALID, smr)) {
+			smmu->smrs[i].id = FIELD_GET(ARM_SMMU_SMR_ID, smr);
+			smmu->smrs[i].mask = FIELD_GET(ARM_SMMU_SMR_MASK, smr);
+			smmu->smrs[i].valid = true;
+
+			smmu->s2crs[i].type = S2CR_TYPE_BYPASS;
+			smmu->s2crs[i].privcfg = S2CR_PRIVCFG_DEFAULT;
+			smmu->s2crs[i].cbndx = 0xff;
+		}
+	}
+
+	return 0;
+}
+
 static int qcom_smmu_def_domain_type(struct device *dev)
 {
 	const struct of_device_id *match =
@@ -61,6 +83,7 @@ static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
 }
 
 static const struct arm_smmu_impl qcom_smmu_impl = {
+	.cfg_probe = qcom_smmu_cfg_probe,
 	.def_domain_type = qcom_smmu_def_domain_type,
 	.reset = qcom_smmu500_reset,
 };
-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
