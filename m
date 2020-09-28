Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2575427B5AE
	for <lists.iommu@lfdr.de>; Mon, 28 Sep 2020 21:51:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 875F8203A3;
	Mon, 28 Sep 2020 19:51:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cfzMl4MTgiYB; Mon, 28 Sep 2020 19:51:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BB7BF20411;
	Mon, 28 Sep 2020 19:51:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96C4FC0051;
	Mon, 28 Sep 2020 19:51:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 716AEC0051
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 19:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5BECC85816
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 19:51:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CdUGXhTpK1hS for <iommu@lists.linux-foundation.org>;
 Mon, 28 Sep 2020 19:51:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 820C0857D6
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 19:51:05 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601322664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zgipLChvpFNHWiHMOszPaOWgxWpCDsPEemdHRMMgKeg=;
 b=Z7rgPm8IevFeQzSjspGAlGq/zQQiDBbBvMRSrddK7h1A2ltTTJ0mSMGL+sWGYGU+sZj9G0
 I6qb+BuPlSl1xRd8RFTq7iriz387EGEs0HyjlmCrgBKzpA8QqaVvc1ib3UAdlwnN/0GciC
 wCA/AFzeCamXq4Wl9VD951j69F9uhv4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-lDE4EAToP96naZr1dUiVkw-1; Mon, 28 Sep 2020 15:51:00 -0400
X-MC-Unique: lDE4EAToP96naZr1dUiVkw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9DAE80F058;
 Mon, 28 Sep 2020 19:50:58 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-210.ams2.redhat.com [10.36.113.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B435614F5;
 Mon, 28 Sep 2020 19:50:55 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, joro@8bytes.org,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 will.deacon@arm.com, robin.murphy@arm.com, dwmw2@infradead.org,
 alex.williamson@redhat.com
Subject: [RFC 1/3] iommu: Fix merging in iommu_insert_resv_region
Date: Mon, 28 Sep 2020 21:50:35 +0200
Message-Id: <20200928195037.22654-2-eric.auger@redhat.com>
In-Reply-To: <20200928195037.22654-1-eric.auger@redhat.com>
References: <20200928195037.22654-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: jean-philippe.brucker@arm.com
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

We currently fail to merge a region into another one whose top
address is ULLONG_MAX. This situation shouldn't have been encountered
yet due to the nature of reserved regions being exposed but this
would happen if we were to expose regions beyond the reach of dma_mask
or beyond the reach of the iommu.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 drivers/iommu/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 609bd25bf154..dd8cda340e62 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -423,7 +423,7 @@ static int iommu_insert_resv_region(struct iommu_resv_region *new,
 check_overlap:
 		top_end = top->start + top->length - 1;
 
-		if (iter->start > top_end + 1) {
+		if (top_end != ULLONG_MAX && iter->start > top_end + 1) {
 			list_move_tail(&iter->list, &stack);
 		} else {
 			top->length = max(top_end, iter_end) - top->start + 1;
-- 
2.21.3

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
