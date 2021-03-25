Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCE334929D
	for <lists.iommu@lfdr.de>; Thu, 25 Mar 2021 14:03:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DA2A84A10;
	Thu, 25 Mar 2021 13:03:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f68ozzHbBqTt; Thu, 25 Mar 2021 13:03:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7964684A0D;
	Thu, 25 Mar 2021 13:03:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7127FC0012;
	Thu, 25 Mar 2021 13:03:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56D60C0012
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 13:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39B5160771
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 13:03:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CP_0DEfQM27O for <iommu@lists.linux-foundation.org>;
 Thu, 25 Mar 2021 13:03:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85B3C6076A
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 13:03:43 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id v11so2194526wro.7
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 06:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p2ZJr/xZleVG5vuo3vPYmm91QfUd+NNqHlfpozdoe+o=;
 b=b9p+BJqLAOyKGwz7BGORFcfWe1SnBSJN57Ur8/KUGDQzC3zjC10qVEmkQIY25Xp2ob
 8RQVaEeuDH80SZerjHOE5/pI+x2LRzXJeLACnZUbmy/6FRAlbHNplEupgC5twlNMKXyY
 tRzjdQmWL45AdOo8WdVHb4/5qurahs/c+eg4dDvHyzR+0VPCVstYh5vUJ7LkDLCbBBG9
 57ULubjRi1M1H410LaBhghrAYwHCxDaHAEeekrXarO7YD7Y7ivN9dYVqLxpmJ/LX0DAz
 DulYEq9U+9/ahB0aKcr7SaZQ+yeiEPW7FFsA/v6nrxKrh6UoJgcTDePDaNdIcDEqn5t8
 ZnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p2ZJr/xZleVG5vuo3vPYmm91QfUd+NNqHlfpozdoe+o=;
 b=uZC4LOKaEWegk/BaiamZx1Nyx/7+Piedj4pz5IKnjHhVZML9G3yofCEBdNC56Xa8BW
 UrP2X5rC2WDQQEs91v+M8F7f5kVzKRLY4BvkTgr1w+3TntIshek5WWngIpObR4cvJt8R
 Br4ekt++MEVOIXhcn9z8TDqcF/Whyf1sHvyBl+nDGtJWN17P5/xfbNvwoxF6MSLdZS6P
 9wgQgxGZVq/k4odvCUil2puRiCncuTk8MNKpQjFSk8fphvv9Zs1c36yf8RPSgEMKafO2
 5d1HErS96yvM1mP9X5sK81FOfKdwuQ+2at2oWyflaA1fnViOd7S1LOfdRGYIVdZoJlyY
 ac3g==
X-Gm-Message-State: AOAM533K16Ub8LzhoywP7oOtmPkZzMqkTrmhkwIza0KnyRxcCIAQw3/s
 MZ92xE9d/up1X503r+Bi68s=
X-Google-Smtp-Source: ABdhPJwKeFtKFkBOdAh9H/ZHiBxwBkM7hwaJ4gXK8GulNDMTzhjAj/zMDpSNpAbmeOVWuqx3NWDIbQ==
X-Received: by 2002:a5d:591a:: with SMTP id v26mr8835899wrd.172.1616677421814; 
 Thu, 25 Mar 2021 06:03:41 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id f22sm6187595wmc.33.2021.03.25.06.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 06:03:40 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 7/9] iommu/arm-smmu: Use Tegra implementation on Tegra186
Date: Thu, 25 Mar 2021 14:03:30 +0100
Message-Id: <20210325130332.778208-8-thierry.reding@gmail.com>
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

Tegra186 requires the same SID override programming as Tegra194 in order
to seamlessly transition from the firmware framebuffer to the Linux
framebuffer, so the Tegra implementation needs to be used on Tegra186
devices as well.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
index 136872e77195..9f465e146799 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
@@ -211,7 +211,8 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
 	if (of_property_read_bool(np, "calxeda,smmu-secure-config-access"))
 		smmu->impl = &calxeda_impl;
 
-	if (of_device_is_compatible(np, "nvidia,tegra194-smmu"))
+	if (of_device_is_compatible(np, "nvidia,tegra194-smmu") ||
+	    of_device_is_compatible(np, "nvidia,tegra186-smmu"))
 		return nvidia_smmu_impl_init(smmu);
 
 	smmu = qcom_smmu_impl_init(smmu);
-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
