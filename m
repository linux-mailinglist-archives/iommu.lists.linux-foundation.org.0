Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FA418D39F
	for <lists.iommu@lfdr.de>; Fri, 20 Mar 2020 17:10:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 32AE688A2D;
	Fri, 20 Mar 2020 16:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lyBafK+SearA; Fri, 20 Mar 2020 16:10:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 790C388904;
	Fri, 20 Mar 2020 16:10:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62D0FC07FF;
	Fri, 20 Mar 2020 16:10:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E40EC07FF
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 16:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 663CD25C36
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 16:10:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7CuBc910D8iq for <iommu@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 16:10:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by silver.osuosl.org (Postfix) with ESMTPS id 8321E2549C
 for <iommu@lists.linux-foundation.org>; Fri, 20 Mar 2020 16:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584720599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fj2Gz7QpZFrwKBONHyte4LLdAcC5Efv46DEPC6CkuRM=;
 b=MzUbQ3/zeZ7l9EjNjxbLD5kRK/ob/7LHICvC3GuabZCP9urTA8oKWjTcM9VM9VFN2linAV
 pQyJgF5OxiAatuimrwjmvb5NjnPcgYCpqYX5jEtnQPbhR9mTaemLOJ5WUEJ+7xwXu8Z/o6
 PL2JMCLgvhXenIfRTUOEphSUXdFBaTI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-x_jviQqPNz2h5iKzxecxiA-1; Fri, 20 Mar 2020 12:09:57 -0400
X-MC-Unique: x_jviQqPNz2h5iKzxecxiA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 844BA13EA;
 Fri, 20 Mar 2020 16:09:55 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD30A5C1D8;
 Fri, 20 Mar 2020 16:09:50 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, joro@8bytes.org,
 alex.williamson@redhat.com, jacob.jun.pan@linux.intel.com,
 yi.l.liu@intel.com, jean-philippe.brucker@arm.com, will.deacon@arm.com,
 robin.murphy@arm.com
Subject: [PATCH v10 02/13] iommu: Introduce bind/unbind_guest_msi
Date: Fri, 20 Mar 2020 17:09:21 +0100
Message-Id: <20200320160932.27222-3-eric.auger@redhat.com>
In-Reply-To: <20200320160932.27222-1-eric.auger@redhat.com>
References: <20200320160932.27222-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: marc.zyngier@arm.com, peter.maydell@linaro.org
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
 include/linux/iommu.h | 19 +++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 7cfc285bac17..ceef73cb088a 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1756,6 +1756,43 @@ static void __iommu_detach_device(struct iommu_domain *domain,
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
index d91c7912ec3d..c698272913b8 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -250,6 +250,8 @@ struct iommu_iotlb_gather {
  * @sva_unbind_gpasid: unbind guest pasid and mm
  * @attach_pasid_table: attach a pasid table
  * @detach_pasid_table: detach the pasid table
+ * @bind_guest_msi: provides a stage1 giova/gpa MSI doorbell mapping
+ * @unbind_guest_msi: withdraw a stage1 giova/gpa MSI doorbell mapping
  * @pgsize_bitmap: bitmap of all possible supported page sizes
  * @owner: Driver module providing these ops
  */
@@ -323,6 +325,10 @@ struct iommu_ops {
 
 	int (*sva_unbind_gpasid)(struct device *dev, int pasid);
 
+	int (*bind_guest_msi)(struct iommu_domain *domain,
+			      dma_addr_t giova, phys_addr_t gpa, size_t size);
+	void (*unbind_guest_msi)(struct iommu_domain *domain, dma_addr_t giova);
+
 	unsigned long pgsize_bitmap;
 	struct module *owner;
 };
@@ -451,6 +457,10 @@ extern int iommu_sva_unbind_gpasid(struct iommu_domain *domain,
 extern int iommu_attach_pasid_table(struct iommu_domain *domain,
 				    struct iommu_pasid_table_config *cfg);
 extern void iommu_detach_pasid_table(struct iommu_domain *domain);
+extern int iommu_bind_guest_msi(struct iommu_domain *domain,
+				dma_addr_t giova, phys_addr_t gpa, size_t size);
+extern void iommu_unbind_guest_msi(struct iommu_domain *domain,
+				   dma_addr_t giova);
 extern struct iommu_domain *iommu_get_domain_for_dev(struct device *dev);
 extern struct iommu_domain *iommu_get_dma_domain(struct device *dev);
 extern int iommu_map(struct iommu_domain *domain, unsigned long iova,
@@ -1091,6 +1101,15 @@ static inline int iommu_sva_unbind_gpasid(struct iommu_domain *domain,
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
