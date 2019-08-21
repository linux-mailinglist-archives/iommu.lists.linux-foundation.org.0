Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5BF978E1
	for <lists.iommu@lfdr.de>; Wed, 21 Aug 2019 14:10:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 04CF2F9C;
	Wed, 21 Aug 2019 12:10:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2E68AF84
	for <iommu@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 12:10:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A3DDEE6
	for <iommu@lists.linux-foundation.org>;
	Wed, 21 Aug 2019 12:10:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 08DF22F30D9;
	Wed, 21 Aug 2019 12:10:32 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-105.ams2.redhat.com [10.36.116.105])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 521D35C541;
	Wed, 21 Aug 2019 12:10:26 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, joro@8bytes.org,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	dwmw2@infradead.org, shameerali.kolothum.thodi@huawei.com,
	alex.williamson@redhat.com, robin.murphy@arm.com, hch@infradead.org
Subject: [PATCH v3] iommu: revisit iommu_insert_resv_region() implementation
Date: Wed, 21 Aug 2019 14:09:40 +0200
Message-Id: <20190821120940.22337-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 21 Aug 2019 12:10:32 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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

Current implementation is recursive and in case of allocation
failure the existing @regions list is altered. A non recursive
version looks better for maintainability and simplifies the
error handling. We use a separate stack for overlapping segment
merging. The elements are sorted by start address and then by
type, if their start address match.

Note this new implementation may change the region order of
appearance in /sys/kernel/iommu_groups/<n>/reserved_regions
files but this order has never been documented, see
commit bc7d12b91bd3 ("iommu: Implement reserved_regions
iommu-group sysfs file").

Signed-off-by: Eric Auger <eric.auger@redhat.com>

---

v2 -> v3:
- use LIST_HEAD(stack)
- remove found local variables

v1 -> v2:
- adapt the algo so that we don't need to move elements of
  other types to different list and sort by address and then by
  type
---
 drivers/iommu/iommu.c | 96 +++++++++++++++++++++----------------------
 1 file changed, 47 insertions(+), 49 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 0c674d80c37f..edd622525796 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -229,60 +229,58 @@ static ssize_t iommu_group_show_name(struct iommu_group *group, char *buf)
  * @new: new region to insert
  * @regions: list of regions
  *
- * The new element is sorted by address with respect to the other
- * regions of the same type. In case it overlaps with another
- * region of the same type, regions are merged. In case it
- * overlaps with another region of different type, regions are
- * not merged.
+ * Elements are sorted by start address and overlapping segments
+ * of the same type are merged.
  */
-static int iommu_insert_resv_region(struct iommu_resv_region *new,
-				    struct list_head *regions)
+int iommu_insert_resv_region(struct iommu_resv_region *new,
+			     struct list_head *regions)
 {
-	struct iommu_resv_region *region;
-	phys_addr_t start = new->start;
-	phys_addr_t end = new->start + new->length - 1;
-	struct list_head *pos = regions->next;
+	struct iommu_resv_region *iter, *tmp, *nr, *top;
+	LIST_HEAD(stack);
 
-	while (pos != regions) {
-		struct iommu_resv_region *entry =
-			list_entry(pos, struct iommu_resv_region, list);
-		phys_addr_t a = entry->start;
-		phys_addr_t b = entry->start + entry->length - 1;
-		int type = entry->type;
-
-		if (end < a) {
-			goto insert;
-		} else if (start > b) {
-			pos = pos->next;
-		} else if ((start >= a) && (end <= b)) {
-			if (new->type == type)
-				return 0;
-			else
-				pos = pos->next;
-		} else {
-			if (new->type == type) {
-				phys_addr_t new_start = min(a, start);
-				phys_addr_t new_end = max(b, end);
-				int ret;
-
-				list_del(&entry->list);
-				entry->start = new_start;
-				entry->length = new_end - new_start + 1;
-				ret = iommu_insert_resv_region(entry, regions);
-				kfree(entry);
-				return ret;
-			} else {
-				pos = pos->next;
-			}
-		}
-	}
-insert:
-	region = iommu_alloc_resv_region(new->start, new->length,
-					 new->prot, new->type);
-	if (!region)
+	nr = iommu_alloc_resv_region(new->start, new->length,
+				     new->prot, new->type);
+	if (!nr)
 		return -ENOMEM;
 
-	list_add_tail(&region->list, pos);
+	/* First add the new element based on start address sorting */
+	list_for_each_entry(iter, regions, list) {
+		if (nr->start < iter->start ||
+		    (nr->start == iter->start && nr->type <= iter->type))
+			break;
+	}
+	list_add_tail(&nr->list, &iter->list);
+
+	/* Merge overlapping segments of type nr->type in @regions, if any */
+	list_for_each_entry_safe(iter, tmp, regions, list) {
+		phys_addr_t top_end, iter_end = iter->start + iter->length - 1;
+
+		/* no merge needed on elements of different types than @nr */
+		if (iter->type != nr->type) {
+			list_move_tail(&iter->list, &stack);
+			continue;
+		}
+
+		/* look for the last stack element of same type as @iter */
+		list_for_each_entry_reverse(top, &stack, list)
+			if (top->type == iter->type)
+				goto check_overlap;
+
+		list_move_tail(&iter->list, &stack);
+		continue;
+
+check_overlap:
+		top_end = top->start + top->length - 1;
+
+		if (iter->start > top_end + 1) {
+			list_move_tail(&iter->list, &stack);
+		} else {
+			top->length = max(top_end, iter_end) - top->start + 1;
+			list_del(&iter->list);
+			kfree(iter);
+		}
+	}
+	list_splice(&stack, regions);
 	return 0;
 }
 
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
