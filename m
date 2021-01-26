Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCC8303C2B
	for <lists.iommu@lfdr.de>; Tue, 26 Jan 2021 12:54:04 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 515308703C;
	Tue, 26 Jan 2021 11:54:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rxacSyLWZwCk; Tue, 26 Jan 2021 11:54:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9CC3A87004;
	Tue, 26 Jan 2021 11:54:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96BA2C013A;
	Tue, 26 Jan 2021 11:54:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BEF70C013A
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 11:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AE750866E3
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 11:54:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sxIArMaVU-mh for <iommu@lists.linux-foundation.org>;
 Tue, 26 Jan 2021 11:54:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7CEFB866A8
 for <iommu@lists.linux-foundation.org>; Tue, 26 Jan 2021 11:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611662039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:in-reply-to:in-reply-to:references:references;
 bh=lu9/PZN6EuVk/z3XNYlg5mJrwNIE9biPlhKJVxceJZ4=;
 b=IaFllKxfKiA2EmnvqOLkg439gj7R22DuTKohInuRI6/JPkRs1werNBp3eu1JPFGwbNU2vX
 0hkOZLRQXuzr3Wftf720kaxnmaSVXhi9WW/TS0oe6q7mPOgFEpg8Z63jF9ERdA0nPHqucc
 83hI632/ZOmxpEwgYO9E1Guv30jKD0A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-oW5-O8WNNj-ttep1JWpU3w-1; Tue, 26 Jan 2021 06:53:55 -0500
X-MC-Unique: oW5-O8WNNj-ttep1JWpU3w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED00615724;
 Tue, 26 Jan 2021 11:53:53 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-12-72.pek2.redhat.com
 [10.72.12.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F01C510023AB;
 Tue, 26 Jan 2021 11:53:49 +0000 (UTC)
From: Lianbo Jiang <lijiang@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] iommu: use the __iommu_attach_device() directly for
 deferred attach
Date: Tue, 26 Jan 2021 19:53:37 +0800
Message-Id: <20210126115337.20068-3-lijiang@redhat.com>
In-Reply-To: <20210126115337.20068-1-lijiang@redhat.com>
References: <20210126115337.20068-1-lijiang@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: thomas.lendacky@amd.com, will@kernel.org, hch@infradead.org,
 iommu@lists.linux-foundation.org, robin.murphy@arm.com
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

Currently, because domain attach allows to be deferred from iommu
driver to device driver, and when iommu initializes, the devices
on the bus will be scanned and the default groups will be allocated.

Due to the above changes, some devices could be added to the same
group as below:

[    3.859417] pci 0000:01:00.0: Adding to iommu group 16
[    3.864572] pci 0000:01:00.1: Adding to iommu group 16
[    3.869738] pci 0000:02:00.0: Adding to iommu group 17
[    3.874892] pci 0000:02:00.1: Adding to iommu group 17

But when attaching these devices, it doesn't allow that a group has
more than one device, otherwise it will return an error. This conflicts
with the deferred attaching. Unfortunately, it has two devices in the
same group for my side, for example:

[    9.627014] iommu_group_device_count(): device name[0]:0000:01:00.0
[    9.633545] iommu_group_device_count(): device name[1]:0000:01:00.1
...
[   10.255609] iommu_group_device_count(): device name[0]:0000:02:00.0
[   10.262144] iommu_group_device_count(): device name[1]:0000:02:00.1

Finally, which caused the failure of tg3 driver when tg3 driver calls
the dma_alloc_coherent() to allocate coherent memory in the tg3_test_dma().

[    9.660310] tg3 0000:01:00.0: DMA engine test failed, aborting
[    9.754085] tg3: probe of 0000:01:00.0 failed with error -12
[    9.997512] tg3 0000:01:00.1: DMA engine test failed, aborting
[   10.043053] tg3: probe of 0000:01:00.1 failed with error -12
[   10.288905] tg3 0000:02:00.0: DMA engine test failed, aborting
[   10.334070] tg3: probe of 0000:02:00.0 failed with error -12
[   10.578303] tg3 0000:02:00.1: DMA engine test failed, aborting
[   10.622629] tg3: probe of 0000:02:00.1 failed with error -12

In addition, the similar situations also occur in other drivers such
as the bnxt_en driver. That can be reproduced easily in kdump kernel
when SME is active.

Let's move the handling currently in iommu_dma_deferred_attach() into
the iommu core code so that it can call the __iommu_attach_device()
directly instead of the iommu_attach_device(). The external interface
iommu_attach_device() is not suitable for handling this situation.

Signed-off-by: Lianbo Jiang <lijiang@redhat.com>
---
 drivers/iommu/dma-iommu.c | 18 +++---------------
 drivers/iommu/iommu.c     | 10 ++++++++++
 include/linux/iommu.h     |  1 +
 3 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index c80056f6c9f9..f659395e7959 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -380,18 +380,6 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
 	return iova_reserve_iommu_regions(dev, domain);
 }
 
-static int iommu_dma_deferred_attach(struct device *dev,
-		struct iommu_domain *domain)
-{
-	const struct iommu_ops *ops = domain->ops;
-
-	if (unlikely(ops->is_attach_deferred &&
-			ops->is_attach_deferred(domain, dev)))
-		return iommu_attach_device(domain, dev);
-
-	return 0;
-}
-
 /**
  * dma_info_to_prot - Translate DMA API directions and attributes to IOMMU API
  *                    page flags.
@@ -535,7 +523,7 @@ static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
 	dma_addr_t iova;
 
 	if (static_branch_unlikely(&iommu_deferred_attach_enabled) &&
-	    iommu_dma_deferred_attach(dev, domain))
+	    iommu_deferred_attach(dev, domain))
 		return DMA_MAPPING_ERROR;
 
 	size = iova_align(iovad, size + iova_off);
@@ -694,7 +682,7 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
 	*dma_handle = DMA_MAPPING_ERROR;
 
 	if (static_branch_unlikely(&iommu_deferred_attach_enabled) &&
-	    iommu_dma_deferred_attach(dev, domain))
+	    iommu_deferred_attach(dev, domain))
 		return NULL;
 
 	min_size = alloc_sizes & -alloc_sizes;
@@ -978,7 +966,7 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	int i;
 
 	if (static_branch_unlikely(&iommu_deferred_attach_enabled) &&
-	    iommu_dma_deferred_attach(dev, domain))
+	    iommu_deferred_attach(dev, domain))
 		return 0;
 
 	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index ffeebda8d6de..15b5fd6bd554 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1980,6 +1980,16 @@ int iommu_attach_device(struct iommu_domain *domain, struct device *dev)
 }
 EXPORT_SYMBOL_GPL(iommu_attach_device);
 
+int iommu_deferred_attach(struct device *dev, struct iommu_domain *domain)
+{
+	const struct iommu_ops *ops = domain->ops;
+
+	if (ops->is_attach_deferred && ops->is_attach_deferred(domain, dev))
+		return __iommu_attach_device(domain, dev);
+
+	return 0;
+}
+
 /*
  * Check flags and other user provided data for valid combinations. We also
  * make sure no reserved fields or unused flags are set. This is to ensure
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index b3f0e2018c62..92ee9b56f118 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -376,6 +376,7 @@ int  iommu_device_sysfs_add(struct iommu_device *iommu,
 void iommu_device_sysfs_remove(struct iommu_device *iommu);
 int  iommu_device_link(struct iommu_device   *iommu, struct device *link);
 void iommu_device_unlink(struct iommu_device *iommu, struct device *link);
+int iommu_deferred_attach(struct device *dev, struct iommu_domain *domain);
 
 static inline void __iommu_device_set_ops(struct iommu_device *iommu,
 					  const struct iommu_ops *ops)
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
