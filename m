Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C463713E477
	for <lists.iommu@lfdr.de>; Thu, 16 Jan 2020 18:08:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 65B4F87E6C;
	Thu, 16 Jan 2020 17:08:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5gMlSjYSYt3z; Thu, 16 Jan 2020 17:08:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 58C1687E49;
	Thu, 16 Jan 2020 17:08:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2CD40C1D8B;
	Thu, 16 Jan 2020 17:08:36 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90B40C077D
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jan 2020 17:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7D3A586B48
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jan 2020 17:08:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8h+P65JHza5I for <iommu@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 17:08:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9843286B67
 for <iommu@lists.linux-foundation.org>; Thu, 16 Jan 2020 17:08:31 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A119820730;
 Thu, 16 Jan 2020 17:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579194511;
 bh=MZ9fc9+Qe71NXpXtNs8hJaoifX6fu22gUoKsJSqUd4A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OWjohxbv1qhr0cRVY1+aRyAUinoN9ZbqYLyyd/J9w+Go7hLwHhoEsX/nu4suhAECI
 aIrA0PHah5fV3aotvnrQCbx90WsturDI24b6wVM6bOmhIzYFLLmh4j0x/nYvZfi4m3
 reCMnnOZ9zFcOwUkhjDRO+RVqT4VG15KHNyoX970=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 405/671] iommu/vt-d: Duplicate iommu_resv_region
 objects per device list
Date: Thu, 16 Jan 2020 12:00:43 -0500
Message-Id: <20200116170509.12787-142-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116170509.12787-1-sashal@kernel.org>
References: <20200116170509.12787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, iommu@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>
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

From: Eric Auger <eric.auger@redhat.com>

[ Upstream commit 5f64ce5411b467f1cfea6c63e2494c22b773582b ]

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
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/intel-iommu.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
index abbbc614c522..9df3b8441227 100644
--- a/drivers/iommu/intel-iommu.c
+++ b/drivers/iommu/intel-iommu.c
@@ -387,7 +387,6 @@ struct dmar_rmrr_unit {
 	u64	end_address;		/* reserved end address */
 	struct dmar_dev_scope *devices;	/* target devices */
 	int	devices_cnt;		/* target device count */
-	struct iommu_resv_region *resv; /* reserved region handle */
 };
 
 struct dmar_atsr_unit {
@@ -4185,7 +4184,6 @@ static inline void init_iommu_pm_ops(void) {}
 int __init dmar_parse_one_rmrr(struct acpi_dmar_header *header, void *arg)
 {
 	struct acpi_dmar_reserved_memory *rmrr;
-	int prot = DMA_PTE_READ|DMA_PTE_WRITE;
 	struct dmar_rmrr_unit *rmrru;
 	size_t length;
 
@@ -4199,22 +4197,16 @@ int __init dmar_parse_one_rmrr(struct acpi_dmar_header *header, void *arg)
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
@@ -4432,7 +4424,6 @@ static void intel_iommu_free_dmars(void)
 	list_for_each_entry_safe(rmrru, rmrr_n, &dmar_rmrr_units, list) {
 		list_del(&rmrru->list);
 		dmar_free_dev_scope(&rmrru->devices, &rmrru->devices_cnt);
-		kfree(rmrru->resv);
 		kfree(rmrru);
 	}
 
@@ -5206,22 +5197,33 @@ static void intel_iommu_remove_device(struct device *dev)
 static void intel_iommu_get_resv_regions(struct device *device,
 					 struct list_head *head)
 {
+	int prot = DMA_PTE_READ | DMA_PTE_WRITE;
 	struct iommu_resv_region *reg;
 	struct dmar_rmrr_unit *rmrr;
 	struct device *i_dev;
 	int i;
 
-	rcu_read_lock();
+	down_read(&dmar_global_lock);
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
+	up_read(&dmar_global_lock);
 
 	reg = iommu_alloc_resv_region(IOAPIC_RANGE_START,
 				      IOAPIC_RANGE_END - IOAPIC_RANGE_START + 1,
@@ -5236,10 +5238,8 @@ static void intel_iommu_put_resv_regions(struct device *dev,
 {
 	struct iommu_resv_region *entry, *next;
 
-	list_for_each_entry_safe(entry, next, head, list) {
-		if (entry->type == IOMMU_RESV_MSI)
-			kfree(entry);
-	}
+	list_for_each_entry_safe(entry, next, head, list)
+		kfree(entry);
 }
 
 #ifdef CONFIG_INTEL_IOMMU_SVM
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
