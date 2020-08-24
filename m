Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F3A250842
	for <lists.iommu@lfdr.de>; Mon, 24 Aug 2020 20:43:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 85D5F87645;
	Mon, 24 Aug 2020 18:43:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cLrvDLtKC4LH; Mon, 24 Aug 2020 18:43:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CB520875F9;
	Mon, 24 Aug 2020 18:43:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B53C3C0051;
	Mon, 24 Aug 2020 18:43:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11212C0051
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 18:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D770A2077C
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 18:43:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eUTSa1J4Hyj2 for <iommu@lists.linux-foundation.org>;
 Mon, 24 Aug 2020 18:43:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 810342157D
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 18:43:01 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id w186so2886569pgb.8
 for <iommu@lists.linux-foundation.org>; Mon, 24 Aug 2020 11:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VJrx+AWRDEEJgr3DuJf5FGtuFm676MmhtRSCNhrUo5I=;
 b=KTt1cEYiXU1s2DyRWGrMCMo6aJgvTJHSOS5G/PYktd3Wc3mxeZoM15gjdxnPZe78K9
 XE9kcJ59YIkPbY8QB1lvDFs/JjIQzAi6D7il7Ftv97hGIAlmL3nZSUWNu222bfOExK5y
 cGVNuCNUbgVJvmdzGAms4T7gFByYkXSMm+vTCf8p30/l2RnccdsynVF1xU0oPQ6SeIng
 TdWYS/jga0mys7CXXXSfJmRn19C/gx/34duKD2WlVftweVsNx8rowU6Vpn5ovYm0oy05
 Pyer/HwI/331NwJN8A0NuiS9QKTGkWSHYYCvTJCa+5Sztp9QmcZHZvwQvMinpKic6mNh
 KoXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VJrx+AWRDEEJgr3DuJf5FGtuFm676MmhtRSCNhrUo5I=;
 b=eiLkk2zs5I4F/nD2ICN7tltS3QlnTOA3vlX7EYTHHI0usvaxCOCck3fd6HuNx/OuyY
 xz9KE0bC1tQ1cs4xFlcT914ouDDQ+Lm9XpwOwqBqZXqs3tGPVour8vdk4EH7yutv9dzB
 EUXUgAoUV4T9DVUnRBaoiugffpQCamMBe4h17ZM1COeX2WG0QciTRYfbVInYwGKwag29
 oFsn16wMCFj7NMLSbu99vROGMHOwCnlkIJ7DF6MWQqTElSwkRn9G/Lzx+jTI54rAa7f3
 77Bz2qUYiOpUM3erp6mOhZCB2T1NR+D60U364nN2Yj26cXnORft9jzZC93OmhimT7MW9
 5b9Q==
X-Gm-Message-State: AOAM5303eCPW4iU9lQJVQlQTxck6i0QMEViiYR6jg6WIXxBd7fjgk9P7
 1prmYSUaxZe9gAvDghUY9S0=
X-Google-Smtp-Source: ABdhPJxVOMMAzbTzCneKhacGBtyMfiXVyO5KNsF0pzpQXeI8dRQjCOIVGM8GwnqXHXzy+GM65O2HsA==
X-Received: by 2002:a17:902:900a:: with SMTP id
 a10mr4551045plp.203.1598294580998; 
 Mon, 24 Aug 2020 11:43:00 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id x14sm11840582pfj.157.2020.08.24.11.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 11:42:59 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 17/20] arm: dts: qcom: sm845: Set the compatible string for
 the GPU SMMU
Date: Mon, 24 Aug 2020 11:37:51 -0700
Message-Id: <20200824183825.1778810-18-robdclark@gmail.com>
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

From: Jordan Crouse <jcrouse@codeaurora.org>

Set the qcom,adreno-smmu compatible string for the GPU SMMU to enable
split pagetables and per-instance pagetables for drm/msm.

Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 9 +++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi       | 2 +-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 64fc1bfd66fa..39f23cdcbd02 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -633,6 +633,15 @@ &mdss_mdp {
 	status = "okay";
 };
 
+/*
+ * Cheza fw does not properly program the GPU aperture to allow the
+ * GPU to update the SMMU pagetables for context switches.  Work
+ * around this by dropping the "qcom,adreno-smmu" compat string.
+ */
+&adreno_smmu {
+	compatible = "qcom,sdm845-smmu-v2", "qcom,smmu-v2";
+};
+
 &mss_pil {
 	iommus = <&apps_smmu 0x781 0x0>,
 		 <&apps_smmu 0x724 0x3>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 2884577dcb77..76a8a34640ae 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4058,7 +4058,7 @@ opp-257000000 {
 		};
 
 		adreno_smmu: iommu@5040000 {
-			compatible = "qcom,sdm845-smmu-v2", "qcom,smmu-v2";
+			compatible = "qcom,sdm845-smmu-v2", "qcom,adreno-smmu", "qcom,smmu-v2";
 			reg = <0 0x5040000 0 0x10000>;
 			#iommu-cells = <1>;
 			#global-interrupts = <2>;
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
