Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FD2398F59
	for <lists.iommu@lfdr.de>; Wed,  2 Jun 2021 17:55:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8ABF83D2C;
	Wed,  2 Jun 2021 15:55:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pXKC2XbdA0rD; Wed,  2 Jun 2021 15:55:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3CFF83D0C;
	Wed,  2 Jun 2021 15:55:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4251EC0028;
	Wed,  2 Jun 2021 15:55:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 314C3C0001
 for <iommu@lists.linux-foundation.org>; Wed,  2 Jun 2021 15:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D56A483CB7
 for <iommu@lists.linux-foundation.org>; Wed,  2 Jun 2021 15:55:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eR-ELwYwLECA for <iommu@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 15:55:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7A60383CFC
 for <iommu@lists.linux-foundation.org>; Wed,  2 Jun 2021 15:55:13 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id a11so3887008ejf.3
 for <iommu@lists.linux-foundation.org>; Wed, 02 Jun 2021 08:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FJBc4XHO8GWouyeNxEp4BksscCRnIRbJmCxL/Ho6xNQ=;
 b=HLBoOUsOdCmAJj4FjB/fu1Loq/8X1A88Bu+3ig+QiYmtd6yqt5X6LmLSVjF6UvasB6
 7+ssFF/PKjYJiNXmeGvOpDtOGzyF+Uo8KyTC6cH/Akitu2K+fyIqBzAXNC6kvR6Yt4lI
 qZIY+7fnySxpkC8AlXr9nCtPhSHMYiS5czzXRe1IHGOuQyvnl+Ciuvrhifcgki61o51h
 DbV52JwnvvaENLzimRhxARWDmR/NzSCxe/U7q0Y2hhWfOd2uYpk7lToahdDsiCbUAvkF
 S/E/EH7mdHv7YJrqbyjMFodbV195eddRHef1viSTEoXHnpw5CDPbgE4uDI0peESVxRj4
 xJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FJBc4XHO8GWouyeNxEp4BksscCRnIRbJmCxL/Ho6xNQ=;
 b=rYuCEIhvm+J+vaTC0GLhD3fOkeWs7OvBMdD2KZAsbTct12WvTnAWPlekEvBV9pM7bR
 nBtkeTAhdj/eZaEt78MFPTrWuK87faA4hy9Q1uKIfrqqLaAGLyL0baTwKACrN8awqc0Y
 P5EY/notZ009oPT0Jlygwy+cqcGQYdSpXJ6HHt6ADUtvJ3VJ72iYPlVgFUVAUi1GZCrH
 S7YsbAhGPRvSd1Xs+t2Yzg0NRT4q52Pem7QOIpwjTdyBSHkIpp6DZQHZbIU+a7s1hC+g
 0POHSIFoDFg5ILnWSbsi1mbUO7k7l7xBeJXmHKiqpqziZPhnWh30GaDLJXCIyBcgar42
 Wqzg==
X-Gm-Message-State: AOAM5304YWA5cWUE2G/Y8efWgpTeWRkwE8NeVM/emqqGP1bX4p9zXkoC
 TTF5XPUBErgRfnDOdYewIKAbdQ==
X-Google-Smtp-Source: ABdhPJzvIihB4u2U21NjmyHazdoodwnPuTYvjpPpgvKWl4ko2Dpr+qcu7Kv+sM483330tcKmVSeTPg==
X-Received: by 2002:a17:907:7b9e:: with SMTP id
 ne30mr20565194ejc.389.1622649311715; 
 Wed, 02 Jun 2021 08:55:11 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-111-173.adslplus.ch.
 [84.226.111.173])
 by smtp.gmail.com with ESMTPSA id d24sm174249edr.95.2021.06.02.08.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 08:55:11 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: rjw@rjwysocki.net,
	lenb@kernel.org,
	joro@8bytes.org,
	mst@redhat.com
Subject: [PATCH v3 5/6] iommu/dma: Simplify calls to iommu_setup_dma_ops()
Date: Wed,  2 Jun 2021 17:44:45 +0200
Message-Id: <20210602154444.1077006-6-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602154444.1077006-1-jean-philippe@linaro.org>
References: <20210602154444.1077006-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: jean-philippe@linaro.org, kevin.tian@intel.com, catalin.marinas@arm.com,
 sudeep.holla@arm.com, robin.murphy@arm.com,
 virtualization@lists.linux-foundation.org, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org, sebastien.boeuf@intel.com,
 guohanjun@huawei.com, will@kernel.org, dwmw2@infradead.org,
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

dma-iommu uses the address bounds described in domain->geometry during
IOVA allocation. The address size parameters of iommu_setup_dma_ops()
are useful for describing additional limits set by the platform
firmware, but aren't needed for drivers that call this function from
probe_finalize(). The base parameter can be zero because dma-iommu
already removes the first IOVA page, and the limit parameter can be
U64_MAX because it's only checked against the domain geometry. Simplify
calls to iommu_setup_dma_ops().

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 drivers/iommu/amd/iommu.c   |  9 +--------
 drivers/iommu/dma-iommu.c   |  4 +++-
 drivers/iommu/intel/iommu.c | 10 +---------
 3 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 94b96d81fcfd..d3123bc05c08 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -1708,14 +1708,7 @@ static struct iommu_device *amd_iommu_probe_device(struct device *dev)
 
 static void amd_iommu_probe_finalize(struct device *dev)
 {
-	struct iommu_domain *domain;
-
-	/* Domains are initialized for this device - have a look what we ended up with */
-	domain = iommu_get_domain_for_dev(dev);
-	if (domain->type == IOMMU_DOMAIN_DMA)
-		iommu_setup_dma_ops(dev, IOVA_START_PFN << PAGE_SHIFT, U64_MAX);
-	else
-		set_dma_ops(dev, NULL);
+	iommu_setup_dma_ops(dev, 0, U64_MAX);
 }
 
 static void amd_iommu_release_device(struct device *dev)
diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index c62e19bed302..175f8eaeb5b3 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1322,7 +1322,9 @@ void iommu_setup_dma_ops(struct device *dev, u64 dma_base, u64 dma_limit)
 	if (domain->type == IOMMU_DOMAIN_DMA) {
 		if (iommu_dma_init_domain(domain, dma_base, dma_limit, dev))
 			goto out_err;
-		dev->dma_ops = &iommu_dma_ops;
+		set_dma_ops(dev, &iommu_dma_ops);
+	} else {
+		set_dma_ops(dev, NULL);
 	}
 
 	return;
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 85f18342603c..8d866940692a 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -5165,15 +5165,7 @@ static void intel_iommu_release_device(struct device *dev)
 
 static void intel_iommu_probe_finalize(struct device *dev)
 {
-	dma_addr_t base = IOVA_START_PFN << VTD_PAGE_SHIFT;
-	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
-	struct dmar_domain *dmar_domain = to_dmar_domain(domain);
-
-	if (domain && domain->type == IOMMU_DOMAIN_DMA)
-		iommu_setup_dma_ops(dev, base,
-				    __DOMAIN_MAX_ADDR(dmar_domain->gaw));
-	else
-		set_dma_ops(dev, NULL);
+	iommu_setup_dma_ops(dev, 0, U64_MAX);
 }
 
 static void intel_iommu_get_resv_regions(struct device *device,
-- 
2.31.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
