Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB7525083D
	for <lists.iommu@lfdr.de>; Mon, 24 Aug 2020 20:43:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F124585F33;
	Mon, 24 Aug 2020 18:43:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1jQiLZnPWhY5; Mon, 24 Aug 2020 18:43:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 98E9085F09;
	Mon, 24 Aug 2020 18:43:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C5F8C0051;
	Mon, 24 Aug 2020 18:43:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F54DC0051
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 18:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7DA5D875E0
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 18:43:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S+x9S64-IVpW for <iommu@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 18:43:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 180AA875CB
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 18:43:04 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id l191so2885443pgd.5
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 11:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eTzVI35DRVJv330Nqj3ET+6aUZCHukORN2vVqCI+diU=;
 b=cKnPnNCTWkaPr7f7iLMlg926WJU4UrOaPzfxFuLlQmLn9Y7XcZslcjvmp0E6xfwtOz
 gkZQ4IxM+pDxd4psoqGqo7WxSHhR+rc9dYIzzwOlOCQ54tBGHD34WnB4UECsRykp5Z8O
 en2Cp+5/9BQErxsjVk1881aQLuK1GHfb+6Audna0letrJ1mnS+M9eeRvQ2l3nnk7CkYZ
 VuSOgl2NAMCIReBC9EYVI7F2m71uuDLKcVLwZ/+E7fsvoPVq3BNE946SmCMo451CQMyq
 H0ykDMGQU5viHtIQmzaf397UPKBZhq7vuQRH58n7N/mCbXaIvgplxyPjozVjUFMh4ZGu
 VEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eTzVI35DRVJv330Nqj3ET+6aUZCHukORN2vVqCI+diU=;
 b=Q+Zmcd45ziukC+Qk/2JFmDOqW8Z+3NgPHmHKMSkody1sTRNZ3+yMS/vYSpM9D3edeS
 1vHw5qne4TJ6HYzTyqh80dXlMh1GRPhiaoTdKvgUbgrS3w4lCp5ZQJVfYHVTL/Q3L6wP
 dsHFcWVtOgbd/sGG6qt8JlnC14tYwIm6V/2ruqO+gT3KFw8rfER2Jtd/4peBKyZ9taWQ
 zPYg4gnos0ZfOTVryT1I/aXIZ4TV2GlYzL0IRxEI9WT5x4agjOlrGUneBI+i5suauOdK
 h2n5ZvV3VIOQ7bDWpkkRdwKgfCMjQjI6YOtRIy0iSNWcSd50aT9N/gdTM+Vs41uIw0wh
 ef6Q==
X-Gm-Message-State: AOAM5318L53WemQA38YHiHiisneo3c6AFqCwWQ6NyZgZNAzdhCq1nnd2
 PK4ApkoSCw4VcgpwegRH8IE=
X-Google-Smtp-Source: ABdhPJziwKfT/ADuD97U1DcjSVUyIfoo1r/o3mFvVUDV/G+U1SSbfm8cvQlIS6s62gMCK8gPj+Br6Q==
X-Received: by 2002:a17:902:b193:: with SMTP id
 s19mr4902466plr.194.1598294583688; 
 Mon, 24 Aug 2020 11:43:03 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id in12sm241872pjb.29.2020.08.24.11.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 11:43:02 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 18/20] arm: dts: qcom: sc7180: Set the compatible string for
 the GPU SMMU
Date: Mon, 24 Aug 2020 11:37:52 -0700
Message-Id: <20200824183825.1778810-19-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200824183825.1778810-1-robdclark@gmail.com>
References: <20200824183825.1778810-1-robdclark@gmail.com>
MIME-Version: 1.0
Cc: Akhil P Oommen <akhilpo@codeaurora.org>, Eric Anholt <eric@anholt.net>,
 Vivek Gautam <vivek.gautam@codeaurora.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Sibi Sankar <sibis@codeaurora.org>,
 Brian Masney <masneyb@onstation.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Joerg Roedel <jroedel@suse.de>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 John Stultz <john.stultz@linaro.org>, freedreno@lists.freedesktop.org,
 Andy Gross <agross@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
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

From: Rob Clark <robdclark@chromium.org>

Set the qcom,adreno-smmu compatible string for the GPU SMMU to enable
split pagetables and per-instance pagetables for drm/msm.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index d46b3833e52f..f3bef1cad889 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1937,7 +1937,7 @@ opp-180000000 {
 		};
 
 		adreno_smmu: iommu@5040000 {
-			compatible = "qcom,sc7180-smmu-v2", "qcom,smmu-v2";
+			compatible = "qcom,sc7180-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2";
 			reg = <0 0x05040000 0 0x10000>;
 			#iommu-cells = <1>;
 			#global-interrupts = <2>;
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
