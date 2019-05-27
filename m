Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4DC2B0C2
	for <lists.iommu@lfdr.de>; Mon, 27 May 2019 10:56:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8040E1619;
	Mon, 27 May 2019 08:56:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 80A171605
	for <iommu@lists.linux-foundation.org>;
	Mon, 27 May 2019 08:56:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EEF7D13A
	for <iommu@lists.linux-foundation.org>;
	Mon, 27 May 2019 08:56:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 600C0883BA;
	Mon, 27 May 2019 08:56:03 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-67.ams2.redhat.com [10.36.116.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D7DA5D978;
	Mon, 27 May 2019 08:55:56 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, joro@8bytes.org,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	dwmw2@infradead.org, lorenzo.pieralisi@arm.com, robin.murphy@arm.com,
	will.deacon@arm.com, hanjun.guo@linaro.org, sudeep.holla@arm.com
Subject: [PATCH v4 2/8] iommu: Pass a GFP flag parameter to
	iommu_alloc_resv_region()
Date: Mon, 27 May 2019 10:55:35 +0200
Message-Id: <20190527085541.5294-3-eric.auger@redhat.com>
In-Reply-To: <20190527085541.5294-1-eric.auger@redhat.com>
References: <20190527085541.5294-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 27 May 2019 08:56:03 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: alex.williamson@redhat.com
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

We plan to call iommu_alloc_resv_region in a non preemptible section.
Pass a GFP flag to the function and update all the call sites.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 drivers/acpi/arm64/iort.c   | 3 ++-
 drivers/iommu/amd_iommu.c   | 7 ++++---
 drivers/iommu/arm-smmu-v3.c | 2 +-
 drivers/iommu/arm-smmu.c    | 2 +-
 drivers/iommu/intel-iommu.c | 4 ++--
 drivers/iommu/iommu.c       | 7 ++++---
 include/linux/iommu.h       | 2 +-
 7 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
index b5390b4c9ade..2d922db4978e 100644
--- a/drivers/acpi/arm64/iort.c
+++ b/drivers/acpi/arm64/iort.c
@@ -843,7 +843,8 @@ int iort_iommu_msi_get_resv_regions(struct device *dev, struct list_head *head)
 			struct iommu_resv_region *region;
 
 			region = iommu_alloc_resv_region(base + SZ_64K, SZ_64K,
-							 prot, IOMMU_RESV_MSI);
+							 prot, IOMMU_RESV_MSI,
+							 GFP_KERNEL);
 			if (region) {
 				list_add_tail(&region->list, head);
 				resv++;
diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index 09c9e45f7fa2..f2eb8e9cd8a6 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -3136,7 +3136,8 @@ static void amd_iommu_get_resv_regions(struct device *dev,
 			type = IOMMU_RESV_RESERVED;
 
 		region = iommu_alloc_resv_region(entry->address_start,
-						 length, prot, type);
+						 length, prot, type,
+						 GFP_KERNEL);
 		if (!region) {
 			dev_err(dev, "Out of memory allocating dm-regions\n");
 			return;
@@ -3146,14 +3147,14 @@ static void amd_iommu_get_resv_regions(struct device *dev,
 
 	region = iommu_alloc_resv_region(MSI_RANGE_START,
 					 MSI_RANGE_END - MSI_RANGE_START + 1,
-					 0, IOMMU_RESV_MSI);
+					 0, IOMMU_RESV_MSI, GFP_KERNEL);
 	if (!region)
 		return;
 	list_add_tail(&region->list, head);
 
 	region = iommu_alloc_resv_region(HT_RANGE_START,
 					 HT_RANGE_END - HT_RANGE_START + 1,
-					 0, IOMMU_RESV_RESERVED);
+					 0, IOMMU_RESV_RESERVED, GFP_KERNEL);
 	if (!region)
 		return;
 	list_add_tail(&region->list, head);
diff --git a/drivers/iommu/arm-smmu-v3.c b/drivers/iommu/arm-smmu-v3.c
index 4d5a694f02c2..f9b1279ef5bf 100644
--- a/drivers/iommu/arm-smmu-v3.c
+++ b/drivers/iommu/arm-smmu-v3.c
@@ -2226,7 +2226,7 @@ static void arm_smmu_get_resv_regions(struct device *dev,
 	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
 
 	region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
-					 prot, IOMMU_RESV_SW_MSI);
+					 prot, IOMMU_RESV_SW_MSI, GFP_KERNEL);
 	if (!region)
 		return;
 
diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 5e54cc0a28b3..646e76813e91 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -1670,7 +1670,7 @@ static void arm_smmu_get_resv_regions(struct device *dev,
 	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
 
 	region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
-					 prot, IOMMU_RESV_SW_MSI);
+					 prot, IOMMU_RESV_SW_MSI, GFP_KERNEL);
 	if (!region)
 		return;
 
diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index a209199f3af6..2be36dff189a 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -4220,7 +4220,7 @@ int __init dmar_parse_one_rmrr(struct acpi_dmar_header *header, void *arg)
 
 	length = rmrr->end_address - rmrr->base_address + 1;
 	rmrru->resv = iommu_alloc_resv_region(rmrr->base_address, length, prot,
-					      IOMMU_RESV_DIRECT);
+					      IOMMU_RESV_DIRECT, GFP_KERNEL);
 	if (!rmrru->resv)
 		goto free_rmrru;
 
@@ -5489,7 +5489,7 @@ static void intel_iommu_get_resv_regions(struct device *device,
 
 	reg = iommu_alloc_resv_region(IOAPIC_RANGE_START,
 				      IOAPIC_RANGE_END - IOAPIC_RANGE_START + 1,
-				      0, IOMMU_RESV_MSI);
+				      0, IOMMU_RESV_MSI, GFP_KERNEL);
 	if (!reg)
 		return;
 	list_add_tail(&reg->list, head);
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index f961f71e4ff8..7dd1a57217e3 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -259,7 +259,7 @@ static int iommu_insert_resv_region(struct iommu_resv_region *new,
 	}
 insert:
 	region = iommu_alloc_resv_region(new->start, new->length,
-					 new->prot, new->type);
+					 new->prot, new->type, GFP_KERNEL);
 	if (!region)
 		return -ENOMEM;
 
@@ -1893,11 +1893,12 @@ void iommu_put_resv_regions(struct device *dev, struct list_head *list)
 
 struct iommu_resv_region *iommu_alloc_resv_region(phys_addr_t start,
 						  size_t length, int prot,
-						  enum iommu_resv_type type)
+						  enum iommu_resv_type type,
+						  gfp_t flags)
 {
 	struct iommu_resv_region *region;
 
-	region = kzalloc(sizeof(*region), GFP_KERNEL);
+	region = kzalloc(sizeof(*region), flags);
 	if (!region)
 		return NULL;
 
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index a815cf6f6f47..ba91666998fb 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -364,7 +364,7 @@ extern void iommu_put_resv_regions(struct device *dev, struct list_head *list);
 extern int iommu_request_dm_for_dev(struct device *dev);
 extern struct iommu_resv_region *
 iommu_alloc_resv_region(phys_addr_t start, size_t length, int prot,
-			enum iommu_resv_type type);
+			enum iommu_resv_type type, gfp_t flags);
 extern int iommu_get_group_resv_regions(struct iommu_group *group,
 					struct list_head *head);
 
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
