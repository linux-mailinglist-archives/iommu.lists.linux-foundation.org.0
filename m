Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C34DB128A16
	for <lists.iommu@lfdr.de>; Sat, 21 Dec 2019 16:11:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7947E875CF;
	Sat, 21 Dec 2019 15:11:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TysMwFd6V0nn; Sat, 21 Dec 2019 15:11:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8F24D87842;
	Sat, 21 Dec 2019 15:11:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74508C077D;
	Sat, 21 Dec 2019 15:11:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A288C077D
 for <iommu@lists.linux-foundation.org>; Sat, 21 Dec 2019 15:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EBD27204AF
 for <iommu@lists.linux-foundation.org>; Sat, 21 Dec 2019 15:11:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R5MqlNhb1hGM for <iommu@lists.linux-foundation.org>;
 Sat, 21 Dec 2019 15:10:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 799442048A
 for <iommu@lists.linux-foundation.org>; Sat, 21 Dec 2019 15:10:59 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id c26so11396247eds.8
 for <iommu@lists.linux-foundation.org>; Sat, 21 Dec 2019 07:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tcd-ie.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yYBMxHbMND3KXJAAlRHvXU1gMqhOszki9jNdzLeiJU4=;
 b=OfH7P/O33XqVmrRHuQ/69BFU28v+MGMIwEx7w/umhnY1qNKXSsCGq1Cwaq7vbEzLMp
 1ksjMyjtAT7hWlwrLscfQ77QvEuhl13Swd9KWJGnv0QAQ12Z4EMmc0UBnDdMMC+fXDOJ
 AwGTYVg3PMuc/dPZ45WbnbZxhIn8YgFF6EoHwr+nGZQHnCr6DhBjsrSxM9L9AHr6Caov
 mXYjg4dRT2WuQhsh/0gAG0D+t+HUDuGU7Nr7pKzkderovTZvMGtj+Zix8GpyJLSUDu3F
 9RO4rb75QMNfDN91pVMg46S9XuW7CZvVU6kXu8d0DBfHs3P12+Wv2dYSOCKjy0bOS/Il
 93QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yYBMxHbMND3KXJAAlRHvXU1gMqhOszki9jNdzLeiJU4=;
 b=JBMs5CYTxyYAzvn+p67SiY8qjqQccMxlISC/lXjEChCTHoZgKQZJsvyhCeYiPi39EO
 pjOXKWuZnSAL0Wz64uuP2VLua08outB1zxjEVpAjUaMm8wfqyYs/n4tIIV6jwTTJpnpF
 lur2pOmBIhZ828DG12rACJjFyyFx58QYDDn6zu0WB/0hfWu20DlJxkBNWOHcNiLNOS+C
 fiztuvAL0ceg6O+4zgUuO6AR25Hh9YgscQUx0oOwZsminM8riet+UQ9jeO5DxcQYVaBb
 mfCbrVN/SKwdrMiO+od0r+pmj8xZNoPlREYhpUpIkVWZesYqxmSxKQA4bVPr8N+ZN2dv
 k0Zg==
X-Gm-Message-State: APjAAAWU2fiiDd4VgOu1f+PgDN2lC8HnGi6wsPWPHgVmQOoUV7mjcvB4
 HjGcjbpzvfa7LuiFmuNnBlgAT8252wLsVw==
X-Google-Smtp-Source: APXvYqxT2LSHoXL54d4LTh1o2yBuykvAD28LUC42eFWoj6JLm/GJqllZFuXkdK3UEroGowvwPF7Zpw==
X-Received: by 2002:a17:906:5448:: with SMTP id
 d8mr22606596ejp.254.1576940659410; 
 Sat, 21 Dec 2019 07:04:19 -0800 (PST)
Received: from localhost.localdomain ([80.233.37.20])
 by smtp.googlemail.com with ESMTPSA id u13sm1517639ejz.69.2019.12.21.07.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Dec 2019 07:04:18 -0800 (PST)
From: Tom Murphy <murphyt7@tcd.ie>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 1/8] iommu/vt-d: clean up 32bit si_domain assignment
Date: Sat, 21 Dec 2019 15:03:53 +0000
Message-Id: <20191221150402.13868-2-murphyt7@tcd.ie>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191221150402.13868-1-murphyt7@tcd.ie>
References: <20191221150402.13868-1-murphyt7@tcd.ie>
MIME-Version: 1.0
Cc: Heiko Stuebner <heiko@sntech.de>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-tegra@vger.kernel.org, Julien Grall <julien.grall@arm.com>,
 Thierry Reding <thierry.reding@gmail.com>, Will Deacon <will@kernel.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 linux-mediatek@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>,
 Kukjin Kim <kgene@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
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

In the intel iommu driver devices which only support 32bit DMA can't be
direct mapped. The implementation of this is weird. Currently we assign
it a direct mapped domain and then remove the domain later and replace
it with a domain of type IOMMU_DOMAIN_IDENTITY. We should just assign it
a domain of type IOMMU_DOMAIN_IDENTITY from the begging rather than
needlessly swapping domains.

Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
---
 drivers/iommu/intel-iommu.c | 88 +++++++++++++------------------------
 1 file changed, 31 insertions(+), 57 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index 0c8d81f56a30..c1ea66467918 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -3462,46 +3462,9 @@ static struct dmar_domain *get_private_domain_for_dev(struct device *dev)
 }
 
 /* Check if the dev needs to go through non-identity map and unmap process.*/
-static bool iommu_need_mapping(struct device *dev)
+static bool iommu_no_mapping(struct device *dev)
 {
-	int ret;
-
-	if (iommu_dummy(dev))
-		return false;
-
-	ret = identity_mapping(dev);
-	if (ret) {
-		u64 dma_mask = *dev->dma_mask;
-
-		if (dev->coherent_dma_mask && dev->coherent_dma_mask < dma_mask)
-			dma_mask = dev->coherent_dma_mask;
-
-		if (dma_mask >= dma_direct_get_required_mask(dev))
-			return false;
-
-		/*
-		 * 32 bit DMA is removed from si_domain and fall back to
-		 * non-identity mapping.
-		 */
-		dmar_remove_one_dev_info(dev);
-		ret = iommu_request_dma_domain_for_dev(dev);
-		if (ret) {
-			struct iommu_domain *domain;
-			struct dmar_domain *dmar_domain;
-
-			domain = iommu_get_domain_for_dev(dev);
-			if (domain) {
-				dmar_domain = to_dmar_domain(domain);
-				dmar_domain->flags |= DOMAIN_FLAG_LOSE_CHILDREN;
-			}
-			dmar_remove_one_dev_info(dev);
-			get_private_domain_for_dev(dev);
-		}
-
-		dev_info(dev, "32bit DMA uses non-identity mapping\n");
-	}
-
-	return true;
+	return iommu_dummy(dev) || identity_mapping(dev);
 }
 
 static dma_addr_t __intel_map_single(struct device *dev, phys_addr_t paddr,
@@ -3568,20 +3531,22 @@ static dma_addr_t intel_map_page(struct device *dev, struct page *page,
 				 enum dma_data_direction dir,
 				 unsigned long attrs)
 {
-	if (iommu_need_mapping(dev))
-		return __intel_map_single(dev, page_to_phys(page) + offset,
-				size, dir, *dev->dma_mask);
-	return dma_direct_map_page(dev, page, offset, size, dir, attrs);
+	if (iommu_no_mapping(dev))
+		return dma_direct_map_page(dev, page, offset, size, dir, attrs);
+
+	return __intel_map_single(dev, page_to_phys(page) + offset, size, dir,
+			*dev->dma_mask);
 }
 
 static dma_addr_t intel_map_resource(struct device *dev, phys_addr_t phys_addr,
 				     size_t size, enum dma_data_direction dir,
 				     unsigned long attrs)
 {
-	if (iommu_need_mapping(dev))
-		return __intel_map_single(dev, phys_addr, size, dir,
-				*dev->dma_mask);
-	return dma_direct_map_resource(dev, phys_addr, size, dir, attrs);
+	if (iommu_no_mapping(dev))
+		return dma_direct_map_resource(dev, phys_addr, size, dir,
+				attrs);
+
+	return __intel_map_single(dev, phys_addr, size, dir, *dev->dma_mask);
 }
 
 static void intel_unmap(struct device *dev, dma_addr_t dev_addr, size_t size)
@@ -3632,16 +3597,16 @@ static void intel_unmap_page(struct device *dev, dma_addr_t dev_addr,
 			     size_t size, enum dma_data_direction dir,
 			     unsigned long attrs)
 {
-	if (iommu_need_mapping(dev))
-		intel_unmap(dev, dev_addr, size);
-	else
+	if (iommu_no_mapping(dev))
 		dma_direct_unmap_page(dev, dev_addr, size, dir, attrs);
+	else
+		intel_unmap(dev, dev_addr, size);
 }
 
 static void intel_unmap_resource(struct device *dev, dma_addr_t dev_addr,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
-	if (iommu_need_mapping(dev))
+	if (!iommu_no_mapping(dev))
 		intel_unmap(dev, dev_addr, size);
 }
 
@@ -3652,7 +3617,7 @@ static void *intel_alloc_coherent(struct device *dev, size_t size,
 	struct page *page = NULL;
 	int order;
 
-	if (!iommu_need_mapping(dev))
+	if (iommu_no_mapping(dev))
 		return dma_direct_alloc(dev, size, dma_handle, flags, attrs);
 
 	size = PAGE_ALIGN(size);
@@ -3688,7 +3653,7 @@ static void intel_free_coherent(struct device *dev, size_t size, void *vaddr,
 	int order;
 	struct page *page = virt_to_page(vaddr);
 
-	if (!iommu_need_mapping(dev))
+	if (iommu_no_mapping(dev))
 		return dma_direct_free(dev, size, vaddr, dma_handle, attrs);
 
 	size = PAGE_ALIGN(size);
@@ -3708,7 +3673,7 @@ static void intel_unmap_sg(struct device *dev, struct scatterlist *sglist,
 	struct scatterlist *sg;
 	int i;
 
-	if (!iommu_need_mapping(dev))
+	if (iommu_no_mapping(dev))
 		return dma_direct_unmap_sg(dev, sglist, nelems, dir, attrs);
 
 	for_each_sg(sglist, sg, nelems, i) {
@@ -3734,7 +3699,7 @@ static int intel_map_sg(struct device *dev, struct scatterlist *sglist, int nele
 	struct intel_iommu *iommu;
 
 	BUG_ON(dir == DMA_NONE);
-	if (!iommu_need_mapping(dev))
+	if (iommu_no_mapping(dev))
 		return dma_direct_map_sg(dev, sglist, nelems, dir, attrs);
 
 	domain = deferred_attach_domain(dev);
@@ -3782,7 +3747,7 @@ static int intel_map_sg(struct device *dev, struct scatterlist *sglist, int nele
 
 static u64 intel_get_required_mask(struct device *dev)
 {
-	if (!iommu_need_mapping(dev))
+	if (iommu_no_mapping(dev))
 		return dma_direct_get_required_mask(dev);
 	return DMA_BIT_MASK(32);
 }
@@ -5618,9 +5583,13 @@ static int intel_iommu_add_device(struct device *dev)
 	struct iommu_domain *domain;
 	struct intel_iommu *iommu;
 	struct iommu_group *group;
+	u64 dma_mask = *dev->dma_mask;
 	u8 bus, devfn;
 	int ret;
 
+	if (dev->coherent_dma_mask && dev->coherent_dma_mask < dma_mask)
+		dma_mask = dev->coherent_dma_mask;
+
 	iommu = device_to_iommu(dev, &bus, &devfn);
 	if (!iommu)
 		return -ENODEV;
@@ -5640,7 +5609,12 @@ static int intel_iommu_add_device(struct device *dev)
 	domain = iommu_get_domain_for_dev(dev);
 	dmar_domain = to_dmar_domain(domain);
 	if (domain->type == IOMMU_DOMAIN_DMA) {
-		if (device_def_domain_type(dev) == IOMMU_DOMAIN_IDENTITY) {
+		/*
+		 * We check dma_mask >= dma_get_required_mask(dev) because
+		 * 32 bit DMA falls back to non-identity mapping.
+		 */
+		if (device_def_domain_type(dev) == IOMMU_DOMAIN_IDENTITY &&
+				dma_mask >= dma_get_required_mask(dev)) {
 			ret = iommu_request_dm_for_dev(dev);
 			if (ret) {
 				dmar_remove_one_dev_info(dev);
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
