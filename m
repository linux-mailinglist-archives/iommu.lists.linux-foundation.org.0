Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id CE640341D62
	for <lists.iommu@lfdr.de>; Fri, 19 Mar 2021 13:52:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5581183C54;
	Fri, 19 Mar 2021 12:52:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VARXhxupBirb; Fri, 19 Mar 2021 12:52:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5554983C3E;
	Fri, 19 Mar 2021 12:52:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27619C000B;
	Fri, 19 Mar 2021 12:52:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A01C2C0001
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 12:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E68F83C3E
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 12:52:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GKagcVtfoS3e for <iommu@lists.linux-foundation.org>;
 Fri, 19 Mar 2021 12:52:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AD2783C38
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 12:52:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BBCD31B;
 Fri, 19 Mar 2021 05:52:06 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
 [10.1.196.41])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E3D323F718;
 Fri, 19 Mar 2021 05:52:05 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: joro@8bytes.org
Subject: [PATCH 1/2] iommu: Statically set module owner
Date: Fri, 19 Mar 2021 12:52:01 +0000
Message-Id: <f4de29d8330981301c1935e667b507254a2691ae.1616157612.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.21.0.dirty
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, will@kernel.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

It happens that the 3 drivers which first supported being modular are
also ones which play games with their pgsize_bitmap, so have non-const
iommu_ops where dynamically setting the owner manages to work out OK.
However, it's less than ideal to force that upon all drivers which want
to be modular - like the new sprd-iommu driver which now has a potential
bug in that regard - so let's just statically set the module owner and
let ops remain const wherever possible.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

This is something I hadn't got round to sending earlier, so now rebased
onto iommu/next to accommodate the new driver :)

 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 1 +
 drivers/iommu/arm/arm-smmu/arm-smmu.c       | 1 +
 drivers/iommu/sprd-iommu.c                  | 1 +
 drivers/iommu/virtio-iommu.c                | 1 +
 include/linux/iommu.h                       | 9 +--------
 5 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 8594b4a83043..b82000519af6 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2632,6 +2632,7 @@ static struct iommu_ops arm_smmu_ops = {
 	.sva_unbind		= arm_smmu_sva_unbind,
 	.sva_get_pasid		= arm_smmu_sva_get_pasid,
 	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
+	.owner			= THIS_MODULE,
 };
 
 /* Probing and initialisation functions */
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index d8c6bfde6a61..11ca963c4b93 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -1638,6 +1638,7 @@ static struct iommu_ops arm_smmu_ops = {
 	.put_resv_regions	= generic_iommu_put_resv_regions,
 	.def_domain_type	= arm_smmu_def_domain_type,
 	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
+	.owner			= THIS_MODULE,
 };
 
 static void arm_smmu_device_reset(struct arm_smmu_device *smmu)
diff --git a/drivers/iommu/sprd-iommu.c b/drivers/iommu/sprd-iommu.c
index 7100ed17dcce..024a0cdd26a6 100644
--- a/drivers/iommu/sprd-iommu.c
+++ b/drivers/iommu/sprd-iommu.c
@@ -436,6 +436,7 @@ static const struct iommu_ops sprd_iommu_ops = {
 	.device_group	= sprd_iommu_device_group,
 	.of_xlate	= sprd_iommu_of_xlate,
 	.pgsize_bitmap	= ~0UL << SPRD_IOMMU_PAGE_SHIFT,
+	.owner		= THIS_MODULE,
 };
 
 static const struct of_device_id sprd_iommu_of_match[] = {
diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
index 2bfdd5734844..594ed827e944 100644
--- a/drivers/iommu/virtio-iommu.c
+++ b/drivers/iommu/virtio-iommu.c
@@ -945,6 +945,7 @@ static struct iommu_ops viommu_ops = {
 	.get_resv_regions	= viommu_get_resv_regions,
 	.put_resv_regions	= generic_iommu_put_resv_regions,
 	.of_xlate		= viommu_of_xlate,
+	.owner			= THIS_MODULE,
 };
 
 static int viommu_init_vqs(struct viommu_dev *viommu)
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 5e7fe519430a..dce8c5e12ea0 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -379,19 +379,12 @@ int  iommu_device_link(struct iommu_device   *iommu, struct device *link);
 void iommu_device_unlink(struct iommu_device *iommu, struct device *link);
 int iommu_deferred_attach(struct device *dev, struct iommu_domain *domain);
 
-static inline void __iommu_device_set_ops(struct iommu_device *iommu,
+static inline void iommu_device_set_ops(struct iommu_device *iommu,
 					  const struct iommu_ops *ops)
 {
 	iommu->ops = ops;
 }
 
-#define iommu_device_set_ops(iommu, ops)				\
-do {									\
-	struct iommu_ops *__ops = (struct iommu_ops *)(ops);		\
-	__ops->owner = THIS_MODULE;					\
-	__iommu_device_set_ops(iommu, __ops);				\
-} while (0)
-
 static inline void iommu_device_set_fwnode(struct iommu_device *iommu,
 					   struct fwnode_handle *fwnode)
 {
-- 
2.21.0.dirty

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
