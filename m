Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C228F2479BF
	for <lists.iommu@lfdr.de>; Tue, 18 Aug 2020 00:03:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0D1D7845D7;
	Mon, 17 Aug 2020 22:03:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iem69ZHGWfEE; Mon, 17 Aug 2020 22:03:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0EB0484508;
	Mon, 17 Aug 2020 22:03:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EFDA8C088B;
	Mon, 17 Aug 2020 22:03:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1FE81C0051
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 22:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1AD9186B68
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 22:03:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KmpXrPpwCxel for <iommu@lists.linux-foundation.org>;
 Mon, 17 Aug 2020 22:03:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 949C186B50
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 22:03:32 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id o13so8784479pgf.0
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 15:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NmKaAGgfZx42q6QOIHx5Lo8CK/gYxLGoADMxgJD50iM=;
 b=ON3+IT8Ii061pwCIRRZqlM9dlVHI9VqTJH+YgqCVJh08kX4Wa87xBftx90qimud4bs
 hoV/afh5Gb91orSJP31DsykdtRqKHhTX8T6FzxOg9HAAKW5uixwIGFTHaGaIzqlpkaTp
 QXI3gdMrm73rnYCJlvYVTmfDcYNea6kPLUYU2muv65ubqjwAKEetUt2WCmpPY6fVKs1W
 UOeGwRgYvcGKocNyZpk4dVMW+KMbgXFaif9rZdJd8n/KRbKHz5sttxdGREVQR4oKm8Nx
 sedk3E4hsHzD4lU0wCGki/wwMi0KdaQ+hOu8IjJUqIzrcdjVU5SLAoB3SWJHeiNOFX19
 bVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NmKaAGgfZx42q6QOIHx5Lo8CK/gYxLGoADMxgJD50iM=;
 b=A1nzAAT+Hw5YaJsBItKBGWDOyDU5K+FyLFzSnLV0hEz/aVNT7HfqSzckMW3VCslrwk
 h0sdagJ9zrsI0KI7zYAmtvegN5rd+d8FhL2nah4NKMr7ss+ZTz6CQyREt+MPkGAw9b1G
 mcW122mxa0M5cru43FjYevgyWG2XbgoZitjJg2tZz7tikRzKSo6ulnTkdnRKBTK8uutW
 XSdNswSIDtJqWcBVs3/06DmTaE7DGwoJoTukLbCev6JwUY1hWgCpUqDF9uSDbxuqHMyR
 kowLiboi2nEidbwXqk3eVdbDQYFnx+qMhTGyl736GljBfvvboGhr/lMMki1ufH01XHnq
 e4TQ==
X-Gm-Message-State: AOAM532rjp3NqDNmKFJAPztV0IijUvA9M9o1lwg/4pnbwMf4IJOa1Cog
 reU7l+2ltyIgT+0kbWh0cLM=
X-Google-Smtp-Source: ABdhPJyHVZ2OTKAViaAMnr6GsfifqWWu585AcJLDTY67ZRAWutmwR3M2K3MJr2/0BsfVKF6RaNHzqw==
X-Received: by 2002:a62:26c2:: with SMTP id
 m185mr13108433pfm.115.1597701812121; 
 Mon, 17 Aug 2020 15:03:32 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 bv17sm18615468pjb.0.2020.08.17.15.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 15:03:31 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-arm-msm@vger.kernel.org
Subject: [PATCH 18/20] arm: dts: qcom: sc7180: Set the compatible string for
 the GPU SMMU
Date: Mon, 17 Aug 2020 15:01:43 -0700
Message-Id: <20200817220238.603465-19-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817220238.603465-1-robdclark@gmail.com>
References: <20200817220238.603465-1-robdclark@gmail.com>
MIME-Version: 1.0
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>
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
index d46b3833e52f..61ae67186691 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -1937,7 +1937,7 @@ opp-180000000 {
 		};
 
 		adreno_smmu: iommu@5040000 {
-			compatible = "qcom,sc7180-smmu-v2", "qcom,smmu-v2";
+			compatible = "qcom,adreno-smmu", "qcom,smmu-v2";
 			reg = <0 0x05040000 0 0x10000>;
 			#iommu-cells = <1>;
 			#global-interrupts = <2>;
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
