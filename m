Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3E344E725
	for <lists.iommu@lfdr.de>; Fri, 12 Nov 2021 14:12:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5AC460631;
	Fri, 12 Nov 2021 13:12:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id teCMn5Kjlk29; Fri, 12 Nov 2021 13:12:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9157F6060D;
	Fri, 12 Nov 2021 13:12:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 676F4C0031;
	Fri, 12 Nov 2021 13:12:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E927C0012
 for <iommu@lists.linux-foundation.org>; Fri, 12 Nov 2021 13:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5E53400CC
 for <iommu@lists.linux-foundation.org>; Fri, 12 Nov 2021 13:12:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mqyehORkuwuj for <iommu@lists.linux-foundation.org>;
 Fri, 12 Nov 2021 13:12:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89AFF40145
 for <iommu@lists.linux-foundation.org>; Fri, 12 Nov 2021 13:12:44 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id u18so15441583wrg.5
 for <iommu@lists.linux-foundation.org>; Fri, 12 Nov 2021 05:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CD8KrErZHm2h0/ca8/KMvKQBC9npkDaLuOssn3ZYFLU=;
 b=WhgOPku/sJMt9I096l9adybmV45TCPeL5vYAMvumDuf4XLqQEQi9ByjZiWFvBqTb/T
 wePpQAZ9se+qWnxsOuElDdl6LSU2Pmm/Hsx4ehCuASikRcdDMES66ADfcFgeDaXPo/1m
 NlemVs7zbsTktVJmPRxljAF/CJDRceLKE32XC/DE7ff9YWSIZYTpde+P7zdto7OJox0e
 R/Mj2i0dNGUh4x0odLrgMPSAkdPsbpOoJibLX2lJFHF36z4/AYL59dxm6Aly/tIYunmC
 PSCN9o6jR6ab2bOdT9vgECNbEH9vKUZb5bDwpf6lpdX+sTpUYDXv/pom4HT33E0gRioZ
 kh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CD8KrErZHm2h0/ca8/KMvKQBC9npkDaLuOssn3ZYFLU=;
 b=DuNaANS39nfe9WrYIa7Rb7CLpVgtOKRxxjYa4A5JD5sWch+k1/oaOT5wI52ZVubA1k
 GlQaQFiiD2o5XBD3AzVXzG9K5yc5NOZq2wcikoD1U5VF72hMKE8SfejJk3Zl/rPGT9PG
 cEyKsGkf84eG82jKld8b6HswsqqL1l+PzqRWjzFkU47Za8fHYoz6klINsocCha4KVM61
 0zHMTpjn0iD38bndIv6EaGhb62rNqu0FAtuCJaSdBMhKWhK2fdDAvH/HzPGEWvo6RMYh
 ZRyFVRLzHdYXfOd8/6+kjtVGhRBexEaLRieDxXq2nPPAB0LTWD0LPrV7rK7xauBmAIzF
 TElg==
X-Gm-Message-State: AOAM530WZlYCnHbUqNY/C3+6687JF73XNdQ9o4BsVQl0dDLULGY3p3k0
 HfFtMEo6jxM6sDM5YGZnxxY=
X-Google-Smtp-Source: ABdhPJzobwIYLFkRU9Zi7ARLqvfIYTYsPB7tVqy3KAjMnKkoqWgxe1N4kFQxuKkmGCazsQHjw2/KwQ==
X-Received: by 2002:a5d:68d2:: with SMTP id p18mr18611547wrw.21.1636722762864; 
 Fri, 12 Nov 2021 05:12:42 -0800 (PST)
Received: from localhost ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id x1sm5665416wru.40.2021.11.12.05.12.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 05:12:41 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 3/4] iommu/arm-smmu: Support Tegra234 SMMU
Date: Fri, 12 Nov 2021 14:12:30 +0100
Message-Id: <20211112131231.3683098-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112131231.3683098-1-thierry.reding@gmail.com>
References: <20211112131231.3683098-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
 iommu@lists.linux-foundation.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Allow the NVIDIA-specific ARM SMMU implementation to bind to the SMMU
instances found on Tegra234.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
index 2c25cce38060..658f3cc83278 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
@@ -211,7 +211,8 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
 	if (of_property_read_bool(np, "calxeda,smmu-secure-config-access"))
 		smmu->impl = &calxeda_impl;
 
-	if (of_device_is_compatible(np, "nvidia,tegra194-smmu") ||
+	if (of_device_is_compatible(np, "nvidia,tegra234-smmu") ||
+	    of_device_is_compatible(np, "nvidia,tegra194-smmu") ||
 	    of_device_is_compatible(np, "nvidia,tegra186-smmu"))
 		return nvidia_smmu_impl_init(smmu);
 
-- 
2.33.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
