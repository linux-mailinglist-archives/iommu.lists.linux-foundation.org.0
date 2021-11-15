Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5963E44FCEF
	for <lists.iommu@lfdr.de>; Mon, 15 Nov 2021 03:10:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC83E606E7;
	Mon, 15 Nov 2021 02:10:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GfSTbl70uO6g; Mon, 15 Nov 2021 02:10:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E7FC6606F8;
	Mon, 15 Nov 2021 02:10:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C607DC0012;
	Mon, 15 Nov 2021 02:10:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC700C0012
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 02:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BAEA6606F8
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 02:10:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MQ85KpFDhOq9 for <iommu@lists.linux-foundation.org>;
 Mon, 15 Nov 2021 02:10:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0AE2D606F7
 for <iommu@lists.linux-foundation.org>; Mon, 15 Nov 2021 02:10:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10168"; a="294186355"
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; d="scan'208";a="294186355"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2021 18:10:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,235,1631602800"; d="scan'208";a="505714599"
Received: from allen-box.sh.intel.com ([10.239.159.118])
 by orsmga008.jf.intel.com with ESMTP; 14 Nov 2021 18:10:47 -0800
From: Lu Baolu <baolu.lu@linux.intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Ashok Raj <ashok.raj@intel.com>
Subject: [PATCH 05/11] iommu: Add security context management for assigned
 devices
Date: Mon, 15 Nov 2021 10:05:46 +0800
Message-Id: <20211115020552.2378167-6-baolu.lu@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211115020552.2378167-1-baolu.lu@linux.intel.com>
References: <20211115020552.2378167-1-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Cc: Chaitanya Kulkarni <kch@nvidia.com>, kvm@vger.kernel.org, rafael@kernel.org,
 linux-pci@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Jacob jun Pan <jacob.jun.pan@intel.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Will Deacon <will@kernel.org>
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

When an iommu group has DMA_OWNER_USER set for the first time, it is a
contract that the group could be assigned to userspace from now on. It
must be detached from the default iommu domain and all devices in this
group are blocked from doing DMA until it is attached to a user I/O
address space. Vice versa, the default domain should be re-attached to
the group after the last DMA_OWNER_USER is released.

Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
---
 drivers/iommu/iommu.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 39493b1b3edf..916a4d448150 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -293,7 +293,11 @@ int iommu_probe_device(struct device *dev)
 	mutex_lock(&group->mutex);
 	iommu_alloc_default_domain(group, dev);
 
-	if (group->default_domain) {
+	/*
+	 * If any device in the group has been initialized for user dma,
+	 * avoid attaching the default domain.
+	 */
+	if (group->default_domain && group->dma_owner != DMA_OWNER_USER) {
 		ret = __iommu_attach_device(group->default_domain, dev);
 		if (ret) {
 			mutex_unlock(&group->mutex);
@@ -2325,7 +2329,7 @@ static int __iommu_attach_group(struct iommu_domain *domain,
 {
 	int ret;
 
-	if (group->default_domain && group->domain != group->default_domain)
+	if (group->domain && group->domain != group->default_domain)
 		return -EBUSY;
 
 	ret = __iommu_group_for_each_dev(group, domain,
@@ -2362,7 +2366,11 @@ static void __iommu_detach_group(struct iommu_domain *domain,
 {
 	int ret;
 
-	if (!group->default_domain) {
+	/*
+	 * If any device in the group has been initialized for user dma,
+	 * avoid re-attaching the default domain.
+	 */
+	if (!group->default_domain || group->dma_owner == DMA_OWNER_USER) {
 		__iommu_group_for_each_dev(group, domain,
 					   iommu_group_do_detach_device);
 		group->domain = NULL;
@@ -3377,6 +3385,21 @@ static int __iommu_group_set_dma_owner(struct iommu_group *group,
 		refcount_set(&group->owner_cnt, 1);
 
 		if (owner == DMA_OWNER_USER) {
+			/*
+			 * The UNMANAGED domain shouldn't be attached before
+			 * claiming the USER ownership for the first time.
+			 */
+			if (group->domain) {
+				if (group->domain != group->default_domain) {
+					group->dma_owner = DMA_OWNER_NONE;
+					refcount_set(&group->owner_cnt, 0);
+
+					return -EBUSY;
+				}
+
+				__iommu_detach_group(group->domain, group);
+			}
+
 			get_file(user_file);
 			group->owner_user_file = user_file;
 		}
@@ -3397,6 +3420,13 @@ static void __iommu_group_release_dma_owner(struct iommu_group *group,
 		if (owner == DMA_OWNER_USER) {
 			fput(group->owner_user_file);
 			group->owner_user_file = NULL;
+
+			/*
+			 * The UNMANAGED domain should be detached before all USER
+			 * owners have been released.
+			 */
+			if (!WARN_ON(group->domain) && group->default_domain)
+				__iommu_attach_group(group->default_domain, group);
 		}
 	}
 }
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
