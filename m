Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8E7454946
	for <lists.iommu@lfdr.de>; Wed, 17 Nov 2021 15:52:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B997880D36;
	Wed, 17 Nov 2021 14:52:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OG_UWN65WYJb; Wed, 17 Nov 2021 14:52:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E67E080D37;
	Wed, 17 Nov 2021 14:52:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C371EC0012;
	Wed, 17 Nov 2021 14:52:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6AF42C0012
 for <iommu@lists.linux-foundation.org>; Wed, 17 Nov 2021 14:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C6E76061C
 for <iommu@lists.linux-foundation.org>; Wed, 17 Nov 2021 14:52:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cGMVjY2_m8W7 for <iommu@lists.linux-foundation.org>;
 Wed, 17 Nov 2021 14:52:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 133DC605F8
 for <iommu@lists.linux-foundation.org>; Wed, 17 Nov 2021 14:52:37 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id t5so12626409edd.0
 for <iommu@lists.linux-foundation.org>; Wed, 17 Nov 2021 06:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nbFF/7gtUy+99k8e1NtB2gMx+MTF8Q65aibKnryEXnE=;
 b=xBUaFM2qmdQljE9TB00BFnFwIarIPq6wrlAQZG0rfdHNpQ35r8lFwuxJSea9OQ1FAY
 6uOwGhPHwdiIxrb2/43B2IdIBdWfGZ5iwyUm5ew6s0lV1H2As1kK6xn7AT482vJFjH8b
 GmcyzUZB30sJ5tnwdUvHqZzFMQ44ASQ5vFPmF43Ic/0fw2YnU7jspNxHkoEJpSd0yuk8
 R5i9IjjO1VKftdJtVN3ohcqhdyJ5rLFw+Qb1rK8G6h3CosmV921I6zEPVVNRrU4//yUB
 AfJxC/bL6OmVhKaYE76R8vz0UYSiJ4WOt+rv1jYJmHjo0M2kwfIXVywFBHBGrFwVP9cJ
 p8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nbFF/7gtUy+99k8e1NtB2gMx+MTF8Q65aibKnryEXnE=;
 b=wBlIGot1HWuU+xVKd0sCIpI5PKTe/Mi2vGLsxnRQ0XqwFnwhermWUEVdwYB6lKn6iC
 1kgAzUJgJLErqP9SKCaBBcHKiqtevqXUdbKFU30nCctWbFje+O3U5c9iRLll9tkv9BFz
 GK1BScPeSErIGiajVfV0CK7n/ofEombX78ldodXJCvNWUUU/kxz4ZPwY2CSumTOA4n2K
 aR6xe0B3+GD+4+H4vCn7nkseaMHxhc2k5hzsQBlmadGpDGTFBhmzd0XYeRn0tzIeledj
 FmKoXs0F3y5j4rNKm1W3EeQ/z1RrunP50ob5tlWUsEnfXZtkKzeB9Yb3C5Q+cYvfOXqm
 X/Uw==
X-Gm-Message-State: AOAM530O5pZhJawVdveeyoVdxh0Iyzp+jrNLwS3D55a+tFHojkb9u3xR
 FYpAwMGbHxx4TZ37WaND4YSfyA==
X-Google-Smtp-Source: ABdhPJzaluFCdabwVapcVv+el0UpwvCLsJJrI7V1vzIb9r6w8HWWT7EJru/5Eoh/o49qPUxpbXIpUw==
X-Received: by 2002:a17:906:b50:: with SMTP id
 v16mr22778059ejg.384.1637160756247; 
 Wed, 17 Nov 2021 06:52:36 -0800 (PST)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id gs15sm63917ejc.42.2021.11.17.06.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 06:52:35 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: robh+dt@kernel.org
Subject: [PATCH v2 0/3] perf/smmuv3: Support devicetree
Date: Wed, 17 Nov 2021 14:48:42 +0000
Message-Id: <20211117144844.241072-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, robin.murphy@arm.com,
 iommu@lists.linux-foundation.org, uchida.jun@socionext.com, leo.yan@linaro.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
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

Add devicetree binding for the SMMUv3 PMU, called Performance Monitoring
Counter Group (PMCG) in the spec. Each SMMUv3 implementation can have
multiple independent PMCGs, for example one for the Translation Control
Unit (TCU) and one per Translation Buffer Unit (TBU).

Since v1 [1]:
* Fixed warnings in the binding doc
* Removed hip08 support
* Merged Robin's version. I took the liberty of splitting the driver
  patch into 2 and 3. One fix in patch 3, and whitespace changes (the
  driver uses spaces instead of tabs to align #define values, which I
  was going to fix but actually seems more common across the tree.)

[1] https://lore.kernel.org/linux-iommu/20211116113536.69758-1-jean-philippe@linaro.org/

Jean-Philippe Brucker (2):
  dt-bindings: Add Arm SMMUv3 PMCG binding
  perf/smmuv3: Add devicetree support

Robin Murphy (1):
  perf/smmuv3: Synthesize IIDR from CoreSight ID registers

 .../bindings/perf/arm,smmu-v3-pmcg.yaml       | 70 +++++++++++++++++++
 drivers/perf/arm_smmuv3_pmu.c                 | 66 ++++++++++++++++-
 2 files changed, 134 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/perf/arm,smmu-v3-pmcg.yaml

-- 
2.33.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
