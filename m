Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 428AC3232A6
	for <lists.iommu@lfdr.de>; Tue, 23 Feb 2021 21:59:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E430C83A99;
	Tue, 23 Feb 2021 20:59:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 68NEU3M_TA95; Tue, 23 Feb 2021 20:59:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CA3083B32;
	Tue, 23 Feb 2021 20:59:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83DB3C0001;
	Tue, 23 Feb 2021 20:59:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D90CDC0001
 for <iommu@lists.linux-foundation.org>; Tue, 23 Feb 2021 20:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D344743022
 for <iommu@lists.linux-foundation.org>; Tue, 23 Feb 2021 20:59:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id COXSCR8XPf8M for <iommu@lists.linux-foundation.org>;
 Tue, 23 Feb 2021 20:59:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E5B9643024
 for <iommu@lists.linux-foundation.org>; Tue, 23 Feb 2021 20:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614113950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U5S7qtPkB+qsFvAwLhsFolrBcTzg7GGWTuqmO3k9MtU=;
 b=aVQPcnHR4OpDLNXHaoxbsYcur3lV3WbkxcSzkcmNFIVlBSIFtXoVJc44TgJrZ/2Pp5zjaK
 1PqFeOjQvaklRr7XxjiQ97bCTvtHLWKgtvnaS6duxOtJIkLTSV6aN7hITjIcQyVbIahEB+
 5QkebhzaZVs2dyZEuwedZw9/JCjB+xQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-y8LNvq4yPWKyFgbCne4ktg-1; Tue, 23 Feb 2021 15:58:17 -0500
X-MC-Unique: y8LNvq4yPWKyFgbCne4ktg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EC5A18B9EC3;
 Tue, 23 Feb 2021 20:58:13 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-34.ams2.redhat.com [10.36.114.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E7F45D9D0;
 Tue, 23 Feb 2021 20:58:01 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, will@kernel.org,
 maz@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
 alex.williamson@redhat.com, tn@semihalf.com, zhukeqian1@huawei.com
Subject: [PATCH v14 08/13] dma-iommu: Implement NESTED_MSI cookie
Date: Tue, 23 Feb 2021 21:56:29 +0100
Message-Id: <20210223205634.604221-9-eric.auger@redhat.com>
In-Reply-To: <20210223205634.604221-1-eric.auger@redhat.com>
References: <20210223205634.604221-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: jean-philippe@linaro.org, wangxingang5@huawei.com, lushenming@huawei.com,
 jiangkunkun@huawei.com, vivek.gautam@arm.com, vsethi@nvidia.com,
 zhangfei.gao@linaro.org
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

Up to now, when the type was UNMANAGED, we used to
allocate IOVA pages within a reserved IOVA MSI range.

If both the host and the guest are exposed with SMMUs, each
would allocate an IOVA. The guest allocates an IOVA (gIOVA)
to map onto the guest MSI doorbell (gDB). The Host allocates
another IOVA (hIOVA) to map onto the physical doorbell (hDB).

So we end up with 2 unrelated mappings, at S1 and S2:
         S1             S2
gIOVA    ->     gDB
               hIOVA    ->    hDB

The PCI device would be programmed with hIOVA.
No stage 1 mapping would existing, causing the MSIs to fault.

iommu_dma_bind_guest_msi() allows to pass gIOVA/gDB
to the host so that gIOVA can be used by the host instead of
re-allocating a new hIOVA.

         S1           S2
gIOVA    ->    gDB    ->    hDB

this time, the PCI device can be programmed with the gIOVA MSI
doorbell which is correctly mapped through both stages.

Nested mode is not compatible with HW MSI regions as in that
case gDB and hDB should have a 1-1 mapping. This check will
be done when attaching each device to the IOMMU domain.

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v10 -> v11:
- fix compilation if !CONFIG_IOMMU_DMA

v7 -> v8:
- correct iommu_dma_(un)bind_guest_msi when
  !CONFIG_IOMMU_DMA
- Mentioned nested mode is not compatible with HW MSI regions
  in commit message
- protect with msi_lock on unbind

v6 -> v7:
- removed device handle

v3 -> v4:
- change function names; add unregister
- protect with msi_lock

v2 -> v3:
- also store the device handle on S1 mapping registration.
  This garantees we associate the associated S2 mapping binds
  to the correct physical MSI controller.

v1 -> v2:
- unmap stage2 on put()
---
 drivers/iommu/dma-iommu.c | 142 +++++++++++++++++++++++++++++++++++++-
 include/linux/dma-iommu.h |  16 +++++
 2 files changed, 155 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index f659395e7959..d25eb7cecaa7 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -19,6 +19,7 @@
 #include <linux/irq.h>
 #include <linux/mm.h>
 #include <linux/mutex.h>
+#include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/swiotlb.h>
 #include <linux/scatterlist.h>
@@ -29,12 +30,15 @@
 struct iommu_dma_msi_page {
 	struct list_head	list;
 	dma_addr_t		iova;
+	dma_addr_t		gpa;
 	phys_addr_t		phys;
+	size_t			s1_granule;
 };
 
 enum iommu_dma_cookie_type {
 	IOMMU_DMA_IOVA_COOKIE,
 	IOMMU_DMA_MSI_COOKIE,
+	IOMMU_DMA_NESTED_MSI_COOKIE,
 };
 
 struct iommu_dma_cookie {
@@ -46,6 +50,7 @@ struct iommu_dma_cookie {
 		dma_addr_t		msi_iova;
 	};
 	struct list_head		msi_page_list;
+	spinlock_t			msi_lock;
 
 	/* Domain for flush queue callback; NULL if flush queue not in use */
 	struct iommu_domain		*fq_domain;
@@ -87,6 +92,7 @@ static struct iommu_dma_cookie *cookie_alloc(enum iommu_dma_cookie_type type)
 
 	cookie = kzalloc(sizeof(*cookie), GFP_KERNEL);
 	if (cookie) {
+		spin_lock_init(&cookie->msi_lock);
 		INIT_LIST_HEAD(&cookie->msi_page_list);
 		cookie->type = type;
 	}
@@ -120,14 +126,17 @@ EXPORT_SYMBOL(iommu_get_dma_cookie);
  *
  * Users who manage their own IOVA allocation and do not want DMA API support,
  * but would still like to take advantage of automatic MSI remapping, can use
- * this to initialise their own domain appropriately. Users should reserve a
+ * this to initialise their own domain appropriately. Users may reserve a
  * contiguous IOVA region, starting at @base, large enough to accommodate the
  * number of PAGE_SIZE mappings necessary to cover every MSI doorbell address
- * used by the devices attached to @domain.
+ * used by the devices attached to @domain. The other way round is to provide
+ * usable iova pages through the iommu_dma_bind_doorbell API (nested stages
+ * use case)
  */
 int iommu_get_msi_cookie(struct iommu_domain *domain, dma_addr_t base)
 {
 	struct iommu_dma_cookie *cookie;
+	int nesting, ret;
 
 	if (domain->type != IOMMU_DOMAIN_UNMANAGED)
 		return -EINVAL;
@@ -135,7 +144,12 @@ int iommu_get_msi_cookie(struct iommu_domain *domain, dma_addr_t base)
 	if (domain->iova_cookie)
 		return -EEXIST;
 
-	cookie = cookie_alloc(IOMMU_DMA_MSI_COOKIE);
+	ret =  iommu_domain_get_attr(domain, DOMAIN_ATTR_NESTING, &nesting);
+	if (!ret && nesting)
+		cookie = cookie_alloc(IOMMU_DMA_NESTED_MSI_COOKIE);
+	else
+		cookie = cookie_alloc(IOMMU_DMA_MSI_COOKIE);
+
 	if (!cookie)
 		return -ENOMEM;
 
@@ -156,6 +170,7 @@ void iommu_put_dma_cookie(struct iommu_domain *domain)
 {
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
 	struct iommu_dma_msi_page *msi, *tmp;
+	bool s2_unmap = false;
 
 	if (!cookie)
 		return;
@@ -163,7 +178,15 @@ void iommu_put_dma_cookie(struct iommu_domain *domain)
 	if (cookie->type == IOMMU_DMA_IOVA_COOKIE && cookie->iovad.granule)
 		put_iova_domain(&cookie->iovad);
 
+	if (cookie->type == IOMMU_DMA_NESTED_MSI_COOKIE)
+		s2_unmap = true;
+
 	list_for_each_entry_safe(msi, tmp, &cookie->msi_page_list, list) {
+		if (s2_unmap && msi->phys) {
+			size_t size = cookie_msi_granule(cookie);
+
+			WARN_ON(iommu_unmap(domain, msi->gpa, size) != size);
+		}
 		list_del(&msi->list);
 		kfree(msi);
 	}
@@ -172,6 +195,92 @@ void iommu_put_dma_cookie(struct iommu_domain *domain)
 }
 EXPORT_SYMBOL(iommu_put_dma_cookie);
 
+/**
+ * iommu_dma_bind_guest_msi - Allows to pass the stage 1
+ * binding of a virtual MSI doorbell used by @dev.
+ *
+ * @domain: domain handle
+ * @iova: guest iova
+ * @gpa: gpa of the virtual doorbell
+ * @size: size of the granule used for the stage1 mapping
+ *
+ * In nested stage use case, the user can provide IOVA/IPA bindings
+ * corresponding to a guest MSI stage 1 mapping. When the host needs
+ * to map its own MSI doorbells, it can use @gpa as stage 2 input
+ * and map it onto the physical MSI doorbell.
+ */
+int iommu_dma_bind_guest_msi(struct iommu_domain *domain,
+			     dma_addr_t iova, phys_addr_t gpa, size_t size)
+{
+	struct iommu_dma_cookie *cookie = domain->iova_cookie;
+	struct iommu_dma_msi_page *msi;
+	int ret = 0;
+
+	if (!cookie)
+		return -EINVAL;
+
+	if (cookie->type != IOMMU_DMA_NESTED_MSI_COOKIE)
+		return -EINVAL;
+
+	iova = iova & ~(dma_addr_t)(size - 1);
+	gpa = gpa & ~(phys_addr_t)(size - 1);
+
+	spin_lock(&cookie->msi_lock);
+
+	list_for_each_entry(msi, &cookie->msi_page_list, list) {
+		if (msi->iova == iova)
+			goto unlock; /* this page is already registered */
+	}
+
+	msi = kzalloc(sizeof(*msi), GFP_ATOMIC);
+	if (!msi) {
+		ret = -ENOMEM;
+		goto unlock;
+	}
+
+	msi->iova = iova;
+	msi->gpa = gpa;
+	msi->s1_granule = size;
+	list_add(&msi->list, &cookie->msi_page_list);
+unlock:
+	spin_unlock(&cookie->msi_lock);
+	return ret;
+}
+EXPORT_SYMBOL(iommu_dma_bind_guest_msi);
+
+void iommu_dma_unbind_guest_msi(struct iommu_domain *domain, dma_addr_t giova)
+{
+	struct iommu_dma_cookie *cookie = domain->iova_cookie;
+	struct iommu_dma_msi_page *msi;
+
+	if (!cookie)
+		return;
+
+	if (cookie->type != IOMMU_DMA_NESTED_MSI_COOKIE)
+		return;
+
+	spin_lock(&cookie->msi_lock);
+
+	list_for_each_entry(msi, &cookie->msi_page_list, list) {
+		dma_addr_t aligned_giova =
+			giova & ~(dma_addr_t)(msi->s1_granule - 1);
+
+		if (msi->iova == aligned_giova) {
+			if (msi->phys) {
+				/* unmap the stage 2 */
+				size_t size = cookie_msi_granule(cookie);
+
+				WARN_ON(iommu_unmap(domain, msi->gpa, size) != size);
+			}
+			list_del(&msi->list);
+			kfree(msi);
+			break;
+		}
+	}
+	spin_unlock(&cookie->msi_lock);
+}
+EXPORT_SYMBOL(iommu_dma_unbind_guest_msi);
+
 /**
  * iommu_dma_get_resv_regions - Reserved region driver helper
  * @dev: Device from iommu_get_resv_regions()
@@ -1343,6 +1452,33 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
 		if (msi_page->phys == msi_addr)
 			return msi_page;
 
+	/*
+	 * In nested stage mode, we do not allocate an MSI page in
+	 * a range provided by the user. Instead, IOVA/IPA bindings are
+	 * individually provided. We reuse thise IOVAs to build the
+	 * GIOVA -> GPA -> MSI HPA nested stage mapping.
+	 */
+	if (cookie->type == IOMMU_DMA_NESTED_MSI_COOKIE) {
+		list_for_each_entry(msi_page, &cookie->msi_page_list, list)
+			if (!msi_page->phys) {
+				int ret;
+
+				/* do the stage 2 mapping */
+				ret = iommu_map(domain,
+						msi_page->gpa, msi_addr, size,
+						IOMMU_MMIO | IOMMU_WRITE);
+				if (ret) {
+					pr_warn("MSI S2 mapping failed (%d)\n",
+						ret);
+					return NULL;
+				}
+				msi_page->phys = msi_addr;
+				return msi_page;
+			}
+		pr_warn("%s no MSI binding found\n", __func__);
+		return NULL;
+	}
+
 	msi_page = kzalloc(sizeof(*msi_page), GFP_KERNEL);
 	if (!msi_page)
 		return NULL;
diff --git a/include/linux/dma-iommu.h b/include/linux/dma-iommu.h
index 706b68d1359b..7bd785e68477 100644
--- a/include/linux/dma-iommu.h
+++ b/include/linux/dma-iommu.h
@@ -12,6 +12,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/iommu.h>
 #include <linux/msi.h>
+#include <uapi/linux/iommu.h>
 
 /* Domain management interface for IOMMU drivers */
 int iommu_get_dma_cookie(struct iommu_domain *domain);
@@ -36,6 +37,9 @@ void iommu_dma_compose_msi_msg(struct msi_desc *desc,
 			       struct msi_msg *msg);
 
 void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list);
+int iommu_dma_bind_guest_msi(struct iommu_domain *domain,
+			     dma_addr_t iova, phys_addr_t gpa, size_t size);
+void iommu_dma_unbind_guest_msi(struct iommu_domain *domain, dma_addr_t giova);
 
 void iommu_dma_free_cpu_cached_iovas(unsigned int cpu,
 		struct iommu_domain *domain);
@@ -77,6 +81,18 @@ static inline void iommu_dma_compose_msi_msg(struct msi_desc *desc,
 {
 }
 
+static inline int
+iommu_dma_bind_guest_msi(struct iommu_domain *domain,
+			 dma_addr_t iova, phys_addr_t gpa, size_t size)
+{
+	return -ENODEV;
+}
+
+static inline void
+iommu_dma_unbind_guest_msi(struct iommu_domain *domain, dma_addr_t giova)
+{
+}
+
 static inline void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list)
 {
 }
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
