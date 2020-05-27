Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9452E1E4084
	for <lists.iommu@lfdr.de>; Wed, 27 May 2020 13:53:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D76C18878A;
	Wed, 27 May 2020 11:53:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CJk-xY3c-vGz; Wed, 27 May 2020 11:53:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2156A88792;
	Wed, 27 May 2020 11:53:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D52AC088D;
	Wed, 27 May 2020 11:53:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AAF6BC016F
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 11:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 992B288767
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 11:53:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JgOlHFefon8v for <iommu@lists.linux-foundation.org>;
 Wed, 27 May 2020 11:53:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CE19688738
 for <iommu@lists.linux-foundation.org>; Wed, 27 May 2020 11:53:27 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 802793C3; Wed, 27 May 2020 13:53:23 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 02/10] iommu/amd: Unexport get_dev_data()
Date: Wed, 27 May 2020 13:53:05 +0200
Message-Id: <20200527115313.7426-3-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200527115313.7426-1-joro@8bytes.org>
References: <20200527115313.7426-1-joro@8bytes.org>
Cc: iommu@lists.linux-foundation.org, jroedel@suse.de,
 linux-kernel@vger.kernel.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

From: Joerg Roedel <jroedel@suse.de>

This function is internal to the AMD IOMMU driver and only exported
because the amd_iommu_v2 modules calls it. But the reason it is called
from there could better be handled by amd_iommu_is_attach_deferred().
So unexport get_dev_data() and use amd_iommu_is_attach_deferred()
instead.

Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/amd/amd_iommu_proto.h |  3 ++-
 drivers/iommu/amd/iommu.c           |  9 +++++----
 drivers/iommu/amd/iommu_v2.c        | 10 ++++------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/amd/amd_iommu_proto.h b/drivers/iommu/amd/amd_iommu_proto.h
index 92c2ba6468a0..1c6c12c11368 100644
--- a/drivers/iommu/amd/amd_iommu_proto.h
+++ b/drivers/iommu/amd/amd_iommu_proto.h
@@ -92,5 +92,6 @@ static inline void *iommu_phys_to_virt(unsigned long paddr)
 }
 
 extern bool translation_pre_enabled(struct amd_iommu *iommu);
-extern struct iommu_dev_data *get_dev_data(struct device *dev);
+extern bool amd_iommu_is_attach_deferred(struct iommu_domain *domain,
+					 struct device *dev);
 #endif /* _ASM_X86_AMD_IOMMU_PROTO_H  */
diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 39155f550f18..8368f6b9c17f 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -280,11 +280,10 @@ static struct iommu_dev_data *find_dev_data(u16 devid)
 	return dev_data;
 }
 
-struct iommu_dev_data *get_dev_data(struct device *dev)
+static struct iommu_dev_data *get_dev_data(struct device *dev)
 {
 	return dev->archdata.iommu;
 }
-EXPORT_SYMBOL(get_dev_data);
 
 /*
 * Find or create an IOMMU group for a acpihid device.
@@ -2706,12 +2705,14 @@ static void amd_iommu_get_resv_regions(struct device *dev,
 	list_add_tail(&region->list, head);
 }
 
-static bool amd_iommu_is_attach_deferred(struct iommu_domain *domain,
-					 struct device *dev)
+bool amd_iommu_is_attach_deferred(struct iommu_domain *domain,
+				  struct device *dev)
 {
 	struct iommu_dev_data *dev_data = dev->archdata.iommu;
+
 	return dev_data->defer_attach;
 }
+EXPORT_SYMBOL_GPL(amd_iommu_is_attach_deferred);
 
 static void amd_iommu_flush_iotlb_all(struct iommu_domain *domain)
 {
diff --git a/drivers/iommu/amd/iommu_v2.c b/drivers/iommu/amd/iommu_v2.c
index d6d85debd01b..9b6e038150c1 100644
--- a/drivers/iommu/amd/iommu_v2.c
+++ b/drivers/iommu/amd/iommu_v2.c
@@ -517,13 +517,12 @@ static int ppr_notifier(struct notifier_block *nb, unsigned long e, void *data)
 	struct amd_iommu_fault *iommu_fault;
 	struct pasid_state *pasid_state;
 	struct device_state *dev_state;
+	struct pci_dev *pdev = NULL;
 	unsigned long flags;
 	struct fault *fault;
 	bool finish;
 	u16 tag, devid;
 	int ret;
-	struct iommu_dev_data *dev_data;
-	struct pci_dev *pdev = NULL;
 
 	iommu_fault = data;
 	tag         = iommu_fault->tag & 0x1ff;
@@ -534,12 +533,11 @@ static int ppr_notifier(struct notifier_block *nb, unsigned long e, void *data)
 					   devid & 0xff);
 	if (!pdev)
 		return -ENODEV;
-	dev_data = get_dev_data(&pdev->dev);
 
-	/* In kdump kernel pci dev is not initialized yet -> send INVALID */
 	ret = NOTIFY_DONE;
-	if (translation_pre_enabled(amd_iommu_rlookup_table[devid])
-		&& dev_data->defer_attach) {
+
+	/* In kdump kernel pci dev is not initialized yet -> send INVALID */
+	if (amd_iommu_is_attach_deferred(NULL, &pdev->dev)) {
 		amd_iommu_complete_ppr(pdev, iommu_fault->pasid,
 				       PPR_INVALID, tag);
 		goto out;
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
