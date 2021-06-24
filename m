Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCF03B3495
	for <lists.iommu@lfdr.de>; Thu, 24 Jun 2021 19:18:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D78A94060C;
	Thu, 24 Jun 2021 17:18:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b6IUqEyI9gA9; Thu, 24 Jun 2021 17:18:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 08DBA4056E;
	Thu, 24 Jun 2021 17:18:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5254C000E;
	Thu, 24 Jun 2021 17:18:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C5E2C000E
 for <iommu@lists.linux-foundation.org>; Thu, 24 Jun 2021 17:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4783C60AD5
 for <iommu@lists.linux-foundation.org>; Thu, 24 Jun 2021 17:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=chromium.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k3ELqXvTOeq3 for <iommu@lists.linux-foundation.org>;
 Thu, 24 Jun 2021 17:18:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76AD760BFA
 for <iommu@lists.linux-foundation.org>; Thu, 24 Jun 2021 17:18:29 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id y4so5737876pfi.9
 for <iommu@lists.linux-foundation.org>; Thu, 24 Jun 2021 10:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ltzQtO7QGv7ihuZ03SI1P6XFOPcuSJGUvlCT/41r+iE=;
 b=E3OBm6d+DSXVCCSeW92dikvGwmwuqWU/DsoUwEYgJrR2tlg8YH4d/NZF7DVqR7/He+
 LenZJUO1mfAjegUrPWjAnmmG5S7PCCZ42geQk165WsFmQEdnb0Ad39+HwartwwMFYgMQ
 9jjJUrS+i22102pFcWK6Q0jsikCiBKGzI6+UY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ltzQtO7QGv7ihuZ03SI1P6XFOPcuSJGUvlCT/41r+iE=;
 b=T+5N5EP1xiyLX3n4q9pm3h0T62ts+n6TW3P4w4hAw/hD0yKDxHwS8A+z5GDcrfO8WA
 iKR1jnDVtM2RnfjrvcSN7E461xjCv/ShXv4PV79igzb/4AjQ+MKizqi631T4ACahmpzo
 d26jRyYO2yjCPnTMBgLR5QBTbtP1uKTxY/o+AwmYRqUrjHu35obtTexALwaQxZ45dT4O
 yhrbsQqlY2MR7sjuVpbRNjj6qo9R1lyxddqtsFxlW2Y0fVh7Vrr5IlUod0tzZRKLp7N7
 qkK7Ux19laZOB+86ls2lwhnzxey7Qm1g4PeEkO88D4l2K4Yg/jjWi+9tLwVIo6nrGwYu
 FDyw==
X-Gm-Message-State: AOAM532h7NavS3bLPP2fhQWhaZPEj6+NcRntaKo3AiQD83uHyLd0B9TB
 bANgGV/LkznrcD3xDO7tLLi1UQ==
X-Google-Smtp-Source: ABdhPJy3hQDCnPl6h1dVLCWoQFoDYGjFrg2/1rsYH0TJwFbq3jVshaM62dCqdnk2IUlzQb/NxFXZ3A==
X-Received: by 2002:a63:1263:: with SMTP id 35mr5496773pgs.221.1624555108972; 
 Thu, 24 Jun 2021 10:18:28 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:fd74:62bc:19e3:a43b])
 by smtp.gmail.com with ESMTPSA id z9sm3365960pfa.2.2021.06.24.10.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 10:18:28 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
 bjorn.andersson@linaro.org, ulf.hansson@linaro.org,
 adrian.hunter@intel.com, bhelgaas@google.com
Subject: [PATCH v2 2/3] iommu/arm-smmu: Check for strictness after calling
 impl->init_context()
Date: Thu, 24 Jun 2021 10:17:58 -0700
Message-Id: <20210624101557.v2.2.I0ddf490bdaa450eb50ab568f35b1cae03bf358f0@changeid>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210624171759.4125094-1-dianders@chromium.org>
References: <20210624171759.4125094-1-dianders@chromium.org>
MIME-Version: 1.0
Cc: robdclark@chromium.org, linux-kernel@vger.kernel.org, saravanak@google.com,
 linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 quic_c_gdjako@quicinc.com, Douglas Anderson <dianders@chromium.org>,
 iommu@lists.linux-foundation.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 joel@joelfernandes.org, rajatja@google.com, sonnyrao@chromium.org,
 vbadigan@codeaurora.org
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

Implementations should be able to affect the strictness so reorder a
little bit so we call them before we look at the strictness.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Patch moving check for strictness in arm-smmu new for v2.

 drivers/iommu/arm/arm-smmu/arm-smmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 6f72c4d208ca..659d3fddffa5 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -761,15 +761,15 @@ static int arm_smmu_init_domain_context(struct iommu_domain *domain,
 		.iommu_dev	= smmu->dev,
 	};
 
-	if (!iommu_get_dma_strict(domain))
-		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
-
 	if (smmu->impl && smmu->impl->init_context) {
 		ret = smmu->impl->init_context(smmu_domain, &pgtbl_cfg, dev);
 		if (ret)
 			goto out_clear_smmu;
 	}
 
+	if (!iommu_get_dma_strict(domain))
+		pgtbl_cfg.quirks |= IO_PGTABLE_QUIRK_NON_STRICT;
+
 	if (smmu_domain->pgtbl_quirks)
 		pgtbl_cfg.quirks |= smmu_domain->pgtbl_quirks;
 
-- 
2.32.0.93.g670b81a890-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
