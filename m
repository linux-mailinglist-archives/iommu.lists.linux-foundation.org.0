Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D395398F56
	for <lists.iommu@lfdr.de>; Wed,  2 Jun 2021 17:55:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A82B4041A;
	Wed,  2 Jun 2021 15:55:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mm1Tm1qr11AP; Wed,  2 Jun 2021 15:55:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C31F4025F;
	Wed,  2 Jun 2021 15:55:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7CB2CC000D;
	Wed,  2 Jun 2021 15:55:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9440CC0001
 for <iommu@lists.linux-foundation.org>; Wed,  2 Jun 2021 15:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 61C386067F
 for <iommu@lists.linux-foundation.org>; Wed,  2 Jun 2021 15:55:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WjgGZXvFzL8v for <iommu@lists.linux-foundation.org>;
 Wed,  2 Jun 2021 15:55:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7278560AD9
 for <iommu@lists.linux-foundation.org>; Wed,  2 Jun 2021 15:55:12 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id h24so4620842ejy.2
 for <iommu@lists.linux-foundation.org>; Wed, 02 Jun 2021 08:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T0y2iCeYYHmrE1fv4Hgj0FTcnFeMz1q5JiDftJFl4po=;
 b=UU+ar2uiuIssxizF/XowP5GaXfYLplYpn1Nerb/7N0zWP6tskNLr9vCRUsE3fwARUH
 KokNG9WNbX2xrgEdrnbZnTnn3Toqdt1Qxq/f391f20+UIKbP13jlmzNdO31ElLUPY2Dh
 hU3W+Drm7oI+RXtS+S8oCII7VQkfw7M4NvmNI0+2nahkcVlhWUqQV3z3BIKVLOCh4DoB
 bPIzZWQd/7A5ATsgUulJsY1I0BKRz5H0Zq2FYTa29L/SatFBvgoajrAU/TNLoyCdNX9D
 9bUKbLDBcn27eMuJQCuJvuzUvgHQLS1VrbrbNj3xHESrrYSx1hKBJdaCqx+fqIiVdhJg
 zPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T0y2iCeYYHmrE1fv4Hgj0FTcnFeMz1q5JiDftJFl4po=;
 b=OVt9pXLwG3oaG9XgzITZY1lDidAb2q8SQxka4NYSWD0Kxp6CQWyJEmJurSQwd0sxAl
 vTGQnC4e4Ta9LvFSj0sW2JBJnN6DThWJL5+X9kwBFyrjbKKRwPcv7TNZrNAr6aRaH4Jm
 XSGxGLqAN3VWq3CZJOuGgnlWvjvpAwqUJrKPUrElupo3QYeDwsnbTJvp6jKGzkAmlIGr
 3DosMEUUQHnbsCvRItSGtndcseM3Garqc+uUcWQod7sK4Jea2qigMyRe/f+XsH3EnwlX
 vzIF6XF7ByhyUW8UdZVWkvlMvqfTSrkuwJHvUx5LniL6D+lg3sUQy0bpv2Zak1T+Pcjt
 yZvg==
X-Gm-Message-State: AOAM5336q0LXd7jCwYUu7w+OP2IrYrIZT20b60pBQIh5z/gjtjAahFN1
 rhR6JCvSNihgLq4sDV4ZvQvDAA==
X-Google-Smtp-Source: ABdhPJyGy0NBOJzSJQLD2BsBLdPZKOs9cC7yrRFD8NAp8rayeCfk0SMetwDCXBWEmUHXL74G7L/GJw==
X-Received: by 2002:a17:906:3b92:: with SMTP id
 u18mr34902477ejf.450.1622649310639; 
 Wed, 02 Jun 2021 08:55:10 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-111-173.adslplus.ch.
 [84.226.111.173])
 by smtp.gmail.com with ESMTPSA id d24sm174249edr.95.2021.06.02.08.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 08:55:10 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: rjw@rjwysocki.net,
	lenb@kernel.org,
	joro@8bytes.org,
	mst@redhat.com
Subject: [PATCH v3 4/6] iommu/dma: Pass address limit rather than size to
 iommu_setup_dma_ops()
Date: Wed,  2 Jun 2021 17:44:44 +0200
Message-Id: <20210602154444.1077006-5-jean-philippe@linaro.org>
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
index 4bf1dd3eb041..7bd1d2199141 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -50,7 +50,7 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 
 	dev->dma_coherent = coherent;
 	if (iommu)
-		iommu_setup_dma_ops(dev, dma_base, size);
+		iommu_setup_dma_ops(dev, dma_base, size - dma_base - 1);
 
 #ifdef CONFIG_XEN
 	if (xen_swiotlb_detect())
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 3ac42bbdefc6..94b96d81fcfd 100644
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
index be35284a2016..85f18342603c 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -5171,7 +5171,7 @@ static void intel_iommu_probe_finalize(struct device *dev)
 
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
