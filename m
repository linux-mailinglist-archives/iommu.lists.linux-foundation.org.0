Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DA2369196
	for <lists.iommu@lfdr.de>; Fri, 23 Apr 2021 13:57:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 805DD84407;
	Fri, 23 Apr 2021 11:57:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Mbl81jHt7V9; Fri, 23 Apr 2021 11:57:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 964218440E;
	Fri, 23 Apr 2021 11:57:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78CE8C001A;
	Fri, 23 Apr 2021 11:57:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1629AC000F
 for <iommu@lists.linux-foundation.org>; Fri, 23 Apr 2021 11:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D500B843B5
 for <iommu@lists.linux-foundation.org>; Fri, 23 Apr 2021 11:57:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f-KZxZCQyWMS for <iommu@lists.linux-foundation.org>;
 Fri, 23 Apr 2021 11:56:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9AA90843EF
 for <iommu@lists.linux-foundation.org>; Fri, 23 Apr 2021 11:56:59 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 p10-20020a1c544a0000b02901387e17700fso1063804wmi.2
 for <iommu@lists.linux-foundation.org>; Fri, 23 Apr 2021 04:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I/trhSE6y6Y4tDuE2sk5DuZOlkIOvXsegzt8mA8VmJ0=;
 b=Lovu0ihGApeyFpxtgvSIg+rb/YQtEIE/Mw2PYDYzX//yT9/GkRvDqYeKzJCInDmD06
 CvQH/h1V2qL0xToqgg8GYiiMXNpipQqi9sk1LaaxPOWzY661jZl73a8wkaY4QCDfpA+n
 1+uEqa5V0V6iAOOHbgIid20FdMbz41uOQn/lui5KCGymadEY0jMLD/3JanbM3FNGhfow
 QpBSyNFCU0SXL1+h/40RMiS9YS1jQal3uZiMeTzSwkO4/yiMkjR/FSdOI0dXp/wyKA1d
 Dl5cad5PmOP5yr5spJLRHn40KzML+YvmpIyvLl1iRzL5VqT/0UR3xGeOIUYet4YV0mnN
 p+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I/trhSE6y6Y4tDuE2sk5DuZOlkIOvXsegzt8mA8VmJ0=;
 b=d/UDO6ZKJXPmyfSVH6mlHdlD80wOzbo4TkZUXyqdxplU7snWKvc5M30jgQc4E45GQz
 XWmAQzfA/MWeCpatdbpnRAJlozWsnvFBFoYs2TD1ciBtP8TgJev0AGk+BcA/WnhkNH69
 2GezyXRFzkn8J6n6C7wSxzcfyzwPuiw7zWd2BdmtGJiaa1/T6A6qJU1SxC7pt9UdzVFa
 +AI/Uvp8WJL6tDu7aL015I10OHdUfQarsINF3jJdhtFPmhi4Z1UbP6JwGqLhvspHdUsr
 rRkQKKzezaClGbGDwObnZ/qPSReaT2ERerA8E3bd7+65Hrq4ngZTIWAvRWeauUIkiykD
 xASA==
X-Gm-Message-State: AOAM530x8l8K4/HtubLnbHTPEgPRB+mVH2iALfUo+oDZ3T7EGJD5A8BU
 2qV9SyzRzsiGW1DOYDdEokvM9A==
X-Google-Smtp-Source: ABdhPJzX2NU0Oaoj5S34aoNhCvVi36QRFwDALrI3TpnnO4mOTYukcRM3GgXIbYly11+ifgWORhu4oQ==
X-Received: by 2002:a1c:3587:: with SMTP id c129mr3760936wma.80.1619179017764; 
 Fri, 23 Apr 2021 04:56:57 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id g9sm7485195wmh.21.2021.04.23.04.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 04:56:57 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: rjw@rjwysocki.net,
	lenb@kernel.org,
	joro@8bytes.org,
	mst@redhat.com
Subject: [PATCH v2 4/6] iommu/dma: Pass address limit rather than size to
 iommu_setup_dma_ops()
Date: Fri, 23 Apr 2021 13:38:35 +0200
Message-Id: <20210423113836.3974972-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423113836.3974972-1-jean-philippe@linaro.org>
References: <20210423113836.3974972-1-jean-philippe@linaro.org>
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

Passing a 64-bit address width to iommu_setup_dma_ops() is valid on
virtual platforms, but isn't currently possible. The overflow check in
iommu_dma_init_domain() prevents this even when @dma_base isn't 0. Pass
a limit address instead of a size, so callers don't have to fake a size
to work around the check.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 include/linux/dma-iommu.h   |  4 ++--
 arch/arm64/mm/dma-mapping.c |  2 +-
 drivers/iommu/amd/iommu.c   |  2 +-
 drivers/iommu/dma-iommu.c   | 12 ++++++------
 drivers/iommu/intel/iommu.c |  2 +-
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/linux/dma-iommu.h b/include/linux/dma-iommu.h
index 6e75a2d689b4..758ca4694257 100644
--- a/include/linux/dma-iommu.h
+++ b/include/linux/dma-iommu.h
@@ -19,7 +19,7 @@ int iommu_get_msi_cookie(struct iommu_domain *domain, dma_addr_t base);
 void iommu_put_dma_cookie(struct iommu_domain *domain);
 
 /* Setup call for arch DMA mapping code */
-void iommu_setup_dma_ops(struct device *dev, u64 dma_base, u64 size);
+void iommu_setup_dma_ops(struct device *dev, u64 dma_base, u64 dma_limit);
 
 /* The DMA API isn't _quite_ the whole story, though... */
 /*
@@ -50,7 +50,7 @@ struct msi_msg;
 struct device;
 
 static inline void iommu_setup_dma_ops(struct device *dev, u64 dma_base,
-		u64 size)
+				       u64 dma_limit)
 {
 }
 
diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index 93e87b287556..83f4f4bad5e4 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -50,7 +50,7 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 
 	dev->dma_coherent = coherent;
 	if (iommu)
-		iommu_setup_dma_ops(dev, dma_base, size);
+		iommu_setup_dma_ops(dev, dma_base, size - dma_base - 1);
 
 #ifdef CONFIG_XEN
 	if (xen_initial_domain())
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 67da96d5b3c2..50041df43391 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -1713,7 +1713,7 @@ static void amd_iommu_probe_finalize(struct device *dev)
 	/* Domains are initialized for this device - have a look what we ended up with */
 	domain = iommu_get_domain_for_dev(dev);
 	if (domain->type == IOMMU_DOMAIN_DMA)
-		iommu_setup_dma_ops(dev, IOVA_START_PFN << PAGE_SHIFT, 0);
+		iommu_setup_dma_ops(dev, IOVA_START_PFN << PAGE_SHIFT, U64_MAX);
 	else
 		set_dma_ops(dev, NULL);
 }
diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 7bcdd1205535..c62e19bed302 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -319,16 +319,16 @@ static bool dev_is_untrusted(struct device *dev)
  * iommu_dma_init_domain - Initialise a DMA mapping domain
  * @domain: IOMMU domain previously prepared by iommu_get_dma_cookie()
  * @base: IOVA at which the mappable address space starts
- * @size: Size of IOVA space
+ * @limit: Last address of the IOVA space
  * @dev: Device the domain is being initialised for
  *
- * @base and @size should be exact multiples of IOMMU page granularity to
+ * @base and @limit + 1 should be exact multiples of IOMMU page granularity to
  * avoid rounding surprises. If necessary, we reserve the page at address 0
  * to ensure it is an invalid IOVA. It is safe to reinitialise a domain, but
  * any change which could make prior IOVAs invalid will fail.
  */
 static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
-		u64 size, struct device *dev)
+				 dma_addr_t limit, struct device *dev)
 {
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
 	unsigned long order, base_pfn;
@@ -346,7 +346,7 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
 	/* Check the domain allows at least some access to the device... */
 	if (domain->geometry.force_aperture) {
 		if (base > domain->geometry.aperture_end ||
-		    base + size <= domain->geometry.aperture_start) {
+		    limit < domain->geometry.aperture_start) {
 			pr_warn("specified DMA range outside IOMMU capability\n");
 			return -EFAULT;
 		}
@@ -1308,7 +1308,7 @@ static const struct dma_map_ops iommu_dma_ops = {
  * The IOMMU core code allocates the default DMA domain, which the underlying
  * IOMMU driver needs to support via the dma-iommu layer.
  */
-void iommu_setup_dma_ops(struct device *dev, u64 dma_base, u64 size)
+void iommu_setup_dma_ops(struct device *dev, u64 dma_base, u64 dma_limit)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
 
@@ -1320,7 +1320,7 @@ void iommu_setup_dma_ops(struct device *dev, u64 dma_base, u64 size)
 	 * underlying IOMMU driver needs to support via the dma-iommu layer.
 	 */
 	if (domain->type == IOMMU_DOMAIN_DMA) {
-		if (iommu_dma_init_domain(domain, dma_base, size, dev))
+		if (iommu_dma_init_domain(domain, dma_base, dma_limit, dev))
 			goto out_err;
 		dev->dma_ops = &iommu_dma_ops;
 	}
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index 708f430af1c4..39a4e672b1c2 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -5166,7 +5166,7 @@ static void intel_iommu_probe_finalize(struct device *dev)
 
 	if (domain && domain->type == IOMMU_DOMAIN_DMA)
 		iommu_setup_dma_ops(dev, base,
-				    __DOMAIN_MAX_ADDR(dmar_domain->gaw) - base);
+				    __DOMAIN_MAX_ADDR(dmar_domain->gaw));
 	else
 		set_dma_ops(dev, NULL);
 }
-- 
2.31.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
