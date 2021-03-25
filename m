Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E0934929E
	for <lists.iommu@lfdr.de>; Thu, 25 Mar 2021 14:03:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD80184A17;
	Thu, 25 Mar 2021 13:03:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S92WvxEspbrQ; Thu, 25 Mar 2021 13:03:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE6BC84A0D;
	Thu, 25 Mar 2021 13:03:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7140C0014;
	Thu, 25 Mar 2021 13:03:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7658C000A
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 13:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B529960757
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 13:03:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K5HDuhp__xGN for <iommu@lists.linux-foundation.org>;
 Thu, 25 Mar 2021 13:03:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0AC9F6078A
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 13:03:46 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id x16so2205272wrn.4
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 06:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=soDQPERcrxQizYmqdP8N6MWaU4yIdYvo3zzWt15BZzE=;
 b=Yz7sN/FBKYsKSIUZt9s/LRF3RLppTSjBQmvvybhJ72OxUeMV3voK7qqhFK3s7qhtGV
 vBmE3cpmnGk3Buy4gOFCBwq+ZqaMi8wT5GdS9Sby/n1uGSnXMoWsR7BjRIP8xahEhmxi
 7scm5D+Q3fKaIkcA05yI5QEfTTtnF/ao13t/4UdJaNzRSafrw82SPefU5mW2Vn35b31A
 axK0xh0xldW9j75n3DLwwIEyO9gtIgd7fh5rg8MuLLp1zuoa/H5f0sGsIMqOa2CbHudt
 OjvYaQZ+zKZ8BGTzV3SYUel+1lIWYIw9AXgKJNbeGb3VpsW9Ec0eZOSg4LY2g9nZwuJ4
 JCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=soDQPERcrxQizYmqdP8N6MWaU4yIdYvo3zzWt15BZzE=;
 b=JlDbMVR04gOebgOjdq92f9f3YkcrJCMoHa2JD8jTFHCm29e12dg3M2Y3rQAotl3adl
 JBTTCSwmeUoOnNq6NnhS1zpSUn+Fa6cNm/bi3gSEZkfbQQxaRi5ce1YkdHi1t0GVd0wS
 u94PRhaB75cvoXqiRahQz8klSrmS3zmQYC2Z1ORCggxgKILNorYDQYH4DbTz+Q4S1AKS
 OICDbweo5GlcNc0d1VwlE35pnPZHv0+UzBOP2bU4S8nXMWDdbSLm0lDRUzeOjUahEWdo
 wjWWF1Gb/9SRhlmZwDSbE8xkuEGUrp96/kNUzPmI4alxgQspEjlye3ZcLq6HY22Hc0Xf
 etmA==
X-Gm-Message-State: AOAM533O8DzYCJ5jIMTp8HDwVkRvBNCg4/lTjbHQyzjw13wlQ4qOCELT
 s75FtAxFoDpGav1a4dhfDpI=
X-Google-Smtp-Source: ABdhPJwIdcfztl0HN1bHqneYRtw+MqoKgp1xBJX4Q+4Px6g8uIOonnw8AMlOhYIbAOuwqNsqpoT77g==
X-Received: by 2002:a5d:684d:: with SMTP id o13mr9166505wrw.235.1616677425265; 
 Thu, 25 Mar 2021 06:03:45 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id b12sm7530911wrf.39.2021.03.25.06.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 06:03:44 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 8/9] arm64: tegra: Hook up memory controller to SMMU on
 Tegra186
Date: Thu, 25 Mar 2021 14:03:31 +0100
Message-Id: <20210325130332.778208-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325130332.778208-1-thierry.reding@gmail.com>
References: <20210325130332.778208-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, Jon Hunter <jonathanh@nvidia.com>,
 Nicolin Chen <nicolinc@nvidia.com>, linux-tegra@vger.kernel.org,
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

From: Thierry Reding <treding@nvidia.com>

On Tegra186 and later, the memory controller needs to be programmed in
coordination with any of the ARM SMMU instances to configure the stream
ID used for each memory client.

To support this, add a phandle reference to the memory controller to the
SMMU device tree node.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 9f75bbf00cf7..e9fdf9e18d37 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1152,6 +1152,8 @@ smmu: iommu@12000000 {
 		stream-match-mask = <0x7f80>;
 		#global-interrupts = <1>;
 		#iommu-cells = <1>;
+
+		nvidia,memory-controller = <&mc>;
 	};
 
 	host1x@13e00000 {
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
