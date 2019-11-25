Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E068108BFD
	for <lists.iommu@lfdr.de>; Mon, 25 Nov 2019 11:45:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D66AE86223;
	Mon, 25 Nov 2019 10:45:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xwx1XoX9cgfz; Mon, 25 Nov 2019 10:45:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0F073861B2;
	Mon, 25 Nov 2019 10:45:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7CD9C0878;
	Mon, 25 Nov 2019 10:45:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B542C0878
 for <iommu@lists.linux-foundation.org>; Mon, 25 Nov 2019 10:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4666687AAE
 for <iommu@lists.linux-foundation.org>; Mon, 25 Nov 2019 10:45:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JYx84i+FdamQ for <iommu@lists.linux-foundation.org>;
 Mon, 25 Nov 2019 10:45:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EC04887A9C
 for <iommu@lists.linux-foundation.org>; Mon, 25 Nov 2019 10:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574678719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QRAeg6sofwTZ7IMOF1+XpMax8/HjXNDIA5l6w+nYTIs=;
 b=esZ8r/Ysi1SGaDPAFo1bldoMmA6Y3ZGL8wXJyBjWdAnwTiLjZXaYc1/RP78Qe2XN6NyWeP
 66+i3ElbP6y3tVBfQXw09Ir+6gaN8LnVGTd0sT38wf4ZL/bQts8ImBw5HxE4ehjuyR75rZ
 DnsIQHnUCdOPulk1zxWsYBO0rRID2Qk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-N6dA0LuNPl2MuZqUDdLEIA-1; Mon, 25 Nov 2019 05:45:16 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05DBC80058E;
 Mon, 25 Nov 2019 10:45:15 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E9665C1D4;
 Mon, 25 Nov 2019 10:45:10 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, joro@8bytes.org,
 hch@lst.de, cai@lca.pw, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] iommu: fix KASAN use-after-free in iommu_insert_resv_region
Date: Mon, 25 Nov 2019 11:45:07 +0100
Message-Id: <20191125104507.23704-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: N6dA0LuNPl2MuZqUDdLEIA-1
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

Store the new region type in a variable. In case the new region
gets merged into another one, the new node is freed and nr shall
not be used anymore.

Fixes: 4dbd258ff63e ("iommu: Revisit iommu_insert_resv_region()
implementation")
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Qian Cai <cai@lca.pw>
Cc: Stable <stable@vger.kernel.org> #v5.3+

---

- remove spurious new line
---
 drivers/iommu/iommu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index d658c7c6a2ab..4412b876250c 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -293,6 +293,7 @@ int iommu_insert_resv_region(struct iommu_resv_region *new,
 			     struct list_head *regions)
 {
 	struct iommu_resv_region *iter, *tmp, *nr, *top;
+	enum iommu_resv_type nr_type = new->type;
 	LIST_HEAD(stack);
 
 	nr = iommu_alloc_resv_region(new->start, new->length,
@@ -313,7 +314,7 @@ int iommu_insert_resv_region(struct iommu_resv_region *new,
 		phys_addr_t top_end, iter_end = iter->start + iter->length - 1;
 
 		/* no merge needed on elements of different types than @nr */
-		if (iter->type != nr->type) {
+		if (iter->type != nr_type) {
 			list_move_tail(&iter->list, &stack);
 			continue;
 		}
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
