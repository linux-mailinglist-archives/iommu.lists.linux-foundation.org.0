Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B4210A39F
	for <lists.iommu@lfdr.de>; Tue, 26 Nov 2019 18:54:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CDE7D86ED5;
	Tue, 26 Nov 2019 17:54:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ltH9Tt1o+RfR; Tue, 26 Nov 2019 17:54:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3A41486F87;
	Tue, 26 Nov 2019 17:54:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2F1BAC0878;
	Tue, 26 Nov 2019 17:54:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8203BC0878
 for <iommu@lists.linux-foundation.org>; Tue, 26 Nov 2019 17:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 70B6F84FD5
 for <iommu@lists.linux-foundation.org>; Tue, 26 Nov 2019 17:54:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YU6xdHm3zVmx for <iommu@lists.linux-foundation.org>;
 Tue, 26 Nov 2019 17:54:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B5F7A843ED
 for <iommu@lists.linux-foundation.org>; Tue, 26 Nov 2019 17:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574790865;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jH4n5LJEgEFoXEBsyDUNpdLdyn9LnH0pqtbnZfED+0w=;
 b=bFY1BB+NFlpotlh3KRBnoxxOjQy0bnnDW7UKY8Iy2uMFb6QQG28FunIgRcYU62YKttVwSy
 MnOAf2TZm4DyFhUODhwKRbYnE7Hgt8eHKuhXtW++CxGgt4fSU80jFzm7KJI1Pc3bE4YpP7
 imu2hBfrUjErsLaKlbh7a+PnwNNZlkA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-Z58OA4CgNMa5aUinv2X9WA-1; Tue, 26 Nov 2019 12:54:24 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A72F80183C;
 Tue, 26 Nov 2019 17:54:22 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EC5E5D9CD;
 Tue, 26 Nov 2019 17:54:17 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, joro@8bytes.org,
 hch@lst.de, cai@lca.pw, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4] iommu: fix KASAN use-after-free in iommu_insert_resv_region
Date: Tue, 26 Nov 2019 18:54:13 +0100
Message-Id: <20191126175413.4350-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: Z58OA4CgNMa5aUinv2X9WA-1
X-Mimecast-Spam-Score: 0
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

In case the new region gets merged into another one, the nr
list node is freed. Checking its type while completing the
merge algorithm leads to a use-after-free. Use new->type
instead.

Fixes: 4dbd258ff63e ("iommu: Revisit iommu_insert_resv_region()
implementation")
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Qian Cai <cai@lca.pw>
Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
Cc: Stable <stable@vger.kernel.org> #v5.3+

---

v3 -> v4:
- s/nr/new in the comment
- Added Jerry's R-b

v2 -> v3:
- directly use new->type

v1 -> v2:
- remove spurious new line
---
 drivers/iommu/iommu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index d658c7c6a2ab..dea1069334a4 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -312,8 +312,8 @@ int iommu_insert_resv_region(struct iommu_resv_region *new,
 	list_for_each_entry_safe(iter, tmp, regions, list) {
 		phys_addr_t top_end, iter_end = iter->start + iter->length - 1;
 
-		/* no merge needed on elements of different types than @nr */
-		if (iter->type != nr->type) {
+		/* no merge needed on elements of different types than @new */
+		if (iter->type != new->type) {
 			list_move_tail(&iter->list, &stack);
 			continue;
 		}
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
