Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFBB39A61B
	for <lists.iommu@lfdr.de>; Thu,  3 Jun 2021 18:45:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D73A360B6A;
	Thu,  3 Jun 2021 16:45:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cwkxmMQXVJn0; Thu,  3 Jun 2021 16:45:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id B878E60B6D;
	Thu,  3 Jun 2021 16:45:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96E4DC000D;
	Thu,  3 Jun 2021 16:45:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46098C0001
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 16:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 281024056B
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 16:45:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zVcqXWCGfni7 for <iommu@lists.linux-foundation.org>;
 Thu,  3 Jun 2021 16:45:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 26C5840550
 for <iommu@lists.linux-foundation.org>; Thu,  3 Jun 2021 16:45:16 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id ci15so10177681ejc.10
 for <iommu@lists.linux-foundation.org>; Thu, 03 Jun 2021 09:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=emaUd/s+I/7zAGqRMV6GpYb0EGNWgcoNn6kxenQlqUg=;
 b=X+mC/YDJZh7NmSy5AKXhH6ARRZ6oNxVKb/QJsn+SBF7ahQKMfHahbwSNEiL2Erg7LG
 KAIJWZAP3OPXIYMkchZXHXRGEXi9IEzRqKXi2i+b4zeWsDj7qtbbwOtF4hOD+NhzdFZU
 xXCHpSlQbkimCyf6KTkGbzxuY9PZtv+P7korKxfdeUrSB3L4cQlFDpsgbUQdTv19ri0R
 cu4InkLernM4E03VSIMzCxmgrsSh/iAW0vzB6rVrPtn2UirqvAStXtERcvwidauasmbX
 1D85368AXktRu4RFzKkpVLBrMxgmDVextvBSHk3Z/VhTNCKA7qZJVOH3LeNUfHST6gIY
 lU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=emaUd/s+I/7zAGqRMV6GpYb0EGNWgcoNn6kxenQlqUg=;
 b=VmQsUgOuNW+7ezurnRPCxCUki+EUSGVHGnZQa992yYL3PYh1SjnoBJSXijzmYZd2w0
 daE3ucVPYurzNd/Vr97txdMH1t93WKPyja4nZi0mn6WP4LIiCW2aw5O5FjAFZKTBvfKH
 KToFPUOdNoHIgB+1ry9S1vUpXVbP0ZxjfEDMGNZDt7/E3exJnycGqmeUVoY5gA0A1tZj
 s3FJhS2h+2Z0ZkGf4p4Use20x59hU5R4TrxNqxnRoQYgI6HpDdICZ2JHL5btR/XRK51V
 EG6bgW9cqdq3UFt6k9bu5Iu41O1uqO7sFyeD96+8+a54yrgJ5955a0JmhhhJ16FCaU3D
 hAOA==
X-Gm-Message-State: AOAM533Tu7xTWmZJ4GvXMV7kYaBFIQlBCgNy9fde6gA2mUwNykxCSJxc
 vCW9QWva8VRB/AvC92DSURQ=
X-Google-Smtp-Source: ABdhPJxGHiqaz78ebiDKvbPuVlWxMu7idWE6kmjhgmMCpZ9tWDxf/zizOL8QBl192mfnuRUYJPqtmw==
X-Received: by 2002:a17:906:b317:: with SMTP id
 n23mr293860ejz.324.1622738714387; 
 Thu, 03 Jun 2021 09:45:14 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id ck3sm168205edb.56.2021.06.03.09.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 09:45:13 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH v3 7/9] arm64: tegra: Use correct compatible string for
 Tegra186 SMMU
Date: Thu,  3 Jun 2021 18:46:30 +0200
Message-Id: <20210603164632.1000458-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603164632.1000458-1-thierry.reding@gmail.com>
References: <20210603164632.1000458-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, Jon Hunter <jonathanh@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>, linux-tegra@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
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

From: Thierry Reding <treding@nvidia.com>

The SMMU found on Tegra186 requires interoperation with the memory
controller in order to program stream ID overrides. The generic ARM SMMU
500 compatible is therefore inaccurate. Replace it with a more correct,
SoC-specific compatible string.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 9f75bbf00cf7..a173f40256ae 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1082,7 +1082,7 @@ pci@3,0 {
 	};
 
 	smmu: iommu@12000000 {
-		compatible = "arm,mmu-500";
+		compatible = "nvidia,tegra186-smmu", "nvidia,smmu-500";
 		reg = <0 0x12000000 0 0x800000>;
 		interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.31.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
