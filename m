Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6731A7C81
	for <lists.iommu@lfdr.de>; Tue, 14 Apr 2020 15:16:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 11E4386587;
	Tue, 14 Apr 2020 13:16:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jV5si-1LHz07; Tue, 14 Apr 2020 13:16:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1D39D859B1;
	Tue, 14 Apr 2020 13:16:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11D8DC1D8D;
	Tue, 14 Apr 2020 13:16:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D75DC0172
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 13:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 43F678579E
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 13:16:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qq8Cj7WLUnZP for <iommu@lists.linux-foundation.org>;
 Tue, 14 Apr 2020 13:16:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id AB03485C92
 for <iommu@lists.linux-foundation.org>; Tue, 14 Apr 2020 13:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=xg3LanskcG5YxBBSEuWUOh1CRzHOTC2lvRuHUPOBmeo=; b=KhiN2gV6T32eNzUkhId1mXELeZ
 5PsdY9DuWijoEqV8hb2sX5GukDJyInt/jxOFGbCajA4t8GitLegtX+eJQjrYYS/EnKK8+i/D4f+Fn
 tuFY7+F0XaygZYJ5b1gWq/yCLhFuXWmmMjxhVh9UYbhg/6YPWDb54NRr5jsiB9JeTXQUj+Uy4dLSr
 ofbutqQlzahhykDWFxF/82ir6KFU2OmzWWDcFYlCWo/0EVGvQvt26fFQ+vtZ8pm1pttsS+Y8snal4
 j3dMZYsLj+N5ZdDPGWwXBRyexm9J5W7B+EYRiLN4iSj9Ock+F721O8Q3VljvKV/BYvUCnE8LmtGd2
 GtWRMJVg==;
Received: from [2001:4bb8:180:384b:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOLPX-0001qd-UV; Tue, 14 Apr 2020 13:15:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 x86@kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Laura Abbott <labbott@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>
Subject: [PATCH 29/29] s390: use __vmalloc_node in stack_alloc
Date: Tue, 14 Apr 2020 15:13:48 +0200
Message-Id: <20200414131348.444715-30-hch@lst.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200414131348.444715-1-hch@lst.de>
References: <20200414131348.444715-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-s390@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, bpf@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 linux-arm-kernel@lists.infradead.org
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

stack_alloc can use a slightly higher level vmalloc function.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/s390/kernel/setup.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/s390/kernel/setup.c b/arch/s390/kernel/setup.c
index 36445dd40fdb..0f0b140b5558 100644
--- a/arch/s390/kernel/setup.c
+++ b/arch/s390/kernel/setup.c
@@ -305,12 +305,9 @@ void *restart_stack __section(.data);
 unsigned long stack_alloc(void)
 {
 #ifdef CONFIG_VMAP_STACK
-	return (unsigned long)
-		__vmalloc_node_range(THREAD_SIZE, THREAD_SIZE,
-				     VMALLOC_START, VMALLOC_END,
-				     THREADINFO_GFP,
-				     PAGE_KERNEL, 0, NUMA_NO_NODE,
-				     __builtin_return_address(0));
+	return (unsigned long)__vmalloc_node(THREAD_SIZE, THREAD_SIZE,
+			THREADINFO_GFP, NUMA_NO_NODE,
+			__builtin_return_address(0));
 #else
 	return __get_free_pages(GFP_KERNEL, THREAD_SIZE_ORDER);
 #endif
-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
