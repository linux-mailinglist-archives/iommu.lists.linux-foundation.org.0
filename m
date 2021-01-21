Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8368B2FDED3
	for <lists.iommu@lfdr.de>; Thu, 21 Jan 2021 02:40:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1F30886B9E;
	Thu, 21 Jan 2021 01:40:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cnpMsWMiTnnx; Thu, 21 Jan 2021 01:40:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A7B3F86BA1;
	Thu, 21 Jan 2021 01:40:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95BBAC013A;
	Thu, 21 Jan 2021 01:40:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5947FC013A
 for <iommu@lists.linux-foundation.org>; Thu, 21 Jan 2021 01:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4818786008
 for <iommu@lists.linux-foundation.org>; Thu, 21 Jan 2021 01:40:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RqJtaJ6Osklh for <iommu@lists.linux-foundation.org>;
 Thu, 21 Jan 2021 01:40:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EAC6A85FDE
 for <iommu@lists.linux-foundation.org>; Thu, 21 Jan 2021 01:39:59 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id k8so160013otr.8
 for <iommu@lists.linux-foundation.org>; Wed, 20 Jan 2021 17:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OzybDX/Xt3GwRPQyEqB7XUFKbLslFfqKE8yCIx/zRK0=;
 b=Ic4hbBuNyAhH77UympHAdRhVtmjkRRK7AuwrbOo083hrfT222pag7ZdAcjU+coGOBG
 SegTBROdZyDXrIHKHPpD7OKNSP+S2Bp8aEu3r2C5bIpaSoi3+BbvZqAgaTsA/nHcFFxD
 hGqfU772nEHnlswa5nwbY1oEB7toAR0dr3ZS9LQDqFVqehrYakJD18wdgS7RmbiBmo6n
 3VmR8dzHxAkcx5IqcyKmmutDJnRDm8A3fV4luzraAFmRJGNrE4B5OhpfhEbsw/7atDVd
 O5evtHnFyC8CjcgSrcdi7mEtyHgvThZxqzHvTpSx1VAAjl/9QRQ1Xcgd+gg0T/JjUX8F
 A+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OzybDX/Xt3GwRPQyEqB7XUFKbLslFfqKE8yCIx/zRK0=;
 b=LrsWaGbBND6b2Jz/LcOEyCRHH+ngieD2fAXF3mRNrfwljXoykezSXJW4DkCt8zfg7d
 rs+lyicQOwQfEOSUIf15B/Hm29HAjsN5TD/sJG9rNz0k122VizMbOgkYBP8r7psS1Q6u
 7mMzxxGMzhYK73VA6UpZT6kRTbeZk5YKkS80VeDEhuacL9YQWSAR3bzM5+vp1l20hB+s
 /fhrAfx7XUyihcp97yxCZkAEJbVTBkAhXmki578t2mLTIyVCwbJGAUp7CzPPJDqgts2h
 h7vfGNYkMqEvadPZdN7uWDTUowpsXDjjGy0jSw19bM2UydKwcwzSrLQJId32NmTD/x0C
 z/sg==
X-Gm-Message-State: AOAM531/6x8K3L0YF8kRf8EOqaaDevtUJO+NTC/JPGuqkwxMEw8zTEHq
 RrRWl7hX9IphI1/BEm5Gsm7B0wD0jEnHbw==
X-Google-Smtp-Source: ABdhPJzSuzuFRbQfleUmMZxwP8jChSlAgkL5r/QPnevAdK69YCOfcV2uckVZyBhzjOw5Qnz8X5Yqfw==
X-Received: by 2002:a9d:84d:: with SMTP id 71mr8916828oty.338.1611193199082;
 Wed, 20 Jan 2021 17:39:59 -0800 (PST)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id s2sm729597oov.35.2021.01.20.17.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 17:39:58 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 2/2] iommu/arm-smmu-qcom: Add Qualcomm SC8180X impl
Date: Wed, 20 Jan 2021 17:40:05 -0800
Message-Id: <20210121014005.1612382-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121014005.1612382-1-bjorn.andersson@linaro.org>
References: <20210121014005.1612382-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

The primary SMMU found in Qualcomm SC8180X platform needs to use the
Qualcomm implementation, so add a specific compatible for this.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index bcda17012aee..82c7edc6e025 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -166,6 +166,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,sc7180-mdss" },
 	{ .compatible = "qcom,sc7180-mss-pil" },
+	{ .compatible = "qcom,sc8180x-mdss" },
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sdm845-mss-pil" },
 	{ }
@@ -327,6 +328,7 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
 static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,msm8998-smmu-v2" },
 	{ .compatible = "qcom,sc7180-smmu-500" },
+	{ .compatible = "qcom,sc8180x-smmu-500" },
 	{ .compatible = "qcom,sdm630-smmu-v2" },
 	{ .compatible = "qcom,sdm845-smmu-500" },
 	{ .compatible = "qcom,sm8150-smmu-500" },
-- 
2.29.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
