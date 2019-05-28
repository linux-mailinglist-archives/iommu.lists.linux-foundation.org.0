Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A77B2C5C4
	for <lists.iommu@lfdr.de>; Tue, 28 May 2019 13:51:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 865D51C45;
	Tue, 28 May 2019 11:51:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E7B521B97
	for <iommu@lists.linux-foundation.org>;
	Tue, 28 May 2019 11:50:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7256E7D2
	for <iommu@lists.linux-foundation.org>;
	Tue, 28 May 2019 11:50:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DA9D2307D971;
	Tue, 28 May 2019 11:50:46 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 522E15D9CC;
	Tue, 28 May 2019 11:50:43 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, joro@8bytes.org,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	dwmw2@infradead.org, robin.murphy@arm.com
Subject: [PATCH v5 2/7] iommu/vt-d: Duplicate iommu_resv_region objects per
	device list
Date: Tue, 28 May 2019 13:50:20 +0200
Message-Id: <20190528115025.17194-3-eric.auger@redhat.com>
In-Reply-To: <20190528115025.17194-1-eric.auger@redhat.com>
References: <20190528115025.17194-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Tue, 28 May 2019 11:50:47 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: jean-philippe.brucker@arm.com, alex.williamson@redhat.com
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

intel_iommu_get_resv_regions() aims to return the list of
reserved regions accessible by a given @device. However several
devices can access the same reserved memory region and when
building the list it is not safe to use a single iommu_resv_region
object, whose container is the RMRR. This iommu_resv_region must
be duplicated per device reserved region list.

Let's remove the struct iommu_resv_region from the RMRR unit
and allocate the iommu_resv_region directly in
intel_iommu_get_resv_regions(). We hold the dmar_global_lock instead
of the rcu-lock to allow sleeping.

Fixes: 0659b8dc45a6 ("iommu/vt-d: Implement reserved region get/put callbacks")
Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v4 -> v5
- replace rcu-lock by the dmar_global_lock
---
 drivers/iommu/intel-iommu.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index a209199f3af6..5ec8b5bd308f 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -322,7 +322,6 @@ struct dmar_rmrr_unit {
 	u64	end_address;		/* reserved end address */
 	struct dmar_dev_scope *devices;	/* target devices */
 	int	devices_cnt;		/* target device count */
-	struct iommu_resv_region *resv; /* reserved region handle */
 };
 
 struct dmar_atsr_unit {
@@ -4205,7 +4204,6 @@ static inline void init_iommu_pm_ops(void) {}
 int __init dmar_parse_one_rmrr(struct acpi_dmar_header *header, void *arg)
 {
 	struct acpi_dmar_reserved_memory *rmrr;
-	int prot = DMA_PTE_READ|DMA_PTE_WRITE;
 	struct dmar_rmrr_unit *rmrru;
 	size_t length;
 
@@ -4219,22 +4217,16 @@ int __init dmar_parse_one_rmrr(struct acpi_dmar_header *header, void *arg)
 	rmrru->end_address = rmrr->end_address;
 
 	length = rmrr->end_address - rmrr->base_address + 1;
-	rmrru->resv = iommu_alloc_resv_region(rmrr->base_address, length, prot,
-					      IOMMU_RESV_DIRECT);
-	if (!rmrru->resv)
-		goto free_rmrru;
 
 	rmrru->devices = dmar_alloc_dev_scope((void *)(rmrr + 1),
 				((void *)rmrr) + rmrr->header.length,
 				&rmrru->devices_cnt);
 	if (rmrru->devices_cnt && rmrru->devices == NULL)
-		goto free_all;
+		goto free_rmrru;
 
 	list_add(&rmrru->list, &dmar_rmrr_units);
 
 	return 0;
-free_all:
-	kfree(rmrru->resv);
 free_rmrru:
 	kfree(rmrru);
 out:
@@ -4452,7 +4444,6 @@ static void intel_iommu_free_dmars(void)
 	list_for_each_entry_safe(rmrru, rmrr_n, &dmar_rmrr_units, list) {
 		list_del(&rmrru->list);
 		dmar_free_dev_scope(&rmrru->devices, &rmrru->devices_cnt);
-		kfree(rmrru->resv);
 		kfree(rmrru);
 	}
 
@@ -5470,22 +5461,33 @@ static void intel_iommu_remove_device(struct device *dev)
 static void intel_iommu_get_resv_regions(struct device *device,
 					 struct list_head *head)
 {
+	int prot = DMA_PTE_READ|DMA_PTE_WRITE;
 	struct iommu_resv_region *reg;
 	struct dmar_rmrr_unit *rmrr;
 	struct device *i_dev;
 	int i;
 
-	rcu_read_lock();
+	down_write(&dmar_global_lock);
 	for_each_rmrr_units(rmrr) {
 		for_each_active_dev_scope(rmrr->devices, rmrr->devices_cnt,
 					  i, i_dev) {
+			struct iommu_resv_region *resv;
+			size_t length;
+
 			if (i_dev != device)
 				continue;
 
-			list_add_tail(&rmrr->resv->list, head);
+			length = rmrr->end_address - rmrr->base_address + 1;
+			resv = iommu_alloc_resv_region(rmrr->base_address,
+						       length, prot,
+						       IOMMU_RESV_DIRECT);
+			if (!resv)
+				break;
+
+			list_add_tail(&resv->list, head);
 		}
 	}
-	rcu_read_unlock();
+	up_write(&dmar_global_lock);
 
 	reg = iommu_alloc_resv_region(IOAPIC_RANGE_START,
 				      IOAPIC_RANGE_END - IOAPIC_RANGE_START + 1,
@@ -5500,10 +5502,8 @@ static void intel_iommu_put_resv_regions(struct device *dev,
 {
 	struct iommu_resv_region *entry, *next;
 
-	list_for_each_entry_safe(entry, next, head, list) {
-		if (entry->type == IOMMU_RESV_MSI)
-			kfree(entry);
-	}
+	list_for_each_entry_safe(entry, next, head, list)
+		kfree(entry);
 }
 
 int intel_iommu_enable_pasid(struct intel_iommu *iommu, struct device *dev)
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
