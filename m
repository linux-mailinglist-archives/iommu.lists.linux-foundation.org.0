Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D0F2041E7
	for <lists.iommu@lfdr.de>; Mon, 22 Jun 2020 22:23:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A1CBE88C15;
	Mon, 22 Jun 2020 20:23:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VcLbnvQ0DXtx; Mon, 22 Jun 2020 20:23:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8C34188C09;
	Mon, 22 Jun 2020 20:23:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6FF5EC016F;
	Mon, 22 Jun 2020 20:23:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E94CAC016F
 for <iommu@lists.linux-foundation.org>; Mon, 22 Jun 2020 20:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DDEE587EF0
 for <iommu@lists.linux-foundation.org>; Mon, 22 Jun 2020 20:23:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DKG0Nx3J2ZtX for <iommu@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 20:23:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4DE5287F31
 for <iommu@lists.linux-foundation.org>; Mon, 22 Jun 2020 20:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592857419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=09H//9zX7bsIJ9e/s6dCG6RDIhWPY+AfL8sPKg/K0oc=;
 b=c8TwY3FIZehtDh1Vofj5pNq9QAv9AwcY+lCNe/0xu8/hjZp5mLhOGqZ4sqW3Y1eP6ijT4j
 NEcpb4Yt6wTvCOd1WV1u3yKZ256ZsrXKTAPTaGQ2nPofENB5tX1dcU1GwQj2qvlBW3NRLc
 1NE9djKSocqIYYzTLOg+utUV8in2UO4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-YcOXdOaaN6uzom3IqOeHRw-1; Mon, 22 Jun 2020 16:23:35 -0400
X-MC-Unique: YcOXdOaaN6uzom3IqOeHRw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 841A71883604;
 Mon, 22 Jun 2020 20:23:33 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF45F1802B;
 Mon, 22 Jun 2020 20:23:25 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com,
 iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, hch@lst.de
Subject: [PATCH] dma-remap: Align the size in dma_common_*_remap()
Date: Mon, 22 Jun 2020 22:23:20 +0200
Message-Id: <20200622202320.1331-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: jean-philippe@linaro.org, peterz@infradead.org, akpm@linux-foundation.org,
 robin.murphy@arm.com, bbhushan2@marvell.com
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

Running a guest with a virtio-iommu protecting virtio devices
is broken since commit 515e5b6d90d4 ("dma-mapping: use vmap insted
of reimplementing it"). Before the conversion, the size was
page aligned in __get_vm_area_node(). Doing so fixes the
regression.

Fixes: 515e5b6d90d4 ("dma-mapping: use vmap insted of reimplementing it")
Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 kernel/dma/remap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/dma/remap.c b/kernel/dma/remap.c
index e739a6eea6e7..a3151a9b0c08 100644
--- a/kernel/dma/remap.c
+++ b/kernel/dma/remap.c
@@ -24,7 +24,7 @@ void *dma_common_pages_remap(struct page **pages, size_t size,
 {
 	void *vaddr;
 
-	vaddr = vmap(pages, size >> PAGE_SHIFT, VM_DMA_COHERENT, prot);
+	vaddr = vmap(pages, PAGE_ALIGN(size) >> PAGE_SHIFT, VM_DMA_COHERENT, prot);
 	if (vaddr)
 		find_vm_area(vaddr)->pages = pages;
 	return vaddr;
@@ -37,7 +37,7 @@ void *dma_common_pages_remap(struct page **pages, size_t size,
 void *dma_common_contiguous_remap(struct page *page, size_t size,
 			pgprot_t prot, const void *caller)
 {
-	int count = size >> PAGE_SHIFT;
+	int count = PAGE_ALIGN(size) >> PAGE_SHIFT;
 	struct page **pages;
 	void *vaddr;
 	int i;
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
