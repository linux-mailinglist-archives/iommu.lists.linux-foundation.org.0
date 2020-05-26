Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C10531D96F4
	for <lists.iommu@lfdr.de>; Tue, 19 May 2020 15:03:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 41D752268D;
	Tue, 19 May 2020 13:03:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M-lTgYisjw7K; Tue, 19 May 2020 13:03:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0CB67203AC;
	Tue, 19 May 2020 13:03:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC57AC0176;
	Tue, 19 May 2020 13:03:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F145EC0176
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 13:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D8CA287F00
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 13:03:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AV1Bxn4XYIiJ for <iommu@lists.linux-foundation.org>;
 Tue, 19 May 2020 13:03:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D12E8877B4
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 13:03:50 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id D58C3386; Tue, 19 May 2020 15:03:48 +0200 (CEST)
From: Joerg Roedel <joro@8bytes.org>
To: iommu@lists.linux-foundation.org
Subject: [PATCH] iommu: Fix deferred domain attachment
Date: Tue, 19 May 2020 15:03:40 +0200
Message-Id: <20200519130340.14564-1-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
Cc: Joerg Roedel <jroedel@suse.de>, linux-kernel@vger.kernel.org,
 Tom Murphy <murphyt7@tcd.ie>, Robin Murphy <robin.murphy@arm.com>
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

The IOMMU core code has support for deferring the attachment of a domain
to a device. This is needed in kdump kernels where the new domain must
not be attached to a device before the device driver takes it over.

When the AMD IOMMU driver got converted to use the dma-iommu
implementation, the deferred attaching got lost. The code in
dma-iommu.c has support for deferred attaching, but it calls into
iommu_attach_device() to actually do it. But iommu_attach_device()
will check if the device should be deferred in it code-path and do
nothing, breaking deferred attachment.

Move the is_deferred_attach() check out of the attach_device path and
into iommu_group_add_device() to make deferred attaching work from the
dma-iommu code.

Cc: Jerry Snitselaar <jsnitsel@redhat.com>
Cc: Tom Murphy <murphyt7@tcd.ie>
Cc: Robin Murphy <robin.murphy@arm.com>
Reported-by: Jerry Snitselaar <jsnitsel@redhat.com>
Suggested-by: Robin Murphy <robin.murphy@arm.com>
Tested-by: Jerry Snitselaar <jsnitsel@redhat.com>
Fixes: 795bbbb9b6f8 ("iommu/dma-iommu: Handle deferred devices")
Signed-off-by: Joerg Roedel <jroedel@suse.de>
---
 drivers/iommu/iommu.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 4050569188be..629d209b8e88 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -769,6 +769,15 @@ static int iommu_create_device_direct_mappings(struct iommu_group *group,
 	return ret;
 }
 
+static bool iommu_is_attach_deferred(struct iommu_domain *domain,
+				     struct device *dev)
+{
+	if (domain->ops->is_attach_deferred)
+		return domain->ops->is_attach_deferred(domain, dev);
+
+	return false;
+}
+
 /**
  * iommu_group_add_device - add a device to an iommu group
  * @group: the group into which to add the device (reference should be held)
@@ -821,7 +830,7 @@ int iommu_group_add_device(struct iommu_group *group, struct device *dev)
 
 	mutex_lock(&group->mutex);
 	list_add_tail(&device->list, &group->devices);
-	if (group->domain)
+	if (group->domain  && !iommu_is_attach_deferred(group->domain, dev))
 		ret = __iommu_attach_device(group->domain, dev);
 	mutex_unlock(&group->mutex);
 	if (ret)
@@ -1893,9 +1902,6 @@ static int __iommu_attach_device(struct iommu_domain *domain,
 				 struct device *dev)
 {
 	int ret;
-	if ((domain->ops->is_attach_deferred != NULL) &&
-	    domain->ops->is_attach_deferred(domain, dev))
-		return 0;
 
 	if (unlikely(domain->ops->attach_dev == NULL))
 		return -ENODEV;
@@ -1967,8 +1973,7 @@ EXPORT_SYMBOL_GPL(iommu_sva_unbind_gpasid);
 static void __iommu_detach_device(struct iommu_domain *domain,
 				  struct device *dev)
 {
-	if ((domain->ops->is_attach_deferred != NULL) &&
-	    domain->ops->is_attach_deferred(domain, dev))
+	if (iommu_is_attach_deferred(domain, dev))
 		return;
 
 	if (unlikely(domain->ops->detach_dev == NULL))
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
