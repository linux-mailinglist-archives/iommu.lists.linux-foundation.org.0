Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9904D2AAC8
	for <lists.iommu@lfdr.de>; Sun, 26 May 2019 18:11:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D5C7A13F8;
	Sun, 26 May 2019 16:11:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7864113A4
	for <iommu@lists.linux-foundation.org>;
	Sun, 26 May 2019 16:11:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 743106C5
	for <iommu@lists.linux-foundation.org>;
	Sun, 26 May 2019 16:11:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F3C94308FBB1;
	Sun, 26 May 2019 16:11:14 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CD3025D72A;
	Sun, 26 May 2019 16:11:06 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, joro@8bytes.org,
	alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
	yi.l.liu@intel.com, jean-philippe.brucker@arm.com, will.deacon@arm.com,
	robin.murphy@arm.com
Subject: [PATCH v8 10/29] iommu: Introduce bind/unbind_guest_msi
Date: Sun, 26 May 2019 18:09:45 +0200
Message-Id: <20190526161004.25232-11-eric.auger@redhat.com>
In-Reply-To: <20190526161004.25232-1-eric.auger@redhat.com>
References: <20190526161004.25232-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Sun, 26 May 2019 16:11:15 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: marc.zyngier@arm.com, peter.maydell@linaro.org, kevin.tian@intel.com,
	vincent.stehle@arm.com, ashok.raj@intel.com
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On ARM, MSI are translated by the SMMU. An IOVA is allocated
for each MSI doorbell. If both the host and the guest are exposed
with SMMUs, we end up with 2 different IOVAs allocated by each.
guest allocates an IOVA (gIOVA) to map onto the guest MSI
doorbell (gDB). The Host allocates another IOVA (hIOVA) to map
onto the physical doorbell (hDB).

So we end up with 2 untied mappings:
         S1            S2
gIOVA    ->    gDB
              hIOVA    ->    hDB

Currently the PCI device is programmed by the host with hIOVA
as MSI doorbell. So this does not work.

This patch introduces an API to pass gIOVA/gDB to the host so
that gIOVA can be reused by the host instead of re-allocating
a new IOVA. So the goal is to create the following nested mapping:

         S1            S2
gIOVA    ->    gDB     ->    hDB

and program the PCI device with gIOVA MSI doorbell.

In case we have several devices attached to this nested domain
(devices belonging to the same group), they cannot be isolated
on guest side either. So they should also end up in the same domain
on guest side. We will enforce that all the devices attached to
the host iommu domain use the same physical doorbell and similarly
a single virtual doorbell mapping gets registered (1 single
virtual doorbell is used on guest as well).

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---
v7 -> v8:
- dummy iommu_unbind_guest_msi turned into a void function

v6 -> v7:
- remove the device handle parameter.
- Add comments saying there can only be a single MSI binding
  registered per iommu_domain
v5 -> v6:
-fix compile issue when IOMMU_API is not set

v3 -> v4:
- add unbind

v2 -> v3:
- add a struct device handle
---
 drivers/iommu/iommu.c | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/iommu.h | 20 ++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 1758b574c722..eb8c95eb2d5a 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1662,6 +1662,43 @@ static void __iommu_detach_device(struct iommu_domain *domain,
 	trace_detach_device_from_domain(dev);
 }
 
+/**
+ * iommu_bind_guest_msi - Passes the stage1 GIOVA/GPA mapping of a
+ * virtual doorbell
+ *
+ * @domain: iommu domain the stage 1 mapping will be attached to
+ * @iova: iova allocated by the guest
+ * @gpa: guest physical address of the virtual doorbell
+ * @size: granule size used for the mapping
+ *
+ * The associated IOVA can be reused by the host to create a nested
+ * stage2 binding mapping translating into the physical doorbell used
+ * by the devices attached to the domain.
+ *
+ * All devices within the domain must share the same physical doorbell.
+ * A single MSI GIOVA/GPA mapping can be attached to an iommu_domain.
+ */
+
+int iommu_bind_guest_msi(struct iommu_domain *domain,
+			 dma_addr_t giova, phys_addr_t gpa, size_t size)
+{
+	if (unlikely(!domain->ops->bind_guest_msi))
+		return -ENODEV;
+
+	return domain->ops->bind_guest_msi(domain, giova, gpa, size);
+}
+EXPORT_SYMBOL_GPL(iommu_bind_guest_msi);
+
+void iommu_unbind_guest_msi(struct iommu_domain *domain,
+			    dma_addr_t iova)
+{
+	if (unlikely(!domain->ops->unbind_guest_msi))
+		return;
+
+	domain->ops->unbind_guest_msi(domain, iova);
+}
+EXPORT_SYMBOL_GPL(iommu_unbind_guest_msi);
+
 void iommu_detach_device(struct iommu_domain *domain, struct device *dev)
 {
 	struct iommu_group *group;
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 7a37336e5d7f..9e397f423333 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -267,6 +267,8 @@ struct page_response_msg {
  * @attach_pasid_table: attach a pasid table
  * @detach_pasid_table: detach the pasid table
  * @cache_invalidate: invalidate translation caches
+ * @bind_guest_msi: provides a stage1 giova/gpa MSI doorbell mapping
+ * @unbind_guest_msi: withdraw a stage1 giova/gpa MSI doorbell mapping
  * @pgsize_bitmap: bitmap of all possible supported page sizes
  */
 struct iommu_ops {
@@ -334,6 +336,10 @@ struct iommu_ops {
 	int (*cache_invalidate)(struct iommu_domain *domain, struct device *dev,
 				struct iommu_cache_invalidate_info *inv_info);
 
+	int (*bind_guest_msi)(struct iommu_domain *domain,
+			      dma_addr_t giova, phys_addr_t gpa, size_t size);
+	void (*unbind_guest_msi)(struct iommu_domain *domain, dma_addr_t giova);
+
 	unsigned long pgsize_bitmap;
 };
 
@@ -448,6 +454,11 @@ extern void iommu_detach_pasid_table(struct iommu_domain *domain);
 extern int iommu_cache_invalidate(struct iommu_domain *domain,
 				  struct device *dev,
 				  struct iommu_cache_invalidate_info *inv_info);
+extern int iommu_bind_guest_msi(struct iommu_domain *domain,
+				dma_addr_t giova, phys_addr_t gpa, size_t size);
+extern void iommu_unbind_guest_msi(struct iommu_domain *domain,
+				   dma_addr_t giova);
+
 extern struct iommu_domain *iommu_get_domain_for_dev(struct device *dev);
 extern struct iommu_domain *iommu_get_dma_domain(struct device *dev);
 extern int iommu_map(struct iommu_domain *domain, unsigned long iova,
@@ -1000,6 +1011,15 @@ iommu_cache_invalidate(struct iommu_domain *domain,
 	return -ENODEV;
 }
 
+static inline
+int iommu_bind_guest_msi(struct iommu_domain *domain,
+			 dma_addr_t giova, phys_addr_t gpa, size_t size)
+{
+	return -ENODEV;
+}
+static inline
+void iommu_unbind_guest_msi(struct iommu_domain *domain, dma_addr_t giova) {}
+
 #endif /* CONFIG_IOMMU_API */
 
 #ifdef CONFIG_IOMMU_DEBUGFS
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
